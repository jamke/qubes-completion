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

@test "Test 000. qvm-copy: qvm-copy " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy '
}

@test "Test 001. qvm-copy: qvm-copy -" {
    EXPECTED_COMPREPLY=([0]="--without-progress" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-copy -'
}

@test "Test 002. qvm-copy: qvm-copy --" {
    EXPECTED_COMPREPLY=([0]="--without-progress" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-copy --'
}

@test "Test 003. qvm-copy: qvm-copy -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy -- '
}

@test "Test 004. qvm-copy: qvm-copy -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy -- -'
}

@test "Test 005. qvm-copy: qvm-copy -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-copy -h'
}

@test "Test 006. qvm-copy: qvm-copy --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-copy --h'
}

@test "Test 007. qvm-copy: qvm-copy run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy run'
}

@test "Test 008. qvm-copy: qvm-copy runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy runnin'
}

@test "Test 009. qvm-copy: qvm-copy running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy running'
}

@test "Test 010. qvm-copy: qvm-copy running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy running '
}

@test "Test 011. qvm-copy: qvm-copy \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy "run'
}

@test "Test 012. qvm-copy: qvm-copy \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy "runnin'
}

@test "Test 013. qvm-copy: qvm-copy \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy "running'
}

@test "Test 014. qvm-copy: qvm-copy \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy "running" '
}

@test "Test 015. qvm-copy: qvm-copy 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy '\''run'
}

@test "Test 016. qvm-copy: qvm-copy 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy '\''runnin'
}

@test "Test 017. qvm-copy: qvm-copy 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy '\''running'
}

@test "Test 018. qvm-copy: qvm-copy 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy '\''running'\'' '
}

@test "Test 019. qvm-copy: qvm-copy nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy nonexistent'
}

@test "Test 020. qvm-copy: qvm-copy nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy nonexistent '
}

@test "Test 021. qvm-copy: qvm-copy nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy nonexistent -'
}

@test "Test 022. qvm-copy: qvm-copy nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy nonexistent --'
}

@test "Test 023. qvm-copy: qvm-copy nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy nonexistent -- '
}

@test "Test 024. qvm-copy: qvm-copy nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy nonexistent -h'
}

@test "Test 025. qvm-copy: qvm-copy nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy nonexistent --h'
}

@test "Test 026. qvm-copy: qvm-copy --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy --something_unknown'
}

@test "Test 027. qvm-copy: qvm-copy --something_unknown " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy --something_unknown '
}

@test "Test 028. qvm-copy: qvm-copy --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy --something_unknown='
}

@test "Test 029. qvm-copy: qvm-copy --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--without-progress" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-copy --something_unknown -'
}

@test "Test 030. qvm-copy: qvm-copy --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--without-progress" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-copy --something_unknown --'
}

@test "Test 031. qvm-copy: qvm-copy --something_unknown -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy --something_unknown -- '
}

@test "Test 032. qvm-copy: qvm-copy --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-copy --something_unknown -h'
}

@test "Test 033. qvm-copy: qvm-copy --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-copy --something_unknown --h'
}

