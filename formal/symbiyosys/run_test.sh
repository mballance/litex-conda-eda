#!/bin/bash

set -e
set +x

cd sbysrc

sed -i -e 's/yices/boolector/g' demo3.sby

$PREFIX/bin/sby demo3.sby > output 2>&1

passed=`grep 'Status: passed' output | wc -l`

if test $passed -ne 1; then
  echo "Error: test failed"
  cat output
  exit 1
fi

