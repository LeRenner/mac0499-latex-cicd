#!/bin/bash

cd src

target=$(cat buildtarget)

make $target