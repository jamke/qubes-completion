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

@test "Test 000. qvm-start-daemon: qvm-start-daemon " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-start-daemon '
}

@test "Test 001. qvm-start-daemon: qvm-start-daemon -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--debug" [3]="-d" [4]="--watch" [5]="--kde" [6]="--force" [7]="--force-stubdomain" [8]="--pidfile" [9]="--notify-monitor-layout" [10]="--verbose" [11]="-v" [12]="--quiet" [13]="-q" [14]="--help" [15]="-h")
    test_wrapper 'qvm-start-daemon -'
}

@test "Test 002. qvm-start-daemon: qvm-start-daemon --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--debug" [3]="--watch" [4]="--kde" [5]="--force" [6]="--force-stubdomain" [7]="--pidfile" [8]="--notify-monitor-layout" [9]="--verbose" [10]="--quiet" [11]="--help")
    test_wrapper 'qvm-start-daemon --'
}

@test "Test 003. qvm-start-daemon: qvm-start-daemon -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-start-daemon -- '
}

@test "Test 004. qvm-start-daemon: qvm-start-daemon -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-daemon -- -'
}

@test "Test 005. qvm-start-daemon: qvm-start-daemon -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-start-daemon -h'
}

@test "Test 006. qvm-start-daemon: qvm-start-daemon --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-start-daemon --h'
}

@test "Test 007. qvm-start-daemon: qvm-start-daemon run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-start-daemon run'
}

@test "Test 008. qvm-start-daemon: qvm-start-daemon runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-daemon runnin'
}

@test "Test 009. qvm-start-daemon: qvm-start-daemon running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-daemon running'
}

@test "Test 010. qvm-start-daemon: qvm-start-daemon running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-start-daemon running '
}

@test "Test 011. qvm-start-daemon: qvm-start-daemon \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-start-daemon "run'
}

@test "Test 012. qvm-start-daemon: qvm-start-daemon \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-daemon "runnin'
}

@test "Test 013. qvm-start-daemon: qvm-start-daemon \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-daemon "running'
}

@test "Test 014. qvm-start-daemon: qvm-start-daemon \"running\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-start-daemon "running" '
}

@test "Test 015. qvm-start-daemon: qvm-start-daemon 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-start-daemon '\''run'
}

@test "Test 016. qvm-start-daemon: qvm-start-daemon 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-daemon '\''runnin'
}

@test "Test 017. qvm-start-daemon: qvm-start-daemon 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-start-daemon '\''running'
}

@test "Test 018. qvm-start-daemon: qvm-start-daemon 'running' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-start-daemon '\''running'\'' '
}

@test "Test 019. qvm-start-daemon: qvm-start-daemon nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-daemon nonexistent'
}

@test "Test 020. qvm-start-daemon: qvm-start-daemon nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-start-daemon nonexistent '
}

@test "Test 021. qvm-start-daemon: qvm-start-daemon nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-daemon nonexistent -'
}

@test "Test 022. qvm-start-daemon: qvm-start-daemon nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-daemon nonexistent --'
}

@test "Test 023. qvm-start-daemon: qvm-start-daemon nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-start-daemon nonexistent -- '
}

@test "Test 024. qvm-start-daemon: qvm-start-daemon nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-daemon nonexistent -h'
}

@test "Test 025. qvm-start-daemon: qvm-start-daemon nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-daemon nonexistent --h'
}

@test "Test 026. qvm-start-daemon: qvm-start-daemon --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-daemon --something_unknown'
}

@test "Test 027. qvm-start-daemon: qvm-start-daemon --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-start-daemon --something_unknown '
}

@test "Test 028. qvm-start-daemon: qvm-start-daemon --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-start-daemon --something_unknown='
}

@test "Test 029. qvm-start-daemon: qvm-start-daemon --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--debug" [3]="-d" [4]="--watch" [5]="--kde" [6]="--force" [7]="--force-stubdomain" [8]="--pidfile" [9]="--notify-monitor-layout" [10]="--verbose" [11]="-v" [12]="--quiet" [13]="-q" [14]="--help" [15]="-h")
    test_wrapper 'qvm-start-daemon --something_unknown -'
}

@test "Test 030. qvm-start-daemon: qvm-start-daemon --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--debug" [3]="--watch" [4]="--kde" [5]="--force" [6]="--force-stubdomain" [7]="--pidfile" [8]="--notify-monitor-layout" [9]="--verbose" [10]="--quiet" [11]="--help")
    test_wrapper 'qvm-start-daemon --something_unknown --'
}

@test "Test 031. qvm-start-daemon: qvm-start-daemon --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-start-daemon --something_unknown -- '
}

@test "Test 032. qvm-start-daemon: qvm-start-daemon --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-start-daemon --something_unknown -h'
}

@test "Test 033. qvm-start-daemon: qvm-start-daemon --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-start-daemon --something_unknown --h'
}

