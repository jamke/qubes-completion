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

@test "Test 000. qubes-vm-boot-from-device: qubes-vm-boot-from-device " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-vm-boot-from-device '
}

@test "Test 001. qubes-vm-boot-from-device: qubes-vm-boot-from-device -" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="-v" [2]="--quiet" [3]="-q" [4]="--help" [5]="-h")
    test_wrapper 'qubes-vm-boot-from-device -'
}

@test "Test 002. qubes-vm-boot-from-device: qubes-vm-boot-from-device --" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="--quiet" [2]="--help")
    test_wrapper 'qubes-vm-boot-from-device --'
}

@test "Test 003. qubes-vm-boot-from-device: qubes-vm-boot-from-device -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-vm-boot-from-device -- '
}

@test "Test 004. qubes-vm-boot-from-device: qubes-vm-boot-from-device -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device -- -'
}

@test "Test 005. qubes-vm-boot-from-device: qubes-vm-boot-from-device -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-vm-boot-from-device -h'
}

@test "Test 006. qubes-vm-boot-from-device: qubes-vm-boot-from-device --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-vm-boot-from-device --h'
}

@test "Test 007. qubes-vm-boot-from-device: qubes-vm-boot-from-device run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-vm-boot-from-device run'
}

@test "Test 008. qubes-vm-boot-from-device: qubes-vm-boot-from-device runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-boot-from-device runnin'
}

@test "Test 009. qubes-vm-boot-from-device: qubes-vm-boot-from-device running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-boot-from-device running'
}

@test "Test 010. qubes-vm-boot-from-device: qubes-vm-boot-from-device running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device running '
}

@test "Test 011. qubes-vm-boot-from-device: qubes-vm-boot-from-device \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-vm-boot-from-device "run'
}

@test "Test 012. qubes-vm-boot-from-device: qubes-vm-boot-from-device \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-boot-from-device "runnin'
}

@test "Test 013. qubes-vm-boot-from-device: qubes-vm-boot-from-device \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-boot-from-device "running'
}

@test "Test 014. qubes-vm-boot-from-device: qubes-vm-boot-from-device \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device "running" '
}

@test "Test 015. qubes-vm-boot-from-device: qubes-vm-boot-from-device 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qubes-vm-boot-from-device '\''run'
}

@test "Test 016. qubes-vm-boot-from-device: qubes-vm-boot-from-device 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-boot-from-device '\''runnin'
}

@test "Test 017. qubes-vm-boot-from-device: qubes-vm-boot-from-device 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qubes-vm-boot-from-device '\''running'
}

@test "Test 018. qubes-vm-boot-from-device: qubes-vm-boot-from-device 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device '\''running'\'' '
}

@test "Test 019. qubes-vm-boot-from-device: qubes-vm-boot-from-device nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device nonexistent'
}

@test "Test 020. qubes-vm-boot-from-device: qubes-vm-boot-from-device nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device nonexistent '
}

@test "Test 021. qubes-vm-boot-from-device: qubes-vm-boot-from-device nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device nonexistent -'
}

@test "Test 022. qubes-vm-boot-from-device: qubes-vm-boot-from-device nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device nonexistent --'
}

@test "Test 023. qubes-vm-boot-from-device: qubes-vm-boot-from-device nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device nonexistent -- '
}

@test "Test 024. qubes-vm-boot-from-device: qubes-vm-boot-from-device nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device nonexistent -h'
}

@test "Test 025. qubes-vm-boot-from-device: qubes-vm-boot-from-device nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device nonexistent --h'
}

@test "Test 026. qubes-vm-boot-from-device: qubes-vm-boot-from-device --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device --something_unknown'
}

@test "Test 027. qubes-vm-boot-from-device: qubes-vm-boot-from-device --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-vm-boot-from-device --something_unknown '
}

@test "Test 028. qubes-vm-boot-from-device: qubes-vm-boot-from-device --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-boot-from-device --something_unknown='
}

@test "Test 029. qubes-vm-boot-from-device: qubes-vm-boot-from-device --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="-v" [2]="--quiet" [3]="-q" [4]="--help" [5]="-h")
    test_wrapper 'qubes-vm-boot-from-device --something_unknown -'
}

@test "Test 030. qubes-vm-boot-from-device: qubes-vm-boot-from-device --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="--quiet" [2]="--help")
    test_wrapper 'qubes-vm-boot-from-device --something_unknown --'
}

@test "Test 031. qubes-vm-boot-from-device: qubes-vm-boot-from-device --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qubes-vm-boot-from-device --something_unknown -- '
}

@test "Test 032. qubes-vm-boot-from-device: qubes-vm-boot-from-device --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-vm-boot-from-device --something_unknown -h'
}

@test "Test 033. qubes-vm-boot-from-device: qubes-vm-boot-from-device --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-vm-boot-from-device --something_unknown --h'
}

