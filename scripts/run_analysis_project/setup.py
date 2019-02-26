from setuptools import setup

setup(name="run_analysis",
      version="0.1.0",
      packages=["run_analysis"],
      entry_points={
          "console_scripts": [
              "run_analysis = run_analysis.__main__:main"
              ]
          },
      )
