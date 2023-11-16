import argparse
import subprocess
from pathlib import Path
from tempfile import TemporaryFile

from atcoder_env.languages import Language, get_language


def run(language: Language, file_path: Path) -> None:
    with TemporaryFile() as dummy_stdin:
        create_res = subprocess.run(
            [
                "docker",
                "create",
                "-i",
                "-v",
                f"{file_path.absolute()}:/judge/{language.filename}:ro",
                f"atcoder-env:{language.tag_name}",
            ],
            stdin=dummy_stdin,
            capture_output=True,
            check=True,
        )

        container_id = create_res.stdout.strip()

        try:
            subprocess.run(
                [
                    "docker",
                    "start",
                    container_id,
                ],
                stdin=dummy_stdin,
                capture_output=True,
                check=True,
            )

            compile_res = subprocess.run(
                ["docker", "exec", "-i", container_id, "/tmp/run.bash", "compile"],
                stdin=dummy_stdin,
                capture_output=True,
                check=False,
            )

            check_res = subprocess.run(
                ["docker", "exec", "-i", container_id, "/tmp/run.bash", "check"],
                stdin=dummy_stdin,
                capture_output=True,
                check=False,
            )

            if check_res.stdout.strip() == b"1":
                print("Compile Error")
                print(compile_res.stderr.decode())
                exit(1)

            run_res = subprocess.run(
                ["docker", "exec", "-i", container_id, "/tmp/run.bash", "run"],
                capture_output=False,
                check=False,
            )

            if run_res.returncode != 0:
                exit(run_res.returncode)

        finally:
            subprocess.run(
                [
                    "docker",
                    "rm",
                    "-f",
                    container_id,
                ],
                capture_output=True,
                check=True,
            )


def main() -> None:
    parser = argparse.ArgumentParser("atcoder-env")

    parser.add_argument("language-name", type=str)
    parser.add_argument("file-path", type=Path)

    args = parser.parse_args()

    language_name = getattr(args, "language-name")
    file_path = getattr(args, "file-path")

    run(get_language(language_name), file_path)


if __name__ == "__main__":
    main()
