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

@test "Test 000. qvm-sync-appmenus: qvm-sync-appmenus " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-sync-appmenus '
}

@test "Test 001. qvm-sync-appmenus: qvm-sync-appmenus -" {
    EXPECTED_COMPREPLY=([0]="--force-rpc" [1]="--regenerate-only" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--help" [7]="-h")
    test_wrapper 'qvm-sync-appmenus -'
}

@test "Test 002. qvm-sync-appmenus: qvm-sync-appmenus --" {
    EXPECTED_COMPREPLY=([0]="--force-rpc" [1]="--regenerate-only" [2]="--verbose" [3]="--quiet" [4]="--help")
    test_wrapper 'qvm-sync-appmenus --'
}

@test "Test 003. qvm-sync-appmenus: qvm-sync-appmenus -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-sync-appmenus -- '
}

@test "Test 004. qvm-sync-appmenus: qvm-sync-appmenus -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus -- -'
}

@test "Test 005. qvm-sync-appmenus: qvm-sync-appmenus -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-sync-appmenus -h'
}

@test "Test 006. qvm-sync-appmenus: qvm-sync-appmenus --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-sync-appmenus --h'
}

@test "Test 007. qvm-sync-appmenus: qvm-sync-appmenus run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-sync-appmenus run'
}

@test "Test 008. qvm-sync-appmenus: qvm-sync-appmenus runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-sync-appmenus runnin'
}

@test "Test 009. qvm-sync-appmenus: qvm-sync-appmenus running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-sync-appmenus running'
}

@test "Test 010. qvm-sync-appmenus: qvm-sync-appmenus running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus running '
}

@test "Test 011. qvm-sync-appmenus: qvm-sync-appmenus \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-sync-appmenus "run'
}

@test "Test 012. qvm-sync-appmenus: qvm-sync-appmenus \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-sync-appmenus "runnin'
}

@test "Test 013. qvm-sync-appmenus: qvm-sync-appmenus \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-sync-appmenus "running'
}

@test "Test 014. qvm-sync-appmenus: qvm-sync-appmenus \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus "running" '
}

@test "Test 015. qvm-sync-appmenus: qvm-sync-appmenus 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-sync-appmenus '\''run'
}

@test "Test 016. qvm-sync-appmenus: qvm-sync-appmenus 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-sync-appmenus '\''runnin'
}

@test "Test 017. qvm-sync-appmenus: qvm-sync-appmenus 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-sync-appmenus '\''running'
}

@test "Test 018. qvm-sync-appmenus: qvm-sync-appmenus 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus '\''running'\'' '
}

@test "Test 019. qvm-sync-appmenus: qvm-sync-appmenus nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus nonexistent'
}

@test "Test 020. qvm-sync-appmenus: qvm-sync-appmenus nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus nonexistent '
}

@test "Test 021. qvm-sync-appmenus: qvm-sync-appmenus nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus nonexistent -'
}

@test "Test 022. qvm-sync-appmenus: qvm-sync-appmenus nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus nonexistent --'
}

@test "Test 023. qvm-sync-appmenus: qvm-sync-appmenus nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus nonexistent -- '
}

@test "Test 024. qvm-sync-appmenus: qvm-sync-appmenus nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus nonexistent -h'
}

@test "Test 025. qvm-sync-appmenus: qvm-sync-appmenus nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus nonexistent --h'
}

@test "Test 026. qvm-sync-appmenus: qvm-sync-appmenus --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus --something_unknown'
}

@test "Test 027. qvm-sync-appmenus: qvm-sync-appmenus --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-sync-appmenus --something_unknown '
}

@test "Test 028. qvm-sync-appmenus: qvm-sync-appmenus --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-appmenus --something_unknown='
}

@test "Test 029. qvm-sync-appmenus: qvm-sync-appmenus --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--force-rpc" [1]="--regenerate-only" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--help" [7]="-h")
    test_wrapper 'qvm-sync-appmenus --something_unknown -'
}

@test "Test 030. qvm-sync-appmenus: qvm-sync-appmenus --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--force-rpc" [1]="--regenerate-only" [2]="--verbose" [3]="--quiet" [4]="--help")
    test_wrapper 'qvm-sync-appmenus --something_unknown --'
}

@test "Test 031. qvm-sync-appmenus: qvm-sync-appmenus --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-sync-appmenus --something_unknown -- '
}

@test "Test 032. qvm-sync-appmenus: qvm-sync-appmenus --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-sync-appmenus --something_unknown -h'
}

@test "Test 033. qvm-sync-appmenus: qvm-sync-appmenus --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-sync-appmenus --something_unknown --h'
}

