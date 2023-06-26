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

@test "Test 004. qvm-ls: qvm-ls -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-ls -h'
}

@test "Test 005. qvm-ls: qvm-ls --d" {
    EXPECTED_COMPREPLY=([0]="--disk")
    test_wrapper 'qvm-ls --d'
}

@test "Test 006. qvm-ls: qvm-ls --format " {
    EXPECTED_COMPREPLY=([0]="disk" [1]="full" [2]="kernel" [3]="network" [4]="simple")
    test_wrapper 'qvm-ls --format '
}

@test "Test 007. qvm-ls: qvm-ls --format f" {
    EXPECTED_COMPREPLY=([0]="full")
    test_wrapper 'qvm-ls --format f'
}

@test "Test 008. qvm-ls: qvm-ls --format nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --format nonexistent'
}

@test "Test 009. qvm-ls: qvm-ls -o " {
    EXPECTED_COMPREPLY=([0]="disk" [1]="full" [2]="kernel" [3]="network" [4]="simple")
    test_wrapper 'qvm-ls -o '
}

@test "Test 010. qvm-ls: qvm-ls -o d" {
    EXPECTED_COMPREPLY=([0]="disk")
    test_wrapper 'qvm-ls -o d'
}

@test "Test 011. qvm-ls: qvm-ls -O nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls -O nonexistent'
}

@test "Test 012. qvm-ls: qvm-ls --fields " {
    EXPECTED_COMPREPLY=([0]="NAME" [1]="CLASS" [2]="DISK" [3]="FLAGS" [4]="GATEWAY" [5]="MEMORY" [6]="PRIV-CURR" [7]="PRIV-MAX" [8]="PRIV-USED" [9]="ROOT-CURR" [10]="ROOT-MAX" [11]="ROOT-USED" [12]="STATE")
    test_wrapper 'qvm-ls --fields '
}

@test "Test 013. qvm-ls: qvm-ls --fields MEMOR" {
    EXPECTED_COMPREPLY=([0]="MEMORY")
    test_wrapper 'qvm-ls --fields MEMOR'
}

@test "Test 014. qvm-ls: qvm-ls --fields nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --fields nonexistent'
}

@test "Test 015. qvm-ls: qvm-ls -O " {
    EXPECTED_COMPREPLY=([0]="NAME" [1]="CLASS" [2]="DISK" [3]="FLAGS" [4]="GATEWAY" [5]="MEMORY" [6]="PRIV-CURR" [7]="PRIV-MAX" [8]="PRIV-USED" [9]="ROOT-CURR" [10]="ROOT-MAX" [11]="ROOT-USED" [12]="STATE")
    test_wrapper 'qvm-ls -O '
}

@test "Test 016. qvm-ls: qvm-ls -O MEMOR" {
    EXPECTED_COMPREPLY=([0]="MEMORY")
    test_wrapper 'qvm-ls -O MEMOR'
}

@test "Test 017. qvm-ls: qvm-ls -O nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls -O nonexistent'
}

@test "Test 018. qvm-ls: qvm-ls --format=" {
    EXPECTED_COMPREPLY=([0]="disk" [1]="full" [2]="kernel" [3]="network" [4]="simple")
    test_wrapper 'qvm-ls --format='
}

@test "Test 019. qvm-ls: qvm-ls --format=f" {
    EXPECTED_COMPREPLY=([0]="full")
    test_wrapper 'qvm-ls --format=f'
}

@test "Test 020. qvm-ls: qvm-ls --format=nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --format=nonexistent'
}

@test "Test 021. qvm-ls: qvm-ls --fields=" {
    EXPECTED_COMPREPLY=([0]="NAME" [1]="CLASS" [2]="DISK" [3]="FLAGS" [4]="GATEWAY" [5]="MEMORY" [6]="PRIV-CURR" [7]="PRIV-MAX" [8]="PRIV-USED" [9]="ROOT-CURR" [10]="ROOT-MAX" [11]="ROOT-USED" [12]="STATE")
    test_wrapper 'qvm-ls --fields='
}

@test "Test 022. qvm-ls: qvm-ls --fields=MEMOR" {
    EXPECTED_COMPREPLY=([0]="MEMORY")
    test_wrapper 'qvm-ls --fields=MEMOR'
}

