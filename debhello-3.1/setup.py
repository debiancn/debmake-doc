#!/usr/bin/python3
# vi:se ts=4 sts=4 et ai:
from distutils.core import setup
from DistUtilsExtra.command import *

setup(name='debhello',
    version='4.2',
    description='Hello Python',
    long_description='Hello Python program.',
    author='Osamu Aoki',
    author_email='osamu@debian.org',
    url='http://people.debian.org/~osamu/',
    packages=['hello_py'],
    package_dir={'hello_py': 'hello_py'},
    scripts=['scripts/hello'],
    data_files=[
        ('share/pixmaps', ['data/hello.png']),
        ('share/man/man1', ['man/hello.1']),
    ],
    classifiers = ['Development Status :: 3 - Alpha',
        'Environment :: Console',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Natural Language :: English',
        'Operating System :: POSIX :: Linux',
        'Programming Language :: Python :: 3',
        'Topic :: Utilities',
    ],
    platforms   = 'POSIX',
    license     = 'MIT License',
    cmdclass={
        'build': build_extra.build_extra,
        'build_i18n' :  build_i18n.build_i18n,
        'build_help' :  build_help.build_help,
        'build_icons' :  build_icons.build_icons,
        'clean_i18n': clean_i18n.clean_i18n,
    }
)

