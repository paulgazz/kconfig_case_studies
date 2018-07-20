import os
import json


def read_dimacs(dimacsfile):
    _features = list()
    _clauses = list()
    _vcount = '-1'

    with open(dimacsfile) as f:
        for line in f:
            # read variables in comments
            if line.startswith("c"):
                line = line[0:len(line) - 1]
                _feature = line.split(" ", 4)
                del _feature[0]
                _features.append(tuple(_feature))
            # read dimacs properties
            elif line.startswith("p"):
                info = line.split()
                _vcount = info[2]
            # read clauses
            else:
                info = line.split()
                if len(info) != 0:
                    _clauses.append(line)

    return _features, _clauses, _vcount


def get_commmon(dimacs_, cdir_, configs_, include_=True):
    common = list()
    init = True

    # check if config dir exists
    if not os.path.exists(cdir_):
        print("randconfig not found")
        return

    # get features and clauses
    _features, _clauses, _vars = read_dimacs(dimacs_)
    _names = [i[1] for i in _features]

    # iterate over each randconfig configurations
    for file in os.listdir(cdir_):
        if (include_ and (file in configs_)) or (not include_ and (file not in configs_)) or (len(configs_) == 0):
            with open(cdir_ + "/" + file, 'r') as f:
                # print(file)
                _existing = set()

                sol = list()
                for line in f:
                    # line: # FEATURE is not set
                    if line.startswith('#'):
                        line = line[0:len(line) - 1]
                        data = line.split()
                        if len(data) > 4:
                            if data[1] in _names:
                                i = _names.index(data[1])
                                _existing.add(data[1])
                                if i != -1:
                                    sol.append('-' + _features[i][1])
                    # line: FEATURE=y or FEATURE="nonbool value"
                    else:
                        line = line[0:len(line) - 1]
                        data = line.split('=')
                        if len(data) > 1:
                            if data[0] in _names:
                                i = _names.index(data[0])
                                _existing.add(data[0])
                                # FEATURE=y
                                if data[1] == 'y':
                                    sol.append(str(_features[i][1]))
                                # FEATURE=empty string or 0
                                elif data[1] == '\"\"' or data[1] == '0':
                                    if _features[i][3] != '\"\"' and _features[i][3] != '0':
                                        sol.append('-' + _features[i][1])
                                # FEATURE='nonbool value'
                                else:
                                    sol.append(str(_features[i][1]))

                if init:
                    common = sol
                    init = False
                else:
                    for s in common:
                        if s not in sol:
                            common.remove(s)

    return common


def analyze_cpp(dimacs_, cdir_, listfile_):
    configs = list()

    # get list of configurations
    if os.path.exists(listfile_):
        with open(listfile_, 'r') as f:
            for line in f:
                raw = line.split('/')
                configs.append(raw[1])
    else:
        print("checking with no config list")

        common_fail = get_commmon(dimacs_, cdir_, configs, True)
        common_pass = get_commmon(dimacs_, cdir_, configs, False)

        for s in common_fail:
            if s not in common_pass:
                print(s)


def analyze_infer(dimacs_, cdir_, jsonfile_):
    # read json file
    with open(jsonfile_) as f:
        rawdata = json.load(f)

    i = 1
    for datum in rawdata:
        # get list of configurations
        configs = datum['configs']

        print("(" + str(i) + "/" + str(len(rawdata)) + ") " + datum['key'] + ":" + str(datum['line']) + " (" + str(len(configs)) + "): ", end='')

        # get filtered config list
        filtered = list()
        for c in configs:
            slash = c.split('/')
            name = slash[1].split('_')
            filtered.append(name[1])

        # find common features
        common_fail = get_commmon(dimacs_, cdir_, filtered, True)
        common_pass = get_commmon(dimacs_, cdir_, filtered, False)

        result = list()
        for s in common_fail:
            if s not in common_pass:
            #     if s.startswith('-'):
            #         if s[1:] in common_pass:
            #             result.append(s)
            #     else:
            #         if '-'+s in common_pass:
            #             result.append(s)
                result.append(s)

        print(result)
        # print(common_fail)
        # print(common_pass)

        i += 1



target = "toybox_0_7_5"
dimacs = "/home/jeho/kmax/kconfig_case_studies/cases/" + target + "/kconfig.dimacs"
cdir = "/home/jeho/kmax/kconfig_case_studies/bugs/cppcheck/toybox_bug_report/configs"
cppfile = "/home/jeho/kmax/kconfig_case_studies/bugs/toybox_bug_report/config_occurrence_lists/configs_with_vmstat.txt"
inferfile = "/home/jeho/kmax/kconfig_case_studies/cases/" + target + "/infer/mapping.json"

analyze_infer(dimacs, cdir, inferfile)