@test "Test 023. qvm-ls: qvm-ls --fields=nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --fields=nonexistent'
}

@test "Test 024. qvm-ls: qvm-ls \"--forma" {
    EXPECTED_COMPREPLY=([0]="--format")
    test_wrapper 'qvm-ls "--forma'
}

@test "Test 025. qvm-ls: qvm-ls \"--format" {
    EXPECTED_COMPREPLY=([0]="--format")
    test_wrapper 'qvm-ls "--format'
}

@test "Test 026. qvm-ls: qvm-ls \"--format=" {
    EXPECTED_COMPREPLY=([0]="--format=disk" [1]="--format=full" [2]="--format=kernel" [3]="--format=network" [4]="--format=simple")
    test_wrapper 'qvm-ls "--format='
}

@test "Test 027. qvm-ls: qvm-ls \"--format " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls "--format '
}

@test "Test 028. qvm-ls: qvm-ls \"--format=f" {
    EXPECTED_COMPREPLY=([0]="--format=full")
    test_wrapper 'qvm-ls "--format=f'
}

@test "Test 029. qvm-ls: qvm-ls '--forma" {
    EXPECTED_COMPREPLY=([0]="--format")
    test_wrapper 'qvm-ls '\''--forma'
}

@test "Test 030. qvm-ls: qvm-ls '--format" {
    EXPECTED_COMPREPLY=([0]="--format")
    test_wrapper 'qvm-ls '\''--format'
}

@test "Test 031. qvm-ls: qvm-ls '--format=" {
    EXPECTED_COMPREPLY=([0]="disk" [1]="full" [2]="kernel" [3]="network" [4]="simple")
    test_wrapper 'qvm-ls '\''--format='
}

@test "Test 032. qvm-ls: qvm-ls '--format " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls '\''--format '
}

@test "Test 033. qvm-ls: qvm-ls '--format=f" {
    EXPECTED_COMPREPLY=([0]="full")
    test_wrapper 'qvm-ls '\''--format=f'
}

@test "Test 034. qvm-ls: qvm-ls --tags " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-ls --tags '
}

@test "Test 035. qvm-ls: qvm-ls --tags foo " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-ls --tags foo '
}

@test "Test 036. qvm-ls: qvm-ls --tags foo -" {
    EXPECTED_COMPREPLY=([0]="--help-columns" [1]="--help-formats" [2]="--all" [3]="--exclude" [4]="--format" [5]="-o" [6]="--fields" [7]="-O" [8]="--tags" [9]="--running" [10]="--paused" [11]="--halted" [12]="--raw-data" [13]="--raw-list" [14]="--tree" [15]="-t" [16]="--disk" [17]="-d" [18]="--network" [19]="-n" [20]="--kernel" [21]="-k" [22]="--spinner" [23]="--no-spinner" [24]="--verbose" [25]="-v" [26]="--quiet" [27]="-q" [28]="--help" [29]="-h")
    test_wrapper 'qvm-ls --tags foo -'
}

@test "Test 037. qvm-ls: qvm-ls --tags foo --" {
    EXPECTED_COMPREPLY=([0]="--help-columns" [1]="--help-formats" [2]="--all" [3]="--exclude" [4]="--format" [5]="--fields" [6]="--tags" [7]="--running" [8]="--paused" [9]="--halted" [10]="--raw-data" [11]="--raw-list" [12]="--tree" [13]="--disk" [14]="--network" [15]="--kernel" [16]="--spinner" [17]="--no-spinner" [18]="--verbose" [19]="--quiet" [20]="--help")
    test_wrapper 'qvm-ls --tags foo --'
}

@test "Test 038. qvm-ls: qvm-ls --tags foo bar -" {
    EXPECTED_COMPREPLY=([0]="--help-columns" [1]="--help-formats" [2]="--all" [3]="--exclude" [4]="--format" [5]="-o" [6]="--fields" [7]="-O" [8]="--tags" [9]="--running" [10]="--paused" [11]="--halted" [12]="--raw-data" [13]="--raw-list" [14]="--tree" [15]="-t" [16]="--disk" [17]="-d" [18]="--network" [19]="-n" [20]="--kernel" [21]="-k" [22]="--spinner" [23]="--no-spinner" [24]="--verbose" [25]="-v" [26]="--quiet" [27]="-q" [28]="--help" [29]="-h")
    test_wrapper 'qvm-ls --tags foo bar -'
}

