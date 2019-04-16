## Angr

* install && use angr (python3)

```
pip install virtualenv
virtualenv -p /usr/bin/python3 venv-angr
source venv-angr/bin/activate
pip install angr
deactivate
```

## Ramblr

Ramblr is angr.analyses.Reassembler

you want to use Patcherex to control it
it provides a nicer interface to add arbitrary code to binaries

* installing patcherex (python3)

```
sudo apt-get install nasm clang
# mkvirtualenv cgc # create and activate a proper virtual env in which other CRS components have been installed (see setup.py)
git clone https://github.com/angr/patcherex.git
cd patcherex
pip install -e .
```

misc helpful links:
* https://github.com/angr/patcherex
* https://github.com/angr/angr/blob/master/angr/analyses/reassembler.py
* https://github.com/angr/angr/issues/417
* https://www.bountysource.com/issues/47790221-reassemblerbackend-error
* https://github.com/shellphish/rex/issues/5


## Dependencies (reassemble)

Some of these parts need other parts for mechaphish and shellphish
many things have to get individually downloaded then in each need to do either

`pip install -e . --user`

`pip3 install -e . --user`

### need main shellphish/angr stuff:

* compilerex
* povsim
* fidget
* tracer
* shellphish-qemu

QEMURunner (??) in tracer

If you have QEMU compilation problems, installing these packages may be useful (tested on Ubuntu 14.04 64bit):

apt-get build-dep qemu-system
apt-get install libacl1-dev

### also need other packages:

* nose
* termcolor

## Exes

Recovering the control flow graph
https://docs.angr.io/built-in-analyses/cfg

angr should be able to be used on pe executables
pe Static loader for PE files based on PEFile

* https://docs.angr.io/core-concepts/loading
* https://github.com/angr/cle
* https://github.com/angr/angr/issues/537
* https://web.wpi.edu/Pubs/E-project/Available/E-project-101816-114710/unrestricted/echeng_mqp_angr.pdf


pg 50 of Binary Analysis and Symbolic Execution with angr:

There were limitations to this project because of time constraints as well as resources.
Further testing of angr can be done to expand its use cases. One of the major next steps for angr
seems to be expanding its compatibility for Windows PE files. There is very rudimentary support
for PE files. In general, only will formed PE binaries will have success in angr. One of the main
focuses for adding more PE compatibility is having a more robust PE parser. Currently, angr uses
the Pefiles Python module to parse PE files. For the most part, the module works well, but there
are things that the module does not do. For example, the module is not able to find function names
and symbols or identify the symbol table in a Pefile. In some cases, PE binaries to not include
symbol tables for which the Pefile module would not be able to find one. But for the cases where
there is a symbol table include, the PE parser should be able to identify it.


--------------------


cfg stuff

Viewing the CFG
Control-flow graph rendering is a hard problem. angr does not provide any built-in mechanism for rendering the output of a CFG analysis, and attempting to use a traditional graph rendering library, like matplotlib, will result in an unusable image.

One solution for viewing angr CFGs is found in axt's angr-utils repository.

https://github.com/angr/angr-doc/blob/master/docs/analyses/cfg.md
https://github.com/axt/angr-utils
https://github.com/axt/cfg-explorer

Install:

cd angr-dev
git clone https://github.com/axt/bingraphvis
pip install -e ./bingraphvis
git clone https://github.com/axt/angr-utils
pip install -e ./angr-utils


