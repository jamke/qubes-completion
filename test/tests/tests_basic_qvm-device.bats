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

@test "Test 000. qvm-device: qvm-device " {
    EXPECTED_COMPREPLY=([0]="block" [1]="mic" [2]="pci" [3]="usb")
    test_wrapper 'qvm-device '
}

@test "Test 001. qvm-device: qvm-device -" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-device -'
}

@test "Test 002. qvm-device: qvm-device --" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-device --'
}

@test "Test 003. qvm-device: qvm-device -- " {
    EXPECTED_COMPREPLY=([0]="block" [1]="mic" [2]="pci" [3]="usb")
    test_wrapper 'qvm-device -- '
}

@test "Test 004. qvm-device: qvm-device -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device -- -'
}

@test "Test 005. qvm-device: qvm-device -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-device -h'
}

@test "Test 006. qvm-device: qvm-device --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-device --h'
}

@test "Test 007. qvm-device: qvm-device run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device run'
}

@test "Test 008. qvm-device: qvm-device runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device runnin'
}

@test "Test 009. qvm-device: qvm-device running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device running'
}

@test "Test 010. qvm-device: qvm-device running " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-device running '
}

@test "Test 011. qvm-device: qvm-device \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device "run'
}

@test "Test 012. qvm-device: qvm-device \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device "runnin'
}

@test "Test 013. qvm-device: qvm-device \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device "running'
}

@test "Test 014. qvm-device: qvm-device \"running\" " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-device "running" '
}

@test "Test 015. qvm-device: qvm-device 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device '\''run'
}

@test "Test 016. qvm-device: qvm-device 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device '\''runnin'
}

@test "Test 017. qvm-device: qvm-device 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device '\''running'
}

@test "Test 018. qvm-device: qvm-device 'running' " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-device '\''running'\'' '
}

@test "Test 019. qvm-device: qvm-device nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device nonexistent'
}

@test "Test 020. qvm-device: qvm-device nonexistent " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-device nonexistent '
}

@test "Test 021. qvm-device: qvm-device nonexistent -" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-device nonexistent -'
}

@test "Test 022. qvm-device: qvm-device nonexistent --" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-device nonexistent --'
}

@test "Test 023. qvm-device: qvm-device nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-device nonexistent -- '
}

@test "Test 024. qvm-device: qvm-device nonexistent -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-device nonexistent -h'
}

@test "Test 025. qvm-device: qvm-device nonexistent --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-device nonexistent --h'
}

@test "Test 026. qvm-device: qvm-device --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device --something_unknown'
}

@test "Test 027. qvm-device: qvm-device --something_unknown " {
    EXPECTED_COMPREPLY=([0]="block" [1]="mic" [2]="pci" [3]="usb")
    test_wrapper 'qvm-device --something_unknown '
}

@test "Test 028. qvm-device: qvm-device --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-device --something_unknown='
}

@test "Test 029. qvm-device: qvm-device --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-device --something_unknown -'
}

@test "Test 030. qvm-device: qvm-device --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-device --something_unknown --'
}

@test "Test 031. qvm-device: qvm-device --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="block" [1]="mic" [2]="pci" [3]="usb")
    test_wrapper 'qvm-device --something_unknown -- '
}

@test "Test 032. qvm-device: qvm-device --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-device --something_unknown -h'
}

@test "Test 033. qvm-device: qvm-device --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-device --something_unknown --h'
}

