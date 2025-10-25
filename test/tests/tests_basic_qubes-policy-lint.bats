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

@test "Test 000. qubes-policy-lint: qubes-policy-lint " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qubes-policy-lint '
}

@test "Test 001. qubes-policy-lint: qubes-policy-lint -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--show-line" [3]="-s" [4]="--include-service" [5]="-i")
    test_wrapper 'qubes-policy-lint -'
}

@test "Test 002. qubes-policy-lint: qubes-policy-lint --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--show-line" [2]="--include-service")
    test_wrapper 'qubes-policy-lint --'
}

@test "Test 003. qubes-policy-lint: qubes-policy-lint -- " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qubes-policy-lint -- '
}

@test "Test 004. qubes-policy-lint: qubes-policy-lint -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint -- -'
}

@test "Test 005. qubes-policy-lint: qubes-policy-lint -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-policy-lint -h'
}

@test "Test 006. qubes-policy-lint: qubes-policy-lint --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-policy-lint --h'
}

@test "Test 007. qubes-policy-lint: qubes-policy-lint run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint run'
}

@test "Test 008. qubes-policy-lint: qubes-policy-lint runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint runnin'
}

@test "Test 009. qubes-policy-lint: qubes-policy-lint running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint running'
}

@test "Test 010. qubes-policy-lint: qubes-policy-lint running " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qubes-policy-lint running '
}

@test "Test 011. qubes-policy-lint: qubes-policy-lint \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint "run'
}

@test "Test 012. qubes-policy-lint: qubes-policy-lint \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint "runnin'
}

@test "Test 013. qubes-policy-lint: qubes-policy-lint \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint "running'
}

@test "Test 014. qubes-policy-lint: qubes-policy-lint \"running\" " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qubes-policy-lint "running" '
}

@test "Test 015. qubes-policy-lint: qubes-policy-lint 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint '\''run'
}

@test "Test 016. qubes-policy-lint: qubes-policy-lint 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint '\''runnin'
}

@test "Test 017. qubes-policy-lint: qubes-policy-lint 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint '\''running'
}

@test "Test 018. qubes-policy-lint: qubes-policy-lint 'running' " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qubes-policy-lint '\''running'\'' '
}

@test "Test 019. qubes-policy-lint: qubes-policy-lint nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint nonexistent'
}

@test "Test 020. qubes-policy-lint: qubes-policy-lint nonexistent " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qubes-policy-lint nonexistent '
}

@test "Test 021. qubes-policy-lint: qubes-policy-lint nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint nonexistent -'
}

@test "Test 022. qubes-policy-lint: qubes-policy-lint nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint nonexistent --'
}

@test "Test 023. qubes-policy-lint: qubes-policy-lint nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qubes-policy-lint nonexistent -- '
}

@test "Test 024. qubes-policy-lint: qubes-policy-lint nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint nonexistent -h'
}

@test "Test 025. qubes-policy-lint: qubes-policy-lint nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint nonexistent --h'
}

@test "Test 026. qubes-policy-lint: qubes-policy-lint --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-lint --something_unknown'
}

@test "Test 027. qubes-policy-lint: qubes-policy-lint --something_unknown " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qubes-policy-lint --something_unknown '
}

@test "Test 028. qubes-policy-lint: qubes-policy-lint --something_unknown=" {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qubes-policy-lint --something_unknown='
}

@test "Test 029. qubes-policy-lint: qubes-policy-lint --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--show-line" [3]="-s" [4]="--include-service" [5]="-i")
    test_wrapper 'qubes-policy-lint --something_unknown -'
}

@test "Test 030. qubes-policy-lint: qubes-policy-lint --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--show-line" [2]="--include-service")
    test_wrapper 'qubes-policy-lint --something_unknown --'
}

@test "Test 031. qubes-policy-lint: qubes-policy-lint --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qubes-policy-lint --something_unknown -- '
}

@test "Test 032. qubes-policy-lint: qubes-policy-lint --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-policy-lint --something_unknown -h'
}

@test "Test 033. qubes-policy-lint: qubes-policy-lint --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-policy-lint --something_unknown --h'
}

