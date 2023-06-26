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

@test "Test 000. qubes-policy: qubes-policy " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy '
}

@test "Test 001. qubes-policy: qubes-policy -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--list" [3]="-l" [4]="--get" [5]="-g" [6]="--replace" [7]="-r" [8]="--remove" [9]="-d")
    test_wrapper 'qubes-policy -'
}

@test "Test 002. qubes-policy: qubes-policy --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--list" [2]="--get" [3]="--replace" [4]="--remove")
    test_wrapper 'qubes-policy --'
}

@test "Test 003. qubes-policy: qubes-policy -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy -- '
}

@test "Test 004. qubes-policy: qubes-policy -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy -- -'
}

@test "Test 005. qubes-policy: qubes-policy -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-policy -h'
}

@test "Test 006. qubes-policy: qubes-policy --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-policy --h'
}

@test "Test 007. qubes-policy: qubes-policy run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy run'
}

@test "Test 008. qubes-policy: qubes-policy runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy runnin'
}

@test "Test 009. qubes-policy: qubes-policy running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy running'
}

@test "Test 010. qubes-policy: qubes-policy running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy running '
}

@test "Test 011. qubes-policy: qubes-policy \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy "run'
}

@test "Test 012. qubes-policy: qubes-policy \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy "runnin'
}

@test "Test 013. qubes-policy: qubes-policy \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy "running'
}

@test "Test 014. qubes-policy: qubes-policy \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy "running" '
}

@test "Test 015. qubes-policy: qubes-policy 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy '\''run'
}

@test "Test 016. qubes-policy: qubes-policy 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy '\''runnin'
}

@test "Test 017. qubes-policy: qubes-policy 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy '\''running'
}

@test "Test 018. qubes-policy: qubes-policy 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy '\''running'\'' '
}

@test "Test 019. qubes-policy: qubes-policy nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy nonexistent'
}

@test "Test 020. qubes-policy: qubes-policy nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy nonexistent '
}

@test "Test 021. qubes-policy: qubes-policy nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy nonexistent -'
}

@test "Test 022. qubes-policy: qubes-policy nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy nonexistent --'
}

@test "Test 023. qubes-policy: qubes-policy nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy nonexistent -- '
}

@test "Test 024. qubes-policy: qubes-policy nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy nonexistent -h'
}

@test "Test 025. qubes-policy: qubes-policy nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy nonexistent --h'
}

@test "Test 026. qubes-policy: qubes-policy --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy --something_unknown'
}

@test "Test 027. qubes-policy: qubes-policy --something_unknown " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy --something_unknown '
}

@test "Test 028. qubes-policy: qubes-policy --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy --something_unknown='
}

@test "Test 029. qubes-policy: qubes-policy --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--list" [3]="-l" [4]="--get" [5]="-g" [6]="--replace" [7]="-r" [8]="--remove" [9]="-d")
    test_wrapper 'qubes-policy --something_unknown -'
}

@test "Test 030. qubes-policy: qubes-policy --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--list" [2]="--get" [3]="--replace" [4]="--remove")
    test_wrapper 'qubes-policy --something_unknown --'
}

@test "Test 031. qubes-policy: qubes-policy --something_unknown -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy --something_unknown -- '
}

@test "Test 032. qubes-policy: qubes-policy --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-policy --something_unknown -h'
}

@test "Test 033. qubes-policy: qubes-policy --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-policy --something_unknown --h'
}

