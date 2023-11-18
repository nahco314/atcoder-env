# atcoder-env

[日本語版の `README.md`](https://github.com/nahco314/atcoder-env/blob/master/README.ja.md)

This is a set of tool containers for replicating the AtCoder environment locally and running the code.

Based on the [Spreadsheet of language updates](https://docs.google.com/spreadsheets/d/1HXyOXt5bKwhKWXruzUvfMFHQtBxfZQ0047W7VVObnXI/edit#gid=0), we create a docker container for each language and compile and run it.

There are some differences from the actual AtCoder environment, but the version of the language processing system and the libraries should be the same, which is useful for compatibility checks.

Also, it eliminates the need for setting up an environment for the language processing system.

Please note that docker cli must be installed in order to run.

## Installation

If you are using [rye](https://rye-up.com/guide/installation/):
```shell
rye install atcoder-env --git https://github.com/nahco314/atcoder-env.git
```

If you are using pip:
```shell
pip install git+https://github.com/nahco314/atcoder-env.git
```

## Usage

First, find the language ID using the `atcoder-env search` command.
```shell
$ atcoder-env search Python
Python (CPython 3.11.4):
  id  : python-cpython-3.11.4
  tag : d66573ba
Python (PyPy 3.10-v7.3.12):
  id  : python-pypy-3.10-v7.3.12
  tag : 2dea280c
Python (Cython 0.29.34):
  id  : python-cython-0.29.34
  tag : 2ae55f54
Python (Mambaforge / CPython 3.10.10):
  id  : python-mambaforge---cpython-3.10.10
  tag : 6f72f33d
```

Copy the ID of the language processing system you want to use and run it by `atcoder-env run {language-id} {file}`.
```shell
$ atcoder-env run python-pypy-3.10-v7.3.12 ./helloworld.py
Hello,World!
```

## Details

Each language's docker containers for execution are uploaded as `nahco314/atcoder-env:{tag-name}`. You can check the `tag-name` field through `atcoder-env search`.

Compilation and execution are done in `/tmp/run.bash` inside the container.

Passing `compile` as an argument performs a compilation.

Passing `check` as an argument determines whether the compilation was successful (i.e., whether the object file exists).

Passing `run` as an argument performs an execution.
