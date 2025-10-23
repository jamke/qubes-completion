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

@test "Test 000. qubes-vm-update: qubes-vm-update " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update '
}

@test "Test 001. qubes-vm-update: qubes-vm-update -" {
    EXPECTED_COMPREPLY=([0]="--max-concurrency" [1]="-x" [2]="--dry-run" [3]="--signal-no-updates" [4]="--apply-to-sys" [5]="--restart" [6]="-r" [7]="--apply-to-all" [8]="-R" [9]="--no-apply" [10]="--force-update" [11]="--update-if-stale" [12]="--update-if-available" [13]="--skip" [14]="--targets" [15]="--templates" [16]="-T" [17]="--standalones" [18]="-S" [19]="--apps" [20]="-A" [21]="--all" [22]="--log" [23]="--no-refresh" [24]="--force-upgrade" [25]="-f" [26]="--no-cleanup" [27]="--leave-obsolete" [28]="--show-output" [29]="--no-progress" [30]="--verbose" [31]="-v" [32]="--quiet" [33]="-q" [34]="--help" [35]="-h")
    test_wrapper 'qubes-vm-update -'
}

@test "Test 002. qubes-vm-update: qubes-vm-update --" {
    EXPECTED_COMPREPLY=([0]="--max-concurrency" [1]="--dry-run" [2]="--signal-no-updates" [3]="--apply-to-sys" [4]="--restart" [5]="--apply-to-all" [6]="--no-apply" [7]="--force-update" [8]="--update-if-stale" [9]="--update-if-available" [10]="--skip" [11]="--targets" [12]="--templates" [13]="--standalones" [14]="--apps" [15]="--all" [16]="--log" [17]="--no-refresh" [18]="--force-upgrade" [19]="--no-cleanup" [20]="--leave-obsolete" [21]="--show-output" [22]="--no-progress" [23]="--verbose" [24]="--quiet" [25]="--help")
    test_wrapper 'qubes-vm-update --'
}

@test "Test 003. qubes-vm-update: qubes-vm-update -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update -- '
}

@test "Test 004. qubes-vm-update: qubes-vm-update -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update -- -'
}

@test "Test 005. qubes-vm-update: qubes-vm-update -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-vm-update -h'
}

@test "Test 006. qubes-vm-update: qubes-vm-update --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-vm-update --h'
}

@test "Test 007. qubes-vm-update: qubes-vm-update run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update run'
}

@test "Test 008. qubes-vm-update: qubes-vm-update runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update runnin'
}

@test "Test 009. qubes-vm-update: qubes-vm-update running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update running'
}

@test "Test 010. qubes-vm-update: qubes-vm-update running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update running '
}

@test "Test 011. qubes-vm-update: qubes-vm-update \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update "run'
}

@test "Test 012. qubes-vm-update: qubes-vm-update \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update "runnin'
}

@test "Test 013. qubes-vm-update: qubes-vm-update \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update "running'
}

@test "Test 014. qubes-vm-update: qubes-vm-update \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update "running" '
}

@test "Test 015. qubes-vm-update: qubes-vm-update 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update '\''run'
}

@test "Test 016. qubes-vm-update: qubes-vm-update 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update '\''runnin'
}

@test "Test 017. qubes-vm-update: qubes-vm-update 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update '\''running'
}

@test "Test 018. qubes-vm-update: qubes-vm-update 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update '\''running'\'' '
}

@test "Test 019. qubes-vm-update: qubes-vm-update nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update nonexistent'
}

@test "Test 020. qubes-vm-update: qubes-vm-update nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update nonexistent '
}

@test "Test 021. qubes-vm-update: qubes-vm-update nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update nonexistent -'
}

@test "Test 022. qubes-vm-update: qubes-vm-update nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update nonexistent --'
}

@test "Test 023. qubes-vm-update: qubes-vm-update nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update nonexistent -- '
}

@test "Test 024. qubes-vm-update: qubes-vm-update nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update nonexistent -h'
}

@test "Test 025. qubes-vm-update: qubes-vm-update nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update nonexistent --h'
}

@test "Test 026. qubes-vm-update: qubes-vm-update --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update --something_unknown'
}

@test "Test 027. qubes-vm-update: qubes-vm-update --something_unknown " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update --something_unknown '
}

@test "Test 028. qubes-vm-update: qubes-vm-update --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update --something_unknown='
}

@test "Test 029. qubes-vm-update: qubes-vm-update --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--max-concurrency" [1]="-x" [2]="--dry-run" [3]="--signal-no-updates" [4]="--apply-to-sys" [5]="--restart" [6]="-r" [7]="--apply-to-all" [8]="-R" [9]="--no-apply" [10]="--force-update" [11]="--update-if-stale" [12]="--update-if-available" [13]="--skip" [14]="--targets" [15]="--templates" [16]="-T" [17]="--standalones" [18]="-S" [19]="--apps" [20]="-A" [21]="--all" [22]="--log" [23]="--no-refresh" [24]="--force-upgrade" [25]="-f" [26]="--no-cleanup" [27]="--leave-obsolete" [28]="--show-output" [29]="--no-progress" [30]="--verbose" [31]="-v" [32]="--quiet" [33]="-q" [34]="--help" [35]="-h")
    test_wrapper 'qubes-vm-update --something_unknown -'
}

@test "Test 030. qubes-vm-update: qubes-vm-update --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--max-concurrency" [1]="--dry-run" [2]="--signal-no-updates" [3]="--apply-to-sys" [4]="--restart" [5]="--apply-to-all" [6]="--no-apply" [7]="--force-update" [8]="--update-if-stale" [9]="--update-if-available" [10]="--skip" [11]="--targets" [12]="--templates" [13]="--standalones" [14]="--apps" [15]="--all" [16]="--log" [17]="--no-refresh" [18]="--force-upgrade" [19]="--no-cleanup" [20]="--leave-obsolete" [21]="--show-output" [22]="--no-progress" [23]="--verbose" [24]="--quiet" [25]="--help")
    test_wrapper 'qubes-vm-update --something_unknown --'
}

@test "Test 031. qubes-vm-update: qubes-vm-update --something_unknown -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update --something_unknown -- '
}

@test "Test 032. qubes-vm-update: qubes-vm-update --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-vm-update --something_unknown -h'
}

@test "Test 033. qubes-vm-update: qubes-vm-update --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-vm-update --something_unknown --h'
}

