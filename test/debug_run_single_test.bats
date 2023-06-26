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


# @test "Test DEBUG. qvm-shutdown: qvm-shutdown \"--exclu" {
#     EXPECTED_COMPREPLY=([0]="--exclude")
#     test_wrapper 'qvm-shutdown "--exclu'
# }

# @test "Test DEBUG. qvm-shutdown: qvm-shutdown \"--exclude " {
#     EXPECTED_COMPREPLY=()
#     test_wrapper 'qvm-shutdown "--exclude '
# }

# @test "Test DEBUG" {
#     EXPECTED_COMPREPLY=()
#     test_wrapper 'qvm-shutdown a": "b:::q'
# }

# @test "Test 061. qvm-shutdown: qvm-shutdown --exclude=\"" {
#     EXPECTED_COMPREPLY=([0]="personal" [1]="runname2" [2]="running" [3]="standalone3" [4]="sys-usb" [5]="template3")
#     test_wrapper 'qvm-shutdown --exclude="'
# }

@test "Test 020. qvm-shutdown: qvm-shutdown \"--exclude" {
    EXPECTED_COMPREPLY=([0]="--exclude")
    test_wrapper 'qvm-shutdown "--exclude'
}

