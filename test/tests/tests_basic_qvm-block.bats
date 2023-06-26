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

@test "Test 000. qvm-block: qvm-block " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-block '
}

@test "Test 001. qvm-block: qvm-block -" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-block -'
}

@test "Test 002. qvm-block: qvm-block --" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-block --'
}

@test "Test 003. qvm-block: qvm-block -- " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-block -- '
}

@test "Test 004. qvm-block: qvm-block -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block -- -'
}

@test "Test 005. qvm-block: qvm-block -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-block -h'
}

@test "Test 006. qvm-block: qvm-block --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-block --h'
}

@test "Test 007. qvm-block: qvm-block run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block run'
}

@test "Test 008. qvm-block: qvm-block runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block runnin'
}

@test "Test 009. qvm-block: qvm-block running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block running'
}

@test "Test 010. qvm-block: qvm-block running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block running '
}

@test "Test 011. qvm-block: qvm-block \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block "run'
}

@test "Test 012. qvm-block: qvm-block \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block "runnin'
}

@test "Test 013. qvm-block: qvm-block \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block "running'
}

@test "Test 014. qvm-block: qvm-block \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block "running" '
}

@test "Test 015. qvm-block: qvm-block 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block '\''run'
}

@test "Test 016. qvm-block: qvm-block 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block '\''runnin'
}

@test "Test 017. qvm-block: qvm-block 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block '\''running'
}

@test "Test 018. qvm-block: qvm-block 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block '\''running'\'' '
}

@test "Test 019. qvm-block: qvm-block nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block nonexistent'
}

@test "Test 020. qvm-block: qvm-block nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block nonexistent '
}

@test "Test 021. qvm-block: qvm-block nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block nonexistent -'
}

@test "Test 022. qvm-block: qvm-block nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block nonexistent --'
}

@test "Test 023. qvm-block: qvm-block nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block nonexistent -- '
}

@test "Test 024. qvm-block: qvm-block nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block nonexistent -h'
}

@test "Test 025. qvm-block: qvm-block nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block nonexistent --h'
}

@test "Test 026. qvm-block: qvm-block --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block --something_unknown'
}

@test "Test 027. qvm-block: qvm-block --something_unknown " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-block --something_unknown '
}

@test "Test 028. qvm-block: qvm-block --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-block --something_unknown='
}

@test "Test 029. qvm-block: qvm-block --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-block --something_unknown -'
}

@test "Test 030. qvm-block: qvm-block --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--list-device-classes" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-block --something_unknown --'
}

@test "Test 031. qvm-block: qvm-block --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="list" [1]="attach" [2]="detach")
    test_wrapper 'qvm-block --something_unknown -- '
}

@test "Test 032. qvm-block: qvm-block --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-block --something_unknown -h'
}

@test "Test 033. qvm-block: qvm-block --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-block --something_unknown --h'
}

