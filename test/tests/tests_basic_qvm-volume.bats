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

@test "Test 000. qvm-volume: qvm-volume " {
    EXPECTED_COMPREPLY=([0]="list" [1]="info" [2]="config" [3]="resize" [4]="revert" [5]="import")
    test_wrapper 'qvm-volume '
}

@test "Test 001. qvm-volume: qvm-volume -" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="-v" [2]="--quiet" [3]="-q" [4]="--help" [5]="-h")
    test_wrapper 'qvm-volume -'
}

@test "Test 002. qvm-volume: qvm-volume --" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="--quiet" [2]="--help")
    test_wrapper 'qvm-volume --'
}

@test "Test 003. qvm-volume: qvm-volume -- " {
    EXPECTED_COMPREPLY=([0]="list" [1]="info" [2]="config" [3]="resize" [4]="revert" [5]="import")
    test_wrapper 'qvm-volume -- '
}

@test "Test 004. qvm-volume: qvm-volume -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume -- -'
}

@test "Test 005. qvm-volume: qvm-volume -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-volume -h'
}

@test "Test 006. qvm-volume: qvm-volume --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-volume --h'
}

@test "Test 007. qvm-volume: qvm-volume run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume run'
}

@test "Test 008. qvm-volume: qvm-volume runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume runnin'
}

@test "Test 009. qvm-volume: qvm-volume running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume running'
}

@test "Test 010. qvm-volume: qvm-volume running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume running '
}

@test "Test 011. qvm-volume: qvm-volume \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume "run'
}

@test "Test 012. qvm-volume: qvm-volume \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume "runnin'
}

@test "Test 013. qvm-volume: qvm-volume \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume "running'
}

@test "Test 014. qvm-volume: qvm-volume \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume "running" '
}

@test "Test 015. qvm-volume: qvm-volume 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume '\''run'
}

@test "Test 016. qvm-volume: qvm-volume 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume '\''runnin'
}

@test "Test 017. qvm-volume: qvm-volume 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume '\''running'
}

@test "Test 018. qvm-volume: qvm-volume 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume '\''running'\'' '
}

@test "Test 019. qvm-volume: qvm-volume nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume nonexistent'
}

@test "Test 020. qvm-volume: qvm-volume nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume nonexistent '
}

@test "Test 021. qvm-volume: qvm-volume nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume nonexistent -'
}

@test "Test 022. qvm-volume: qvm-volume nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume nonexistent --'
}

@test "Test 023. qvm-volume: qvm-volume nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume nonexistent -- '
}

@test "Test 024. qvm-volume: qvm-volume nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume nonexistent -h'
}

@test "Test 025. qvm-volume: qvm-volume nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume nonexistent --h'
}

@test "Test 026. qvm-volume: qvm-volume --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-volume --something_unknown'
}

@test "Test 027. qvm-volume: qvm-volume --something_unknown " {
    EXPECTED_COMPREPLY=([0]="list" [1]="info" [2]="config" [3]="resize" [4]="revert" [5]="import")
    test_wrapper 'qvm-volume --something_unknown '
}

@test "Test 028. qvm-volume: qvm-volume --something_unknown=" {
    EXPECTED_COMPREPLY=([0]="list" [1]="info" [2]="config" [3]="resize" [4]="revert" [5]="import")
    test_wrapper 'qvm-volume --something_unknown='
}

@test "Test 029. qvm-volume: qvm-volume --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="-v" [2]="--quiet" [3]="-q" [4]="--help" [5]="-h")
    test_wrapper 'qvm-volume --something_unknown -'
}

@test "Test 030. qvm-volume: qvm-volume --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="--quiet" [2]="--help")
    test_wrapper 'qvm-volume --something_unknown --'
}

@test "Test 031. qvm-volume: qvm-volume --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="list" [1]="info" [2]="config" [3]="resize" [4]="revert" [5]="import")
    test_wrapper 'qvm-volume --something_unknown -- '
}

@test "Test 032. qvm-volume: qvm-volume --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-volume --something_unknown -h'
}

@test "Test 033. qvm-volume: qvm-volume --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-volume --something_unknown --h'
}

