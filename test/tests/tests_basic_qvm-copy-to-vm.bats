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

@test "Test 000. qvm-copy-to-vm: qvm-copy-to-vm " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-copy-to-vm '
}

@test "Test 001. qvm-copy-to-vm: qvm-copy-to-vm -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm -'
}

@test "Test 002. qvm-copy-to-vm: qvm-copy-to-vm --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm --'
}

@test "Test 003. qvm-copy-to-vm: qvm-copy-to-vm -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-copy-to-vm -- '
}

@test "Test 004. qvm-copy-to-vm: qvm-copy-to-vm -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm -- -'
}

@test "Test 005. qvm-copy-to-vm: qvm-copy-to-vm -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm -h'
}

@test "Test 006. qvm-copy-to-vm: qvm-copy-to-vm --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm --h'
}

@test "Test 007. qvm-copy-to-vm: qvm-copy-to-vm run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-copy-to-vm run'
}

@test "Test 008. qvm-copy-to-vm: qvm-copy-to-vm runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-copy-to-vm runnin'
}

@test "Test 009. qvm-copy-to-vm: qvm-copy-to-vm running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-copy-to-vm running'
}

@test "Test 010. qvm-copy-to-vm: qvm-copy-to-vm running " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-copy-to-vm running '
}

@test "Test 011. qvm-copy-to-vm: qvm-copy-to-vm \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-copy-to-vm "run'
}

@test "Test 012. qvm-copy-to-vm: qvm-copy-to-vm \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-copy-to-vm "runnin'
}

@test "Test 013. qvm-copy-to-vm: qvm-copy-to-vm \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-copy-to-vm "running'
}

@test "Test 014. qvm-copy-to-vm: qvm-copy-to-vm \"running\" " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-copy-to-vm "running" '
}

@test "Test 015. qvm-copy-to-vm: qvm-copy-to-vm 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-copy-to-vm '\''run'
}

@test "Test 016. qvm-copy-to-vm: qvm-copy-to-vm 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-copy-to-vm '\''runnin'
}

@test "Test 017. qvm-copy-to-vm: qvm-copy-to-vm 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-copy-to-vm '\''running'
}

@test "Test 018. qvm-copy-to-vm: qvm-copy-to-vm 'running' " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-copy-to-vm '\''running'\'' '
}

@test "Test 019. qvm-copy-to-vm: qvm-copy-to-vm nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm nonexistent'
}

@test "Test 020. qvm-copy-to-vm: qvm-copy-to-vm nonexistent " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-copy-to-vm nonexistent '
}

@test "Test 021. qvm-copy-to-vm: qvm-copy-to-vm nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm nonexistent -'
}

@test "Test 022. qvm-copy-to-vm: qvm-copy-to-vm nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm nonexistent --'
}

@test "Test 023. qvm-copy-to-vm: qvm-copy-to-vm nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="dir1" [1]="dir2" [2]="_dir" [3]="file1" [4]="file2" [5]="file33" [6]="file" [7]="_file" [8]="something")
    test_wrapper 'qvm-copy-to-vm nonexistent -- '
}

@test "Test 024. qvm-copy-to-vm: qvm-copy-to-vm nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm nonexistent -h'
}

@test "Test 025. qvm-copy-to-vm: qvm-copy-to-vm nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm nonexistent --h'
}

@test "Test 026. qvm-copy-to-vm: qvm-copy-to-vm --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm --something_unknown'
}

@test "Test 027. qvm-copy-to-vm: qvm-copy-to-vm --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-copy-to-vm --something_unknown '
}

@test "Test 028. qvm-copy-to-vm: qvm-copy-to-vm --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm --something_unknown='
}

@test "Test 029. qvm-copy-to-vm: qvm-copy-to-vm --something_unknown -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm --something_unknown -'
}

@test "Test 030. qvm-copy-to-vm: qvm-copy-to-vm --something_unknown --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm --something_unknown --'
}

@test "Test 031. qvm-copy-to-vm: qvm-copy-to-vm --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-copy-to-vm --something_unknown -- '
}

@test "Test 032. qvm-copy-to-vm: qvm-copy-to-vm --something_unknown -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm --something_unknown -h'
}

@test "Test 033. qvm-copy-to-vm: qvm-copy-to-vm --something_unknown --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-copy-to-vm --something_unknown --h'
}

