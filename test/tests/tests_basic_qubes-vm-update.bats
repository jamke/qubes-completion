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
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--max-concurrency" [7]="-x" [8]="--dry-run" [9]="--signal-no-updates" [10]="--apply-to-sys" [11]="--restart" [12]="-r" [13]="--apply-to-all" [14]="-R" [15]="--no-apply" [16]="--force-update" [17]="--update-if-stale" [18]="--update-if-available" [19]="--skip" [20]="--targets" [21]="--templates" [22]="-T" [23]="--standalones" [24]="-S" [25]="--apps" [26]="-A" [27]="--all" [28]="--log" [29]="--no-refresh" [30]="--force-upgrade" [31]="-f" [32]="--no-cleanup" [33]="--leave-obsolete" [34]="--show-output" [35]="--no-progress")
    test_wrapper 'qubes-vm-update '
}

@test "Test 001. qubes-vm-update: qubes-vm-update -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--max-concurrency" [7]="-x" [8]="--dry-run" [9]="--signal-no-updates" [10]="--apply-to-sys" [11]="--restart" [12]="-r" [13]="--apply-to-all" [14]="-R" [15]="--no-apply" [16]="--force-update" [17]="--update-if-stale" [18]="--update-if-available" [19]="--skip" [20]="--targets" [21]="--templates" [22]="-T" [23]="--standalones" [24]="-S" [25]="--apps" [26]="-A" [27]="--all" [28]="--log" [29]="--no-refresh" [30]="--force-upgrade" [31]="-f" [32]="--no-cleanup" [33]="--leave-obsolete" [34]="--show-output" [35]="--no-progress")
    test_wrapper 'qubes-vm-update -'
}

@test "Test 002. qubes-vm-update: qubes-vm-update --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--verbose" [2]="--quiet" [3]="--max-concurrency" [4]="--dry-run" [5]="--signal-no-updates" [6]="--apply-to-sys" [7]="--restart" [8]="--apply-to-all" [9]="--no-apply" [10]="--force-update" [11]="--update-if-stale" [12]="--update-if-available" [13]="--skip" [14]="--targets" [15]="--templates" [16]="--standalones" [17]="--apps" [18]="--all" [19]="--log" [20]="--no-refresh" [21]="--force-upgrade" [22]="--no-cleanup" [23]="--leave-obsolete" [24]="--show-output" [25]="--no-progress")
    test_wrapper 'qubes-vm-update --'
}

@test "Test 003. qubes-vm-update: qubes-vm-update -- " {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--max-concurrency" [7]="-x" [8]="--dry-run" [9]="--signal-no-updates" [10]="--apply-to-sys" [11]="--restart" [12]="-r" [13]="--apply-to-all" [14]="-R" [15]="--no-apply" [16]="--force-update" [17]="--update-if-stale" [18]="--update-if-available" [19]="--skip" [20]="--targets" [21]="--templates" [22]="-T" [23]="--standalones" [24]="-S" [25]="--apps" [26]="-A" [27]="--all" [28]="--log" [29]="--no-refresh" [30]="--force-upgrade" [31]="-f" [32]="--no-cleanup" [33]="--leave-obsolete" [34]="--show-output" [35]="--no-progress")
    test_wrapper 'qubes-vm-update -- '
}

@test "Test 004. qubes-vm-update: qubes-vm-update -- -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--max-concurrency" [7]="-x" [8]="--dry-run" [9]="--signal-no-updates" [10]="--apply-to-sys" [11]="--restart" [12]="-r" [13]="--apply-to-all" [14]="-R" [15]="--no-apply" [16]="--force-update" [17]="--update-if-stale" [18]="--update-if-available" [19]="--skip" [20]="--targets" [21]="--templates" [22]="-T" [23]="--standalones" [24]="-S" [25]="--apps" [26]="-A" [27]="--all" [28]="--log" [29]="--no-refresh" [30]="--force-upgrade" [31]="-f" [32]="--no-cleanup" [33]="--leave-obsolete" [34]="--show-output" [35]="--no-progress")
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
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--max-concurrency" [7]="-x" [8]="--dry-run" [9]="--signal-no-updates" [10]="--apply-to-sys" [11]="--restart" [12]="-r" [13]="--apply-to-all" [14]="-R" [15]="--no-apply" [16]="--force-update" [17]="--update-if-stale" [18]="--update-if-available" [19]="--skip" [20]="--targets" [21]="--templates" [22]="-T" [23]="--standalones" [24]="-S" [25]="--apps" [26]="-A" [27]="--all" [28]="--log" [29]="--no-refresh" [30]="--force-upgrade" [31]="-f" [32]="--no-cleanup" [33]="--leave-obsolete" [34]="--show-output" [35]="--no-progress")
    test_wrapper 'qubes-vm-update --something_unknown '
}

@test "Test 028. qubes-vm-update: qubes-vm-update --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-vm-update --something_unknown='
}

@test "Test 029. qubes-vm-update: qubes-vm-update --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--max-concurrency" [7]="-x" [8]="--dry-run" [9]="--signal-no-updates" [10]="--apply-to-sys" [11]="--restart" [12]="-r" [13]="--apply-to-all" [14]="-R" [15]="--no-apply" [16]="--force-update" [17]="--update-if-stale" [18]="--update-if-available" [19]="--skip" [20]="--targets" [21]="--templates" [22]="-T" [23]="--standalones" [24]="-S" [25]="--apps" [26]="-A" [27]="--all" [28]="--log" [29]="--no-refresh" [30]="--force-upgrade" [31]="-f" [32]="--no-cleanup" [33]="--leave-obsolete" [34]="--show-output" [35]="--no-progress")
    test_wrapper 'qubes-vm-update --something_unknown -'
}

@test "Test 030. qubes-vm-update: qubes-vm-update --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--verbose" [2]="--quiet" [3]="--max-concurrency" [4]="--dry-run" [5]="--signal-no-updates" [6]="--apply-to-sys" [7]="--restart" [8]="--apply-to-all" [9]="--no-apply" [10]="--force-update" [11]="--update-if-stale" [12]="--update-if-available" [13]="--skip" [14]="--targets" [15]="--templates" [16]="--standalones" [17]="--apps" [18]="--all" [19]="--log" [20]="--no-refresh" [21]="--force-upgrade" [22]="--no-cleanup" [23]="--leave-obsolete" [24]="--show-output" [25]="--no-progress")
    test_wrapper 'qubes-vm-update --something_unknown --'
}

@test "Test 031. qubes-vm-update: qubes-vm-update --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--verbose" [3]="-v" [4]="--quiet" [5]="-q" [6]="--max-concurrency" [7]="-x" [8]="--dry-run" [9]="--signal-no-updates" [10]="--apply-to-sys" [11]="--restart" [12]="-r" [13]="--apply-to-all" [14]="-R" [15]="--no-apply" [16]="--force-update" [17]="--update-if-stale" [18]="--update-if-available" [19]="--skip" [20]="--targets" [21]="--templates" [22]="-T" [23]="--standalones" [24]="-S" [25]="--apps" [26]="-A" [27]="--all" [28]="--log" [29]="--no-refresh" [30]="--force-upgrade" [31]="-f" [32]="--no-cleanup" [33]="--leave-obsolete" [34]="--show-output" [35]="--no-progress")
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

