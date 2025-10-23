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

@test "Test 000. qvm-move: qvm-move " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-move '
}

@test "Test 001. qvm-move: qvm-move -" {
    EXPECTED_COMPREPLY=([0]="--without-progress" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-move -'
}

@test "Test 002. qvm-move: qvm-move --" {
    EXPECTED_COMPREPLY=([0]="--without-progress" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-move --'
}

@test "Test 003. qvm-move: qvm-move -- " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-move -- '
}

@test "Test 004. qvm-move: qvm-move -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move -- -'
}

@test "Test 005. qvm-move: qvm-move -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-move -h'
}

@test "Test 006. qvm-move: qvm-move --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-move --h'
}

@test "Test 007. qvm-move: qvm-move run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move run'
}

@test "Test 008. qvm-move: qvm-move runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move runnin'
}

@test "Test 009. qvm-move: qvm-move running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move running'
}

@test "Test 010. qvm-move: qvm-move running " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-move running '
}

@test "Test 011. qvm-move: qvm-move \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move "run'
}

@test "Test 012. qvm-move: qvm-move \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move "runnin'
}

@test "Test 013. qvm-move: qvm-move \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move "running'
}

@test "Test 014. qvm-move: qvm-move \"running\" " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-move "running" '
}

@test "Test 015. qvm-move: qvm-move 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move '\''run'
}

@test "Test 016. qvm-move: qvm-move 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move '\''runnin'
}

@test "Test 017. qvm-move: qvm-move 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move '\''running'
}

@test "Test 018. qvm-move: qvm-move 'running' " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-move '\''running'\'' '
}

@test "Test 019. qvm-move: qvm-move nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move nonexistent'
}

@test "Test 020. qvm-move: qvm-move nonexistent " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-move nonexistent '
}

@test "Test 021. qvm-move: qvm-move nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move nonexistent -'
}

@test "Test 022. qvm-move: qvm-move nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move nonexistent --'
}

@test "Test 023. qvm-move: qvm-move nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-move nonexistent -- '
}

@test "Test 024. qvm-move: qvm-move nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move nonexistent -h'
}

@test "Test 025. qvm-move: qvm-move nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move nonexistent --h'
}

@test "Test 026. qvm-move: qvm-move --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move --something_unknown'
}

@test "Test 027. qvm-move: qvm-move --something_unknown " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-move --something_unknown '
}

@test "Test 028. qvm-move: qvm-move --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-move --something_unknown='
}

@test "Test 029. qvm-move: qvm-move --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--without-progress" [1]="--verbose" [2]="-v" [3]="--quiet" [4]="-q" [5]="--help" [6]="-h")
    test_wrapper 'qvm-move --something_unknown -'
}

@test "Test 030. qvm-move: qvm-move --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--without-progress" [1]="--verbose" [2]="--quiet" [3]="--help")
    test_wrapper 'qvm-move --something_unknown --'
}

@test "Test 031. qvm-move: qvm-move --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-move --something_unknown -- '
}

@test "Test 032. qvm-move: qvm-move --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-move --something_unknown -h'
}

@test "Test 033. qvm-move: qvm-move --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-move --something_unknown --h'
}

