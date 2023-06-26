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

@test "Test 000. qvm-get-tinted-image: qvm-get-tinted-image " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-get-tinted-image '
}

@test "Test 001. qvm-get-tinted-image: qvm-get-tinted-image -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h")
    test_wrapper 'qvm-get-tinted-image -'
}

@test "Test 002. qvm-get-tinted-image: qvm-get-tinted-image --" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-get-tinted-image --'
}

@test "Test 003. qvm-get-tinted-image: qvm-get-tinted-image -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-get-tinted-image -- '
}

@test "Test 004. qvm-get-tinted-image: qvm-get-tinted-image -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image -- -'
}

@test "Test 005. qvm-get-tinted-image: qvm-get-tinted-image -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-get-tinted-image -h'
}

@test "Test 006. qvm-get-tinted-image: qvm-get-tinted-image --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-get-tinted-image --h'
}

@test "Test 007. qvm-get-tinted-image: qvm-get-tinted-image run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-get-tinted-image run'
}

@test "Test 008. qvm-get-tinted-image: qvm-get-tinted-image runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-get-tinted-image runnin'
}

@test "Test 009. qvm-get-tinted-image: qvm-get-tinted-image running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-get-tinted-image running'
}

@test "Test 010. qvm-get-tinted-image: qvm-get-tinted-image running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image running '
}

@test "Test 011. qvm-get-tinted-image: qvm-get-tinted-image \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-get-tinted-image "run'
}

@test "Test 012. qvm-get-tinted-image: qvm-get-tinted-image \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-get-tinted-image "runnin'
}

@test "Test 013. qvm-get-tinted-image: qvm-get-tinted-image \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-get-tinted-image "running'
}

@test "Test 014. qvm-get-tinted-image: qvm-get-tinted-image \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image "running" '
}

@test "Test 015. qvm-get-tinted-image: qvm-get-tinted-image 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-get-tinted-image '\''run'
}

@test "Test 016. qvm-get-tinted-image: qvm-get-tinted-image 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-get-tinted-image '\''runnin'
}

@test "Test 017. qvm-get-tinted-image: qvm-get-tinted-image 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-get-tinted-image '\''running'
}

@test "Test 018. qvm-get-tinted-image: qvm-get-tinted-image 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image '\''running'\'' '
}

@test "Test 019. qvm-get-tinted-image: qvm-get-tinted-image nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image nonexistent'
}

@test "Test 020. qvm-get-tinted-image: qvm-get-tinted-image nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image nonexistent '
}

@test "Test 021. qvm-get-tinted-image: qvm-get-tinted-image nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image nonexistent -'
}

@test "Test 022. qvm-get-tinted-image: qvm-get-tinted-image nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image nonexistent --'
}

@test "Test 023. qvm-get-tinted-image: qvm-get-tinted-image nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image nonexistent -- '
}

@test "Test 024. qvm-get-tinted-image: qvm-get-tinted-image nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image nonexistent -h'
}

@test "Test 025. qvm-get-tinted-image: qvm-get-tinted-image nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image nonexistent --h'
}

@test "Test 026. qvm-get-tinted-image: qvm-get-tinted-image --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image --something_unknown'
}

@test "Test 027. qvm-get-tinted-image: qvm-get-tinted-image --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-get-tinted-image --something_unknown '
}

@test "Test 028. qvm-get-tinted-image: qvm-get-tinted-image --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-get-tinted-image --something_unknown='
}

@test "Test 029. qvm-get-tinted-image: qvm-get-tinted-image --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h")
    test_wrapper 'qvm-get-tinted-image --something_unknown -'
}

@test "Test 030. qvm-get-tinted-image: qvm-get-tinted-image --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-get-tinted-image --something_unknown --'
}

@test "Test 031. qvm-get-tinted-image: qvm-get-tinted-image --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-get-tinted-image --something_unknown -- '
}

@test "Test 032. qvm-get-tinted-image: qvm-get-tinted-image --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-get-tinted-image --something_unknown -h'
}

@test "Test 033. qvm-get-tinted-image: qvm-get-tinted-image --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-get-tinted-image --something_unknown --h'
}

