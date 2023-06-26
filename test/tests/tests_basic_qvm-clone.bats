#!/usr/bin/env bats

function setup() {
    
    source "${BATS_TEST_DIRNAME}/../tests_common.sh"

    load "${BATS_TEST_DIRNAME}/../test_helper/bats-support/load"
    load "${BATS_TEST_DIRNAME}/../test_helper/bats-assert/load"

    tests_common_setup
}


function test_wrapper() {
    run test_command "${1}"
    assert_success
    assert_output ''
}

@test "Test 000. qvm-clone: qvm-clone " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-clone '
}

@test "Test 001. qvm-clone: qvm-clone -" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="-C" [2]="--ignore-errors" [3]="-p" [4]="-P" [5]="--pool" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qvm-clone -'
}

@test "Test 002. qvm-clone: qvm-clone --" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="--ignore-errors" [2]="--pool" [3]="--verbose" [4]="--quiet" [5]="--help")
    test_wrapper 'qvm-clone --'
}

@test "Test 003. qvm-clone: qvm-clone -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-clone -- '
}

@test "Test 004. qvm-clone: qvm-clone -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-clone -- -'
}

@test "Test 005. qvm-clone: qvm-clone -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-clone -h'
}

@test "Test 006. qvm-clone: qvm-clone --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-clone --h'
}

@test "Test 007. qvm-clone: qvm-clone run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-clone run'
}

@test "Test 008. qvm-clone: qvm-clone runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-clone runnin'
}

@test "Test 009. qvm-clone: qvm-clone running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-clone running'
}

@test "Test 010. qvm-clone: qvm-clone running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-clone running '
}

@test "Test 011. qvm-clone: qvm-clone \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-clone "run'
}

@test "Test 012. qvm-clone: qvm-clone \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-clone "runnin'
}

@test "Test 013. qvm-clone: qvm-clone \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-clone "running'
}

@test "Test 014. qvm-clone: qvm-clone \"running\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-clone "running" '
}

@test "Test 015. qvm-clone: qvm-clone 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-clone '\''run'
}

@test "Test 016. qvm-clone: qvm-clone 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-clone '\''runnin'
}

@test "Test 017. qvm-clone: qvm-clone 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-clone '\''running'
}

@test "Test 018. qvm-clone: qvm-clone 'running' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-clone '\''running'\'' '
}

@test "Test 019. qvm-clone: qvm-clone nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-clone nonexistent'
}

@test "Test 020. qvm-clone: qvm-clone nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-clone nonexistent '
}

@test "Test 021. qvm-clone: qvm-clone nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-clone nonexistent -'
}

@test "Test 022. qvm-clone: qvm-clone nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-clone nonexistent --'
}

@test "Test 023. qvm-clone: qvm-clone nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-clone nonexistent -- '
}

@test "Test 024. qvm-clone: qvm-clone nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-clone nonexistent -h'
}

@test "Test 025. qvm-clone: qvm-clone nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-clone nonexistent --h'
}

@test "Test 026. qvm-clone: qvm-clone --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-clone --something_unknown'
}

@test "Test 027. qvm-clone: qvm-clone --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-clone --something_unknown '
}

@test "Test 028. qvm-clone: qvm-clone --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-clone --something_unknown='
}

@test "Test 029. qvm-clone: qvm-clone --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="-C" [2]="--ignore-errors" [3]="-p" [4]="-P" [5]="--pool" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qvm-clone --something_unknown -'
}

@test "Test 030. qvm-clone: qvm-clone --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="--ignore-errors" [2]="--pool" [3]="--verbose" [4]="--quiet" [5]="--help")
    test_wrapper 'qvm-clone --something_unknown --'
}

@test "Test 031. qvm-clone: qvm-clone --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-clone --something_unknown -- '
}

@test "Test 032. qvm-clone: qvm-clone --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-clone --something_unknown -h'
}

@test "Test 033. qvm-clone: qvm-clone --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-clone --something_unknown --h'
}

