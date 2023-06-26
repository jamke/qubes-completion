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

@test "Test 000. qubes-vm-settings: qubes-vm-settings " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-vm-settings '
}

@test "Test 001. qubes-vm-settings: qubes-vm-settings -" {
    EXPECTED_COMPREPLY=([0]="--tab" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qubes-vm-settings -'
}

@test "Test 002. qubes-vm-settings: qubes-vm-settings --" {
    EXPECTED_COMPREPLY=([0]="--tab" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qubes-vm-settings --'
}

@test "Test 003. qubes-vm-settings: qubes-vm-settings -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-vm-settings -- '
}

@test "Test 004. qubes-vm-settings: qubes-vm-settings -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings -- -'
}

@test "Test 005. qubes-vm-settings: qubes-vm-settings -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-vm-settings -h'
}

@test "Test 006. qubes-vm-settings: qubes-vm-settings --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-vm-settings --h'
}

@test "Test 007. qubes-vm-settings: qubes-vm-settings run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-vm-settings run'
}

@test "Test 008. qubes-vm-settings: qubes-vm-settings runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-settings runnin'
}

@test "Test 009. qubes-vm-settings: qubes-vm-settings running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-settings running'
}

@test "Test 010. qubes-vm-settings: qubes-vm-settings running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings running '
}

@test "Test 011. qubes-vm-settings: qubes-vm-settings \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-vm-settings "run'
}

@test "Test 012. qubes-vm-settings: qubes-vm-settings \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-settings "runnin'
}

@test "Test 013. qubes-vm-settings: qubes-vm-settings \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-settings "running'
}

@test "Test 014. qubes-vm-settings: qubes-vm-settings \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings "running" '
}

@test "Test 015. qubes-vm-settings: qubes-vm-settings 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-vm-settings '\''run'
}

@test "Test 016. qubes-vm-settings: qubes-vm-settings 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-settings '\''runnin'
}

@test "Test 017. qubes-vm-settings: qubes-vm-settings 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-settings '\''running'
}

@test "Test 018. qubes-vm-settings: qubes-vm-settings 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings '\''running'\'' '
}

@test "Test 019. qubes-vm-settings: qubes-vm-settings nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings nonexistent'
}

@test "Test 020. qubes-vm-settings: qubes-vm-settings nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings nonexistent '
}

@test "Test 021. qubes-vm-settings: qubes-vm-settings nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings nonexistent -'
}

@test "Test 022. qubes-vm-settings: qubes-vm-settings nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings nonexistent --'
}

@test "Test 023. qubes-vm-settings: qubes-vm-settings nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings nonexistent -- '
}

@test "Test 024. qubes-vm-settings: qubes-vm-settings nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings nonexistent -h'
}

@test "Test 025. qubes-vm-settings: qubes-vm-settings nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings nonexistent --h'
}

@test "Test 026. qubes-vm-settings: qubes-vm-settings --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings --something_unknown'
}

@test "Test 027. qubes-vm-settings: qubes-vm-settings --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-vm-settings --something_unknown '
}

@test "Test 028. qubes-vm-settings: qubes-vm-settings --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-settings --something_unknown='
}

@test "Test 029. qubes-vm-settings: qubes-vm-settings --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--tab" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qubes-vm-settings --something_unknown -'
}

@test "Test 030. qubes-vm-settings: qubes-vm-settings --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--tab" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qubes-vm-settings --something_unknown --'
}

@test "Test 031. qubes-vm-settings: qubes-vm-settings --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-vm-settings --something_unknown -- '
}

@test "Test 032. qubes-vm-settings: qubes-vm-settings --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-vm-settings --something_unknown -h'
}

@test "Test 033. qubes-vm-settings: qubes-vm-settings --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-vm-settings --something_unknown --h'
}

