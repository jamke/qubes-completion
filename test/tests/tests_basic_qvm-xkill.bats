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

@test "Test 000. qvm-xkill: qvm-xkill " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill '
}

@test "Test 001. qvm-xkill: qvm-xkill -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill -'
}

@test "Test 002. qvm-xkill: qvm-xkill --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill --'
}

@test "Test 003. qvm-xkill: qvm-xkill -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill -- '
}

@test "Test 004. qvm-xkill: qvm-xkill -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill -- -'
}

@test "Test 005. qvm-xkill: qvm-xkill -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill -h'
}

@test "Test 006. qvm-xkill: qvm-xkill --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill --h'
}

@test "Test 007. qvm-xkill: qvm-xkill run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill run'
}

@test "Test 008. qvm-xkill: qvm-xkill runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill runnin'
}

@test "Test 009. qvm-xkill: qvm-xkill running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill running'
}

@test "Test 010. qvm-xkill: qvm-xkill running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill running '
}

@test "Test 011. qvm-xkill: qvm-xkill \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill "run'
}

@test "Test 012. qvm-xkill: qvm-xkill \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill "runnin'
}

@test "Test 013. qvm-xkill: qvm-xkill \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill "running'
}

@test "Test 014. qvm-xkill: qvm-xkill \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill "running" '
}

@test "Test 015. qvm-xkill: qvm-xkill 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill '\''run'
}

@test "Test 016. qvm-xkill: qvm-xkill 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill '\''runnin'
}

@test "Test 017. qvm-xkill: qvm-xkill 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill '\''running'
}

@test "Test 018. qvm-xkill: qvm-xkill 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill '\''running'\'' '
}

@test "Test 019. qvm-xkill: qvm-xkill nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill nonexistent'
}

@test "Test 020. qvm-xkill: qvm-xkill nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill nonexistent '
}

@test "Test 021. qvm-xkill: qvm-xkill nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill nonexistent -'
}

@test "Test 022. qvm-xkill: qvm-xkill nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill nonexistent --'
}

@test "Test 023. qvm-xkill: qvm-xkill nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill nonexistent -- '
}

@test "Test 024. qvm-xkill: qvm-xkill nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill nonexistent -h'
}

@test "Test 025. qvm-xkill: qvm-xkill nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill nonexistent --h'
}

@test "Test 026. qvm-xkill: qvm-xkill --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill --something_unknown'
}

@test "Test 027. qvm-xkill: qvm-xkill --something_unknown " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill --something_unknown '
}

@test "Test 028. qvm-xkill: qvm-xkill --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill --something_unknown='
}

@test "Test 029. qvm-xkill: qvm-xkill --something_unknown -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill --something_unknown -'
}

@test "Test 030. qvm-xkill: qvm-xkill --something_unknown --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill --something_unknown --'
}

@test "Test 031. qvm-xkill: qvm-xkill --something_unknown -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill --something_unknown -- '
}

@test "Test 032. qvm-xkill: qvm-xkill --something_unknown -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill --something_unknown -h'
}

@test "Test 033. qvm-xkill: qvm-xkill --something_unknown --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-xkill --something_unknown --h'
}

