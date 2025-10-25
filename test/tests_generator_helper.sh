#!/bin/bash

function tests_generator_init() {

    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"

    # shellcheck source=tests_common.sh
    source "${script_dir}/tests_common.sh"

    HEADER_FOR_TESTS="${script_dir}/header_for_tests.bats"
    RESULT_OUTPUT_FILEPATH="default_generated_test_filename.txt"
    TEST_INDEX=0
}

function tests_setup_new_output() {

    local tests_name="${1}"

    RESULT_OUTPUT_FILEPATH="tests/tests_${tests_name}.bats"

    (( TEST_INDEX = 0 ))

    cat "${HEADER_FOR_TESTS}" > "${RESULT_OUTPUT_FILEPATH}"
}


function tests_create_test_and_save() {

    local test_command_line="${1}"

    local test_name
    test_name="$(printf "%03d" "${TEST_INDEX}")"
    create_test "$test_name" "${test_command_line}" >> "${RESULT_OUTPUT_FILEPATH}"
    (( TEST_INDEX++ ))
}


function tests_create_all_basic_tests_and_save() {

    local command="${1}"

    tests_setup_new_output "basic_${command}"

    # cSpell:disable

    # command itself
    tests_create_test_and_save "${command} "

    # flags
    tests_create_test_and_save "${command} -"
    tests_create_test_and_save "${command} --"
    tests_create_test_and_save "${command} -- "
    tests_create_test_and_save "${command} -- -"
    tests_create_test_and_save "${command} -h"
    tests_create_test_and_save "${command} --h"

    # qube name with optional quotes
    tests_create_test_and_save "${command} run"
    tests_create_test_and_save "${command} runnin"
    tests_create_test_and_save "${command} running"
    tests_create_test_and_save "${command} running "

    tests_create_test_and_save "${command} \"run"
    tests_create_test_and_save "${command} \"runnin"
    tests_create_test_and_save "${command} \"running"
    tests_create_test_and_save "${command} \"running\" "

    tests_create_test_and_save "${command} 'run"
    tests_create_test_and_save "${command} 'runnin"
    tests_create_test_and_save "${command} 'running"
    tests_create_test_and_save "${command} 'running' "

    # invalid argument
    tests_create_test_and_save "${command} nonexistent"
    tests_create_test_and_save "${command} nonexistent "
    tests_create_test_and_save "${command} nonexistent -"
    tests_create_test_and_save "${command} nonexistent --"
    tests_create_test_and_save "${command} nonexistent -- "
    tests_create_test_and_save "${command} nonexistent -h"
    tests_create_test_and_save "${command} nonexistent --h"

    # invalid flag
    tests_create_test_and_save "${command} --something_unknown"
    tests_create_test_and_save "${command} --something_unknown "
    tests_create_test_and_save "${command} --something_unknown="
    tests_create_test_and_save "${command} --something_unknown -"
    tests_create_test_and_save "${command} --something_unknown --"
    tests_create_test_and_save "${command} --something_unknown -- "
    tests_create_test_and_save "${command} --something_unknown -h"
    tests_create_test_and_save "${command} --something_unknown --h"

    # cSpell:enable
}

# ------------------------------------------

