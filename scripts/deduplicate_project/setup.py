""" Thank you to the setuptools tutorial at
https://chriswarrick.com/blog/2014/09/15/
python-apps-the-right-way-entry_points-and-scripts/,
for help understanding how to setup a setuptools project.
Last accessed 2019-02-11 """

from setuptools import setup

setup(name="deduplicate",
      version="0.1.0",
      packages=["deduplicate"],
      entry_points={
          "console_scripts": [
              "deduplicate = deduplicate.__main__:main"
              ]
          }
      )
