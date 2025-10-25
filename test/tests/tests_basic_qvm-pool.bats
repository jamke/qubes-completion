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

@test "Test 000. qvm-pool: qvm-pool " {
    EXPECTED_COMPREPLY=([0]="add" [1]="drivers" [2]="info" [3]="list" [4]="remove" [5]="set")
    test_wrapper 'qvm-pool '
}

@test "Test 001. qvm-pool: qvm-pool -" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="-v" [2]="--quiet" [3]="-q" [4]="--help" [5]="-h")
    test_wrapper 'qvm-pool -'
}

@test "Test 002. qvm-pool: qvm-pool --" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="--quiet" [2]="--help")
    test_wrapper 'qvm-pool --'
}

@test "Test 003. qvm-pool: qvm-pool -- " {
    EXPECTED_COMPREPLY=([0]="add" [1]="drivers" [2]="info" [3]="list" [4]="remove" [5]="set")
    test_wrapper 'qvm-pool -- '
}

@test "Test 004. qvm-pool: qvm-pool -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool -- -'
}

@test "Test 005. qvm-pool: qvm-pool -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-pool -h'
}

@test "Test 006. qvm-pool: qvm-pool --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-pool --h'
}

@test "Test 007. qvm-pool: qvm-pool run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool run'
}

@test "Test 008. qvm-pool: qvm-pool runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool runnin'
}

@test "Test 009. qvm-pool: qvm-pool running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool running'
}

@test "Test 010. qvm-pool: qvm-pool running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool running '
}

@test "Test 011. qvm-pool: qvm-pool \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool "run'
}

@test "Test 012. qvm-pool: qvm-pool \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool "runnin'
}

@test "Test 013. qvm-pool: qvm-pool \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool "running'
}

@test "Test 014. qvm-pool: qvm-pool \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool "running" '
}

@test "Test 015. qvm-pool: qvm-pool 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool '\''run'
}

@test "Test 016. qvm-pool: qvm-pool 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool '\''runnin'
}

@test "Test 017. qvm-pool: qvm-pool 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool '\''running'
}

@test "Test 018. qvm-pool: qvm-pool 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool '\''running'\'' '
}

@test "Test 019. qvm-pool: qvm-pool nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool nonexistent'
}

@test "Test 020. qvm-pool: qvm-pool nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool nonexistent '
}

@test "Test 021. qvm-pool: qvm-pool nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool nonexistent -'
}

@test "Test 022. qvm-pool: qvm-pool nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool nonexistent --'
}

@test "Test 023. qvm-pool: qvm-pool nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool nonexistent -- '
}

@test "Test 024. qvm-pool: qvm-pool nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool nonexistent -h'
}

@test "Test 025. qvm-pool: qvm-pool nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool nonexistent --h'
}

@test "Test 026. qvm-pool: qvm-pool --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool --something_unknown'
}

@test "Test 027. qvm-pool: qvm-pool --something_unknown " {
    EXPECTED_COMPREPLY=([0]="add" [1]="drivers" [2]="info" [3]="list" [4]="remove" [5]="set")
    test_wrapper 'qvm-pool --something_unknown '
}

@test "Test 028. qvm-pool: qvm-pool --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pool --something_unknown='
}

@test "Test 029. qvm-pool: qvm-pool --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="-v" [2]="--quiet" [3]="-q" [4]="--help" [5]="-h")
    test_wrapper 'qvm-pool --something_unknown -'
}

@test "Test 030. qvm-pool: qvm-pool --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="--quiet" [2]="--help")
    test_wrapper 'qvm-pool --something_unknown --'
}

@test "Test 031. qvm-pool: qvm-pool --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="add" [1]="drivers" [2]="info" [3]="list" [4]="remove" [5]="set")
    test_wrapper 'qvm-pool --something_unknown -- '
}

@test "Test 032. qvm-pool: qvm-pool --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-pool --something_unknown -h'
}

@test "Test 033. qvm-pool: qvm-pool --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-pool --something_unknown --h'
}

