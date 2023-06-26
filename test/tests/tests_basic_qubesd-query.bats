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

@test "Test 000. qubesd-query: qubesd-query " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubesd-query '
}

@test "Test 001. qubesd-query: qubesd-query -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--connect" [3]="-c" [4]="--empty" [5]="-e" [6]="--fail")
    test_wrapper 'qubesd-query -'
}

@test "Test 002. qubesd-query: qubesd-query --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--connect" [2]="--empty" [3]="--fail")
    test_wrapper 'qubesd-query --'
}

@test "Test 003. qubesd-query: qubesd-query -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubesd-query -- '
}

@test "Test 004. qubesd-query: qubesd-query -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query -- -'
}

@test "Test 005. qubesd-query: qubesd-query -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubesd-query -h'
}

@test "Test 006. qubesd-query: qubesd-query --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubesd-query --h'
}

@test "Test 007. qubesd-query: qubesd-query run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubesd-query run'
}

@test "Test 008. qubesd-query: qubesd-query runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubesd-query runnin'
}

@test "Test 009. qubesd-query: qubesd-query running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubesd-query running'
}

@test "Test 010. qubesd-query: qubesd-query running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query running '
}

@test "Test 011. qubesd-query: qubesd-query \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubesd-query "run'
}

@test "Test 012. qubesd-query: qubesd-query \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubesd-query "runnin'
}

@test "Test 013. qubesd-query: qubesd-query \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubesd-query "running'
}

@test "Test 014. qubesd-query: qubesd-query \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query "running" '
}

@test "Test 015. qubesd-query: qubesd-query 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubesd-query '\''run'
}

@test "Test 016. qubesd-query: qubesd-query 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubesd-query '\''runnin'
}

@test "Test 017. qubesd-query: qubesd-query 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubesd-query '\''running'
}

@test "Test 018. qubesd-query: qubesd-query 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query '\''running'\'' '
}

@test "Test 019. qubesd-query: qubesd-query nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query nonexistent'
}

@test "Test 020. qubesd-query: qubesd-query nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query nonexistent '
}

@test "Test 021. qubesd-query: qubesd-query nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query nonexistent -'
}

@test "Test 022. qubesd-query: qubesd-query nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query nonexistent --'
}

@test "Test 023. qubesd-query: qubesd-query nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query nonexistent -- '
}

@test "Test 024. qubesd-query: qubesd-query nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query nonexistent -h'
}

@test "Test 025. qubesd-query: qubesd-query nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query nonexistent --h'
}

@test "Test 026. qubesd-query: qubesd-query --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query --something_unknown'
}

@test "Test 027. qubesd-query: qubesd-query --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubesd-query --something_unknown '
}

@test "Test 028. qubesd-query: qubesd-query --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesd-query --something_unknown='
}

@test "Test 029. qubesd-query: qubesd-query --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--connect" [3]="-c" [4]="--empty" [5]="-e" [6]="--fail")
    test_wrapper 'qubesd-query --something_unknown -'
}

@test "Test 030. qubesd-query: qubesd-query --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--connect" [2]="--empty" [3]="--fail")
    test_wrapper 'qubesd-query --something_unknown --'
}

@test "Test 031. qubesd-query: qubesd-query --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubesd-query --something_unknown -- '
}

@test "Test 032. qubesd-query: qubesd-query --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubesd-query --something_unknown -h'
}

@test "Test 033. qubesd-query: qubesd-query --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubesd-query --something_unknown --h'
}

