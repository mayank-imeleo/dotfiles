import os
from pathlib import Path

from dotenv import dotenv_values
from mako.template import Template


def main():
    os.chdir(Path(__file__).parent)
    data = dotenv_values(Path('~/.env').expanduser())
    for root, dirs, files in os.walk(Path(__file__).parent / 'templates'):
        for file in files:
            template = Template(filename=f'{root}/{file}')
            for k, v in data.items():
                try:
                    template = Template(template.render(**{k: v}))
                except NameError as e:
                    continue
                with open(f'/tmp/{file}', 'w') as f:
                    f.write(template.render())


if __name__ == '__main__':
    main()
