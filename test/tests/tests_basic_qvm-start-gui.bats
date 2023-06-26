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

@test "Test 000. qvm-start-gui: qvm-start-gui " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-start-gui '
}

@test "Test 001. qvm-start-gui: qvm-start-gui -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--watch" [3]="--force-stubdomain" [4]="--pidfile" [5]="--notify-monitor-layout" [6]="--kde" [7]="--force" [8]="--verbose" [9]="-v" [10]="--quiet" [11]="-q" [12]="--help" [13]="-h")
    test_wrapper 'qvm-start-gui -'
}

@test "Test 002. qvm-start-gui: qvm-start-gui --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--watch" [3]="--force-stubdomain" [4]="--pidfile" [5]="--notify-monitor-layout" [6]="--kde" [7]="--force" [8]="--verbose" [9]="--quiet" [10]="--help")
    test_wrapper 'qvm-start-gui --'
}

@test "Test 003. qvm-start-gui: qvm-start-gui -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-start-gui -- '
}

@test "Test 004. qvm-start-gui: qvm-start-gui -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-gui -- -'
}

@test "Test 005. qvm-start-gui: qvm-start-gui -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-start-gui -h'
}

@test "Test 006. qvm-start-gui: qvm-start-gui --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-start-gui --h'
}

@test "Test 007. qvm-start-gui: qvm-start-gui run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-start-gui run'
}

@test "Test 008. qvm-start-gui: qvm-start-gui runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-gui runnin'
}

@test "Test 009. qvm-start-gui: qvm-start-gui running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-gui running'
}

@test "Test 010. qvm-start-gui: qvm-start-gui running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-start-gui running '
}

@test "Test 011. qvm-start-gui: qvm-start-gui \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-start-gui "run'
}

@test "Test 012. qvm-start-gui: qvm-start-gui \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-gui "runnin'
}

@test "Test 013. qvm-start-gui: qvm-start-gui \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-gui "running'
}

@test "Test 014. qvm-start-gui: qvm-start-gui \"running\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-start-gui "running" '
}

@test "Test 015. qvm-start-gui: qvm-start-gui 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-start-gui '\''run'
}

@test "Test 016. qvm-start-gui: qvm-start-gui 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-gui '\''runnin'
}

@test "Test 017. qvm-start-gui: qvm-start-gui 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-gui '\''running'
}

@test "Test 018. qvm-start-gui: qvm-start-gui 'running' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-start-gui '\''running'\'' '
}

@test "Test 019. qvm-start-gui: qvm-start-gui nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-gui nonexistent'
}

@test "Test 020. qvm-start-gui: qvm-start-gui nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-start-gui nonexistent '
}

@test "Test 021. qvm-start-gui: qvm-start-gui nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-gui nonexistent -'
}

@test "Test 022. qvm-start-gui: qvm-start-gui nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-gui nonexistent --'
}

@test "Test 023. qvm-start-gui: qvm-start-gui nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-start-gui nonexistent -- '
}

@test "Test 024. qvm-start-gui: qvm-start-gui nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-gui nonexistent -h'
}

@test "Test 025. qvm-start-gui: qvm-start-gui nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-gui nonexistent --h'
}

@test "Test 026. qvm-start-gui: qvm-start-gui --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-gui --something_unknown'
}

@test "Test 027. qvm-start-gui: qvm-start-gui --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-start-gui --something_unknown '
}

@test "Test 028. qvm-start-gui: qvm-start-gui --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-gui --something_unknown='
}

@test "Test 029. qvm-start-gui: qvm-start-gui --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--watch" [3]="--force-stubdomain" [4]="--pidfile" [5]="--notify-monitor-layout" [6]="--kde" [7]="--force" [8]="--verbose" [9]="-v" [10]="--quiet" [11]="-q" [12]="--help" [13]="-h")
    test_wrapper 'qvm-start-gui --something_unknown -'
}

@test "Test 030. qvm-start-gui: qvm-start-gui --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--watch" [3]="--force-stubdomain" [4]="--pidfile" [5]="--notify-monitor-layout" [6]="--kde" [7]="--force" [8]="--verbose" [9]="--quiet" [10]="--help")
    test_wrapper 'qvm-start-gui --something_unknown --'
}

@test "Test 031. qvm-start-gui: qvm-start-gui --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-start-gui --something_unknown -- '
}

@test "Test 032. qvm-start-gui: qvm-start-gui --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-start-gui --something_unknown -h'
}

@test "Test 033. qvm-start-gui: qvm-start-gui --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-start-gui --something_unknown --h'
}