@test "Test 039. qvm-ls: qvm-ls --tags foo bar --" {
    EXPECTED_COMPREPLY=([0]="--help-columns" [1]="--help-formats" [2]="--all" [3]="--exclude" [4]="--format" [5]="--fields" [6]="--tags" [7]="--running" [8]="--paused" [9]="--halted" [10]="--raw-data" [11]="--raw-list" [12]="--tree" [13]="--disk" [14]="--network" [15]="--kernel" [16]="--spinner" [17]="--no-spinner" [18]="--verbose" [19]="--quiet" [20]="--help")
    test_wrapper 'qvm-ls --tags foo bar --'
}

@test "Test 040. qvm-ls: qvm-ls --exclude \"" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-ls --exclude "'
}

@test "Test 041. qvm-ls: qvm-ls --exclude \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-ls --exclude "run'
}

@test "Test 042. qvm-ls: qvm-ls --exclude \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-ls --exclude "runnin'
}

@test "Test 043. qvm-ls: qvm-ls --exclude \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-ls --exclude "running'
}

@test "Test 044. qvm-ls: qvm-ls --exclude \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --exclude "nonexistent'
}

@test "Test 045. qvm-ls: qvm-ls --exclude \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --exclude "nonexistent" '
}

@test "Test 046. qvm-ls: qvm-ls --exclude '" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-ls --exclude '\'''
}

@test "Test 047. qvm-ls: qvm-ls --exclude 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-ls --exclude '\''run'
}

@test "Test 048. qvm-ls: qvm-ls --exclude 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-ls --exclude '\''runnin'
}

@test "Test 049. qvm-ls: qvm-ls --exclude 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-ls --exclude '\''running'
}

@test "Test 050. qvm-ls: qvm-ls --exclude 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --exclude '\''nonexistent'
}

@test "Test 051. qvm-ls: qvm-ls --exclude 'nonexistent' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --exclude '\''nonexistent'\'' '
}

@test "Test 052. qvm-ls: qvm-ls --exclude=\"" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-ls --exclude="'
}

@test "Test 053. qvm-ls: qvm-ls --exclude=\"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-ls --exclude="run'
}

@test "Test 054. qvm-ls: qvm-ls --exclude=\"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-ls --exclude="runnin'
}

@test "Test 055. qvm-ls: qvm-ls --exclude=\"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-ls --exclude="running'
}

@test "Test 056. qvm-ls: qvm-ls --exclude=\"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --exclude="nonexistent'
}

@test "Test 057. qvm-ls: qvm-ls --exclude=\"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --exclude="nonexistent" '
}

@test "Test 058. qvm-ls: qvm-ls --exclude='" {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-ls --exclude='\'''
}

@test "Test 059. qvm-ls: qvm-ls --exclude='run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-ls --exclude='\''run'
}

@test "Test 060. qvm-ls: qvm-ls --exclude='runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-ls --exclude='\''runnin'
}

@test "Test 061. qvm-ls: qvm-ls --exclude='running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-ls --exclude='\''running'
}

@test "Test 062. qvm-ls: qvm-ls --exclude='nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --exclude='\''nonexistent'
}

@test "Test 063. qvm-ls: qvm-ls --exclude='nonexistent' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-ls --exclude='\''nonexistent'\'' '
}

@test "Test 064. qvm-tags: qvm-tags --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-tags --something_unknown '
}

@test "Test 065. qvm-tags: qvm-tags --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags --something_unknown='
}

@test "Test 066. qvm-tags: qvm-tags --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="-v" [2]="--quiet" [3]="-q" [4]="--help" [5]="-h")
    test_wrapper 'qvm-tags --something_unknown -'
}

@test "Test 067. qvm-tags: qvm-tags --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="--quiet" [2]="--help")
    test_wrapper 'qvm-tags --something_unknown --'
}

@test "Test 068. qvm-tags: qvm-tags --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-tags --something_unknown -- '
}

@test "Test 069. qvm-tags: qvm-tags --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-tags --something_unknown -h'
}

@test "Test 070. qvm-tags: qvm-tags --something_unknown --d" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags --something_unknown --d'
}

