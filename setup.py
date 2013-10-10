#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
    keen importer: setup script
'''

# distutils
from distutils.core import setup


setup(name="importer",
      version="0.0.1",
      description="Data transfer tool for analytics providers",
      author="Sam Gammon",
      author_email="sam@keen.io",
      url="https://github.com/keen-labs/Keen-Importer",
      packages=["keen"],
      install_requires=["mixpanel", "keen"],
      tests_require=["nose"]
)
