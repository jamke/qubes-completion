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

@test "Test 000. qvm-kill: qvm-kill " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="standalone4" [6]="sys-usb" [7]="template3" [8]="template4" [9]="transient" [10]="vault")
    test_wrapper 'qvm-kill '
}

@test "Test 001. qvm-kill: qvm-kill -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--help" [7]="-h")
    test_wrapper 'qvm-kill -'
}

@test "Test 002. qvm-kill: qvm-kill --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="--quiet" [4]="--help")
    test_wrapper 'qvm-kill --'
}

@test "Test 003. qvm-kill: qvm-kill -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="standalone4" [6]="sys-usb" [7]="template3" [8]="template4" [9]="transient" [10]="vault")
    test_wrapper 'qvm-kill -- '
}

@test "Test 004. qvm-kill: qvm-kill -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-kill -- -'
}

@test "Test 005. qvm-kill: qvm-kill -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-kill -h'
}

@test "Test 006. qvm-kill: qvm-kill --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-kill --h'
}

@test "Test 007. qvm-kill: qvm-kill run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-kill run'
}

@test "Test 008. qvm-kill: qvm-kill runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-kill runnin'
}

@test "Test 009. qvm-kill: qvm-kill running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-kill running'
}

@test "Test 010. qvm-kill: qvm-kill running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="standalone4" [6]="sys-usb" [7]="template3" [8]="template4" [9]="transient" [10]="vault")
    test_wrapper 'qvm-kill running '
}

@test "Test 011. qvm-kill: qvm-kill \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-kill "run'
}

@test "Test 012. qvm-kill: qvm-kill \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-kill "runnin'
}

@test "Test 013. qvm-kill: qvm-kill \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-kill "running'
}

@test "Test 014. qvm-kill: qvm-kill \"running\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="standalone4" [6]="sys-usb" [7]="template3" [8]="template4" [9]="transient" [10]="vault")
    test_wrapper 'qvm-kill "running" '
}

@test "Test 015. qvm-kill: qvm-kill 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-kill '\''run'
}

@test "Test 016. qvm-kill: qvm-kill 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-kill '\''runnin'
}

@test "Test 017. qvm-kill: qvm-kill 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-kill '\''running'
}

@test "Test 018. qvm-kill: qvm-kill 'running' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="standalone4" [6]="sys-usb" [7]="template3" [8]="template4" [9]="transient" [10]="vault")
    test_wrapper 'qvm-kill '\''running'\'' '
}

@test "Test 019. qvm-kill: qvm-kill nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-kill nonexistent'
}

@test "Test 020. qvm-kill: qvm-kill nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="standalone4" [6]="sys-usb" [7]="template3" [8]="template4" [9]="transient" [10]="vault")
    test_wrapper 'qvm-kill nonexistent '
}

@test "Test 021. qvm-kill: qvm-kill nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-kill nonexistent -'
}

@test "Test 022. qvm-kill: qvm-kill nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-kill nonexistent --'
}

@test "Test 023. qvm-kill: qvm-kill nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="standalone4" [6]="sys-usb" [7]="template3" [8]="template4" [9]="transient" [10]="vault")
    test_wrapper 'qvm-kill nonexistent -- '
}

@test "Test 024. qvm-kill: qvm-kill nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-kill nonexistent -h'
}

@test "Test 025. qvm-kill: qvm-kill nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-kill nonexistent --h'
}

@test "Test 026. qvm-kill: qvm-kill --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-kill --something_unknown'
}

@test "Test 027. qvm-kill: qvm-kill --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="standalone4" [6]="sys-usb" [7]="template3" [8]="template4" [9]="transient" [10]="vault")
    test_wrapper 'qvm-kill --something_unknown '
}

@test "Test 028. qvm-kill: qvm-kill --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-kill --something_unknown='
}

@test "Test 029. qvm-kill: qvm-kill --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--help" [7]="-h")
    test_wrapper 'qvm-kill --something_unknown -'
}

@test "Test 030. qvm-kill: qvm-kill --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="--quiet" [4]="--help")
    test_wrapper 'qvm-kill --something_unknown --'
}

@test "Test 031. qvm-kill: qvm-kill --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="standalone4" [6]="sys-usb" [7]="template3" [8]="template4" [9]="transient" [10]="vault")
    test_wrapper 'qvm-kill --something_unknown -- '
}

@test "Test 032. qvm-kill: qvm-kill --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-kill --something_unknown -h'
}

@test "Test 033. qvm-kill: qvm-kill --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-kill --something_unknown --h'
}

