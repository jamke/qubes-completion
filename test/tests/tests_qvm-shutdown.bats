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

@test "Test 000. qvm-shutdown: qvm-shutdown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown '
}

@test "Test 001. qvm-shutdown: qvm-shutdown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--wait" [3]="--timeout" [4]="--force" [5]="--dry-run" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qvm-shutdown -'
}

@test "Test 002. qvm-shutdown: qvm-shutdown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--wait" [3]="--timeout" [4]="--force" [5]="--dry-run" [6]="--verbose" [7]="--quiet" [8]="--help")
    test_wrapper 'qvm-shutdown --'
}

@test "Test 003. qvm-shutdown: qvm-shutdown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown -- '
}

@test "Test 004. qvm-shutdown: qvm-shutdown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-shutdown -h'
}

@test "Test 005. qvm-shutdown: qvm-shutdown --d" {
    EXPECTED_COMPREPLY=([0]="--dry-run")
    test_wrapper 'qvm-shutdown --d'
}

@test "Test 006. qvm-shutdown: qvm-shutdown --exclude " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude '
}

@test "Test 007. qvm-shutdown: qvm-shutdown --exclude run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown --exclude run'
}

@test "Test 008. qvm-shutdown: qvm-shutdown --exclude runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude runnin'
}

@test "Test 009. qvm-shutdown: qvm-shutdown --exclude running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude running'
}

@test "Test 010. qvm-shutdown: qvm-shutdown --exclude nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown --exclude nonexistent'
}

@test "Test 011. qvm-shutdown: qvm-shutdown --exclude nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude nonexistent '
}

@test "Test 012. qvm-shutdown: qvm-shutdown --exclude=" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude='
}

@test "Test 013. qvm-shutdown: qvm-shutdown --exclude=run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown --exclude=run'
}

@test "Test 014. qvm-shutdown: qvm-shutdown --exclude=runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude=runnin'
}

@test "Test 015. qvm-shutdown: qvm-shutdown --exclude=running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude=running'
}

@test "Test 016. qvm-shutdown: qvm-shutdown --exclude=nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown --exclude=nonexistent'
}

@test "Test 017. qvm-shutdown: qvm-shutdown --exclude=nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude=nonexistent '
}

@test "Test 018. qvm-shutdown: qvm-shutdown \"--exclu" {
    EXPECTED_COMPREPLY=([0]="--exclude")
    test_wrapper 'qvm-shutdown "--exclu'
}

@test "Test 019. qvm-shutdown: qvm-shutdown \"--exclude" {
    EXPECTED_COMPREPLY=([0]="--exclude")
    test_wrapper 'qvm-shutdown "--exclude'
}

@test "Test 020. qvm-shutdown: qvm-shutdown \"--exclude=" {
    EXPECTED_COMPREPLY=([0]="--exclude=disp" [1]="--exclude=personal" [2]="--exclude=runname2" [3]="--exclude=running" [4]="--exclude=standalone3" [5]="--exclude=sys-usb" [6]="--exclude=template3")
    test_wrapper 'qvm-shutdown "--exclude='
}

@test "Test 021. qvm-shutdown: qvm-shutdown \"--exclude " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown "--exclude '
}

@test "Test 022. qvm-shutdown: qvm-shutdown \"--exclude=run" {
    EXPECTED_COMPREPLY=([0]="--exclude=runname2" [1]="--exclude=running")
    test_wrapper 'qvm-shutdown "--exclude=run'
}

@test "Test 023. qvm-shutdown: qvm-shutdown \"--exclude=running" {
    EXPECTED_COMPREPLY=([0]="--exclude=running")
    test_wrapper 'qvm-shutdown "--exclude=running'
}

@test "Test 024. qvm-shutdown: qvm-shutdown '--exclu" {
    EXPECTED_COMPREPLY=([0]="--exclude")
    test_wrapper 'qvm-shutdown '\''--exclu'
}

@test "Test 025. qvm-shutdown: qvm-shutdown '--exclude" {
    EXPECTED_COMPREPLY=([0]="--exclude")
    test_wrapper 'qvm-shutdown '\''--exclude'
}

@test "Test 026. qvm-shutdown: qvm-shutdown '--exclude=" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown '\''--exclude='
}

@test "Test 027. qvm-shutdown: qvm-shutdown '--exclude " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown '\''--exclude '
}

@test "Test 028. qvm-shutdown: qvm-shutdown '--exclude=run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown '\''--exclude=run'
}

@test "Test 029. qvm-shutdown: qvm-shutdown '--exclude=running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown '\''--exclude=running'
}

@test "Test 030. qvm-shutdown: qvm-shutdown --timeout " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown --timeout '
}

@test "Test 031. qvm-shutdown: qvm-shutdown --timeout 99" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown --timeout 99'
}

@test "Test 032. qvm-shutdown: qvm-shutdown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown '
}

@test "Test 033. qvm-shutdown: qvm-shutdown run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown run'
}

@test "Test 034. qvm-shutdown: qvm-shutdown runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown runnin'
}

@test "Test 035. qvm-shutdown: qvm-shutdown running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown running'
}

@test "Test 036. qvm-shutdown: qvm-shutdown running " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown running '
}

