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

@test "Test 000. qvm-check: qvm-check " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-check '
}

@test "Test 001. qvm-check: qvm-check -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--running" [3]="--paused" [4]="--template" [5]="--networked" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qvm-check -'
}

@test "Test 002. qvm-check: qvm-check --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--running" [3]="--paused" [4]="--template" [5]="--networked" [6]="--verbose" [7]="--quiet" [8]="--help")
    test_wrapper 'qvm-check --'
}

@test "Test 003. qvm-check: qvm-check -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-check -- '
}

@test "Test 004. qvm-check: qvm-check -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-check -- -'
}

@test "Test 005. qvm-check: qvm-check -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-check -h'
}

@test "Test 006. qvm-check: qvm-check --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-check --h'
}

@test "Test 007. qvm-check: qvm-check run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-check run'
}

@test "Test 008. qvm-check: qvm-check runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-check runnin'
}

@test "Test 009. qvm-check: qvm-check running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-check running'
}

@test "Test 010. qvm-check: qvm-check running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-check running '
}

@test "Test 011. qvm-check: qvm-check \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-check "run'
}

@test "Test 012. qvm-check: qvm-check \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-check "runnin'
}

@test "Test 013. qvm-check: qvm-check \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-check "running'
}

@test "Test 014. qvm-check: qvm-check \"running\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-check "running" '
}

@test "Test 015. qvm-check: qvm-check 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-check '\''run'
}

@test "Test 016. qvm-check: qvm-check 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-check '\''runnin'
}

@test "Test 017. qvm-check: qvm-check 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-check '\''running'
}

@test "Test 018. qvm-check: qvm-check 'running' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-check '\''running'\'' '
}

@test "Test 019. qvm-check: qvm-check nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-check nonexistent'
}

@test "Test 020. qvm-check: qvm-check nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-check nonexistent '
}

@test "Test 021. qvm-check: qvm-check nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-check nonexistent -'
}

@test "Test 022. qvm-check: qvm-check nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-check nonexistent --'
}

@test "Test 023. qvm-check: qvm-check nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-check nonexistent -- '
}

@test "Test 024. qvm-check: qvm-check nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-check nonexistent -h'
}

@test "Test 025. qvm-check: qvm-check nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-check nonexistent --h'
}

@test "Test 026. qvm-check: qvm-check --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-check --something_unknown'
}

@test "Test 027. qvm-check: qvm-check --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-check --something_unknown '
}

@test "Test 028. qvm-check: qvm-check --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-check --something_unknown='
}

@test "Test 029. qvm-check: qvm-check --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--running" [3]="--paused" [4]="--template" [5]="--networked" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qvm-check --something_unknown -'
}

@test "Test 030. qvm-check: qvm-check --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--running" [3]="--paused" [4]="--template" [5]="--networked" [6]="--verbose" [7]="--quiet" [8]="--help")
    test_wrapper 'qvm-check --something_unknown --'
}

@test "Test 031. qvm-check: qvm-check --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-check --something_unknown -- '
}

@test "Test 032. qvm-check: qvm-check --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-check --something_unknown -h'
}

@test "Test 033. qvm-check: qvm-check --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-check --something_unknown --h'
}

