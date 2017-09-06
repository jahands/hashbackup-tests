#!/bin/bash
name=$1
if [[ ! $(echo $name | wc -c) -gt 1 ]]; then
    echo 'Test name empty! Please provide a name.'
    exit 1
fi
TOP=`git rev-parse --show-toplevel`
test_root=`$TOP/get-test-root.sh`

test_dir="$test_root/$name"

echo $test_dir
