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

@test "Test 000. qubes-update-gui: qubes-update-gui " {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--log" [3]="--max-concurrency" [4]="--signal-no-updates" [5]="--apply-to-sys" [6]="--restart" [7]="-r" [8]="--apply-to-all" [9]="-R" [10]="--no-apply" [11]="--force-update" [12]="--update-if-stale" [13]="--update-if-available" [14]="--skip" [15]="--targets" [16]="--templates" [17]="-T" [18]="--standalones" [19]="-S" [20]="--all" [21]="--dom0" [22]="--non-interactive" [23]="-n")
    test_wrapper 'qubes-update-gui '
}

@test "Test 001. qubes-update-gui: qubes-update-gui -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--log" [3]="--max-concurrency" [4]="--signal-no-updates" [5]="--apply-to-sys" [6]="--restart" [7]="-r" [8]="--apply-to-all" [9]="-R" [10]="--no-apply" [11]="--force-update" [12]="--update-if-stale" [13]="--update-if-available" [14]="--skip" [15]="--targets" [16]="--templates" [17]="-T" [18]="--standalones" [19]="-S" [20]="--all" [21]="--dom0" [22]="--non-interactive" [23]="-n")
    test_wrapper 'qubes-update-gui -'
}

@test "Test 002. qubes-update-gui: qubes-update-gui --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--log" [2]="--max-concurrency" [3]="--signal-no-updates" [4]="--apply-to-sys" [5]="--restart" [6]="--apply-to-all" [7]="--no-apply" [8]="--force-update" [9]="--update-if-stale" [10]="--update-if-available" [11]="--skip" [12]="--targets" [13]="--templates" [14]="--standalones" [15]="--all" [16]="--dom0" [17]="--non-interactive")
    test_wrapper 'qubes-update-gui --'
}

@test "Test 003. qubes-update-gui: qubes-update-gui -- " {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--log" [3]="--max-concurrency" [4]="--signal-no-updates" [5]="--apply-to-sys" [6]="--restart" [7]="-r" [8]="--apply-to-all" [9]="-R" [10]="--no-apply" [11]="--force-update" [12]="--update-if-stale" [13]="--update-if-available" [14]="--skip" [15]="--targets" [16]="--templates" [17]="-T" [18]="--standalones" [19]="-S" [20]="--all" [21]="--dom0" [22]="--non-interactive" [23]="-n")
    test_wrapper 'qubes-update-gui -- '
}

@test "Test 004. qubes-update-gui: qubes-update-gui -- -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--log" [3]="--max-concurrency" [4]="--signal-no-updates" [5]="--apply-to-sys" [6]="--restart" [7]="-r" [8]="--apply-to-all" [9]="-R" [10]="--no-apply" [11]="--force-update" [12]="--update-if-stale" [13]="--update-if-available" [14]="--skip" [15]="--targets" [16]="--templates" [17]="-T" [18]="--standalones" [19]="-S" [20]="--all" [21]="--dom0" [22]="--non-interactive" [23]="-n")
    test_wrapper 'qubes-update-gui -- -'
}

@test "Test 005. qubes-update-gui: qubes-update-gui -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-update-gui -h'
}

@test "Test 006. qubes-update-gui: qubes-update-gui --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-update-gui --h'
}

@test "Test 007. qubes-update-gui: qubes-update-gui run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui run'
}

@test "Test 008. qubes-update-gui: qubes-update-gui runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui runnin'
}

@test "Test 009. qubes-update-gui: qubes-update-gui running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui running'
}

@test "Test 010. qubes-update-gui: qubes-update-gui running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui running '
}

@test "Test 011. qubes-update-gui: qubes-update-gui \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui "run'
}

@test "Test 012. qubes-update-gui: qubes-update-gui \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui "runnin'
}

@test "Test 013. qubes-update-gui: qubes-update-gui \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui "running'
}

@test "Test 014. qubes-update-gui: qubes-update-gui \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui "running" '
}

