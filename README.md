# Description

This repository provides the implementation of the final three steps of the automated framework presented in our FSE'2019 paper (included as ./PDF). The first step, Sample Generation, relies on the work done by Jeho et al. [31], so we do not include it here. so we do not include it here. Instead, we provide the results of that step in ./cases, and provide the rest of the framework,  which runs off-the-shelf bug detectors, deduplicates their results, automatically extracts relevant features, and outputs those results in a unified format.

See [INSTALL.md](./INSTALL.md) for instructions on running the experiments.

# Code Organization

[The scripts directory](./scripts) contains the artifacts that run the experiments. Namely, we provide two artifacts which encompass the final three steps of the automated framework presented in the FSE'19 paper. Namely, the [run_tools](./scripts/run_tools) artifact runs analysis tools on configurations of target programs, and the [deduplicate_project](./scripts/deduplicate_project) artifact performs deduplication, formatting, and automatic feature identification of the warnings produced by the run_tools project. See [INSTALL.md](./INSTALL.md) for instructions on how to run the two artifacts. See the READMEs listed in both tools' root directories for more specific information about their organization.

[The cases directory](./cases) contains both the source code and the sampled configurations of the three target programs we used in our study. Under each program's root directory, bugs/configs contains the 1000 sampled configurations. Each folder also includes a tarball containing the source code of the version of the code we are  testing.