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

@test "Test 000. qubesctl: qubesctl " {
    EXPECTED_COMPREPLY=([0]="top.enable" [1]="top.disable" [2]="top.enabled" [3]="state.highstate" [4]="state.apply")
    test_wrapper 'qubesctl '
}

@test "Test 001. qubesctl: qubesctl -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--show-output" [3]="--force-color" [4]="--skip-dom0" [5]="--max-concurrency" [6]="--templates" [7]="--standalones" [8]="--app" [9]="--targets" [10]="--all")
    test_wrapper 'qubesctl -'
}

@test "Test 002. qubesctl: qubesctl --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--show-output" [2]="--force-color" [3]="--skip-dom0" [4]="--max-concurrency" [5]="--templates" [6]="--standalones" [7]="--app" [8]="--targets" [9]="--all")
    test_wrapper 'qubesctl --'
}

@test "Test 003. qubesctl: qubesctl -- " {
    EXPECTED_COMPREPLY=([0]="top.enable" [1]="top.disable" [2]="top.enabled" [3]="state.highstate" [4]="state.apply")
    test_wrapper 'qubesctl -- '
}

@test "Test 004. qubesctl: qubesctl -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl -- -'
}

@test "Test 005. qubesctl: qubesctl -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubesctl -h'
}

@test "Test 006. qubesctl: qubesctl --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubesctl --h'
}

@test "Test 007. qubesctl: qubesctl run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl run'
}

@test "Test 008. qubesctl: qubesctl runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl runnin'
}

@test "Test 009. qubesctl: qubesctl running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl running'
}

@test "Test 010. qubesctl: qubesctl running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl running '
}

@test "Test 011. qubesctl: qubesctl \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl "run'
}

@test "Test 012. qubesctl: qubesctl \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl "runnin'
}

@test "Test 013. qubesctl: qubesctl \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl "running'
}

@test "Test 014. qubesctl: qubesctl \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl "running" '
}

@test "Test 015. qubesctl: qubesctl 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl '\''run'
}

@test "Test 016. qubesctl: qubesctl 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl '\''runnin'
}

@test "Test 017. qubesctl: qubesctl 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl '\''running'
}

@test "Test 018. qubesctl: qubesctl 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl '\''running'\'' '
}

@test "Test 019. qubesctl: qubesctl nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl nonexistent'
}

@test "Test 020. qubesctl: qubesctl nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl nonexistent '
}

@test "Test 021. qubesctl: qubesctl nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl nonexistent -'
}

@test "Test 022. qubesctl: qubesctl nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl nonexistent --'
}

@test "Test 023. qubesctl: qubesctl nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl nonexistent -- '
}

@test "Test 024. qubesctl: qubesctl nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl nonexistent -h'
}

@test "Test 025. qubesctl: qubesctl nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl nonexistent --h'
}

@test "Test 026. qubesctl: qubesctl --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl --something_unknown'
}

@test "Test 027. qubesctl: qubesctl --something_unknown " {
    EXPECTED_COMPREPLY=([0]="top.enable" [1]="top.disable" [2]="top.enabled" [3]="state.highstate" [4]="state.apply")
    test_wrapper 'qubesctl --something_unknown '
}

@test "Test 028. qubesctl: qubesctl --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubesctl --something_unknown='
}

@test "Test 029. qubesctl: qubesctl --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--show-output" [3]="--force-color" [4]="--skip-dom0" [5]="--max-concurrency" [6]="--templates" [7]="--standalones" [8]="--app" [9]="--targets" [10]="--all")
    test_wrapper 'qubesctl --something_unknown -'
}

@test "Test 030. qubesctl: qubesctl --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--show-output" [2]="--force-color" [3]="--skip-dom0" [4]="--max-concurrency" [5]="--templates" [6]="--standalones" [7]="--app" [8]="--targets" [9]="--all")
    test_wrapper 'qubesctl --something_unknown --'
}

@test "Test 031. qubesctl: qubesctl --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="top.enable" [1]="top.disable" [2]="top.enabled" [3]="state.highstate" [4]="state.apply")
    test_wrapper 'qubesctl --something_unknown -- '
}

@test "Test 032. qubesctl: qubesctl --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubesctl --something_unknown -h'
}

@test "Test 033. qubesctl: qubesctl --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubesctl --something_unknown --h'
}

