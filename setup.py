from distutils.core import setup

from setuptools import find_packages

setup(
    name='solidifi',
    version='0.0.1',
    packages=find_packages(),
    install_requires=[
        'matplotlib',
        'ijson',
        'numpy',
        'configparser',
        'pandas'
    ],
    entry_points={
            'console_scripts': [
                'solidifi = solidifi.__main__:main'
            ]
    }
)