@test "Test 037. qvm-shutdown: qvm-shutdown nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown nonexistent'
}

@test "Test 038. qvm-shutdown: qvm-shutdown nonexistent " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown nonexistent '
}

@test "Test 039. qvm-shutdown: qvm-shutdown \"" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown "'
}

@test "Test 040. qvm-shutdown: qvm-shutdown \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown "run'
}

@test "Test 041. qvm-shutdown: qvm-shutdown \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown "runnin'
}

@test "Test 042. qvm-shutdown: qvm-shutdown \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown "nonexistent'
}

@test "Test 043. qvm-shutdown: qvm-shutdown \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown "nonexistent" '
}

@test "Test 044. qvm-shutdown: qvm-shutdown 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown '\''run'
}

@test "Test 045. qvm-shutdown: qvm-shutdown '" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown '\'''
}

@test "Test 046. qvm-shutdown: qvm-shutdown 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown '\''runnin'
}

@test "Test 047. qvm-shutdown: qvm-shutdown 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown '\''nonexistent'
}

@test "Test 048. qvm-shutdown: qvm-shutdown 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown '\''nonexistent'\'' '
}

@test "Test 049. qvm-shutdown: qvm-shutdown --exclude \"" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude "'
}

@test "Test 050. qvm-shutdown: qvm-shutdown --exclude \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown --exclude "run'
}

@test "Test 051. qvm-shutdown: qvm-shutdown --exclude \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude "runnin'
}

@test "Test 052. qvm-shutdown: qvm-shutdown --exclude \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude "running'
}

@test "Test 053. qvm-shutdown: qvm-shutdown --exclude \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown --exclude "nonexistent'
}

@test "Test 054. qvm-shutdown: qvm-shutdown --exclude \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude "nonexistent" '
}

@test "Test 055. qvm-shutdown: qvm-shutdown --exclude '" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude '\'''
}

@test "Test 056. qvm-shutdown: qvm-shutdown --exclude 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown --exclude '\''run'
}

@test "Test 057. qvm-shutdown: qvm-shutdown --exclude 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude '\''runnin'
}

@test "Test 058. qvm-shutdown: qvm-shutdown --exclude 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude '\''running'
}

@test "Test 059. qvm-shutdown: qvm-shutdown --exclude 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown --exclude '\''nonexistent'
}

@test "Test 060. qvm-shutdown: qvm-shutdown --exclude 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude '\''nonexistent'\'' '
}

@test "Test 061. qvm-shutdown: qvm-shutdown --exclude=\"" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude="'
}

@test "Test 062. qvm-shutdown: qvm-shutdown --exclude=\"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown --exclude="run'
}

@test "Test 063. qvm-shutdown: qvm-shutdown --exclude=\"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude="runnin'
}

@test "Test 064. qvm-shutdown: qvm-shutdown --exclude=\"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude="running'
}

@test "Test 065. qvm-shutdown: qvm-shutdown --exclude=\"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown --exclude="nonexistent'
}

@test "Test 066. qvm-shutdown: qvm-shutdown --exclude=\"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude="nonexistent" '
}

@test "Test 067. qvm-shutdown: qvm-shutdown --exclude='" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude='\'''
}

@test "Test 068. qvm-shutdown: qvm-shutdown --exclude='run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-shutdown --exclude='\''run'
}

@test "Test 069. qvm-shutdown: qvm-shutdown --exclude='runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude='\''runnin'
}

@test "Test 070. qvm-shutdown: qvm-shutdown --exclude='running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-shutdown --exclude='\''running'
}

@test "Test 071. qvm-shutdown: qvm-shutdown --exclude='nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown --exclude='\''nonexistent'
}

@test "Test 072. qvm-shutdown: qvm-shutdown --exclude='nonexistent' " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --exclude='\''nonexistent'\'' '
}

@test "Test 073. qvm-shutdown: qvm-shutdown --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --something_unknown '
}

@test "Test 074. qvm-shutdown: qvm-shutdown --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-shutdown --something_unknown='
}

@test "Test 075. qvm-shutdown: qvm-shutdown --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--wait" [3]="--timeout" [4]="--force" [5]="--dry-run" [6]="--verbose" [7]="-v" [8]="--quiet" [9]="-q" [10]="--help" [11]="-h")
    test_wrapper 'qvm-shutdown --something_unknown -'
}

@test "Test 076. qvm-shutdown: qvm-shutdown --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--all" [1]="--exclude" [2]="--wait" [3]="--timeout" [4]="--force" [5]="--dry-run" [6]="--verbose" [7]="--quiet" [8]="--help")
    test_wrapper 'qvm-shutdown --something_unknown --'
}

@test "Test 077. qvm-shutdown: qvm-shutdown --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="personal" [2]="runname2" [3]="running" [4]="standalone3" [5]="sys-usb" [6]="template3")
    test_wrapper 'qvm-shutdown --something_unknown -- '
}

@test "Test 078. qvm-shutdown: qvm-shutdown --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-shutdown --something_unknown -h'
}

@test "Test 079. qvm-shutdown: qvm-shutdown --something_unknown --d" {
    EXPECTED_COMPREPLY=([0]="--dry-run")
    test_wrapper 'qvm-shutdown --something_unknown --d'
}

