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

@test "Test 000. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel " {
    EXPECTED_COMPREPLY=([0]="kernel-6.11.11-1.qubes.fc37.x86_64" [1]="kernel-6.12.20-1.qubes.fc37.x86_64" [2]="kernel-6.12.40-1.qubes.fc37.x86_64")
    test_wrapper 'qubes-prepare-vm-kernel '
}

@test "Test 001. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel -" {
    EXPECTED_COMPREPLY=([0]="--modules-only" [1]="--include-devel")
    test_wrapper 'qubes-prepare-vm-kernel -'
}

@test "Test 002. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel --" {
    EXPECTED_COMPREPLY=([0]="--modules-only" [1]="--include-devel")
    test_wrapper 'qubes-prepare-vm-kernel --'
}

@test "Test 003. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel -- " {
    EXPECTED_COMPREPLY=([0]="kernel-6.11.11-1.qubes.fc37.x86_64" [1]="kernel-6.12.20-1.qubes.fc37.x86_64" [2]="kernel-6.12.40-1.qubes.fc37.x86_64")
    test_wrapper 'qubes-prepare-vm-kernel -- '
}

@test "Test 004. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel -- -'
}

@test "Test 005. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel -h'
}

@test "Test 006. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel --h'
}

@test "Test 007. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel run'
}

@test "Test 008. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel runnin'
}

@test "Test 009. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel running'
}

@test "Test 010. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel running " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel running '
}

@test "Test 011. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel \"run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel "run'
}

@test "Test 012. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel \"runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel "runnin'
}

@test "Test 013. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel \"running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel "running'
}

@test "Test 014. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel \"running\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel "running" '
}

@test "Test 015. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel 'run" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel '\''run'
}

@test "Test 016. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel 'runnin" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel '\''runnin'
}

@test "Test 017. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel 'running" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel '\''running'
}

@test "Test 018. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel 'running' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel '\''running'\'' '
}

@test "Test 019. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel nonexistent'
}

@test "Test 020. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel nonexistent '
}

@test "Test 021. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel nonexistent -'
}

@test "Test 022. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel nonexistent --'
}

@test "Test 023. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel nonexistent -- " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel nonexistent -- '
}

@test "Test 024. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel nonexistent -h'
}

@test "Test 025. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel nonexistent --h'
}

@test "Test 026. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel --something_unknown'
}

@test "Test 027. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel --something_unknown " {
    EXPECTED_COMPREPLY=([0]="kernel-6.11.11-1.qubes.fc37.x86_64" [1]="kernel-6.12.20-1.qubes.fc37.x86_64" [2]="kernel-6.12.40-1.qubes.fc37.x86_64")
    test_wrapper 'qubes-prepare-vm-kernel --something_unknown '
}

@test "Test 028. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel --something_unknown=" {
    EXPECTED_COMPREPLY=([0]="kernel-6.11.11-1.qubes.fc37.x86_64" [1]="kernel-6.12.20-1.qubes.fc37.x86_64" [2]="kernel-6.12.40-1.qubes.fc37.x86_64")
    test_wrapper 'qubes-prepare-vm-kernel --something_unknown='
}

@test "Test 029. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--modules-only" [1]="--include-devel")
    test_wrapper 'qubes-prepare-vm-kernel --something_unknown -'
}

@test "Test 030. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--modules-only" [1]="--include-devel")
    test_wrapper 'qubes-prepare-vm-kernel --something_unknown --'
}

@test "Test 031. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="kernel-6.11.11-1.qubes.fc37.x86_64" [1]="kernel-6.12.20-1.qubes.fc37.x86_64" [2]="kernel-6.12.40-1.qubes.fc37.x86_64")
    test_wrapper 'qubes-prepare-vm-kernel --something_unknown -- '
}

@test "Test 032. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel --something_unknown -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel --something_unknown -h'
}

@test "Test 033. qubes-prepare-vm-kernel: qubes-prepare-vm-kernel --something_unknown --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-prepare-vm-kernel --something_unknown --h'
}

