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

@test "Test 000. qubes-input-trigger: qubes-input-trigger " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-input-trigger '
}

@test "Test 001. qubes-input-trigger: qubes-input-trigger -" {
    EXPECTED_COMPREPLY=([0]="-h" [1]="--help" [2]="--all" [3]="--action" [4]="--event" [5]="--dom0" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qubes-input-trigger -'
}

@test "Test 002. qubes-input-trigger: qubes-input-trigger --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--all" [2]="--action" [3]="--event" [4]="--dom0" [5]="--verbose" [6]="--quiet" [7]="--help")
    test_wrapper 'qubes-input-trigger --'
}

@test "Test 003. qubes-input-trigger: qubes-input-trigger -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-input-trigger -- '
}

@test "Test 004. qubes-input-trigger: qubes-input-trigger -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger -- -'
}

@test "Test 005. qubes-input-trigger: qubes-input-trigger -h" {
    EXPECTED_COMPREPLY=([0]="-h" [1]="-h")
    test_wrapper 'qubes-input-trigger -h'
}

@test "Test 006. qubes-input-trigger: qubes-input-trigger --h" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--help")
    test_wrapper 'qubes-input-trigger --h'
}

@test "Test 007. qubes-input-trigger: qubes-input-trigger run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-input-trigger run'
}

@test "Test 008. qubes-input-trigger: qubes-input-trigger runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-input-trigger runnin'
}

@test "Test 009. qubes-input-trigger: qubes-input-trigger running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-input-trigger running'
}

@test "Test 010. qubes-input-trigger: qubes-input-trigger running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger running '
}

@test "Test 011. qubes-input-trigger: qubes-input-trigger \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-input-trigger "run'
}

@test "Test 012. qubes-input-trigger: qubes-input-trigger \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-input-trigger "runnin'
}

@test "Test 013. qubes-input-trigger: qubes-input-trigger \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-input-trigger "running'
}

@test "Test 014. qubes-input-trigger: qubes-input-trigger \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger "running" '
}

@test "Test 015. qubes-input-trigger: qubes-input-trigger 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-input-trigger '\''run'
}

@test "Test 016. qubes-input-trigger: qubes-input-trigger 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-input-trigger '\''runnin'
}

@test "Test 017. qubes-input-trigger: qubes-input-trigger 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-input-trigger '\''running'
}

@test "Test 018. qubes-input-trigger: qubes-input-trigger 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger '\''running'\'' '
}

@test "Test 019. qubes-input-trigger: qubes-input-trigger nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger nonexistent'
}

@test "Test 020. qubes-input-trigger: qubes-input-trigger nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger nonexistent '
}

@test "Test 021. qubes-input-trigger: qubes-input-trigger nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger nonexistent -'
}

@test "Test 022. qubes-input-trigger: qubes-input-trigger nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger nonexistent --'
}

@test "Test 023. qubes-input-trigger: qubes-input-trigger nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger nonexistent -- '
}

@test "Test 024. qubes-input-trigger: qubes-input-trigger nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger nonexistent -h'
}

@test "Test 025. qubes-input-trigger: qubes-input-trigger nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger nonexistent --h'
}

@test "Test 026. qubes-input-trigger: qubes-input-trigger --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger --something_unknown'
}

@test "Test 027. qubes-input-trigger: qubes-input-trigger --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-input-trigger --something_unknown '
}

@test "Test 028. qubes-input-trigger: qubes-input-trigger --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-input-trigger --something_unknown='
}

@test "Test 029. qubes-input-trigger: qubes-input-trigger --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="-h" [1]="--help" [2]="--all" [3]="--action" [4]="--event" [5]="--dom0" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qubes-input-trigger --something_unknown -'
}

@test "Test 030. qubes-input-trigger: qubes-input-trigger --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--all" [2]="--action" [3]="--event" [4]="--dom0" [5]="--verbose" [6]="--quiet" [7]="--help")
    test_wrapper 'qubes-input-trigger --something_unknown --'
}

@test "Test 031. qubes-input-trigger: qubes-input-trigger --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-input-trigger --something_unknown -- '
}

@test "Test 032. qubes-input-trigger: qubes-input-trigger --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h" [1]="-h")
    test_wrapper 'qubes-input-trigger --something_unknown -h'
}

@test "Test 033. qubes-input-trigger: qubes-input-trigger --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--help")
    test_wrapper 'qubes-input-trigger --something_unknown --h'
}

