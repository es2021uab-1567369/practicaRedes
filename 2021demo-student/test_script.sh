#!/bin/bash

echo "If you run this file, it will not work because the exam-tester binary is missing in this demo.";

function finish {
    echo "TEST FAILED"
}

trap finish EXIT

# Killing exam just in case it was already running...

killall exam > /dev/null 2>&1 && { echo "Exam binary was still running... killing it. You may want to wait for a few seconds for the port to be available again"; }

set -e

# Starting server

bin/exam&

# Waiting a bit for the server to start

sleep .2

# Testing server

bin/exam-tester

killall exam > /dev/null 2>&1 && { echo "Exam binary still running when should have stopped!" ; exit 1; }

trap - EXIT
