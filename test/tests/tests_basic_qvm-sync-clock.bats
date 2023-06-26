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

@test "Test 000. qvm-sync-clock: qvm-sync-clock " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock '
}

@test "Test 001. qvm-sync-clock: qvm-sync-clock -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock -'
}

@test "Test 002. qvm-sync-clock: qvm-sync-clock --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock --'
}

@test "Test 003. qvm-sync-clock: qvm-sync-clock -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock -- '
}

@test "Test 004. qvm-sync-clock: qvm-sync-clock -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock -- -'
}

@test "Test 005. qvm-sync-clock: qvm-sync-clock -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock -h'
}

@test "Test 006. qvm-sync-clock: qvm-sync-clock --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock --h'
}

@test "Test 007. qvm-sync-clock: qvm-sync-clock run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock run'
}

@test "Test 008. qvm-sync-clock: qvm-sync-clock runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock runnin'
}

@test "Test 009. qvm-sync-clock: qvm-sync-clock running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock running'
}

@test "Test 010. qvm-sync-clock: qvm-sync-clock running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock running '
}

@test "Test 011. qvm-sync-clock: qvm-sync-clock \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock "run'
}

@test "Test 012. qvm-sync-clock: qvm-sync-clock \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock "runnin'
}

@test "Test 013. qvm-sync-clock: qvm-sync-clock \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock "running'
}

@test "Test 014. qvm-sync-clock: qvm-sync-clock \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock "running" '
}

@test "Test 015. qvm-sync-clock: qvm-sync-clock 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock '\''run'
}

@test "Test 016. qvm-sync-clock: qvm-sync-clock 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock '\''runnin'
}

@test "Test 017. qvm-sync-clock: qvm-sync-clock 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock '\''running'
}

@test "Test 018. qvm-sync-clock: qvm-sync-clock 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock '\''running'\'' '
}

@test "Test 019. qvm-sync-clock: qvm-sync-clock nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock nonexistent'
}

@test "Test 020. qvm-sync-clock: qvm-sync-clock nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock nonexistent '
}

@test "Test 021. qvm-sync-clock: qvm-sync-clock nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock nonexistent -'
}

@test "Test 022. qvm-sync-clock: qvm-sync-clock nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock nonexistent --'
}

@test "Test 023. qvm-sync-clock: qvm-sync-clock nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock nonexistent -- '
}

@test "Test 024. qvm-sync-clock: qvm-sync-clock nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock nonexistent -h'
}

@test "Test 025. qvm-sync-clock: qvm-sync-clock nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock nonexistent --h'
}

@test "Test 026. qvm-sync-clock: qvm-sync-clock --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock --something_unknown'
}

@test "Test 027. qvm-sync-clock: qvm-sync-clock --something_unknown " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock --something_unknown '
}

@test "Test 028. qvm-sync-clock: qvm-sync-clock --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock --something_unknown='
}

@test "Test 029. qvm-sync-clock: qvm-sync-clock --something_unknown -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock --something_unknown -'
}

@test "Test 030. qvm-sync-clock: qvm-sync-clock --something_unknown --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock --something_unknown --'
}

@test "Test 031. qvm-sync-clock: qvm-sync-clock --something_unknown -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock --something_unknown -- '
}

@test "Test 032. qvm-sync-clock: qvm-sync-clock --something_unknown -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock --something_unknown -h'
}

@test "Test 033. qvm-sync-clock: qvm-sync-clock --something_unknown --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-sync-clock --something_unknown --h'
}

