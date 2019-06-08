from setuptools import setup

setup(name='run_tools',
      version='0.1.0',
      packages=['run_tools'],
      entry_points={
          'console_scripts': [
              'run_tools = run_tools.__main__:main'
          ]
      },
      )
