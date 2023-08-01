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

@test "Test 000. qubes-guivm-session: qubes-guivm-session " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qubes-guivm-session '
}

@test "Test 001. qubes-guivm-session: qubes-guivm-session -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session -'
}

@test "Test 002. qubes-guivm-session: qubes-guivm-session --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session --'
}

@test "Test 003. qubes-guivm-session: qubes-guivm-session -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qubes-guivm-session -- '
}

@test "Test 004. qubes-guivm-session: qubes-guivm-session -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session -- -'
}

@test "Test 005. qubes-guivm-session: qubes-guivm-session -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session -h'
}

@test "Test 006. qubes-guivm-session: qubes-guivm-session --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session --h'
}

@test "Test 007. qubes-guivm-session: qubes-guivm-session run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-guivm-session run'
}

@test "Test 008. qubes-guivm-session: qubes-guivm-session runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-guivm-session runnin'
}

@test "Test 009. qubes-guivm-session: qubes-guivm-session running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-guivm-session running'
}

@test "Test 010. qubes-guivm-session: qubes-guivm-session running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session running '
}

@test "Test 011. qubes-guivm-session: qubes-guivm-session \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-guivm-session "run'
}

@test "Test 012. qubes-guivm-session: qubes-guivm-session \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-guivm-session "runnin'
}

@test "Test 013. qubes-guivm-session: qubes-guivm-session \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-guivm-session "running'
}

@test "Test 014. qubes-guivm-session: qubes-guivm-session \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session "running" '
}

@test "Test 015. qubes-guivm-session: qubes-guivm-session 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-guivm-session '\''run'
}

@test "Test 016. qubes-guivm-session: qubes-guivm-session 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-guivm-session '\''runnin'
}

@test "Test 017. qubes-guivm-session: qubes-guivm-session 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-guivm-session '\''running'
}

@test "Test 018. qubes-guivm-session: qubes-guivm-session 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session '\''running'\'' '
}

@test "Test 019. qubes-guivm-session: qubes-guivm-session nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session nonexistent'
}

@test "Test 020. qubes-guivm-session: qubes-guivm-session nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session nonexistent '
}

@test "Test 021. qubes-guivm-session: qubes-guivm-session nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session nonexistent -'
}

@test "Test 022. qubes-guivm-session: qubes-guivm-session nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session nonexistent --'
}

@test "Test 023. qubes-guivm-session: qubes-guivm-session nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session nonexistent -- '
}

@test "Test 024. qubes-guivm-session: qubes-guivm-session nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session nonexistent -h'
}

@test "Test 025. qubes-guivm-session: qubes-guivm-session nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session nonexistent --h'
}

@test "Test 026. qubes-guivm-session: qubes-guivm-session --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session --something_unknown'
}

@test "Test 027. qubes-guivm-session: qubes-guivm-session --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qubes-guivm-session --something_unknown '
}

@test "Test 028. qubes-guivm-session: qubes-guivm-session --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session --something_unknown='
}

@test "Test 029. qubes-guivm-session: qubes-guivm-session --something_unknown -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session --something_unknown -'
}

@test "Test 030. qubes-guivm-session: qubes-guivm-session --something_unknown --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session --something_unknown --'
}

@test "Test 031. qubes-guivm-session: qubes-guivm-session --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qubes-guivm-session --something_unknown -- '
}

@test "Test 032. qubes-guivm-session: qubes-guivm-session --something_unknown -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session --something_unknown -h'
}

@test "Test 033. qubes-guivm-session: qubes-guivm-session --something_unknown --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guivm-session --something_unknown --h'
}

