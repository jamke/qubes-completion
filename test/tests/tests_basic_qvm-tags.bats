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

@test "Test 000. qvm-tags: qvm-tags " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-tags '
}

@test "Test 001. qvm-tags: qvm-tags -" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="-v" [2]="--quiet" [3]="-q" [4]="--help" [5]="-h")
    test_wrapper 'qvm-tags -'
}

@test "Test 002. qvm-tags: qvm-tags --" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="--quiet" [2]="--help")
    test_wrapper 'qvm-tags --'
}

@test "Test 003. qvm-tags: qvm-tags -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-tags -- '
}

@test "Test 004. qvm-tags: qvm-tags -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags -- -'
}

@test "Test 005. qvm-tags: qvm-tags -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-tags -h'
}

@test "Test 006. qvm-tags: qvm-tags --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-tags --h'
}

@test "Test 007. qvm-tags: qvm-tags run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-tags run'
}

@test "Test 008. qvm-tags: qvm-tags runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-tags runnin'
}

@test "Test 009. qvm-tags: qvm-tags running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-tags running'
}

@test "Test 010. qvm-tags: qvm-tags running " {
    EXPECTED_COMPREPLY=([0]="list" [1]="set" [2]="unset" [3]="add" [4]="del")
    test_wrapper 'qvm-tags running '
}

@test "Test 011. qvm-tags: qvm-tags \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-tags "run'
}

@test "Test 012. qvm-tags: qvm-tags \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-tags "runnin'
}

@test "Test 013. qvm-tags: qvm-tags \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-tags "running'
}

@test "Test 014. qvm-tags: qvm-tags \"running\" " {
    EXPECTED_COMPREPLY=([0]="list" [1]="set" [2]="unset" [3]="add" [4]="del")
    test_wrapper 'qvm-tags "running" '
}

@test "Test 015. qvm-tags: qvm-tags 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-tags '\''run'
}

@test "Test 016. qvm-tags: qvm-tags 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-tags '\''runnin'
}

@test "Test 017. qvm-tags: qvm-tags 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-tags '\''running'
}

@test "Test 018. qvm-tags: qvm-tags 'running' " {
    EXPECTED_COMPREPLY=([0]="list" [1]="set" [2]="unset" [3]="add" [4]="del")
    test_wrapper 'qvm-tags '\''running'\'' '
}

@test "Test 019. qvm-tags: qvm-tags nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags nonexistent'
}

@test "Test 020. qvm-tags: qvm-tags nonexistent " {
    EXPECTED_COMPREPLY=([0]="list" [1]="set" [2]="unset" [3]="add" [4]="del")
    test_wrapper 'qvm-tags nonexistent '
}

@test "Test 021. qvm-tags: qvm-tags nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags nonexistent -'
}

@test "Test 022. qvm-tags: qvm-tags nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags nonexistent --'
}

@test "Test 023. qvm-tags: qvm-tags nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="list" [1]="set" [2]="unset" [3]="add" [4]="del")
    test_wrapper 'qvm-tags nonexistent -- '
}

@test "Test 024. qvm-tags: qvm-tags nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags nonexistent -h'
}

@test "Test 025. qvm-tags: qvm-tags nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags nonexistent --h'
}

@test "Test 026. qvm-tags: qvm-tags --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags --something_unknown'
}

@test "Test 027. qvm-tags: qvm-tags --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-tags --something_unknown '
}

@test "Test 028. qvm-tags: qvm-tags --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags --something_unknown='
}

@test "Test 029. qvm-tags: qvm-tags --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="-v" [2]="--quiet" [3]="-q" [4]="--help" [5]="-h")
    test_wrapper 'qvm-tags --something_unknown -'
}

@test "Test 030. qvm-tags: qvm-tags --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="--quiet" [2]="--help")
    test_wrapper 'qvm-tags --something_unknown --'
}

@test "Test 031. qvm-tags: qvm-tags --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-tags --something_unknown -- '
}

@test "Test 032. qvm-tags: qvm-tags --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-tags --something_unknown -h'
}

@test "Test 033. qvm-tags: qvm-tags --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-tags --something_unknown --h'
}

