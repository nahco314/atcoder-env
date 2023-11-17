import argparse
from pathlib import Path
from typing import Any

from atcoder_env.languages import get_language, search_language
from atcoder_env.run import run


def handle_run(args: Any) -> None:
    language_id: str = getattr(args, "language-id")
    file_path: Path = getattr(args, "file-path")

    run(get_language(language_id), file_path)


def handle_search(args: Any) -> None:
    language_name: str = getattr(args, "language-name")

    lst = search_language(language_name)

    for lang in lst:
        print(f"{lang.display_id}:")
        print(f"  id  : {lang.id}")
        print(f"  tag : {lang.tag_name}")


def main() -> None:
    parser = argparse.ArgumentParser("atcoder-env")

    subparsers = parser.add_subparsers()

    run_parser = subparsers.add_parser("run")
    run_parser.set_defaults(handler=handle_run)
    run_parser.add_argument("language-id", type=str)
    run_parser.add_argument("file-path", type=Path)

    search_parser = subparsers.add_parser("search")
    search_parser.set_defaults(handler=handle_search)
    search_parser.add_argument("language-name", type=str)

    args = parser.parse_args()

    args.handler(args)


if __name__ == "__main__":
    main()
