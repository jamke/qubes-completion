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

@test "Test 000. qvm-remove: qvm-remove " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-remove '
}

@test "Test 001. qvm-remove: qvm-remove -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--force" [3]="-f" [4]="--force-root" [5]="--just-db" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qvm-remove -'
}

@test "Test 002. qvm-remove: qvm-remove --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--force" [3]="--force-root" [4]="--just-db" [5]="--verbose" [6]="--quiet" [7]="--help")
    test_wrapper 'qvm-remove --'
}

@test "Test 003. qvm-remove: qvm-remove -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-remove -- '
}

@test "Test 004. qvm-remove: qvm-remove -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-remove -- -'
}

@test "Test 005. qvm-remove: qvm-remove -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-remove -h'
}

@test "Test 006. qvm-remove: qvm-remove --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-remove --h'
}

@test "Test 007. qvm-remove: qvm-remove run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-remove run'
}

@test "Test 008. qvm-remove: qvm-remove runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-remove runnin'
}

@test "Test 009. qvm-remove: qvm-remove running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-remove running'
}

@test "Test 010. qvm-remove: qvm-remove running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-remove running '
}

@test "Test 011. qvm-remove: qvm-remove \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-remove "run'
}

@test "Test 012. qvm-remove: qvm-remove \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-remove "runnin'
}

@test "Test 013. qvm-remove: qvm-remove \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-remove "running'
}

@test "Test 014. qvm-remove: qvm-remove \"running\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-remove "running" '
}

@test "Test 015. qvm-remove: qvm-remove 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-remove '\''run'
}

@test "Test 016. qvm-remove: qvm-remove 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-remove '\''runnin'
}

@test "Test 017. qvm-remove: qvm-remove 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-remove '\''running'
}

@test "Test 018. qvm-remove: qvm-remove 'running' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-remove '\''running'\'' '
}

@test "Test 019. qvm-remove: qvm-remove nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-remove nonexistent'
}

@test "Test 020. qvm-remove: qvm-remove nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-remove nonexistent '
}

@test "Test 021. qvm-remove: qvm-remove nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-remove nonexistent -'
}

@test "Test 022. qvm-remove: qvm-remove nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-remove nonexistent --'
}

@test "Test 023. qvm-remove: qvm-remove nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-remove nonexistent -- '
}

@test "Test 024. qvm-remove: qvm-remove nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-remove nonexistent -h'
}

@test "Test 025. qvm-remove: qvm-remove nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-remove nonexistent --h'
}

@test "Test 026. qvm-remove: qvm-remove --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-remove --something_unknown'
}

@test "Test 027. qvm-remove: qvm-remove --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-remove --something_unknown '
}

@test "Test 028. qvm-remove: qvm-remove --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-remove --something_unknown='
}

@test "Test 029. qvm-remove: qvm-remove --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--force" [3]="-f" [4]="--force-root" [5]="--just-db" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qvm-remove --something_unknown -'
}

@test "Test 030. qvm-remove: qvm-remove --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--force" [3]="--force-root" [4]="--just-db" [5]="--verbose" [6]="--quiet" [7]="--help")
    test_wrapper 'qvm-remove --something_unknown --'
}

@test "Test 031. qvm-remove: qvm-remove --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-remove --something_unknown -- '
}

@test "Test 032. qvm-remove: qvm-remove --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-remove --something_unknown -h'
}

@test "Test 033. qvm-remove: qvm-remove --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-remove --something_unknown --h'
}

