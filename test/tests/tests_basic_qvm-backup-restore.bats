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

@test "Test 000. qvm-backup-restore: qvm-backup-restore " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore '
}

@test "Test 001. qvm-backup-restore: qvm-backup-restore -" {
    EXPECTED_COMPREPLY=([0]="--verify-only" [1]="--skip-broken" [2]="--ignore-missing" [3]="--skip-conflicting" [4]="--rename-conflicting" [5]="--skip-dom0-home" [6]="--ignore-username-mismatch" [7]="--ignore-size-limit" [8]="--paranoid-mode" [9]="--plan-b" [10]="--location-is-service" [11]="--auto-close" [12]="--exclude" [13]="-x" [14]="--dest-vm" [15]="-d" [16]="--passphrase-file" [17]="-p" [18]="--compress-filter" [19]="-Z" [20]="--verbose" [21]="-v" [22]="--quiet" [23]="-q" [24]="--help" [25]="-h")
    test_wrapper 'qvm-backup-restore -'
}

@test "Test 002. qvm-backup-restore: qvm-backup-restore --" {
    EXPECTED_COMPREPLY=([0]="--verify-only" [1]="--skip-broken" [2]="--ignore-missing" [3]="--skip-conflicting" [4]="--rename-conflicting" [5]="--skip-dom0-home" [6]="--ignore-username-mismatch" [7]="--ignore-size-limit" [8]="--paranoid-mode" [9]="--plan-b" [10]="--location-is-service" [11]="--auto-close" [12]="--exclude" [13]="--dest-vm" [14]="--passphrase-file" [15]="--compress-filter" [16]="--verbose" [17]="--quiet" [18]="--help")
    test_wrapper 'qvm-backup-restore --'
}

@test "Test 003. qvm-backup-restore: qvm-backup-restore -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore -- '
}

@test "Test 004. qvm-backup-restore: qvm-backup-restore -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore -- -'
}

@test "Test 005. qvm-backup-restore: qvm-backup-restore -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-backup-restore -h'
}

@test "Test 006. qvm-backup-restore: qvm-backup-restore --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-backup-restore --h'
}

@test "Test 007. qvm-backup-restore: qvm-backup-restore run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore run'
}

@test "Test 008. qvm-backup-restore: qvm-backup-restore runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore runnin'
}

@test "Test 009. qvm-backup-restore: qvm-backup-restore running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore running'
}

@test "Test 010. qvm-backup-restore: qvm-backup-restore running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-backup-restore running '
}

@test "Test 011. qvm-backup-restore: qvm-backup-restore \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore "run'
}

@test "Test 012. qvm-backup-restore: qvm-backup-restore \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore "runnin'
}

@test "Test 013. qvm-backup-restore: qvm-backup-restore \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore "running'
}

@test "Test 014. qvm-backup-restore: qvm-backup-restore \"running\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-backup-restore "running" '
}

@test "Test 015. qvm-backup-restore: qvm-backup-restore 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore '\''run'
}

@test "Test 016. qvm-backup-restore: qvm-backup-restore 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore '\''runnin'
}

@test "Test 017. qvm-backup-restore: qvm-backup-restore 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore '\''running'
}

@test "Test 018. qvm-backup-restore: qvm-backup-restore 'running' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-backup-restore '\''running'\'' '
}

@test "Test 019. qvm-backup-restore: qvm-backup-restore nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore nonexistent'
}

@test "Test 020. qvm-backup-restore: qvm-backup-restore nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-backup-restore nonexistent '
}

@test "Test 021. qvm-backup-restore: qvm-backup-restore nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore nonexistent -'
}

@test "Test 022. qvm-backup-restore: qvm-backup-restore nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore nonexistent --'
}

@test "Test 023. qvm-backup-restore: qvm-backup-restore nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-backup-restore nonexistent -- '
}

@test "Test 024. qvm-backup-restore: qvm-backup-restore nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore nonexistent -h'
}

@test "Test 025. qvm-backup-restore: qvm-backup-restore nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore nonexistent --h'
}

@test "Test 026. qvm-backup-restore: qvm-backup-restore --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore --something_unknown'
}

@test "Test 027. qvm-backup-restore: qvm-backup-restore --something_unknown " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore --something_unknown '
}

@test "Test 028. qvm-backup-restore: qvm-backup-restore --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore --something_unknown='
}

@test "Test 029. qvm-backup-restore: qvm-backup-restore --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--verify-only" [1]="--skip-broken" [2]="--ignore-missing" [3]="--skip-conflicting" [4]="--rename-conflicting" [5]="--skip-dom0-home" [6]="--ignore-username-mismatch" [7]="--ignore-size-limit" [8]="--paranoid-mode" [9]="--plan-b" [10]="--location-is-service" [11]="--auto-close" [12]="--exclude" [13]="-x" [14]="--dest-vm" [15]="-d" [16]="--passphrase-file" [17]="-p" [18]="--compress-filter" [19]="-Z" [20]="--verbose" [21]="-v" [22]="--quiet" [23]="-q" [24]="--help" [25]="-h")
    test_wrapper 'qvm-backup-restore --something_unknown -'
}

@test "Test 030. qvm-backup-restore: qvm-backup-restore --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--verify-only" [1]="--skip-broken" [2]="--ignore-missing" [3]="--skip-conflicting" [4]="--rename-conflicting" [5]="--skip-dom0-home" [6]="--ignore-username-mismatch" [7]="--ignore-size-limit" [8]="--paranoid-mode" [9]="--plan-b" [10]="--location-is-service" [11]="--auto-close" [12]="--exclude" [13]="--dest-vm" [14]="--passphrase-file" [15]="--compress-filter" [16]="--verbose" [17]="--quiet" [18]="--help")
    test_wrapper 'qvm-backup-restore --something_unknown --'
}

@test "Test 031. qvm-backup-restore: qvm-backup-restore --something_unknown -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-backup-restore --something_unknown -- '
}

@test "Test 032. qvm-backup-restore: qvm-backup-restore --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-backup-restore --something_unknown -h'
}

@test "Test 033. qvm-backup-restore: qvm-backup-restore --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-backup-restore --something_unknown --h'
}

