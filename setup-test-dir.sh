#!/bin/bash
TOP=`git rev-parse --show-toplevel`
test_root=`$TOP/get-test-root.sh`
if [[ ! $(echo $test_root | grep /tmp/hashbackup-tests | wc -c) -gt 1 ]]; then
    echo 'Invalid test test_root! Must be /tmp/hashbackup-tests'
    exit 1
fi

name=$1
if [[ ! $(echo $name | wc -c) -gt 1 ]]; then
    echo 'Test name empty! Please provide a name.'
    exit 1
fi

test_dir=`$TOP/get-test-dir.sh $name`

# Clean things up
if [[ -d $test_dir ]]; then
    rm -rf $test_dir
fi

mkdir -p $test_dir/d
mkdir -p $test_dir/r
