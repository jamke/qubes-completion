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

@test "Test 000. qvm-pause: qvm-pause " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-pause '
}

@test "Test 001. qvm-pause: qvm-pause -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--help" [7]="-h")
    test_wrapper 'qvm-pause -'
}

@test "Test 002. qvm-pause: qvm-pause --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="--quiet" [4]="--help")
    test_wrapper 'qvm-pause --'
}

@test "Test 003. qvm-pause: qvm-pause -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-pause -- '
}

@test "Test 004. qvm-pause: qvm-pause -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pause -- -'
}

@test "Test 005. qvm-pause: qvm-pause -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-pause -h'
}

@test "Test 006. qvm-pause: qvm-pause --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-pause --h'
}

@test "Test 007. qvm-pause: qvm-pause run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-pause run'
}

@test "Test 008. qvm-pause: qvm-pause runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-pause runnin'
}

@test "Test 009. qvm-pause: qvm-pause running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-pause running'
}

@test "Test 010. qvm-pause: qvm-pause running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-pause running '
}

@test "Test 011. qvm-pause: qvm-pause \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-pause "run'
}

@test "Test 012. qvm-pause: qvm-pause \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-pause "runnin'
}

@test "Test 013. qvm-pause: qvm-pause \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-pause "running'
}

@test "Test 014. qvm-pause: qvm-pause \"running\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-pause "running" '
}

@test "Test 015. qvm-pause: qvm-pause 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-pause '\''run'
}

@test "Test 016. qvm-pause: qvm-pause 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-pause '\''runnin'
}

@test "Test 017. qvm-pause: qvm-pause 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-pause '\''running'
}

@test "Test 018. qvm-pause: qvm-pause 'running' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-pause '\''running'\'' '
}

@test "Test 019. qvm-pause: qvm-pause nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pause nonexistent'
}

@test "Test 020. qvm-pause: qvm-pause nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-pause nonexistent '
}

@test "Test 021. qvm-pause: qvm-pause nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pause nonexistent -'
}

@test "Test 022. qvm-pause: qvm-pause nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pause nonexistent --'
}

@test "Test 023. qvm-pause: qvm-pause nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-pause nonexistent -- '
}

@test "Test 024. qvm-pause: qvm-pause nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pause nonexistent -h'
}

@test "Test 025. qvm-pause: qvm-pause nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pause nonexistent --h'
}

@test "Test 026. qvm-pause: qvm-pause --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pause --something_unknown'
}

@test "Test 027. qvm-pause: qvm-pause --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-pause --something_unknown '
}

@test "Test 028. qvm-pause: qvm-pause --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-pause --something_unknown='
}

@test "Test 029. qvm-pause: qvm-pause --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--help" [7]="-h")
    test_wrapper 'qvm-pause --something_unknown -'
}

@test "Test 030. qvm-pause: qvm-pause --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--verbose" [3]="--quiet" [4]="--help")
    test_wrapper 'qvm-pause --something_unknown --'
}

@test "Test 031. qvm-pause: qvm-pause --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-pause --something_unknown -- '
}

@test "Test 032. qvm-pause: qvm-pause --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-pause --something_unknown -h'
}

@test "Test 033. qvm-pause: qvm-pause --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-pause --something_unknown --h'
}

