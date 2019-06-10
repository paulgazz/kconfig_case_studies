# Setup

Once you're in the VM, there are a few manual steps you need to perform. The first is installing the pyenv tool to manage python versions. You can use the pyenv-installer project available at https://github.com/pyenv/pyenv-installer, distributed under the MIT License.

## Setting up pyenv

Run the following command from a bash shell from inside the vagrant vm:

`curl https://pyenv.run | bash`

This should take care of installing pyenv and adding the appropriate lines to ~/.bashrc to allow it to be available upon startup. Start a new bash shell and run

`pyenv update`

to make sure that pyenv is available. If it isn't, please refer to the homepage of the pyenv installer and follow the instructions there.

Assuming pyenv is installed, run

`pyenv install 3.7.0`

to install Python 3.7.0 (this will take a bit of time), then run

`pyenv global 3.7.0`

to set Python 3.7.0 as the global python version.

## Final setup steps

Finally, you need to compile the GCCShunt.java program to correctly run the analysis tools. Run the following commands:

`cd /vagrant/scripts && javac GCCShunt.java`

You are now ready to run the analysis tools. Refer to the instructions in /vagrant/scripts/run_tools.