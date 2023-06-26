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

@test "Test 000. qvm-pci: qvm-pci " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-pci '
}

@test "Test 001. qvm-pci: qvm-pci -" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-pci -'
}

@test "Test 002. qvm-pci: qvm-pci --" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-pci --'
}

@test "Test 003. qvm-pci: qvm-pci -- " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-pci -- '
}

@test "Test 004. qvm-pci: qvm-pci -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci -- -'
}

@test "Test 005. qvm-pci: qvm-pci -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-pci -h'
}

@test "Test 006. qvm-pci: qvm-pci --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-pci --h'
}

@test "Test 007. qvm-pci: qvm-pci run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci run'
}

@test "Test 008. qvm-pci: qvm-pci runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci runnin'
}

@test "Test 009. qvm-pci: qvm-pci running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci running'
}

@test "Test 010. qvm-pci: qvm-pci running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci running '
}

@test "Test 011. qvm-pci: qvm-pci \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci "run'
}

@test "Test 012. qvm-pci: qvm-pci \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci "runnin'
}

@test "Test 013. qvm-pci: qvm-pci \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci "running'
}

@test "Test 014. qvm-pci: qvm-pci \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci "running" '
}

@test "Test 015. qvm-pci: qvm-pci 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci '\''run'
}

@test "Test 016. qvm-pci: qvm-pci 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci '\''runnin'
}

@test "Test 017. qvm-pci: qvm-pci 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci '\''running'
}

@test "Test 018. qvm-pci: qvm-pci 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci '\''running'\'' '
}

@test "Test 019. qvm-pci: qvm-pci nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci nonexistent'
}

@test "Test 020. qvm-pci: qvm-pci nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci nonexistent '
}

@test "Test 021. qvm-pci: qvm-pci nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci nonexistent -'
}

@test "Test 022. qvm-pci: qvm-pci nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci nonexistent --'
}

@test "Test 023. qvm-pci: qvm-pci nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci nonexistent -- '
}

@test "Test 024. qvm-pci: qvm-pci nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci nonexistent -h'
}

@test "Test 025. qvm-pci: qvm-pci nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci nonexistent --h'
}

@test "Test 026. qvm-pci: qvm-pci --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci --something_unknown'
}

@test "Test 027. qvm-pci: qvm-pci --something_unknown " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-pci --something_unknown '
}

@test "Test 028. qvm-pci: qvm-pci --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pci --something_unknown='
}

@test "Test 029. qvm-pci: qvm-pci --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-pci --something_unknown -'
}

@test "Test 030. qvm-pci: qvm-pci --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-pci --something_unknown --'
}

@test "Test 031. qvm-pci: qvm-pci --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-pci --something_unknown -- '
}

@test "Test 032. qvm-pci: qvm-pci --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-pci --something_unknown -h'
}

@test "Test 033. qvm-pci: qvm-pci --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-pci --something_unknown --h'
}

