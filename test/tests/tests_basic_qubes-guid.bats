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

@test "Test 000. qubes-guid: qubes-guid " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid '
}

@test "Test 001. qubes-guid: qubes-guid -" {
    EXPECTED_COMPREPLY=([0]="--config" [1]="-C" [2]="--domid" [3]="-d" [4]="--target-domid" [5]="-t" [6]="--name" [7]="-N" [8]="--color" [9]="-c" [10]="--label" [11]="-l" [12]="--icon" [13]="-i" [14]="--qrexec-for-clipboard" [15]="-Q" [16]="--background" [17]="-n" [18]="--foreground" [19]="-f" [20]="--invisible" [21]="-I" [22]="--kill-on-connect" [23]="-K" [24]="--prop" [25]="-p" [26]="--title-name" [27]="-T" [28]="--trayicon-mode" [29]="--screensaver-name" [30]="--override-redirect" [31]="--verbose" [32]="-v" [33]="--quiet" [34]="-q" [35]="--help" [36]="-h")
    test_wrapper 'qubes-guid -'
}

@test "Test 002. qubes-guid: qubes-guid --" {
    EXPECTED_COMPREPLY=([0]="--config" [1]="--domid" [2]="--target-domid" [3]="--name" [4]="--color" [5]="--label" [6]="--icon" [7]="--qrexec-for-clipboard" [8]="--background" [9]="--foreground" [10]="--invisible" [11]="--kill-on-connect" [12]="--prop" [13]="--title-name" [14]="--trayicon-mode" [15]="--screensaver-name" [16]="--override-redirect" [17]="--verbose" [18]="--quiet" [19]="--help")
    test_wrapper 'qubes-guid --'
}

@test "Test 003. qubes-guid: qubes-guid -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid -- '
}

@test "Test 004. qubes-guid: qubes-guid -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid -- -'
}

@test "Test 005. qubes-guid: qubes-guid -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-guid -h'
}

@test "Test 006. qubes-guid: qubes-guid --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-guid --h'
}

@test "Test 007. qubes-guid: qubes-guid run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid run'
}

@test "Test 008. qubes-guid: qubes-guid runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid runnin'
}

@test "Test 009. qubes-guid: qubes-guid running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid running'
}

@test "Test 010. qubes-guid: qubes-guid running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid running '
}

@test "Test 011. qubes-guid: qubes-guid \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid "run'
}

@test "Test 012. qubes-guid: qubes-guid \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid "runnin'
}

@test "Test 013. qubes-guid: qubes-guid \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid "running'
}

@test "Test 014. qubes-guid: qubes-guid \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid "running" '
}

@test "Test 015. qubes-guid: qubes-guid 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid '\''run'
}

@test "Test 016. qubes-guid: qubes-guid 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid '\''runnin'
}

@test "Test 017. qubes-guid: qubes-guid 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid '\''running'
}

@test "Test 018. qubes-guid: qubes-guid 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid '\''running'\'' '
}

@test "Test 019. qubes-guid: qubes-guid nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid nonexistent'
}

@test "Test 020. qubes-guid: qubes-guid nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid nonexistent '
}

@test "Test 021. qubes-guid: qubes-guid nonexistent -" {
    EXPECTED_COMPREPLY=([0]="--config" [1]="-C" [2]="--domid" [3]="-d" [4]="--target-domid" [5]="-t" [6]="--name" [7]="-N" [8]="--color" [9]="-c" [10]="--label" [11]="-l" [12]="--icon" [13]="-i" [14]="--qrexec-for-clipboard" [15]="-Q" [16]="--background" [17]="-n" [18]="--foreground" [19]="-f" [20]="--invisible" [21]="-I" [22]="--kill-on-connect" [23]="-K" [24]="--prop" [25]="-p" [26]="--title-name" [27]="-T" [28]="--trayicon-mode" [29]="--screensaver-name" [30]="--override-redirect" [31]="--verbose" [32]="-v" [33]="--quiet" [34]="-q" [35]="--help" [36]="-h")
    test_wrapper 'qubes-guid nonexistent -'
}

@test "Test 022. qubes-guid: qubes-guid nonexistent --" {
    EXPECTED_COMPREPLY=([0]="--config" [1]="--domid" [2]="--target-domid" [3]="--name" [4]="--color" [5]="--label" [6]="--icon" [7]="--qrexec-for-clipboard" [8]="--background" [9]="--foreground" [10]="--invisible" [11]="--kill-on-connect" [12]="--prop" [13]="--title-name" [14]="--trayicon-mode" [15]="--screensaver-name" [16]="--override-redirect" [17]="--verbose" [18]="--quiet" [19]="--help")
    test_wrapper 'qubes-guid nonexistent --'
}

@test "Test 023. qubes-guid: qubes-guid nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid nonexistent -- '
}

@test "Test 024. qubes-guid: qubes-guid nonexistent -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-guid nonexistent -h'
}

@test "Test 025. qubes-guid: qubes-guid nonexistent --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-guid nonexistent --h'
}

@test "Test 026. qubes-guid: qubes-guid --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid --something_unknown'
}

@test "Test 027. qubes-guid: qubes-guid --something_unknown " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid --something_unknown '
}

@test "Test 028. qubes-guid: qubes-guid --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid --something_unknown='
}

@test "Test 029. qubes-guid: qubes-guid --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--config" [1]="-C" [2]="--domid" [3]="-d" [4]="--target-domid" [5]="-t" [6]="--name" [7]="-N" [8]="--color" [9]="-c" [10]="--label" [11]="-l" [12]="--icon" [13]="-i" [14]="--qrexec-for-clipboard" [15]="-Q" [16]="--background" [17]="-n" [18]="--foreground" [19]="-f" [20]="--invisible" [21]="-I" [22]="--kill-on-connect" [23]="-K" [24]="--prop" [25]="-p" [26]="--title-name" [27]="-T" [28]="--trayicon-mode" [29]="--screensaver-name" [30]="--override-redirect" [31]="--verbose" [32]="-v" [33]="--quiet" [34]="-q" [35]="--help" [36]="-h")
    test_wrapper 'qubes-guid --something_unknown -'
}

@test "Test 030. qubes-guid: qubes-guid --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--config" [1]="--domid" [2]="--target-domid" [3]="--name" [4]="--color" [5]="--label" [6]="--icon" [7]="--qrexec-for-clipboard" [8]="--background" [9]="--foreground" [10]="--invisible" [11]="--kill-on-connect" [12]="--prop" [13]="--title-name" [14]="--trayicon-mode" [15]="--screensaver-name" [16]="--override-redirect" [17]="--verbose" [18]="--quiet" [19]="--help")
    test_wrapper 'qubes-guid --something_unknown --'
}

@test "Test 031. qubes-guid: qubes-guid --something_unknown -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-guid --something_unknown -- '
}

@test "Test 032. qubes-guid: qubes-guid --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-guid --something_unknown -h'
}

@test "Test 033. qubes-guid: qubes-guid --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qubes-guid --something_unknown --h'
}

