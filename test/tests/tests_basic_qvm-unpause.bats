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

@test "Test 000. qvm-unpause: qvm-unpause " {
    EXPECTED_COMPREPLY=([0]="other" [1]="paused" [2]="standalone2" [3]="template2")
    test_wrapper 'qvm-unpause '
}

@test "Test 001. qvm-unpause: qvm-unpause -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--help" [7]="-h")
    test_wrapper 'qvm-unpause -'
}

@test "Test 002. qvm-unpause: qvm-unpause --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="--quiet" [4]="--help")
    test_wrapper 'qvm-unpause --'
}

@test "Test 003. qvm-unpause: qvm-unpause -- " {
    EXPECTED_COMPREPLY=([0]="other" [1]="paused" [2]="standalone2" [3]="template2")
    test_wrapper 'qvm-unpause -- '
}

@test "Test 004. qvm-unpause: qvm-unpause -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause -- -'
}

@test "Test 005. qvm-unpause: qvm-unpause -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-unpause -h'
}

@test "Test 006. qvm-unpause: qvm-unpause --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-unpause --h'
}

@test "Test 007. qvm-unpause: qvm-unpause run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause run'
}

@test "Test 008. qvm-unpause: qvm-unpause runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause runnin'
}

@test "Test 009. qvm-unpause: qvm-unpause running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause running'
}

@test "Test 010. qvm-unpause: qvm-unpause running " {
    EXPECTED_COMPREPLY=([0]="other" [1]="paused" [2]="standalone2" [3]="template2")
    test_wrapper 'qvm-unpause running '
}

@test "Test 011. qvm-unpause: qvm-unpause \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause "run'
}

@test "Test 012. qvm-unpause: qvm-unpause \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause "runnin'
}

@test "Test 013. qvm-unpause: qvm-unpause \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause "running'
}

@test "Test 014. qvm-unpause: qvm-unpause \"running\" " {
    EXPECTED_COMPREPLY=([0]="other" [1]="paused" [2]="standalone2" [3]="template2")
    test_wrapper 'qvm-unpause "running" '
}

@test "Test 015. qvm-unpause: qvm-unpause 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause '\''run'
}

@test "Test 016. qvm-unpause: qvm-unpause 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause '\''runnin'
}

@test "Test 017. qvm-unpause: qvm-unpause 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause '\''running'
}

@test "Test 018. qvm-unpause: qvm-unpause 'running' " {
    EXPECTED_COMPREPLY=([0]="other" [1]="paused" [2]="standalone2" [3]="template2")
    test_wrapper 'qvm-unpause '\''running'\'' '
}

@test "Test 019. qvm-unpause: qvm-unpause nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause nonexistent'
}

@test "Test 020. qvm-unpause: qvm-unpause nonexistent " {
    EXPECTED_COMPREPLY=([0]="other" [1]="paused" [2]="standalone2" [3]="template2")
    test_wrapper 'qvm-unpause nonexistent '
}

@test "Test 021. qvm-unpause: qvm-unpause nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause nonexistent -'
}

@test "Test 022. qvm-unpause: qvm-unpause nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause nonexistent --'
}

@test "Test 023. qvm-unpause: qvm-unpause nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="other" [1]="paused" [2]="standalone2" [3]="template2")
    test_wrapper 'qvm-unpause nonexistent -- '
}

@test "Test 024. qvm-unpause: qvm-unpause nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause nonexistent -h'
}

@test "Test 025. qvm-unpause: qvm-unpause nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause nonexistent --h'
}

@test "Test 026. qvm-unpause: qvm-unpause --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause --something_unknown'
}

@test "Test 027. qvm-unpause: qvm-unpause --something_unknown " {
    EXPECTED_COMPREPLY=([0]="other" [1]="paused" [2]="standalone2" [3]="template2")
    test_wrapper 'qvm-unpause --something_unknown '
}

@test "Test 028. qvm-unpause: qvm-unpause --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-unpause --something_unknown='
}

@test "Test 029. qvm-unpause: qvm-unpause --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--help" [7]="-h")
    test_wrapper 'qvm-unpause --something_unknown -'
}

@test "Test 030. qvm-unpause: qvm-unpause --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="--quiet" [4]="--help")
    test_wrapper 'qvm-unpause --something_unknown --'
}

@test "Test 031. qvm-unpause: qvm-unpause --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="other" [1]="paused" [2]="standalone2" [3]="template2")
    test_wrapper 'qvm-unpause --something_unknown -- '
}

@test "Test 032. qvm-unpause: qvm-unpause --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-unpause --something_unknown -h'
}

@test "Test 033. qvm-unpause: qvm-unpause --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-unpause --something_unknown --h'
}

