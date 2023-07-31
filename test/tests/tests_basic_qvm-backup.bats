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

@test "Test 000. qvm-backup: qvm-backup " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup '
}

@test "Test 001. qvm-backup: qvm-backup -" {
    EXPECTED_COMPREPLY=([0]="--yes" [1]="-y" [2]="--encrypt" [3]="-e" [4]="--compress" [5]="-z" [6]="--no-compress" [7]="--profile" [8]="--save-profile" [9]="--exclude" [10]="-x" [11]="--dest-vm" [12]="-d" [13]="--passphrase-file" [14]="-p" [15]="--compress-filter" [16]="-Z" [17]="--verbose" [18]="-v" [19]="--quiet" [20]="-q" [21]="--help" [22]="-h")
    test_wrapper 'qvm-backup -'
}

@test "Test 002. qvm-backup: qvm-backup --" {
    EXPECTED_COMPREPLY=([0]="--yes" [1]="--encrypt" [2]="--compress" [3]="--no-compress" [4]="--profile" [5]="--save-profile" [6]="--exclude" [7]="--dest-vm" [8]="--passphrase-file" [9]="--compress-filter" [10]="--verbose" [11]="--quiet" [12]="--help")
    test_wrapper 'qvm-backup --'
}

@test "Test 003. qvm-backup: qvm-backup -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup -- '
}

@test "Test 004. qvm-backup: qvm-backup -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup -- -'
}

@test "Test 005. qvm-backup: qvm-backup -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-backup -h'
}

@test "Test 006. qvm-backup: qvm-backup --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-backup --h'
}

@test "Test 007. qvm-backup: qvm-backup run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup run'
}

@test "Test 008. qvm-backup: qvm-backup runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup runnin'
}

@test "Test 009. qvm-backup: qvm-backup running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup running'
}

@test "Test 010. qvm-backup: qvm-backup running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-backup running '
}

@test "Test 011. qvm-backup: qvm-backup \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup "run'
}

@test "Test 012. qvm-backup: qvm-backup \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup "runnin'
}

@test "Test 013. qvm-backup: qvm-backup \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup "running'
}

@test "Test 014. qvm-backup: qvm-backup \"running\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-backup "running" '
}

@test "Test 015. qvm-backup: qvm-backup 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup '\''run'
}

@test "Test 016. qvm-backup: qvm-backup 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup '\''runnin'
}

@test "Test 017. qvm-backup: qvm-backup 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup '\''running'
}

@test "Test 018. qvm-backup: qvm-backup 'running' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-backup '\''running'\'' '
}

@test "Test 019. qvm-backup: qvm-backup nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup nonexistent'
}

@test "Test 020. qvm-backup: qvm-backup nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-backup nonexistent '
}

@test "Test 021. qvm-backup: qvm-backup nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup nonexistent -'
}

@test "Test 022. qvm-backup: qvm-backup nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup nonexistent --'
}

@test "Test 023. qvm-backup: qvm-backup nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-backup nonexistent -- '
}

@test "Test 024. qvm-backup: qvm-backup nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup nonexistent -h'
}

@test "Test 025. qvm-backup: qvm-backup nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup nonexistent --h'
}

@test "Test 026. qvm-backup: qvm-backup --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup --something_unknown'
}

@test "Test 027. qvm-backup: qvm-backup --something_unknown " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup --something_unknown '
}

@test "Test 028. qvm-backup: qvm-backup --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup --something_unknown='
}

@test "Test 029. qvm-backup: qvm-backup --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--yes" [1]="-y" [2]="--encrypt" [3]="-e" [4]="--compress" [5]="-z" [6]="--no-compress" [7]="--profile" [8]="--save-profile" [9]="--exclude" [10]="-x" [11]="--dest-vm" [12]="-d" [13]="--passphrase-file" [14]="-p" [15]="--compress-filter" [16]="-Z" [17]="--verbose" [18]="-v" [19]="--quiet" [20]="-q" [21]="--help" [22]="-h")
    test_wrapper 'qvm-backup --something_unknown -'
}

@test "Test 030. qvm-backup: qvm-backup --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--yes" [1]="--encrypt" [2]="--compress" [3]="--no-compress" [4]="--profile" [5]="--save-profile" [6]="--exclude" [7]="--dest-vm" [8]="--passphrase-file" [9]="--compress-filter" [10]="--verbose" [11]="--quiet" [12]="--help")
    test_wrapper 'qvm-backup --something_unknown --'
}

@test "Test 031. qvm-backup: qvm-backup --something_unknown -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup --something_unknown -- '
}

@test "Test 032. qvm-backup: qvm-backup --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-backup --something_unknown -h'
}

@test "Test 033. qvm-backup: qvm-backup --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-backup --something_unknown --h'
}

