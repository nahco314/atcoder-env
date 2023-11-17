import subprocess
from multiprocessing import Pool

from atcoder_env.languages import Language, languages


def process(lang: Language) -> None:
    print(f"Building {lang.display_name}...")

    try:
        subprocess.run(
            f'DOCKER_BUILDKIT=1 docker build -t atcoder-env:{lang.tag_name} "./images/{lang.id}"',
            shell=True,
            check=True,
            capture_output=True,
        )

    except subprocess.CalledProcessError as e:
        print(f"error in {lang}")
        print(e.stderr.decode())
        raise

    print(f"Built {lang.display_name}.")


def multi_main() -> None:
    with Pool(20) as pool:
        pool.map(process, languages)


def main() -> None:
    for lang in languages:
        print(lang.display_id, lang.tag_name)
        print(
            f'DOCKER_BUILDKIT=1 docker build -t nahco314/atcoder-env:{lang.tag_name} "./images/{lang.id}"'
        )
        subprocess.run(
            f'DOCKER_BUILDKIT=1 docker build -t nahco314/atcoder-env:{lang.tag_name} "./images/{lang.id}"',
            shell=True,
            check=True,
        )
        subprocess.run(
            f"docker push nahco314/atcoder-env:{lang.tag_name}",
            shell=True,
            check=True,
        )


if __name__ == "__main__":
    main()
