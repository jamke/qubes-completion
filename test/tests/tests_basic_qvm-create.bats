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

@test "Test 000. qvm-create: qvm-create " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create '
}

@test "Test 001. qvm-create: qvm-create -" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="-C" [2]="--property" [3]="-P" [4]="--pool" [5]="-p" [6]="--template" [7]="-t" [8]="--label" [9]="-l" [10]="--root-copy-from" [11]="-r" [12]="--root-move-from" [13]="-R" [14]="--standalone" [15]="--disp" [16]="--help-classes" [17]="--force-root" [18]="--verbose" [19]="-v" [20]="--quiet" [21]="-q" [22]="--help" [23]="-h")
    test_wrapper 'qvm-create -'
}

@test "Test 002. qvm-create: qvm-create --" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="--property" [2]="--pool" [3]="--template" [4]="--label" [5]="--root-copy-from" [6]="--root-move-from" [7]="--standalone" [8]="--disp" [9]="--help-classes" [10]="--force-root" [11]="--verbose" [12]="--quiet" [13]="--help")
    test_wrapper 'qvm-create --'
}

@test "Test 003. qvm-create: qvm-create -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create -- '
}

@test "Test 004. qvm-create: qvm-create -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create -- -'
}

@test "Test 005. qvm-create: qvm-create -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-create -h'
}

@test "Test 006. qvm-create: qvm-create --h" {
    EXPECTED_COMPREPLY=([0]="--help-classes" [1]="--help")
    test_wrapper 'qvm-create --h'
}

@test "Test 007. qvm-create: qvm-create run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create run'
}

@test "Test 008. qvm-create: qvm-create runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create runnin'
}

@test "Test 009. qvm-create: qvm-create running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create running'
}

@test "Test 010. qvm-create: qvm-create running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create running '
}

@test "Test 011. qvm-create: qvm-create \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create "run'
}

@test "Test 012. qvm-create: qvm-create \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create "runnin'
}

@test "Test 013. qvm-create: qvm-create \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create "running'
}

@test "Test 014. qvm-create: qvm-create \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create "running" '
}

@test "Test 015. qvm-create: qvm-create 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create '\''run'
}

@test "Test 016. qvm-create: qvm-create 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create '\''runnin'
}

@test "Test 017. qvm-create: qvm-create 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create '\''running'
}

@test "Test 018. qvm-create: qvm-create 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create '\''running'\'' '
}

@test "Test 019. qvm-create: qvm-create nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent'
}

@test "Test 020. qvm-create: qvm-create nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent '
}

@test "Test 021. qvm-create: qvm-create nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent -'
}

@test "Test 022. qvm-create: qvm-create nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent --'
}

@test "Test 023. qvm-create: qvm-create nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent -- '
}

@test "Test 024. qvm-create: qvm-create nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent -h'
}

@test "Test 025. qvm-create: qvm-create nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create nonexistent --h'
}

@test "Test 026. qvm-create: qvm-create --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create --something_unknown'
}

@test "Test 027. qvm-create: qvm-create --something_unknown " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create --something_unknown '
}

@test "Test 028. qvm-create: qvm-create --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create --something_unknown='
}

@test "Test 029. qvm-create: qvm-create --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="-C" [2]="--property" [3]="-P" [4]="--pool" [5]="-p" [6]="--template" [7]="-t" [8]="--label" [9]="-l" [10]="--root-copy-from" [11]="-r" [12]="--root-move-from" [13]="-R" [14]="--standalone" [15]="--disp" [16]="--help-classes" [17]="--force-root" [18]="--verbose" [19]="-v" [20]="--quiet" [21]="-q" [22]="--help" [23]="-h")
    test_wrapper 'qvm-create --something_unknown -'
}

@test "Test 030. qvm-create: qvm-create --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--class" [1]="--property" [2]="--pool" [3]="--template" [4]="--label" [5]="--root-copy-from" [6]="--root-move-from" [7]="--standalone" [8]="--disp" [9]="--help-classes" [10]="--force-root" [11]="--verbose" [12]="--quiet" [13]="--help")
    test_wrapper 'qvm-create --something_unknown --'
}

@test "Test 031. qvm-create: qvm-create --something_unknown -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-create --something_unknown -- '
}

@test "Test 032. qvm-create: qvm-create --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-create --something_unknown -h'
}

@test "Test 033. qvm-create: qvm-create --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help-classes" [1]="--help")
    test_wrapper 'qvm-create --something_unknown --h'
}

