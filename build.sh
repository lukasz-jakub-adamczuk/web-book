#!/bin/bash

# concatenate chapters
sh ./create_chapters.sh

# generate pdf
make
