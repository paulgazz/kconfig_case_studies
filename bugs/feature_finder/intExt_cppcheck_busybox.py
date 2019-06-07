import os
import json
import sys


def read_dimacs(dimacsfile_):
    """parse variables and clauses from a dimacs file"""

    _features = list()
    _clauses = list()
    _vcount = '-1'  # required for variables without names

    with open(dimacsfile_) as f:
        for line in f:
            # read variables in comments
            if line.startswith("c"):
                line = line[0:len(line) - 1]
                _feature = line.split(" ", 4)
                del _feature[0]
                _feature[0] = int(_feature[0])
                _features.append(tuple(_feature))
            # read dimacs properties
            elif line.startswith("p"):
                info = line.split()
                _vcount = info[2]
            # read clauses
            else:
                info = line.split()
                if len(info) != 0:
                    _clauses.append(list(map(int, info[:len(info)-1])))
                    #_clauses.append(line.strip('\n'))

    return _features, _clauses, _vcount


def get_commmon(dimacs_, cdir_, configs_, include_=True):
    common = list()
    init = True

    # check if config dir exists
    if not os.path.exists(cdir_):
        print("config not found")
        return

    filter = set()
    # filterfile = "/home/jeho/kmax/kconfig_case_studies/cases/axtls_2_1_4/bugs/configs/lua.txt"
    # with open(filterfile, 'r') as f:
    #     for line in f:
    #         filter.add(line.strip())

    # get features and clauses
    _features, _clauses, _vars = read_dimacs(dimacs_)
    _names = [i[1] for i in _features]

    # iterate over each randconfig configurations
    count = 0
    files = os.listdir(cdir_)
    for file in os.listdir(cdir_):
        if file.endswith('.config') and file not in filter:
            if (include_ and (file in configs_)) or (not include_ and (file not in configs_)) or (len(configs_) == 0):
                with open(cdir_ + "/" + file, 'r') as f:
                    # if not include_:
                    #     print(file)
                    _existing = set()
                    invalid = False
                    sol = list()
                    for line in f:
                        # line: # FEATURE is not set
                        if line.startswith('#'):
                            line = line[0:len(line) - 1]
                            data = line.split()
                            if len(data) > 4:
                                # if data[1] == 'CONFIG_SED': #HTTP_HAS_AUTHORIZATION
                                #     print(str(include_) + " " + file + " unselected")

                                if data[1] in _names:
                                    i = _names.index(data[1])
                                    _existing.add(data[1])
                                    if i != -1:
                                        sol.append('-' + _features[i][1])
                                else:
                                    print(data)
                        # line: FEATURE=y or FEATURE="nonbool value"
                        else:
                            line = line[0:len(line) - 1]
                            data = line.split('=')
                            if len(data) > 1:
                                if data[0] in _names:
                                    # if data[0] == 'CONFIG_SED':
                                    #     print(str(include_) + " " + file + " selected")

                                    i = _names.index(data[0])
                                    _existing.add(data[0])
                                    # FEATURE=y
                                    if data[1] == 'y':
                                        if 'CONFIG_HTTP_ENABLE_LUA' == data[0]:
                                            invalid = True
                                        #     #print("LUA!!!!!")
                                        sol.append(str(_features[i][1]))
                                    # FEATURE=empty string or 0
                                    elif data[1] == '\"\"' or data[1] == '0':
                                        if _features[i][3] != '\"\"' and _features[i][3] != '0':
                                            sol.append('-' + _features[i][1])
                                    # FEATURE='nonbool value'
                                    else:
                                        sol.append(str(_features[i][1]))
                                else:
                                    print(data)
                    # if '-CONFIG_DATE' in sol:
                    #     print(file)

                    if not invalid:
                        if init:
                            common = sol
                            init = False
                        else:
                            for s in common:
                                if s not in sol:
                                    common.remove(s)
                        count += 1

    return common, count


def neg(feature):
    if feature[0] == '-':
        return feature[1:]
    else:
        return '-' + feature


