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

@test "Test 000. qvm-appmenus: qvm-appmenus " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-appmenus '
}

@test "Test 001. qvm-appmenus: qvm-appmenus -" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--init" [2]="--create" [3]="--remove" [4]="--update" [5]="--get-available" [6]="--get-whitelist" [7]="--set-whitelist" [8]="--set-default-whitelist" [9]="--get-default-whitelist" [10]="--source" [11]="--force" [12]="--i-understand-format-is-unstable" [13]="--file-field" [14]="--template" [15]="--all" [16]="--verbose" [17]="-v" [18]="--quiet" [19]="-q" [20]="--help" [21]="-h")
    test_wrapper 'qvm-appmenus -'
}

@test "Test 002. qvm-appmenus: qvm-appmenus --" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--init" [2]="--create" [3]="--remove" [4]="--update" [5]="--get-available" [6]="--get-whitelist" [7]="--set-whitelist" [8]="--set-default-whitelist" [9]="--get-default-whitelist" [10]="--source" [11]="--force" [12]="--i-understand-format-is-unstable" [13]="--file-field" [14]="--template" [15]="--all" [16]="--verbose" [17]="--quiet" [18]="--help")
    test_wrapper 'qvm-appmenus --'
}

@test "Test 003. qvm-appmenus: qvm-appmenus -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-appmenus -- '
}

@test "Test 004. qvm-appmenus: qvm-appmenus -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-appmenus -- -'
}

@test "Test 005. qvm-appmenus: qvm-appmenus -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-appmenus -h'
}

@test "Test 006. qvm-appmenus: qvm-appmenus --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-appmenus --h'
}

@test "Test 007. qvm-appmenus: qvm-appmenus run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-appmenus run'
}

@test "Test 008. qvm-appmenus: qvm-appmenus runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-appmenus runnin'
}

@test "Test 009. qvm-appmenus: qvm-appmenus running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-appmenus running'
}

@test "Test 010. qvm-appmenus: qvm-appmenus running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-appmenus running '
}

@test "Test 011. qvm-appmenus: qvm-appmenus \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-appmenus "run'
}

@test "Test 012. qvm-appmenus: qvm-appmenus \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-appmenus "runnin'
}

@test "Test 013. qvm-appmenus: qvm-appmenus \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-appmenus "running'
}

@test "Test 014. qvm-appmenus: qvm-appmenus \"running\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-appmenus "running" '
}

@test "Test 015. qvm-appmenus: qvm-appmenus 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-appmenus '\''run'
}

@test "Test 016. qvm-appmenus: qvm-appmenus 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-appmenus '\''runnin'
}

@test "Test 017. qvm-appmenus: qvm-appmenus 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-appmenus '\''running'
}

@test "Test 018. qvm-appmenus: qvm-appmenus 'running' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-appmenus '\''running'\'' '
}

@test "Test 019. qvm-appmenus: qvm-appmenus nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-appmenus nonexistent'
}

@test "Test 020. qvm-appmenus: qvm-appmenus nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-appmenus nonexistent '
}

@test "Test 021. qvm-appmenus: qvm-appmenus nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-appmenus nonexistent -'
}

@test "Test 022. qvm-appmenus: qvm-appmenus nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-appmenus nonexistent --'
}

@test "Test 023. qvm-appmenus: qvm-appmenus nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-appmenus nonexistent -- '
}

@test "Test 024. qvm-appmenus: qvm-appmenus nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-appmenus nonexistent -h'
}

@test "Test 025. qvm-appmenus: qvm-appmenus nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-appmenus nonexistent --h'
}

@test "Test 026. qvm-appmenus: qvm-appmenus --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-appmenus --something_unknown'
}

@test "Test 027. qvm-appmenus: qvm-appmenus --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-appmenus --something_unknown '
}

@test "Test 028. qvm-appmenus: qvm-appmenus --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-appmenus --something_unknown='
}

@test "Test 029. qvm-appmenus: qvm-appmenus --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--init" [2]="--create" [3]="--remove" [4]="--update" [5]="--get-available" [6]="--get-whitelist" [7]="--set-whitelist" [8]="--set-default-whitelist" [9]="--get-default-whitelist" [10]="--source" [11]="--force" [12]="--i-understand-format-is-unstable" [13]="--file-field" [14]="--template" [15]="--all" [16]="--verbose" [17]="-v" [18]="--quiet" [19]="-q" [20]="--help" [21]="-h")
    test_wrapper 'qvm-appmenus --something_unknown -'
}

@test "Test 030. qvm-appmenus: qvm-appmenus --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--init" [2]="--create" [3]="--remove" [4]="--update" [5]="--get-available" [6]="--get-whitelist" [7]="--set-whitelist" [8]="--set-default-whitelist" [9]="--get-default-whitelist" [10]="--source" [11]="--force" [12]="--i-understand-format-is-unstable" [13]="--file-field" [14]="--template" [15]="--all" [16]="--verbose" [17]="--quiet" [18]="--help")
    test_wrapper 'qvm-appmenus --something_unknown --'
}

@test "Test 031. qvm-appmenus: qvm-appmenus --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-appmenus --something_unknown -- '
}

@test "Test 032. qvm-appmenus: qvm-appmenus --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-appmenus --something_unknown -h'
}

@test "Test 033. qvm-appmenus: qvm-appmenus --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-appmenus --something_unknown --h'
}

