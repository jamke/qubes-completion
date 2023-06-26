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

@test "Test 000. qvm-run: qvm-run " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-run '
}

@test "Test 001. qvm-run: qvm-run -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--dispvm" [3]="--user" [4]="-u" [5]="--auto" [6]="--autostart" [7]="-a" [8]="--no-auto" [9]="--no-autostart" [10]="-n" [11]="--pass-io" [12]="-p" [13]="--localcmd" [14]="--gui" [15]="--no-gui" [16]="--nogui" [17]="--service" [18]="--colour-output" [19]="--color-output" [20]="--colour-stderr" [21]="--color-stderr" [22]="--no-colour-output" [23]="--no-color-output" [24]="--no-colour-stderr" [25]="--no-color-stderr" [26]="--filter-escape-chars" [27]="--no-filter-escape-chars" [28]="--no-shell" [29]="--verbose" [30]="-v" [31]="--quiet" [32]="-q" [33]="--help" [34]="-h")
    test_wrapper 'qvm-run -'
}

@test "Test 002. qvm-run: qvm-run --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--dispvm" [3]="--user" [4]="--auto" [5]="--autostart" [6]="--no-auto" [7]="--no-autostart" [8]="--pass-io" [9]="--localcmd" [10]="--gui" [11]="--no-gui" [12]="--nogui" [13]="--service" [14]="--colour-output" [15]="--color-output" [16]="--colour-stderr" [17]="--color-stderr" [18]="--no-colour-output" [19]="--no-color-output" [20]="--no-colour-stderr" [21]="--no-color-stderr" [22]="--filter-escape-chars" [23]="--no-filter-escape-chars" [24]="--no-shell" [25]="--verbose" [26]="--quiet" [27]="--help")
    test_wrapper 'qvm-run --'
}

@test "Test 003. qvm-run: qvm-run -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-run -- '
}

@test "Test 004. qvm-run: qvm-run -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-run -- -'
}

@test "Test 005. qvm-run: qvm-run -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-run -h'
}

@test "Test 006. qvm-run: qvm-run --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-run --h'
}

@test "Test 007. qvm-run: qvm-run run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-run run'
}

@test "Test 008. qvm-run: qvm-run runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-run runnin'
}

@test "Test 009. qvm-run: qvm-run running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-run running'
}

@test "Test 010. qvm-run: qvm-run running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-run running '
}

@test "Test 011. qvm-run: qvm-run \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-run "run'
}

@test "Test 012. qvm-run: qvm-run \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-run "runnin'
}

@test "Test 013. qvm-run: qvm-run \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-run "running'
}

@test "Test 014. qvm-run: qvm-run \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-run "running" '
}

@test "Test 015. qvm-run: qvm-run 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-run '\''run'
}

@test "Test 016. qvm-run: qvm-run 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-run '\''runnin'
}

@test "Test 017. qvm-run: qvm-run 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-run '\''running'
}

@test "Test 018. qvm-run: qvm-run 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-run '\''running'\'' '
}

@test "Test 019. qvm-run: qvm-run nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-run nonexistent'
}

@test "Test 020. qvm-run: qvm-run nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-run nonexistent '
}

@test "Test 021. qvm-run: qvm-run nonexistent -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--dispvm" [3]="--user" [4]="-u" [5]="--auto" [6]="--autostart" [7]="-a" [8]="--no-auto" [9]="--no-autostart" [10]="-n" [11]="--pass-io" [12]="-p" [13]="--localcmd" [14]="--gui" [15]="--no-gui" [16]="--nogui" [17]="--service" [18]="--colour-output" [19]="--color-output" [20]="--colour-stderr" [21]="--color-stderr" [22]="--no-colour-output" [23]="--no-color-output" [24]="--no-colour-stderr" [25]="--no-color-stderr" [26]="--filter-escape-chars" [27]="--no-filter-escape-chars" [28]="--no-shell" [29]="--verbose" [30]="-v" [31]="--quiet" [32]="-q" [33]="--help" [34]="-h")
    test_wrapper 'qvm-run nonexistent -'
}

@test "Test 022. qvm-run: qvm-run nonexistent --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--dispvm" [3]="--user" [4]="--auto" [5]="--autostart" [6]="--no-auto" [7]="--no-autostart" [8]="--pass-io" [9]="--localcmd" [10]="--gui" [11]="--no-gui" [12]="--nogui" [13]="--service" [14]="--colour-output" [15]="--color-output" [16]="--colour-stderr" [17]="--color-stderr" [18]="--no-colour-output" [19]="--no-color-output" [20]="--no-colour-stderr" [21]="--no-color-stderr" [22]="--filter-escape-chars" [23]="--no-filter-escape-chars" [24]="--no-shell" [25]="--verbose" [26]="--quiet" [27]="--help")
    test_wrapper 'qvm-run nonexistent --'
}

@test "Test 023. qvm-run: qvm-run nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-run nonexistent -- '
}

@test "Test 024. qvm-run: qvm-run nonexistent -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-run nonexistent -h'
}

@test "Test 025. qvm-run: qvm-run nonexistent --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-run nonexistent --h'
}

@test "Test 026. qvm-run: qvm-run --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-run --something_unknown'
}

@test "Test 027. qvm-run: qvm-run --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-run --something_unknown '
}

@test "Test 028. qvm-run: qvm-run --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-run --something_unknown='
}

@test "Test 029. qvm-run: qvm-run --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--dispvm" [3]="--user" [4]="-u" [5]="--auto" [6]="--autostart" [7]="-a" [8]="--no-auto" [9]="--no-autostart" [10]="-n" [11]="--pass-io" [12]="-p" [13]="--localcmd" [14]="--gui" [15]="--no-gui" [16]="--nogui" [17]="--service" [18]="--colour-output" [19]="--color-output" [20]="--colour-stderr" [21]="--color-stderr" [22]="--no-colour-output" [23]="--no-color-output" [24]="--no-colour-stderr" [25]="--no-color-stderr" [26]="--filter-escape-chars" [27]="--no-filter-escape-chars" [28]="--no-shell" [29]="--verbose" [30]="-v" [31]="--quiet" [32]="-q" [33]="--help" [34]="-h")
    test_wrapper 'qvm-run --something_unknown -'
}

@test "Test 030. qvm-run: qvm-run --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--dispvm" [3]="--user" [4]="--auto" [5]="--autostart" [6]="--no-auto" [7]="--no-autostart" [8]="--pass-io" [9]="--localcmd" [10]="--gui" [11]="--no-gui" [12]="--nogui" [13]="--service" [14]="--colour-output" [15]="--color-output" [16]="--colour-stderr" [17]="--color-stderr" [18]="--no-colour-output" [19]="--no-color-output" [20]="--no-colour-stderr" [21]="--no-color-stderr" [22]="--filter-escape-chars" [23]="--no-filter-escape-chars" [24]="--no-shell" [25]="--verbose" [26]="--quiet" [27]="--help")
    test_wrapper 'qvm-run --something_unknown --'
}

@test "Test 031. qvm-run: qvm-run --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-run --something_unknown -- '
}

@test "Test 032. qvm-run: qvm-run --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-run --something_unknown -h'
}

@test "Test 033. qvm-run: qvm-run --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-run --something_unknown --h'
}

