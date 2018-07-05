import os


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


def get_commmon(dimacs_, cdir_, configlist_, include_=True):
    common = list()
    configs = list()
    init = True

    # check if config dir exists
    if not os.path.exists(cdir_):
        print("randconfig not found")
        return

    # get list of configurations
    if os.path.exists(configlist_):
        with open(configlist_, 'r') as f:
            for line in f:
                raw = line.split('/')
                configs.append(raw[1])
    else:
        print("checking with no config list")

    # get features and clauses
    _features, _clauses, _vars = read_dimacs(dimacs_)
    _names = [i[1] for i in _features]

    # iterate over each randconfig configurations
    for file in os.listdir(cdir_):
        if (include_ and (file in configs)) or (not include_ and (file not in configs)) or (len(configs) == 0):
            with open(cdir_ + "/" + file, 'r') as f:
                print(file)
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

# extract common features from configs
target = "toybox_0_7_5"
dimacs = "/home/jeho/kmax/kconfig_case_studies/cases/" + target + "/kconfig.dimacs"
cdir = "/home/jeho/kmax/kconfig_case_studies/bugs/toybox_bug_report/configs"
configlist = "/home/jeho/kmax/kconfig_case_studies/bugs/toybox_bug_report/config_occurrence_lists/configs_with_vmstat.txt"

common_fail = get_commmon(dimacs, cdir, configlist, True)
common_pass = get_commmon(dimacs, cdir, configlist, False)

for s in common_fail:
    if s not in common_pass:
        print(s)