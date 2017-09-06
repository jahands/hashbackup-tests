#!/bin/bash
TOP=`git rev-parse --show-toplevel`
name='cmd/dest/clean/multi-dests'
$TOP/setup-test-dir.sh $name
# test dir
D=`$TOP/get-test-dir.sh $name`
# hb repo dir
R="$D/r/hb"