def filter_common(dimacs_, cdir_, configs_):
    #print()
    common_fail, fcount = get_commmon(dimacs_, cdir_, configs_, True)
    #print("Common across failed configs: " + str(common_fail))
    common_pass, pcount = get_commmon(dimacs_, cdir_, configs_, False)
    #print("Common across passed configs: " + str(common_pass))

    fail_only = list()
    for s in common_fail:
        if s not in common_pass:
            print(s, end=',')
            fail_only.append(s)
    print("\",\"", end='')

    #print("Only in passed configs (" + str(pcount) + "/" + str(fcount + pcount) + "): ", end='')
    pass_only = list()
    for s in common_pass:
        if s not in common_fail:
            print(s, end=',')
            pass_only.append(s)
    print("\"", end='')

    print(",\"", end='')
    if pcount == 0:
        print("generic", end="")

    else:
        if fcount == 0:
            print("check", end="")

        elif len(fail_only) == 0 and len(pass_only) == 0:
            print("check", end="")

        elif len(fail_only) == len(pass_only):
            allneg = True
            for f in fail_only:
                if neg(f) not in pass_only:
                    allneg = False

            if allneg:
                if len(fail_only) == 1:
                    print(fail_only[0], end="")
                else:
                    print(fail_only[0], end="")
                    for i in range(1, len(fail_only)):
                        print(" and " + fail_only[i], end="")
            else:
                print("check", end="")

        elif len(fail_only) == 1 and len(pass_only) > 1:
            if 'CONFIG_TOYBOX_SELINUX' in pass_only:
                pass_only.remove('CONFIG_TOYBOX_SELINUX')
            if '-CONFIG_TOYBOX_LSM_NONE' in pass_only:
                pass_only.remove('-CONFIG_TOYBOX_LSM_NONE')

            if neg(fail_only[0]) in pass_only:
                print(fail_only[0], end="")
            else:
                print("check", end="")

        elif len(fail_only) > 1 and len(pass_only) == 1:
            if 'CONFIG_TOYBOX_SELINUX' in fail_only:
                fail_only.remove('CONFIG_TOYBOX_SELINUX')
            if '-CONFIG_TOYBOX_LSM_NONE' in fail_only:
                fail_only.remove('-CONFIG_TOYBOX_LSM_NONE')

            if neg(pass_only[0]) in fail_only:
                if len(fail_only) == 1:
                    print(fail_only[0], end="")
                else:
                    print(fail_only[0], end="")
                    for i in range(1, len(fail_only)):
                        print(" and " + fail_only[i], end="")
            else:
                print("check", end="")

        elif len(fail_only) > 1 and len(pass_only) == 0:
            if 'CONFIG_TOYBOX_SELINUX' in fail_only:
                fail_only.remove('CONFIG_TOYBOX_SELINUX')
            if '-CONFIG_TOYBOX_LSM_NONE' in fail_only:
                fail_only.remove('-CONFIG_TOYBOX_LSM_NONE')
            if len(pass_only) != 0:
                print(fail_only[0], end='')
                for i in range(1, len(fail_only)):
                    print(" and " + fail_only[i], end='')
            else:
                print("check", end="")

        elif len(fail_only) == 0 and len(pass_only) > 1:
            if 'CONFIG_TOYBOX_SELINUX' in pass_only:
                pass_only.remove('CONFIG_TOYBOX_SELINUX')
            if '-CONFIG_TOYBOX_LSM_NONE' in pass_only:
                pass_only.remove('-CONFIG_TOYBOX_LSM_NONE')

            if len(pass_only) != 0:
                print(neg(pass_only[0]), end='')
                for i in range(1, len(pass_only)):
                    print(" or " + neg(pass_only[i]), end='')
            else:
                print("check", end="")

        else:
            print("check", end='')
    print("\"")

    return


def analyze_cpp_paul(dimacs_, cdir_, reportfile_):
    with open(reportfile_, 'r') as f:
        for line in f:
            #print(line)
            raw = line.split(',')

            if raw[0].startswith('set'):
                names = raw[1].split()
                print(raw[0] + ": ", end='')
                configs = [name + '.config' for name in names]

                filter_common(dimacs_, cdir_, configs)


# run script
if __name__ == "__main__":
    args = sys.argv

    if len(args) == 3:
        print("Not enough arguments: <dimacs> <sampledir> <configlist>")
        sys.exit(2)

    dimacs = args[1]
    sampledir = args[2]
    jsonfile = args[3]

    analyze_cpp_paul(dimacs, sampledir, jsonfile)
