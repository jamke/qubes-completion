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

@test "Test 000. qubes-app-menu: qubes-app-menu " {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--help-all" [3]="--help-gapplication" [4]="--help-gtk" [5]="--keep-visible" [6]="-k" [7]="--page" [8]="-p" [9]="--background" [10]="-b" [11]="--display")
    test_wrapper 'qubes-app-menu '
}

@test "Test 001. qubes-app-menu: qubes-app-menu -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--help-all" [3]="--help-gapplication" [4]="--help-gtk" [5]="--keep-visible" [6]="-k" [7]="--page" [8]="-p" [9]="--background" [10]="-b" [11]="--display")
    test_wrapper 'qubes-app-menu -'
}

@test "Test 002. qubes-app-menu: qubes-app-menu --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--help-all" [2]="--help-gapplication" [3]="--help-gtk" [4]="--keep-visible" [5]="--page" [6]="--background" [7]="--display")
    test_wrapper 'qubes-app-menu --'
}

@test "Test 003. qubes-app-menu: qubes-app-menu -- " {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--help-all" [3]="--help-gapplication" [4]="--help-gtk" [5]="--keep-visible" [6]="-k" [7]="--page" [8]="-p" [9]="--background" [10]="-b" [11]="--display")
    test_wrapper 'qubes-app-menu -- '
}

@test "Test 004. qubes-app-menu: qubes-app-menu -- -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--help-all" [3]="--help-gapplication" [4]="--help-gtk" [5]="--keep-visible" [6]="-k" [7]="--page" [8]="-p" [9]="--background" [10]="-b" [11]="--display")
    test_wrapper 'qubes-app-menu -- -'
}

@test "Test 005. qubes-app-menu: qubes-app-menu -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-app-menu -h'
}

@test "Test 006. qubes-app-menu: qubes-app-menu --h" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--help-all" [2]="--help-gapplication" [3]="--help-gtk")
    test_wrapper 'qubes-app-menu --h'
}

@test "Test 007. qubes-app-menu: qubes-app-menu run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu run'
}

@test "Test 008. qubes-app-menu: qubes-app-menu runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu runnin'
}

@test "Test 009. qubes-app-menu: qubes-app-menu running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu running'
}

@test "Test 010. qubes-app-menu: qubes-app-menu running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu running '
}

@test "Test 011. qubes-app-menu: qubes-app-menu \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu "run'
}

@test "Test 012. qubes-app-menu: qubes-app-menu \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu "runnin'
}

@test "Test 013. qubes-app-menu: qubes-app-menu \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu "running'
}

@test "Test 014. qubes-app-menu: qubes-app-menu \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu "running" '
}

@test "Test 015. qubes-app-menu: qubes-app-menu 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu '\''run'
}

@test "Test 016. qubes-app-menu: qubes-app-menu 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu '\''runnin'
}

@test "Test 017. qubes-app-menu: qubes-app-menu 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu '\''running'
}

@test "Test 018. qubes-app-menu: qubes-app-menu 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu '\''running'\'' '
}

@test "Test 019. qubes-app-menu: qubes-app-menu nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu nonexistent'
}

@test "Test 020. qubes-app-menu: qubes-app-menu nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu nonexistent '
}

@test "Test 021. qubes-app-menu: qubes-app-menu nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu nonexistent -'
}

@test "Test 022. qubes-app-menu: qubes-app-menu nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu nonexistent --'
}

@test "Test 023. qubes-app-menu: qubes-app-menu nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu nonexistent -- '
}

@test "Test 024. qubes-app-menu: qubes-app-menu nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu nonexistent -h'
}

@test "Test 025. qubes-app-menu: qubes-app-menu nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu nonexistent --h'
}

@test "Test 026. qubes-app-menu: qubes-app-menu --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu --something_unknown'
}

@test "Test 027. qubes-app-menu: qubes-app-menu --something_unknown " {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--help-all" [3]="--help-gapplication" [4]="--help-gtk" [5]="--keep-visible" [6]="-k" [7]="--page" [8]="-p" [9]="--background" [10]="-b" [11]="--display")
    test_wrapper 'qubes-app-menu --something_unknown '
}

@test "Test 028. qubes-app-menu: qubes-app-menu --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-app-menu --something_unknown='
}

@test "Test 029. qubes-app-menu: qubes-app-menu --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--help-all" [3]="--help-gapplication" [4]="--help-gtk" [5]="--keep-visible" [6]="-k" [7]="--page" [8]="-p" [9]="--background" [10]="-b" [11]="--display")
    test_wrapper 'qubes-app-menu --something_unknown -'
}

@test "Test 030. qubes-app-menu: qubes-app-menu --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--help-all" [2]="--help-gapplication" [3]="--help-gtk" [4]="--keep-visible" [5]="--page" [6]="--background" [7]="--display")
    test_wrapper 'qubes-app-menu --something_unknown --'
}

@test "Test 031. qubes-app-menu: qubes-app-menu --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--help-all" [3]="--help-gapplication" [4]="--help-gtk" [5]="--keep-visible" [6]="-k" [7]="--page" [8]="-p" [9]="--background" [10]="-b" [11]="--display")
    test_wrapper 'qubes-app-menu --something_unknown -- '
}

@test "Test 032. qubes-app-menu: qubes-app-menu --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-app-menu --something_unknown -h'
}

@test "Test 033. qubes-app-menu: qubes-app-menu --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--help-all" [2]="--help-gapplication" [3]="--help-gtk")
    test_wrapper 'qubes-app-menu --something_unknown --h'
}