@test "Test 015. qubes-update-gui: qubes-update-gui 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui '\''run'
}

@test "Test 016. qubes-update-gui: qubes-update-gui 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui '\''runnin'
}

@test "Test 017. qubes-update-gui: qubes-update-gui 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui '\''running'
}

@test "Test 018. qubes-update-gui: qubes-update-gui 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui '\''running'\'' '
}

@test "Test 019. qubes-update-gui: qubes-update-gui nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui nonexistent'
}

@test "Test 020. qubes-update-gui: qubes-update-gui nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui nonexistent '
}

@test "Test 021. qubes-update-gui: qubes-update-gui nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui nonexistent -'
}

@test "Test 022. qubes-update-gui: qubes-update-gui nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui nonexistent --'
}

@test "Test 023. qubes-update-gui: qubes-update-gui nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui nonexistent -- '
}

@test "Test 024. qubes-update-gui: qubes-update-gui nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui nonexistent -h'
}

@test "Test 025. qubes-update-gui: qubes-update-gui nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui nonexistent --h'
}

@test "Test 026. qubes-update-gui: qubes-update-gui --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui --something_unknown'
}

@test "Test 027. qubes-update-gui: qubes-update-gui --something_unknown " {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--log" [3]="--max-concurrency" [4]="--signal-no-updates" [5]="--apply-to-sys" [6]="--restart" [7]="-r" [8]="--apply-to-all" [9]="-R" [10]="--no-apply" [11]="--force-update" [12]="--update-if-stale" [13]="--update-if-available" [14]="--skip" [15]="--targets" [16]="--templates" [17]="-T" [18]="--standalones" [19]="-S" [20]="--all" [21]="--dom0" [22]="--non-interactive" [23]="-n")
    test_wrapper 'qubes-update-gui --something_unknown '
}

@test "Test 028. qubes-update-gui: qubes-update-gui --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-update-gui --something_unknown='
}

@test "Test 029. qubes-update-gui: qubes-update-gui --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--log" [3]="--max-concurrency" [4]="--signal-no-updates" [5]="--apply-to-sys" [6]="--restart" [7]="-r" [8]="--apply-to-all" [9]="-R" [10]="--no-apply" [11]="--force-update" [12]="--update-if-stale" [13]="--update-if-available" [14]="--skip" [15]="--targets" [16]="--templates" [17]="-T" [18]="--standalones" [19]="-S" [20]="--all" [21]="--dom0" [22]="--non-interactive" [23]="-n")
    test_wrapper 'qubes-update-gui --something_unknown -'
}

@test "Test 030. qubes-update-gui: qubes-update-gui --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--log" [2]="--max-concurrency" [3]="--signal-no-updates" [4]="--apply-to-sys" [5]="--restart" [6]="--apply-to-all" [7]="--no-apply" [8]="--force-update" [9]="--update-if-stale" [10]="--update-if-available" [11]="--skip" [12]="--targets" [13]="--templates" [14]="--standalones" [15]="--all" [16]="--dom0" [17]="--non-interactive")
    test_wrapper 'qubes-update-gui --something_unknown --'
}

@test "Test 031. qubes-update-gui: qubes-update-gui --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="--help" [1]="-h" [2]="--log" [3]="--max-concurrency" [4]="--signal-no-updates" [5]="--apply-to-sys" [6]="--restart" [7]="-r" [8]="--apply-to-all" [9]="-R" [10]="--no-apply" [11]="--force-update" [12]="--update-if-stale" [13]="--update-if-available" [14]="--skip" [15]="--targets" [16]="--templates" [17]="-T" [18]="--standalones" [19]="-S" [20]="--all" [21]="--dom0" [22]="--non-interactive" [23]="-n")
    test_wrapper 'qubes-update-gui --something_unknown -- '
}

@test "Test 032. qubes-update-gui: qubes-update-gui --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-update-gui --something_unknown -h'
}

@test "Test 033. qubes-update-gui: qubes-update-gui --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-update-gui --something_unknown --h'
}

