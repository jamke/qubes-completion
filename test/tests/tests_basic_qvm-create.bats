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

@test "Test 000. qvm-create: qvm-create " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-create '
}

@test "Test 001. qvm-create: qvm-create -" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="-C" [2]="--property" [3]="-P" [4]="--pool" [5]="-p" [6]="--template" [7]="-t" [8]="--label" [9]="-l" [10]="--root-copy-from" [11]="-r" [12]="--root-move-from" [13]="-R" [14]="--standalone" [15]="--disp" [16]="--help-classes" [17]="--verbose" [18]="-v" [19]="--quiet" [20]="-q" [21]="--help" [22]="-h")
    test_wrapper 'qvm-create -'
}

@test "Test 002. qvm-create: qvm-create --" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="--property" [2]="--pool" [3]="--template" [4]="--label" [5]="--root-copy-from" [6]="--root-move-from" [7]="--standalone" [8]="--disp" [9]="--help-classes" [10]="--verbose" [11]="--quiet" [12]="--help")
    test_wrapper 'qvm-create --'
}

@test "Test 003. qvm-create: qvm-create -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-create -- '
}

@test "Test 004. qvm-create: qvm-create -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create -- -'
}

@test "Test 005. qvm-create: qvm-create -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-create -h'
}

@test "Test 006. qvm-create: qvm-create --h" {
    EXPECTED_COMPREPLY=([0]="--help-classes" [1]="--help")
    test_wrapper 'qvm-create --h'
}

@test "Test 007. qvm-create: qvm-create run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-create run'
}

@test "Test 008. qvm-create: qvm-create runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-create runnin'
}

@test "Test 009. qvm-create: qvm-create running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-create running'
}

@test "Test 010. qvm-create: qvm-create running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create running '
}

@test "Test 011. qvm-create: qvm-create \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-create "run'
}

@test "Test 012. qvm-create: qvm-create \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-create "runnin'
}

@test "Test 013. qvm-create: qvm-create \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-create "running'
}

@test "Test 014. qvm-create: qvm-create \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create "running" '
}

@test "Test 015. qvm-create: qvm-create 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-create '\''run'
}

@test "Test 016. qvm-create: qvm-create 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-create '\''runnin'
}

@test "Test 017. qvm-create: qvm-create 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-create '\''running'
}

@test "Test 018. qvm-create: qvm-create 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create '\''running'\'' '
}

@test "Test 019. qvm-create: qvm-create nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent'
}

@test "Test 020. qvm-create: qvm-create nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent '
}

@test "Test 021. qvm-create: qvm-create nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent -'
}

@test "Test 022. qvm-create: qvm-create nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent --'
}

@test "Test 023. qvm-create: qvm-create nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent -- '
}

@test "Test 024. qvm-create: qvm-create nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent -h'
}

@test "Test 025. qvm-create: qvm-create nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent --h'
}

@test "Test 026. qvm-create: qvm-create --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create --something_unknown'
}

@test "Test 027. qvm-create: qvm-create --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-create --something_unknown '
}

@test "Test 028. qvm-create: qvm-create --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create --something_unknown='
}

@test "Test 029. qvm-create: qvm-create --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="-C" [2]="--property" [3]="-P" [4]="--pool" [5]="-p" [6]="--template" [7]="-t" [8]="--label" [9]="-l" [10]="--root-copy-from" [11]="-r" [12]="--root-move-from" [13]="-R" [14]="--standalone" [15]="--disp" [16]="--help-classes" [17]="--verbose" [18]="-v" [19]="--quiet" [20]="-q" [21]="--help" [22]="-h")
    test_wrapper 'qvm-create --something_unknown -'
}

@test "Test 030. qvm-create: qvm-create --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="--property" [2]="--pool" [3]="--template" [4]="--label" [5]="--root-copy-from" [6]="--root-move-from" [7]="--standalone" [8]="--disp" [9]="--help-classes" [10]="--verbose" [11]="--quiet" [12]="--help")
    test_wrapper 'qvm-create --something_unknown --'
}

@test "Test 031. qvm-create: qvm-create --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-create --something_unknown -- '
}

@test "Test 032. qvm-create: qvm-create --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-create --something_unknown -h'
}

@test "Test 033. qvm-create: qvm-create --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help-classes" [1]="--help")
    test_wrapper 'qvm-create --something_unknown --h'
}

