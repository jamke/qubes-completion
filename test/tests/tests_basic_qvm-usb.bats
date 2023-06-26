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

@test "Test 000. qvm-usb: qvm-usb " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-usb '
}

@test "Test 001. qvm-usb: qvm-usb -" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-usb -'
}

@test "Test 002. qvm-usb: qvm-usb --" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-usb --'
}

@test "Test 003. qvm-usb: qvm-usb -- " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-usb -- '
}

@test "Test 004. qvm-usb: qvm-usb -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb -- -'
}

@test "Test 005. qvm-usb: qvm-usb -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-usb -h'
}

@test "Test 006. qvm-usb: qvm-usb --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-usb --h'
}

@test "Test 007. qvm-usb: qvm-usb run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb run'
}

@test "Test 008. qvm-usb: qvm-usb runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb runnin'
}

@test "Test 009. qvm-usb: qvm-usb running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb running'
}

@test "Test 010. qvm-usb: qvm-usb running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb running '
}

@test "Test 011. qvm-usb: qvm-usb \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb "run'
}

@test "Test 012. qvm-usb: qvm-usb \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb "runnin'
}

@test "Test 013. qvm-usb: qvm-usb \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb "running'
}

@test "Test 014. qvm-usb: qvm-usb \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb "running" '
}

@test "Test 015. qvm-usb: qvm-usb 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb '\''run'
}

@test "Test 016. qvm-usb: qvm-usb 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb '\''runnin'
}

@test "Test 017. qvm-usb: qvm-usb 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb '\''running'
}

@test "Test 018. qvm-usb: qvm-usb 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb '\''running'\'' '
}

@test "Test 019. qvm-usb: qvm-usb nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb nonexistent'
}

@test "Test 020. qvm-usb: qvm-usb nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb nonexistent '
}

@test "Test 021. qvm-usb: qvm-usb nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb nonexistent -'
}

@test "Test 022. qvm-usb: qvm-usb nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb nonexistent --'
}

@test "Test 023. qvm-usb: qvm-usb nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb nonexistent -- '
}

@test "Test 024. qvm-usb: qvm-usb nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb nonexistent -h'
}

@test "Test 025. qvm-usb: qvm-usb nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb nonexistent --h'
}

@test "Test 026. qvm-usb: qvm-usb --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb --something_unknown'
}

@test "Test 027. qvm-usb: qvm-usb --something_unknown " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-usb --something_unknown '
}

@test "Test 028. qvm-usb: qvm-usb --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-usb --something_unknown='
}

@test "Test 029. qvm-usb: qvm-usb --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-usb --something_unknown -'
}

@test "Test 030. qvm-usb: qvm-usb --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-usb --something_unknown --'
}

@test "Test 031. qvm-usb: qvm-usb --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-usb --something_unknown -- '
}

@test "Test 032. qvm-usb: qvm-usb --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-usb --something_unknown -h'
}

@test "Test 033. qvm-usb: qvm-usb --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-usb --something_unknown --h'
}

