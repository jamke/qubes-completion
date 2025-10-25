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

@test "Test 000. qubes-policy-editor: qubes-policy-editor " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor '
}

@test "Test 001. qubes-policy-editor: qubes-policy-editor -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h")
    test_wrapper 'qubes-policy-editor -'
}

@test "Test 002. qubes-policy-editor: qubes-policy-editor --" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-policy-editor --'
}

@test "Test 003. qubes-policy-editor: qubes-policy-editor -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor -- '
}

@test "Test 004. qubes-policy-editor: qubes-policy-editor -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor -- -'
}

@test "Test 005. qubes-policy-editor: qubes-policy-editor -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-policy-editor -h'
}

@test "Test 006. qubes-policy-editor: qubes-policy-editor --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-policy-editor --h'
}

@test "Test 007. qubes-policy-editor: qubes-policy-editor run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor run'
}

@test "Test 008. qubes-policy-editor: qubes-policy-editor runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor runnin'
}

@test "Test 009. qubes-policy-editor: qubes-policy-editor running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor running'
}

@test "Test 010. qubes-policy-editor: qubes-policy-editor running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor running '
}

@test "Test 011. qubes-policy-editor: qubes-policy-editor \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor "run'
}

@test "Test 012. qubes-policy-editor: qubes-policy-editor \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor "runnin'
}

@test "Test 013. qubes-policy-editor: qubes-policy-editor \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor "running'
}

@test "Test 014. qubes-policy-editor: qubes-policy-editor \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor "running" '
}

@test "Test 015. qubes-policy-editor: qubes-policy-editor 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor '\''run'
}

@test "Test 016. qubes-policy-editor: qubes-policy-editor 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor '\''runnin'
}

@test "Test 017. qubes-policy-editor: qubes-policy-editor 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor '\''running'
}

@test "Test 018. qubes-policy-editor: qubes-policy-editor 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor '\''running'\'' '
}

@test "Test 019. qubes-policy-editor: qubes-policy-editor nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor nonexistent'
}

@test "Test 020. qubes-policy-editor: qubes-policy-editor nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor nonexistent '
}

@test "Test 021. qubes-policy-editor: qubes-policy-editor nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor nonexistent -'
}

@test "Test 022. qubes-policy-editor: qubes-policy-editor nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor nonexistent --'
}

@test "Test 023. qubes-policy-editor: qubes-policy-editor nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor nonexistent -- '
}

@test "Test 024. qubes-policy-editor: qubes-policy-editor nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor nonexistent -h'
}

@test "Test 025. qubes-policy-editor: qubes-policy-editor nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor nonexistent --h'
}

@test "Test 026. qubes-policy-editor: qubes-policy-editor --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor --something_unknown'
}

@test "Test 027. qubes-policy-editor: qubes-policy-editor --something_unknown " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor --something_unknown '
}

@test "Test 028. qubes-policy-editor: qubes-policy-editor --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor --something_unknown='
}

@test "Test 029. qubes-policy-editor: qubes-policy-editor --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h")
    test_wrapper 'qubes-policy-editor --something_unknown -'
}

@test "Test 030. qubes-policy-editor: qubes-policy-editor --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-policy-editor --something_unknown --'
}

@test "Test 031. qubes-policy-editor: qubes-policy-editor --something_unknown -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-policy-editor --something_unknown -- '
}

@test "Test 032. qubes-policy-editor: qubes-policy-editor --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-policy-editor --something_unknown -h'
}

@test "Test 033. qubes-policy-editor: qubes-policy-editor --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-policy-editor --something_unknown --h'
}

