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

@test "Test 000. qubes-hcl-report: qubes-hcl-report " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-hcl-report '
}

@test "Test 001. qubes-hcl-report: qubes-hcl-report -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--support" [3]="-s")
    test_wrapper 'qubes-hcl-report -'
}

@test "Test 002. qubes-hcl-report: qubes-hcl-report --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--support")
    test_wrapper 'qubes-hcl-report --'
}

@test "Test 003. qubes-hcl-report: qubes-hcl-report -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-hcl-report -- '
}

@test "Test 004. qubes-hcl-report: qubes-hcl-report -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report -- -'
}

@test "Test 005. qubes-hcl-report: qubes-hcl-report -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-hcl-report -h'
}

@test "Test 006. qubes-hcl-report: qubes-hcl-report --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-hcl-report --h'
}

@test "Test 007. qubes-hcl-report: qubes-hcl-report run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-hcl-report run'
}

@test "Test 008. qubes-hcl-report: qubes-hcl-report runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-hcl-report runnin'
}

@test "Test 009. qubes-hcl-report: qubes-hcl-report running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-hcl-report running'
}

@test "Test 010. qubes-hcl-report: qubes-hcl-report running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report running '
}

@test "Test 011. qubes-hcl-report: qubes-hcl-report \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-hcl-report "run'
}

@test "Test 012. qubes-hcl-report: qubes-hcl-report \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-hcl-report "runnin'
}

@test "Test 013. qubes-hcl-report: qubes-hcl-report \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-hcl-report "running'
}

@test "Test 014. qubes-hcl-report: qubes-hcl-report \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report "running" '
}

@test "Test 015. qubes-hcl-report: qubes-hcl-report 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-hcl-report '\''run'
}

@test "Test 016. qubes-hcl-report: qubes-hcl-report 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-hcl-report '\''runnin'
}

@test "Test 017. qubes-hcl-report: qubes-hcl-report 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-hcl-report '\''running'
}

@test "Test 018. qubes-hcl-report: qubes-hcl-report 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report '\''running'\'' '
}

@test "Test 019. qubes-hcl-report: qubes-hcl-report nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report nonexistent'
}

@test "Test 020. qubes-hcl-report: qubes-hcl-report nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report nonexistent '
}

@test "Test 021. qubes-hcl-report: qubes-hcl-report nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report nonexistent -'
}

@test "Test 022. qubes-hcl-report: qubes-hcl-report nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report nonexistent --'
}

@test "Test 023. qubes-hcl-report: qubes-hcl-report nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report nonexistent -- '
}

@test "Test 024. qubes-hcl-report: qubes-hcl-report nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report nonexistent -h'
}

@test "Test 025. qubes-hcl-report: qubes-hcl-report nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report nonexistent --h'
}

@test "Test 026. qubes-hcl-report: qubes-hcl-report --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report --something_unknown'
}

@test "Test 027. qubes-hcl-report: qubes-hcl-report --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-hcl-report --something_unknown '
}

@test "Test 028. qubes-hcl-report: qubes-hcl-report --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-hcl-report --something_unknown='
}

@test "Test 029. qubes-hcl-report: qubes-hcl-report --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--support" [3]="-s")
    test_wrapper 'qubes-hcl-report --something_unknown -'
}

@test "Test 030. qubes-hcl-report: qubes-hcl-report --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--support")
    test_wrapper 'qubes-hcl-report --something_unknown --'
}

@test "Test 031. qubes-hcl-report: qubes-hcl-report --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-hcl-report --something_unknown -- '
}

@test "Test 032. qubes-hcl-report: qubes-hcl-report --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-hcl-report --something_unknown -h'
}

@test "Test 033. qubes-hcl-report: qubes-hcl-report --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-hcl-report --something_unknown --h'
}

