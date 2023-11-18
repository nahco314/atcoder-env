# atcoder-env

ローカルでAtCoderの環境を再現してコードを実行するためのツール・コンテナ群です。

[言語アップデートのスプレッドシート](https://docs.google.com/spreadsheets/d/1HXyOXt5bKwhKWXruzUvfMFHQtBxfZQ0047W7VVObnXI/edit#gid=0) に基づき言語ごとの docker コンテナを作り、その上でコンパイル・実行します。

いくつかの点で実際の AtCoder 環境とは違いますが、処理系バージョンやライブラリは同じになってるはずなので、そういった互換性のチェックに便利です。

また、言語処理系に関する環境構築が不要になります。

なお、動かすには docker cli がインストールされている必要があります。

## インストール

[rye](https://rye-up.com/guide/installation/) を使う場合:
```shell
rye install atcoder-env --git https://github.com/nahco314/atcoder-env.git
```

pip を使う場合:
```shell
pip install git+https://github.com/nahco314/atcoder-env.git
```

## 使い方
まず、 `atcoder-env search` コマンドで言語の id を探します。
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

使いたい処理系の id をコピペし、 `atcoder-env run {言語id} {ファイル}` で実行します。

```shell
$ atcoder-env run python-pypy-3.10-v7.3.12 ./helloworld.py
Hello,World!
```

## 詳細

各言語の実行に使う docker コンテナは、 `nahco314/atcoder-env:{tag-name}` としてアップロードしています。`tag-name` は `atcoder-env search` の tag 欄で確認できます。

コンテナ内の `/tmp/run.bash` でコンパイルや実行を行います。

引数に `compile` を渡すとコンパイルを行います。

引数に `check` を渡すとコンパイルが成功したか(オブジェクトファイルが存在するか)を判定します。

引数に `run` を渡すと実行します。
