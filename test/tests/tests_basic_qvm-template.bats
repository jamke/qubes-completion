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

@test "Test 000. qvm-template: qvm-template " {
    EXPECTED_COMPREPLY=([0]="install" [1]="reinstall" [2]="downgrade" [3]="upgrade" [4]="download" [5]="list" [6]="info" [7]="search" [8]="remove" [9]="purge" [10]="clean" [11]="repolist" [12]="migrate-from-rpmdb")
    test_wrapper 'qvm-template '
}

@test "Test 001. qvm-template: qvm-template -" {
    EXPECTED_COMPREPLY=([0]="--refresh" [1]="--keep-cache" [2]="--yes" [3]="--repo-files" [4]="--keyring" [5]="--updatevm" [6]="--enablerepo" [7]="--disablerepo" [8]="--repoid" [9]="--releasever" [10]="--cachedir" [11]="--verbose" [12]="-v" [13]="--quiet" [14]="-q" [15]="--help" [16]="-h")
    test_wrapper 'qvm-template -'
}

@test "Test 002. qvm-template: qvm-template --" {
    EXPECTED_COMPREPLY=([0]="--refresh" [1]="--keep-cache" [2]="--yes" [3]="--repo-files" [4]="--keyring" [5]="--updatevm" [6]="--enablerepo" [7]="--disablerepo" [8]="--repoid" [9]="--releasever" [10]="--cachedir" [11]="--verbose" [12]="--quiet" [13]="--help")
    test_wrapper 'qvm-template --'
}

@test "Test 003. qvm-template: qvm-template -- " {
    EXPECTED_COMPREPLY=([0]="install" [1]="reinstall" [2]="downgrade" [3]="upgrade" [4]="download" [5]="list" [6]="info" [7]="search" [8]="remove" [9]="purge" [10]="clean" [11]="repolist" [12]="migrate-from-rpmdb")
    test_wrapper 'qvm-template -- '
}

@test "Test 004. qvm-template: qvm-template -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template -- -'
}

@test "Test 005. qvm-template: qvm-template -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-template -h'
}

@test "Test 006. qvm-template: qvm-template --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-template --h'
}

@test "Test 007. qvm-template: qvm-template run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template run'
}

@test "Test 008. qvm-template: qvm-template runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template runnin'
}

@test "Test 009. qvm-template: qvm-template running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template running'
}

@test "Test 010. qvm-template: qvm-template running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template running '
}

@test "Test 011. qvm-template: qvm-template \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template "run'
}

@test "Test 012. qvm-template: qvm-template \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template "runnin'
}

@test "Test 013. qvm-template: qvm-template \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template "running'
}

@test "Test 014. qvm-template: qvm-template \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template "running" '
}

@test "Test 015. qvm-template: qvm-template 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template '\''run'
}

@test "Test 016. qvm-template: qvm-template 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template '\''runnin'
}

@test "Test 017. qvm-template: qvm-template 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template '\''running'
}

@test "Test 018. qvm-template: qvm-template 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template '\''running'\'' '
}

@test "Test 019. qvm-template: qvm-template nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template nonexistent'
}

@test "Test 020. qvm-template: qvm-template nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template nonexistent '
}

@test "Test 021. qvm-template: qvm-template nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template nonexistent -'
}

@test "Test 022. qvm-template: qvm-template nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template nonexistent --'
}

@test "Test 023. qvm-template: qvm-template nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template nonexistent -- '
}

@test "Test 024. qvm-template: qvm-template nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template nonexistent -h'
}

@test "Test 025. qvm-template: qvm-template nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template nonexistent --h'
}

@test "Test 026. qvm-template: qvm-template --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template --something_unknown'
}

@test "Test 027. qvm-template: qvm-template --something_unknown " {
    EXPECTED_COMPREPLY=([0]="install" [1]="reinstall" [2]="downgrade" [3]="upgrade" [4]="download" [5]="list" [6]="info" [7]="search" [8]="remove" [9]="purge" [10]="clean" [11]="repolist" [12]="migrate-from-rpmdb")
    test_wrapper 'qvm-template --something_unknown '
}

@test "Test 028. qvm-template: qvm-template --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-template --something_unknown='
}

@test "Test 029. qvm-template: qvm-template --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--refresh" [1]="--keep-cache" [2]="--yes" [3]="--repo-files" [4]="--keyring" [5]="--updatevm" [6]="--enablerepo" [7]="--disablerepo" [8]="--repoid" [9]="--releasever" [10]="--cachedir" [11]="--verbose" [12]="-v" [13]="--quiet" [14]="-q" [15]="--help" [16]="-h")
    test_wrapper 'qvm-template --something_unknown -'
}

@test "Test 030. qvm-template: qvm-template --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--refresh" [1]="--keep-cache" [2]="--yes" [3]="--repo-files" [4]="--keyring" [5]="--updatevm" [6]="--enablerepo" [7]="--disablerepo" [8]="--repoid" [9]="--releasever" [10]="--cachedir" [11]="--verbose" [12]="--quiet" [13]="--help")
    test_wrapper 'qvm-template --something_unknown --'
}

@test "Test 031. qvm-template: qvm-template --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="install" [1]="reinstall" [2]="downgrade" [3]="upgrade" [4]="download" [5]="list" [6]="info" [7]="search" [8]="remove" [9]="purge" [10]="clean" [11]="repolist" [12]="migrate-from-rpmdb")
    test_wrapper 'qvm-template --something_unknown -- '
}

@test "Test 032. qvm-template: qvm-template --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-template --something_unknown -h'
}

@test "Test 033. qvm-template: qvm-template --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-template --something_unknown --h'
}

