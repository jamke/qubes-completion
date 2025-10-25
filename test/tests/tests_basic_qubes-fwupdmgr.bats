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

@test "Test 000. qubes-fwupdmgr: qubes-fwupdmgr " {
    EXPECTED_COMPREPLY=([0]="get-devices" [1]="get-updates" [2]="refresh" [3]="update" [4]="update-heads" [5]="downgrade" [6]="clean")
    test_wrapper 'qubes-fwupdmgr '
}

@test "Test 001. qubes-fwupdmgr: qubes-fwupdmgr -" {
    EXPECTED_COMPREPLY=([0]="-h" [1]="--help")
    test_wrapper 'qubes-fwupdmgr -'
}

@test "Test 002. qubes-fwupdmgr: qubes-fwupdmgr --" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-fwupdmgr --'
}

@test "Test 003. qubes-fwupdmgr: qubes-fwupdmgr -- " {
    EXPECTED_COMPREPLY=([0]="get-devices" [1]="get-updates" [2]="refresh" [3]="update" [4]="update-heads" [5]="downgrade" [6]="clean")
    test_wrapper 'qubes-fwupdmgr -- '
}

@test "Test 004. qubes-fwupdmgr: qubes-fwupdmgr -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr -- -'
}

@test "Test 005. qubes-fwupdmgr: qubes-fwupdmgr -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-fwupdmgr -h'
}

@test "Test 006. qubes-fwupdmgr: qubes-fwupdmgr --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-fwupdmgr --h'
}

@test "Test 007. qubes-fwupdmgr: qubes-fwupdmgr run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr run'
}

@test "Test 008. qubes-fwupdmgr: qubes-fwupdmgr runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr runnin'
}

@test "Test 009. qubes-fwupdmgr: qubes-fwupdmgr running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr running'
}

@test "Test 010. qubes-fwupdmgr: qubes-fwupdmgr running " {
    EXPECTED_COMPREPLY=([0]="--whonix" [1]="--device" [2]="--url")
    test_wrapper 'qubes-fwupdmgr running '
}

@test "Test 011. qubes-fwupdmgr: qubes-fwupdmgr \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr "run'
}

@test "Test 012. qubes-fwupdmgr: qubes-fwupdmgr \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr "runnin'
}

@test "Test 013. qubes-fwupdmgr: qubes-fwupdmgr \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr "running'
}

@test "Test 014. qubes-fwupdmgr: qubes-fwupdmgr \"running\" " {
    EXPECTED_COMPREPLY=([0]="--whonix" [1]="--device" [2]="--url")
    test_wrapper 'qubes-fwupdmgr "running" '
}

@test "Test 015. qubes-fwupdmgr: qubes-fwupdmgr 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr '\''run'
}

@test "Test 016. qubes-fwupdmgr: qubes-fwupdmgr 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr '\''runnin'
}

@test "Test 017. qubes-fwupdmgr: qubes-fwupdmgr 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr '\''running'
}

@test "Test 018. qubes-fwupdmgr: qubes-fwupdmgr 'running' " {
    EXPECTED_COMPREPLY=([0]="--whonix" [1]="--device" [2]="--url")
    test_wrapper 'qubes-fwupdmgr '\''running'\'' '
}

@test "Test 019. qubes-fwupdmgr: qubes-fwupdmgr nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr nonexistent'
}

@test "Test 020. qubes-fwupdmgr: qubes-fwupdmgr nonexistent " {
    EXPECTED_COMPREPLY=([0]="--whonix" [1]="--device" [2]="--url")
    test_wrapper 'qubes-fwupdmgr nonexistent '
}

@test "Test 021. qubes-fwupdmgr: qubes-fwupdmgr nonexistent -" {
    EXPECTED_COMPREPLY=([0]="--whonix" [1]="--device" [2]="--url")
    test_wrapper 'qubes-fwupdmgr nonexistent -'
}

@test "Test 022. qubes-fwupdmgr: qubes-fwupdmgr nonexistent --" {
    EXPECTED_COMPREPLY=([0]="--whonix" [1]="--device" [2]="--url")
    test_wrapper 'qubes-fwupdmgr nonexistent --'
}

@test "Test 023. qubes-fwupdmgr: qubes-fwupdmgr nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="--whonix" [1]="--device" [2]="--url")
    test_wrapper 'qubes-fwupdmgr nonexistent -- '
}

@test "Test 024. qubes-fwupdmgr: qubes-fwupdmgr nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr nonexistent -h'
}

@test "Test 025. qubes-fwupdmgr: qubes-fwupdmgr nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr nonexistent --h'
}

@test "Test 026. qubes-fwupdmgr: qubes-fwupdmgr --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-fwupdmgr --something_unknown'
}

@test "Test 027. qubes-fwupdmgr: qubes-fwupdmgr --something_unknown " {
    EXPECTED_COMPREPLY=([0]="get-devices" [1]="get-updates" [2]="refresh" [3]="update" [4]="update-heads" [5]="downgrade" [6]="clean")
    test_wrapper 'qubes-fwupdmgr --something_unknown '
}

@test "Test 028. qubes-fwupdmgr: qubes-fwupdmgr --something_unknown=" {
    EXPECTED_COMPREPLY=([0]="get-devices" [1]="get-updates" [2]="refresh" [3]="update" [4]="update-heads" [5]="downgrade" [6]="clean")
    test_wrapper 'qubes-fwupdmgr --something_unknown='
}

@test "Test 029. qubes-fwupdmgr: qubes-fwupdmgr --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="-h" [1]="--help")
    test_wrapper 'qubes-fwupdmgr --something_unknown -'
}

@test "Test 030. qubes-fwupdmgr: qubes-fwupdmgr --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-fwupdmgr --something_unknown --'
}

@test "Test 031. qubes-fwupdmgr: qubes-fwupdmgr --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="get-devices" [1]="get-updates" [2]="refresh" [3]="update" [4]="update-heads" [5]="downgrade" [6]="clean")
    test_wrapper 'qubes-fwupdmgr --something_unknown -- '
}

@test "Test 032. qubes-fwupdmgr: qubes-fwupdmgr --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-fwupdmgr --something_unknown -h'
}

@test "Test 033. qubes-fwupdmgr: qubes-fwupdmgr --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-fwupdmgr --something_unknown --h'
}

