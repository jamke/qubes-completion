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

@test "Test 000. qvm-start: qvm-start " {
    EXPECTED_COMPREPLY=([0]="halted" [1]="standalone1" [2]="template1" [3]="work")
    test_wrapper 'qvm-start '
}

@test "Test 001. qvm-start: qvm-start -" {
    EXPECTED_COMPREPLY=([0]="--skip-if-running" [1]="--all" [2]="--exclude" [3]="--drive" [4]="--hddisk" [5]="--cdrom" [6]="--install-windows-tools" [7]="--verbose" [8]="-v" [9]="--quiet" [10]="-q" [11]="--help" [12]="-h")
    test_wrapper 'qvm-start -'
}

@test "Test 002. qvm-start: qvm-start --" {
    EXPECTED_COMPREPLY=([0]="--skip-if-running" [1]="--all" [2]="--exclude" [3]="--drive" [4]="--hddisk" [5]="--cdrom" [6]="--install-windows-tools" [7]="--verbose" [8]="--quiet" [9]="--help")
    test_wrapper 'qvm-start --'
}

@test "Test 003. qvm-start: qvm-start -- " {
    EXPECTED_COMPREPLY=([0]="halted" [1]="standalone1" [2]="template1" [3]="work")
    test_wrapper 'qvm-start -- '
}

@test "Test 004. qvm-start: qvm-start -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start -- -'
}

@test "Test 005. qvm-start: qvm-start -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-start -h'
}

@test "Test 006. qvm-start: qvm-start --h" {
    EXPECTED_COMPREPLY=([0]="--hddisk" [1]="--help")
    test_wrapper 'qvm-start --h'
}

@test "Test 007. qvm-start: qvm-start run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start run'
}

@test "Test 008. qvm-start: qvm-start runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start runnin'
}

@test "Test 009. qvm-start: qvm-start running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start running'
}

@test "Test 010. qvm-start: qvm-start running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start running '
}

@test "Test 011. qvm-start: qvm-start \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start "run'
}

@test "Test 012. qvm-start: qvm-start \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start "runnin'
}

@test "Test 013. qvm-start: qvm-start \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start "running'
}

@test "Test 014. qvm-start: qvm-start \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start "running" '
}

@test "Test 015. qvm-start: qvm-start 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start '\''run'
}

@test "Test 016. qvm-start: qvm-start 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start '\''runnin'
}

@test "Test 017. qvm-start: qvm-start 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start '\''running'
}

@test "Test 018. qvm-start: qvm-start 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start '\''running'\'' '
}

@test "Test 019. qvm-start: qvm-start nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start nonexistent'
}

@test "Test 020. qvm-start: qvm-start nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start nonexistent '
}

@test "Test 021. qvm-start: qvm-start nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start nonexistent -'
}

@test "Test 022. qvm-start: qvm-start nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start nonexistent --'
}

@test "Test 023. qvm-start: qvm-start nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start nonexistent -- '
}

@test "Test 024. qvm-start: qvm-start nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start nonexistent -h'
}

@test "Test 025. qvm-start: qvm-start nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start nonexistent --h'
}

@test "Test 026. qvm-start: qvm-start --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start --something_unknown'
}

@test "Test 027. qvm-start: qvm-start --something_unknown " {
    EXPECTED_COMPREPLY=([0]="halted" [1]="standalone1" [2]="template1" [3]="work")
    test_wrapper 'qvm-start --something_unknown '
}

@test "Test 028. qvm-start: qvm-start --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start --something_unknown='
}

@test "Test 029. qvm-start: qvm-start --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--skip-if-running" [1]="--all" [2]="--exclude" [3]="--drive" [4]="--hddisk" [5]="--cdrom" [6]="--install-windows-tools" [7]="--verbose" [8]="-v" [9]="--quiet" [10]="-q" [11]="--help" [12]="-h")
    test_wrapper 'qvm-start --something_unknown -'
}

@test "Test 030. qvm-start: qvm-start --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--skip-if-running" [1]="--all" [2]="--exclude" [3]="--drive" [4]="--hddisk" [5]="--cdrom" [6]="--install-windows-tools" [7]="--verbose" [8]="--quiet" [9]="--help")
    test_wrapper 'qvm-start --something_unknown --'
}

@test "Test 031. qvm-start: qvm-start --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="halted" [1]="standalone1" [2]="template1" [3]="work")
    test_wrapper 'qvm-start --something_unknown -- '
}

@test "Test 032. qvm-start: qvm-start --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-start --something_unknown -h'
}

@test "Test 033. qvm-start: qvm-start --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--hddisk" [1]="--help")
    test_wrapper 'qvm-start --something_unknown --h'
}

