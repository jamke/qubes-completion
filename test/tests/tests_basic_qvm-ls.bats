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

@test "Test 000. qvm-ls: qvm-ls " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls '
}

@test "Test 001. qvm-ls: qvm-ls -" {
    EXPECTED_COMPREPLY=([0]="--help-columns" [1]="--help-formats" [2]="--all" [3]="--exclude" [4]="--format" [5]="-o" [6]="--fields" [7]="-O" [8]="--tags" [9]="--running" [10]="--paused" [11]="--halted" [12]="--raw-data" [13]="--raw-list" [14]="--tree" [15]="-t" [16]="--disk" [17]="-d" [18]="--network" [19]="-n" [20]="--kernel" [21]="-k" [22]="--spinner" [23]="--no-spinner" [24]="--verbose" [25]="-v" [26]="--quiet" [27]="-q" [28]="--help" [29]="-h")
    test_wrapper 'qvm-ls -'
}

@test "Test 002. qvm-ls: qvm-ls --" {
    EXPECTED_COMPREPLY=([0]="--help-columns" [1]="--help-formats" [2]="--all" [3]="--exclude" [4]="--format" [5]="--fields" [6]="--tags" [7]="--running" [8]="--paused" [9]="--halted" [10]="--raw-data" [11]="--raw-list" [12]="--tree" [13]="--disk" [14]="--network" [15]="--kernel" [16]="--spinner" [17]="--no-spinner" [18]="--verbose" [19]="--quiet" [20]="--help")
    test_wrapper 'qvm-ls --'
}

@test "Test 003. qvm-ls: qvm-ls -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls -- '
}

@test "Test 004. qvm-ls: qvm-ls -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls -- -'
}

@test "Test 005. qvm-ls: qvm-ls -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-ls -h'
}

@test "Test 006. qvm-ls: qvm-ls --h" {
    EXPECTED_COMPREPLY=([0]="--help-columns" [1]="--help-formats" [2]="--halted" [3]="--help")
    test_wrapper 'qvm-ls --h'
}

@test "Test 007. qvm-ls: qvm-ls run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls run'
}

@test "Test 008. qvm-ls: qvm-ls runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls runnin'
}

@test "Test 009. qvm-ls: qvm-ls running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls running'
}

@test "Test 010. qvm-ls: qvm-ls running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls running '
}

@test "Test 011. qvm-ls: qvm-ls \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls "run'
}

@test "Test 012. qvm-ls: qvm-ls \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls "runnin'
}

@test "Test 013. qvm-ls: qvm-ls \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls "running'
}

@test "Test 014. qvm-ls: qvm-ls \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls "running" '
}

@test "Test 015. qvm-ls: qvm-ls 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls '\''run'
}

@test "Test 016. qvm-ls: qvm-ls 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls '\''runnin'
}

@test "Test 017. qvm-ls: qvm-ls 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls '\''running'
}

@test "Test 018. qvm-ls: qvm-ls 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls '\''running'\'' '
}

@test "Test 019. qvm-ls: qvm-ls nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls nonexistent'
}

@test "Test 020. qvm-ls: qvm-ls nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls nonexistent '
}

@test "Test 021. qvm-ls: qvm-ls nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls nonexistent -'
}

@test "Test 022. qvm-ls: qvm-ls nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls nonexistent --'
}

@test "Test 023. qvm-ls: qvm-ls nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls nonexistent -- '
}

@test "Test 024. qvm-ls: qvm-ls nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls nonexistent -h'
}

@test "Test 025. qvm-ls: qvm-ls nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls nonexistent --h'
}

@test "Test 026. qvm-ls: qvm-ls --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --something_unknown'
}

@test "Test 027. qvm-ls: qvm-ls --something_unknown " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --something_unknown '
}

@test "Test 028. qvm-ls: qvm-ls --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --something_unknown='
}

@test "Test 029. qvm-ls: qvm-ls --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--help-columns" [1]="--help-formats" [2]="--all" [3]="--exclude" [4]="--format" [5]="-o" [6]="--fields" [7]="-O" [8]="--tags" [9]="--running" [10]="--paused" [11]="--halted" [12]="--raw-data" [13]="--raw-list" [14]="--tree" [15]="-t" [16]="--disk" [17]="-d" [18]="--network" [19]="-n" [20]="--kernel" [21]="-k" [22]="--spinner" [23]="--no-spinner" [24]="--verbose" [25]="-v" [26]="--quiet" [27]="-q" [28]="--help" [29]="-h")
    test_wrapper 'qvm-ls --something_unknown -'
}

@test "Test 030. qvm-ls: qvm-ls --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--help-columns" [1]="--help-formats" [2]="--all" [3]="--exclude" [4]="--format" [5]="--fields" [6]="--tags" [7]="--running" [8]="--paused" [9]="--halted" [10]="--raw-data" [11]="--raw-list" [12]="--tree" [13]="--disk" [14]="--network" [15]="--kernel" [16]="--spinner" [17]="--no-spinner" [18]="--verbose" [19]="--quiet" [20]="--help")
    test_wrapper 'qvm-ls --something_unknown --'
}

@test "Test 031. qvm-ls: qvm-ls --something_unknown -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --something_unknown -- '
}

@test "Test 032. qvm-ls: qvm-ls --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-ls --something_unknown -h'
}

@test "Test 033. qvm-ls: qvm-ls --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help-columns" [1]="--help-formats" [2]="--halted" [3]="--help")
    test_wrapper 'qvm-ls --something_unknown --h'
}

