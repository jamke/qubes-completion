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

@test "Test 000. qvm-shutdown: qvm-shutdown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown '
}

@test "Test 001. qvm-shutdown: qvm-shutdown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--wait" [3]="--timeout" [4]="--force" [5]="--dry-run" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qvm-shutdown -'
}

@test "Test 002. qvm-shutdown: qvm-shutdown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--wait" [3]="--timeout" [4]="--force" [5]="--dry-run" [6]="--verbose" [7]="--quiet" [8]="--help")
    test_wrapper 'qvm-shutdown --'
}

@test "Test 003. qvm-shutdown: qvm-shutdown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown -- '
}

@test "Test 004. qvm-shutdown: qvm-shutdown -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown -- -'
}

@test "Test 005. qvm-shutdown: qvm-shutdown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-shutdown -h'
}

@test "Test 006. qvm-shutdown: qvm-shutdown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-shutdown --h'
}

@test "Test 007. qvm-shutdown: qvm-shutdown run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown run'
}

@test "Test 008. qvm-shutdown: qvm-shutdown runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown runnin'
}

@test "Test 009. qvm-shutdown: qvm-shutdown running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown running'
}

@test "Test 010. qvm-shutdown: qvm-shutdown running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown running '
}

@test "Test 011. qvm-shutdown: qvm-shutdown \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown "run'
}

@test "Test 012. qvm-shutdown: qvm-shutdown \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown "runnin'
}

@test "Test 013. qvm-shutdown: qvm-shutdown \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown "running'
}

@test "Test 014. qvm-shutdown: qvm-shutdown \"running\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown "running" '
}

@test "Test 015. qvm-shutdown: qvm-shutdown 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown '\''run'
}

@test "Test 016. qvm-shutdown: qvm-shutdown 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown '\''runnin'
}

@test "Test 017. qvm-shutdown: qvm-shutdown 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown '\''running'
}

@test "Test 018. qvm-shutdown: qvm-shutdown 'running' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown '\''running'\'' '
}

@test "Test 019. qvm-shutdown: qvm-shutdown nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown nonexistent'
}

@test "Test 020. qvm-shutdown: qvm-shutdown nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown nonexistent '
}

@test "Test 021. qvm-shutdown: qvm-shutdown nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown nonexistent -'
}

@test "Test 022. qvm-shutdown: qvm-shutdown nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown nonexistent --'
}

@test "Test 023. qvm-shutdown: qvm-shutdown nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown nonexistent -- '
}

@test "Test 024. qvm-shutdown: qvm-shutdown nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown nonexistent -h'
}

@test "Test 025. qvm-shutdown: qvm-shutdown nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown nonexistent --h'
}

@test "Test 026. qvm-shutdown: qvm-shutdown --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown --something_unknown'
}

@test "Test 027. qvm-shutdown: qvm-shutdown --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --something_unknown '
}

@test "Test 028. qvm-shutdown: qvm-shutdown --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown --something_unknown='
}

@test "Test 029. qvm-shutdown: qvm-shutdown --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--wait" [3]="--timeout" [4]="--force" [5]="--dry-run" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qvm-shutdown --something_unknown -'
}

@test "Test 030. qvm-shutdown: qvm-shutdown --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--wait" [3]="--timeout" [4]="--force" [5]="--dry-run" [6]="--verbose" [7]="--quiet" [8]="--help")
    test_wrapper 'qvm-shutdown --something_unknown --'
}

@test "Test 031. qvm-shutdown: qvm-shutdown --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --something_unknown -- '
}

@test "Test 032. qvm-shutdown: qvm-shutdown --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-shutdown --something_unknown -h'
}

@test "Test 033. qvm-shutdown: qvm-shutdown --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-shutdown --something_unknown --h'
}

