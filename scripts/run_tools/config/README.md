# Writing your own configuration files

Configuration files for this tool are in the format of a single list, called "runs", of sequential runs.
The format is as follows (see the provided configuration files for more information)

    {
    "runs": [
        {
          "tool": "one of [cppcheck, clang, infer, cbmc]",
          "target": "one of [axtls, toybox, busybox]",
          "source": "/home/vagrant/<source code>",
          "configs": "bugs/configs (relative to /vagrant/cases/<target>",
          "config_range": [min, max] (optional)
        },
        {
          "tool": "one of [cppcheck, clang, infer, cbmc]",
          "target": "one of [axtls, toybox, busybox]",
          "source": "/home/vagrant/<source code>",
          "configs": "bugs/configs (relative to /vagrant/cases/<target>"
        },
        ...
        ]
    }

