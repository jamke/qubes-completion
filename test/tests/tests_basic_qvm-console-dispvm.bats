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

@test "Test 000. qvm-console-dispvm: qvm-console-dispvm " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-console-dispvm '
}

@test "Test 001. qvm-console-dispvm: qvm-console-dispvm -" {
    EXPECTED_COMPREPLY=([0]="--autostart" [1]="-h" [2]="--help")
    test_wrapper 'qvm-console-dispvm -'
}

@test "Test 002. qvm-console-dispvm: qvm-console-dispvm --" {
    EXPECTED_COMPREPLY=([0]="--autostart" [1]="--help")
    test_wrapper 'qvm-console-dispvm --'
}

@test "Test 003. qvm-console-dispvm: qvm-console-dispvm -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-console-dispvm -- '
}

@test "Test 004. qvm-console-dispvm: qvm-console-dispvm -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm -- -'
}

@test "Test 005. qvm-console-dispvm: qvm-console-dispvm -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-console-dispvm -h'
}

@test "Test 006. qvm-console-dispvm: qvm-console-dispvm --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-console-dispvm --h'
}

@test "Test 007. qvm-console-dispvm: qvm-console-dispvm run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-console-dispvm run'
}

@test "Test 008. qvm-console-dispvm: qvm-console-dispvm runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-console-dispvm runnin'
}

@test "Test 009. qvm-console-dispvm: qvm-console-dispvm running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-console-dispvm running'
}

@test "Test 010. qvm-console-dispvm: qvm-console-dispvm running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm running '
}

@test "Test 011. qvm-console-dispvm: qvm-console-dispvm \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-console-dispvm "run'
}

@test "Test 012. qvm-console-dispvm: qvm-console-dispvm \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-console-dispvm "runnin'
}

@test "Test 013. qvm-console-dispvm: qvm-console-dispvm \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-console-dispvm "running'
}

@test "Test 014. qvm-console-dispvm: qvm-console-dispvm \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm "running" '
}

@test "Test 015. qvm-console-dispvm: qvm-console-dispvm 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-console-dispvm '\''run'
}

@test "Test 016. qvm-console-dispvm: qvm-console-dispvm 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-console-dispvm '\''runnin'
}

@test "Test 017. qvm-console-dispvm: qvm-console-dispvm 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-console-dispvm '\''running'
}

@test "Test 018. qvm-console-dispvm: qvm-console-dispvm 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm '\''running'\'' '
}

@test "Test 019. qvm-console-dispvm: qvm-console-dispvm nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm nonexistent'
}

@test "Test 020. qvm-console-dispvm: qvm-console-dispvm nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm nonexistent '
}

@test "Test 021. qvm-console-dispvm: qvm-console-dispvm nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm nonexistent -'
}

@test "Test 022. qvm-console-dispvm: qvm-console-dispvm nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm nonexistent --'
}

@test "Test 023. qvm-console-dispvm: qvm-console-dispvm nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm nonexistent -- '
}

@test "Test 024. qvm-console-dispvm: qvm-console-dispvm nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm nonexistent -h'
}

@test "Test 025. qvm-console-dispvm: qvm-console-dispvm nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm nonexistent --h'
}

@test "Test 026. qvm-console-dispvm: qvm-console-dispvm --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm --something_unknown'
}

@test "Test 027. qvm-console-dispvm: qvm-console-dispvm --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-console-dispvm --something_unknown '
}

@test "Test 028. qvm-console-dispvm: qvm-console-dispvm --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-console-dispvm --something_unknown='
}

@test "Test 029. qvm-console-dispvm: qvm-console-dispvm --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--autostart" [1]="-h" [2]="--help")
    test_wrapper 'qvm-console-dispvm --something_unknown -'
}

@test "Test 030. qvm-console-dispvm: qvm-console-dispvm --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--autostart" [1]="--help")
    test_wrapper 'qvm-console-dispvm --something_unknown --'
}

@test "Test 031. qvm-console-dispvm: qvm-console-dispvm --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-console-dispvm --something_unknown -- '
}

@test "Test 032. qvm-console-dispvm: qvm-console-dispvm --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-console-dispvm --something_unknown -h'
}

@test "Test 033. qvm-console-dispvm: qvm-console-dispvm --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-console-dispvm --something_unknown --h'
}

