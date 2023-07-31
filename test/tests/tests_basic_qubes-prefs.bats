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

@test "Test 000. qubes-prefs: qubes-prefs " {
    EXPECTED_COMPREPLY=([0]="check_updates_vm" [1]="clockvm" [2]="default_audiovm" [3]="default_dispvm" [4]="default_guivm" [5]="default_netvm" [6]="default_template" [7]="management_dispvm" [8]="updatevm" [9]="default_pool" [10]="default_pool_kernel" [11]="default_pool_private" [12]="default_pool_root" [13]="default_pool_volatile" [14]="default_kernel" [15]="default_qrexec_timeout" [16]="default_shutdown_timeout" [17]="stats_interval")
    test_wrapper 'qubes-prefs '
}

@test "Test 001. qubes-prefs: qubes-prefs -" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--help-properties" [2]="--hide-default" [3]="--verbose" [4]="-v" [5]="--quiet" [6]="-q" [7]="--help" [8]="-h")
    test_wrapper 'qubes-prefs -'
}

@test "Test 002. qubes-prefs: qubes-prefs --" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--help-properties" [2]="--hide-default" [3]="--verbose" [4]="--quiet" [5]="--help")
    test_wrapper 'qubes-prefs --'
}

@test "Test 003. qubes-prefs: qubes-prefs -- " {
    EXPECTED_COMPREPLY=([0]="check_updates_vm" [1]="clockvm" [2]="default_audiovm" [3]="default_dispvm" [4]="default_guivm" [5]="default_netvm" [6]="default_template" [7]="management_dispvm" [8]="updatevm" [9]="default_pool" [10]="default_pool_kernel" [11]="default_pool_private" [12]="default_pool_root" [13]="default_pool_volatile" [14]="default_kernel" [15]="default_qrexec_timeout" [16]="default_shutdown_timeout" [17]="stats_interval")
    test_wrapper 'qubes-prefs -- '
}

@test "Test 004. qubes-prefs: qubes-prefs -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs -- -'
}

@test "Test 005. qubes-prefs: qubes-prefs -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-prefs -h'
}

@test "Test 006. qubes-prefs: qubes-prefs --h" {
    EXPECTED_COMPREPLY=([0]="--help-properties" [1]="--hide-default" [2]="--help")
    test_wrapper 'qubes-prefs --h'
}

@test "Test 007. qubes-prefs: qubes-prefs run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs run'
}

@test "Test 008. qubes-prefs: qubes-prefs runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs runnin'
}

@test "Test 009. qubes-prefs: qubes-prefs running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs running'
}

@test "Test 010. qubes-prefs: qubes-prefs running " {
    EXPECTED_COMPREPLY=([0]="--default")
    test_wrapper 'qubes-prefs running '
}

@test "Test 011. qubes-prefs: qubes-prefs \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs "run'
}

@test "Test 012. qubes-prefs: qubes-prefs \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs "runnin'
}

@test "Test 013. qubes-prefs: qubes-prefs \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs "running'
}

@test "Test 014. qubes-prefs: qubes-prefs \"running\" " {
    EXPECTED_COMPREPLY=([0]="--default")
    test_wrapper 'qubes-prefs "running" '
}

@test "Test 015. qubes-prefs: qubes-prefs 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs '\''run'
}

@test "Test 016. qubes-prefs: qubes-prefs 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs '\''runnin'
}

@test "Test 017. qubes-prefs: qubes-prefs 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs '\''running'
}

@test "Test 018. qubes-prefs: qubes-prefs 'running' " {
    EXPECTED_COMPREPLY=([0]="--default")
    test_wrapper 'qubes-prefs '\''running'\'' '
}

@test "Test 019. qubes-prefs: qubes-prefs nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs nonexistent'
}

@test "Test 020. qubes-prefs: qubes-prefs nonexistent " {
    EXPECTED_COMPREPLY=([0]="--default")
    test_wrapper 'qubes-prefs nonexistent '
}

@test "Test 021. qubes-prefs: qubes-prefs nonexistent -" {
    EXPECTED_COMPREPLY=([0]="--default")
    test_wrapper 'qubes-prefs nonexistent -'
}

@test "Test 022. qubes-prefs: qubes-prefs nonexistent --" {
    EXPECTED_COMPREPLY=([0]="--default")
    test_wrapper 'qubes-prefs nonexistent --'
}

@test "Test 023. qubes-prefs: qubes-prefs nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="--default")
    test_wrapper 'qubes-prefs nonexistent -- '
}

@test "Test 024. qubes-prefs: qubes-prefs nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs nonexistent -h'
}

@test "Test 025. qubes-prefs: qubes-prefs nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs nonexistent --h'
}

@test "Test 026. qubes-prefs: qubes-prefs --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs --something_unknown'
}

@test "Test 027. qubes-prefs: qubes-prefs --something_unknown " {
    EXPECTED_COMPREPLY=([0]="check_updates_vm" [1]="clockvm" [2]="default_audiovm" [3]="default_dispvm" [4]="default_guivm" [5]="default_netvm" [6]="default_template" [7]="management_dispvm" [8]="updatevm" [9]="default_pool" [10]="default_pool_kernel" [11]="default_pool_private" [12]="default_pool_root" [13]="default_pool_volatile" [14]="default_kernel" [15]="default_qrexec_timeout" [16]="default_shutdown_timeout" [17]="stats_interval")
    test_wrapper 'qubes-prefs --something_unknown '
}

@test "Test 028. qubes-prefs: qubes-prefs --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prefs --something_unknown='
}

@test "Test 029. qubes-prefs: qubes-prefs --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--help-properties" [2]="--hide-default" [3]="--verbose" [4]="-v" [5]="--quiet" [6]="-q" [7]="--help" [8]="-h")
    test_wrapper 'qubes-prefs --something_unknown -'
}

@test "Test 030. qubes-prefs: qubes-prefs --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--help-properties" [2]="--hide-default" [3]="--verbose" [4]="--quiet" [5]="--help")
    test_wrapper 'qubes-prefs --something_unknown --'
}

@test "Test 031. qubes-prefs: qubes-prefs --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="check_updates_vm" [1]="clockvm" [2]="default_audiovm" [3]="default_dispvm" [4]="default_guivm" [5]="default_netvm" [6]="default_template" [7]="management_dispvm" [8]="updatevm" [9]="default_pool" [10]="default_pool_kernel" [11]="default_pool_private" [12]="default_pool_root" [13]="default_pool_volatile" [14]="default_kernel" [15]="default_qrexec_timeout" [16]="default_shutdown_timeout" [17]="stats_interval")
    test_wrapper 'qubes-prefs --something_unknown -- '
}

@test "Test 032. qubes-prefs: qubes-prefs --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-prefs --something_unknown -h'
}

@test "Test 033. qubes-prefs: qubes-prefs --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help-properties" [1]="--hide-default" [2]="--help")
    test_wrapper 'qubes-prefs --something_unknown --h'
}

