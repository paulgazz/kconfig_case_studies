# Writing your own configuration files

Configuration files are in the following format:

    {
      "<one of [toybox_0_7_5, axtls_2_1_4, busybox_1_28_0]>": {
        "<one of [infer, cbmc, cppcheck, clang]>_results": {
          "location": "/vagrant/results/<target>/<tool>_results"
        },
        "<one of [infer, cbmc, cppcheck, clang]>_results": {
          "location": "/vagrant/results/<target>/<tool>_results"
        }
        },
      "<one of [toybox_0_7_5, axtls_2_1_4, busybox_1_28_0]>": {
        "<one of [infer, cbmc, cppcheck, clang]>_results": {
          "location": "/vagrant/results/<target>/<tool>_results"
        },
        "<one of [infer, cbmc, cppcheck, clang]>_results": {
          "location": "/vagrant/results/<target>/<tool>_results"
        }
        }
    }
   
See the included configuration file for examples.
