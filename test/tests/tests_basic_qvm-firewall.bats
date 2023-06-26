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

@test "Test 000. qvm-firewall: qvm-firewall " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-firewall '
}

@test "Test 001. qvm-firewall: qvm-firewall -" {
    EXPECTED_COMPREPLY=([0]="--reload" [1]="-r" [2]="--raw" [3]="--verbose" [4]="-v" [5]="--quiet" [6]="-q" [7]="--help" [8]="-h")
    test_wrapper 'qvm-firewall -'
}

@test "Test 002. qvm-firewall: qvm-firewall --" {
    EXPECTED_COMPREPLY=([0]="--reload" [1]="--raw" [2]="--verbose" [3]="--quiet" [4]="--help")
    test_wrapper 'qvm-firewall --'
}

@test "Test 003. qvm-firewall: qvm-firewall -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-firewall -- '
}

@test "Test 004. qvm-firewall: qvm-firewall -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-firewall -- -'
}

@test "Test 005. qvm-firewall: qvm-firewall -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-firewall -h'
}

@test "Test 006. qvm-firewall: qvm-firewall --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-firewall --h'
}

@test "Test 007. qvm-firewall: qvm-firewall run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-firewall run'
}

@test "Test 008. qvm-firewall: qvm-firewall runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-firewall runnin'
}

@test "Test 009. qvm-firewall: qvm-firewall running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-firewall running'
}

@test "Test 010. qvm-firewall: qvm-firewall running " {
    EXPECTED_COMPREPLY=([0]="add" [1]="del" [2]="list" [3]="reset")
    test_wrapper 'qvm-firewall running '
}

@test "Test 011. qvm-firewall: qvm-firewall \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-firewall "run'
}

@test "Test 012. qvm-firewall: qvm-firewall \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-firewall "runnin'
}

@test "Test 013. qvm-firewall: qvm-firewall \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-firewall "running'
}

@test "Test 014. qvm-firewall: qvm-firewall \"running\" " {
    EXPECTED_COMPREPLY=([0]="add" [1]="del" [2]="list" [3]="reset")
    test_wrapper 'qvm-firewall "running" '
}

@test "Test 015. qvm-firewall: qvm-firewall 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-firewall '\''run'
}

@test "Test 016. qvm-firewall: qvm-firewall 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-firewall '\''runnin'
}

@test "Test 017. qvm-firewall: qvm-firewall 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-firewall '\''running'
}

@test "Test 018. qvm-firewall: qvm-firewall 'running' " {
    EXPECTED_COMPREPLY=([0]="add" [1]="del" [2]="list" [3]="reset")
    test_wrapper 'qvm-firewall '\''running'\'' '
}

@test "Test 019. qvm-firewall: qvm-firewall nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-firewall nonexistent'
}

@test "Test 020. qvm-firewall: qvm-firewall nonexistent " {
    EXPECTED_COMPREPLY=([0]="add" [1]="del" [2]="list" [3]="reset")
    test_wrapper 'qvm-firewall nonexistent '
}

@test "Test 021. qvm-firewall: qvm-firewall nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-firewall nonexistent -'
}

@test "Test 022. qvm-firewall: qvm-firewall nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-firewall nonexistent --'
}

@test "Test 023. qvm-firewall: qvm-firewall nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="add" [1]="del" [2]="list" [3]="reset")
    test_wrapper 'qvm-firewall nonexistent -- '
}

@test "Test 024. qvm-firewall: qvm-firewall nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-firewall nonexistent -h'
}

@test "Test 025. qvm-firewall: qvm-firewall nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-firewall nonexistent --h'
}

@test "Test 026. qvm-firewall: qvm-firewall --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-firewall --something_unknown'
}

@test "Test 027. qvm-firewall: qvm-firewall --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-firewall --something_unknown '
}

@test "Test 028. qvm-firewall: qvm-firewall --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-firewall --something_unknown='
}

@test "Test 029. qvm-firewall: qvm-firewall --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--reload" [1]="-r" [2]="--raw" [3]="--verbose" [4]="-v" [5]="--quiet" [6]="-q" [7]="--help" [8]="-h")
    test_wrapper 'qvm-firewall --something_unknown -'
}

@test "Test 030. qvm-firewall: qvm-firewall --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--reload" [1]="--raw" [2]="--verbose" [3]="--quiet" [4]="--help")
    test_wrapper 'qvm-firewall --something_unknown --'
}

@test "Test 031. qvm-firewall: qvm-firewall --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-firewall --something_unknown -- '
}

@test "Test 032. qvm-firewall: qvm-firewall --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-firewall --something_unknown -h'
}

@test "Test 033. qvm-firewall: qvm-firewall --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-firewall --something_unknown --h'
}

