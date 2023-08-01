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

@test "Test 000. qvm-tags: qvm-tags " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-tags '
}

@test "Test 001. qvm-tags: qvm-tags -" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="-v" [2]="--quiet" [3]="-q" [4]="--help" [5]="-h")
    test_wrapper 'qvm-tags -'
}

@test "Test 002. qvm-tags: qvm-tags --" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="--quiet" [2]="--help")
    test_wrapper 'qvm-tags --'
}

@test "Test 003. qvm-tags: qvm-tags -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-tags -- '
}

@test "Test 004. qvm-tags: qvm-tags -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-tags -h'
}

@test "Test 005. qvm-tags: qvm-tags --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-tags --h'
}

@test "Test 006. qvm-tags: qvm-tags list" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags list'
}

@test "Test 007. qvm-tags: qvm-tags list " {
    EXPECTED_COMPREPLY=([0]="list" [1]="set" [2]="unset" [3]="add" [4]="del")
    test_wrapper 'qvm-tags list '
}

@test "Test 008. qvm-tags: qvm-tags " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-tags '
}

@test "Test 009. qvm-tags: qvm-tags run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-tags run'
}

@test "Test 010. qvm-tags: qvm-tags runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-tags runnin'
}

@test "Test 011. qvm-tags: qvm-tags running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-tags running'
}

@test "Test 012. qvm-tags: qvm-tags running " {
    EXPECTED_COMPREPLY=([0]="list" [1]="set" [2]="unset" [3]="add" [4]="del")
    test_wrapper 'qvm-tags running '
}

@test "Test 013. qvm-tags: qvm-tags nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags nonexistent'
}

@test "Test 014. qvm-tags: qvm-tags nonexistent " {
    EXPECTED_COMPREPLY=([0]="list" [1]="set" [2]="unset" [3]="add" [4]="del")
    test_wrapper 'qvm-tags nonexistent '
}

@test "Test 015. qvm-tags: qvm-tags running list" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running list'
}

@test "Test 016. qvm-tags: qvm-tags running list " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running list '
}

@test "Test 017. qvm-tags: qvm-tags running list gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running list gui'
}

@test "Test 018. qvm-tags: qvm-tags running list guivm-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list guivm-dom0 '
}

@test "Test 019. qvm-tags: qvm-tags running list guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list guivm-dom0 created-by-dom0 '
}

@test "Test 020. qvm-tags: qvm-tags running list guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list guivm-dom0 created-by-dom0 '
}

@test "Test 021. qvm-tags: qvm-tags running list nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list nonexistent'
}

@test "Test 022. qvm-tags: qvm-tags running list nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list nonexistent '
}

@test "Test 023. qvm-tags: qvm-tags running ls" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls'
}

@test "Test 024. qvm-tags: qvm-tags running ls " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running ls '
}

@test "Test 025. qvm-tags: qvm-tags running ls gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running ls gui'
}

@test "Test 026. qvm-tags: qvm-tags running ls guivm-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls guivm-dom0 '
}

@test "Test 027. qvm-tags: qvm-tags running ls guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls guivm-dom0 created-by-dom0 '
}

@test "Test 028. qvm-tags: qvm-tags running ls guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls guivm-dom0 created-by-dom0 '
}

@test "Test 029. qvm-tags: qvm-tags running ls nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls nonexistent'
}

@test "Test 030. qvm-tags: qvm-tags running ls nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls nonexistent '
}

@test "Test 031. qvm-tags: qvm-tags running l" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running l'
}

@test "Test 032. qvm-tags: qvm-tags running l " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running l '
}

@test "Test 033. qvm-tags: qvm-tags running l gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running l gui'
}

@test "Test 034. qvm-tags: qvm-tags running l guivm-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l guivm-dom0 '
}

@test "Test 035. qvm-tags: qvm-tags running l guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l guivm-dom0 created-by-dom0 '
}

@test "Test 036. qvm-tags: qvm-tags running l guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l guivm-dom0 created-by-dom0 '
}

@test "Test 037. qvm-tags: qvm-tags running l nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l nonexistent'
}

@test "Test 038. qvm-tags: qvm-tags running l nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l nonexistent '
}

@test "Test 039. qvm-tags: qvm-tags running add" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running add'
}

@test "Test 040. qvm-tags: qvm-tags running add " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add '
}

@test "Test 041. qvm-tags: qvm-tags running add gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running add gui'
}

@test "Test 042. qvm-tags: qvm-tags running add guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add guivm-dom0 '
}

@test "Test 043. qvm-tags: qvm-tags running add guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add guivm-dom0 created-by-dom0 '
}

@test "Test 044. qvm-tags: qvm-tags running add guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add guivm-dom0 created-by-dom0 '
}

@test "Test 045. qvm-tags: qvm-tags running add nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running add nonexistent'
}

@test "Test 046. qvm-tags: qvm-tags running add nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add nonexistent '
}

@test "Test 047. qvm-tags: qvm-tags running set" {
    EXPECTED_COMPREPLY=([0]="set")
    test_wrapper 'qvm-tags running set'
}

@test "Test 048. qvm-tags: qvm-tags running set " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set '
}

@test "Test 049. qvm-tags: qvm-tags running set gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running set gui'
}

@test "Test 050. qvm-tags: qvm-tags running set guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set guivm-dom0 '
}

@test "Test 051. qvm-tags: qvm-tags running set guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set guivm-dom0 created-by-dom0 '
}

@test "Test 052. qvm-tags: qvm-tags running set guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set guivm-dom0 created-by-dom0 '
}

@test "Test 053. qvm-tags: qvm-tags running set nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running set nonexistent'
}

@test "Test 054. qvm-tags: qvm-tags running set nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set nonexistent '
}

@test "Test 055. qvm-tags: qvm-tags running a" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running a'
}

@test "Test 056. qvm-tags: qvm-tags running a " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a '
}

@test "Test 057. qvm-tags: qvm-tags running a gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running a gui'
}

@test "Test 058. qvm-tags: qvm-tags running a guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a guivm-dom0 '
}

@test "Test 059. qvm-tags: qvm-tags running a guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a guivm-dom0 created-by-dom0 '
}

@test "Test 060. qvm-tags: qvm-tags running a guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a guivm-dom0 created-by-dom0 '
}

@test "Test 061. qvm-tags: qvm-tags running a nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running a nonexistent'
}

@test "Test 062. qvm-tags: qvm-tags running a nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a nonexistent '
}

@test "Test 063. qvm-tags: qvm-tags running del" {
    EXPECTED_COMPREPLY=([0]="del")
    test_wrapper 'qvm-tags running del'
}

@test "Test 064. qvm-tags: qvm-tags running del " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del '
}

@test "Test 065. qvm-tags: qvm-tags running del gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running del gui'
}

@test "Test 066. qvm-tags: qvm-tags running del guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del guivm-dom0 '
}

@test "Test 067. qvm-tags: qvm-tags running del guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del guivm-dom0 created-by-dom0 '
}

@test "Test 068. qvm-tags: qvm-tags running del guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del guivm-dom0 created-by-dom0 '
}

@test "Test 069. qvm-tags: qvm-tags running del nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running del nonexistent'
}

@test "Test 070. qvm-tags: qvm-tags running del nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del nonexistent '
}

@test "Test 071. qvm-tags: qvm-tags running unset" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running unset'
}

@test "Test 072. qvm-tags: qvm-tags running unset " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset '
}

@test "Test 073. qvm-tags: qvm-tags running unset gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running unset gui'
}

@test "Test 074. qvm-tags: qvm-tags running unset guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset guivm-dom0 '
}

@test "Test 075. qvm-tags: qvm-tags running unset guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset guivm-dom0 created-by-dom0 '
}

@test "Test 076. qvm-tags: qvm-tags running unset guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset guivm-dom0 created-by-dom0 '
}

@test "Test 077. qvm-tags: qvm-tags running unset nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running unset nonexistent'
}

@test "Test 078. qvm-tags: qvm-tags running unset nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset nonexistent '
}

@test "Test 079. qvm-tags: qvm-tags running u" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running u'
}

@test "Test 080. qvm-tags: qvm-tags running u " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u '
}

@test "Test 081. qvm-tags: qvm-tags running u gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running u gui'
}

@test "Test 082. qvm-tags: qvm-tags running u guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u guivm-dom0 '
}

@test "Test 083. qvm-tags: qvm-tags running u guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u guivm-dom0 created-by-dom0 '
}

@test "Test 084. qvm-tags: qvm-tags running u guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u guivm-dom0 created-by-dom0 '
}

@test "Test 085. qvm-tags: qvm-tags running u nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running u nonexistent'
}

@test "Test 086. qvm-tags: qvm-tags running u nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u nonexistent '
}

@test "Test 087. qvm-tags: qvm-tags running \"list" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running "list'
}

@test "Test 088. qvm-tags: qvm-tags running \"list\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "list" '
}

@test "Test 089. qvm-tags: qvm-tags running \"list\" gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "list" gui'
}

@test "Test 090. qvm-tags: qvm-tags running \"list\" guivm-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" guivm-dom0 '
}

@test "Test 091. qvm-tags: qvm-tags running \"list\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" guivm-dom0 created-by-dom0 '
}

@test "Test 092. qvm-tags: qvm-tags running \"list\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" guivm-dom0 created-by-dom0 '
}

@test "Test 093. qvm-tags: qvm-tags running \"list\" nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" nonexistent'
}

@test "Test 094. qvm-tags: qvm-tags running \"list\" nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" nonexistent '
}

@test "Test 095. qvm-tags: qvm-tags running \"ls" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls'
}

@test "Test 096. qvm-tags: qvm-tags running \"ls\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "ls" '
}

@test "Test 097. qvm-tags: qvm-tags running \"ls\" gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "ls" gui'
}

@test "Test 098. qvm-tags: qvm-tags running \"ls\" guivm-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" guivm-dom0 '
}

@test "Test 099. qvm-tags: qvm-tags running \"ls\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" guivm-dom0 created-by-dom0 '
}

@test "Test 100. qvm-tags: qvm-tags running \"ls\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" guivm-dom0 created-by-dom0 '
}

@test "Test 101. qvm-tags: qvm-tags running \"ls\" nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" nonexistent'
}

@test "Test 102. qvm-tags: qvm-tags running \"ls\" nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" nonexistent '
}

@test "Test 103. qvm-tags: qvm-tags running \"l" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running "l'
}

@test "Test 104. qvm-tags: qvm-tags running \"l\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "l" '
}

@test "Test 105. qvm-tags: qvm-tags running \"l\" gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "l" gui'
}

@test "Test 106. qvm-tags: qvm-tags running \"l\" guivm-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" guivm-dom0 '
}

@test "Test 107. qvm-tags: qvm-tags running \"l\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" guivm-dom0 created-by-dom0 '
}

@test "Test 108. qvm-tags: qvm-tags running \"l\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" guivm-dom0 created-by-dom0 '
}

@test "Test 109. qvm-tags: qvm-tags running \"l\" nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" nonexistent'
}

@test "Test 110. qvm-tags: qvm-tags running \"l\" nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" nonexistent '
}

@test "Test 111. qvm-tags: qvm-tags running \"add" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running "add'
}

@test "Test 112. qvm-tags: qvm-tags running \"add\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "add" '
}

@test "Test 113. qvm-tags: qvm-tags running \"add\" gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "add" gui'
}

@test "Test 114. qvm-tags: qvm-tags running \"add\" guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "add" guivm-dom0 '
}

@test "Test 115. qvm-tags: qvm-tags running \"add\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "add" guivm-dom0 created-by-dom0 '
}

@test "Test 116. qvm-tags: qvm-tags running \"add\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "add" guivm-dom0 created-by-dom0 '
}

@test "Test 117. qvm-tags: qvm-tags running \"add\" nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "add" nonexistent'
}

@test "Test 118. qvm-tags: qvm-tags running \"add\" nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "add" nonexistent '
}

@test "Test 119. qvm-tags: qvm-tags running \"set" {
    EXPECTED_COMPREPLY=([0]="set")
    test_wrapper 'qvm-tags running "set'
}

@test "Test 120. qvm-tags: qvm-tags running \"set\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "set" '
}

@test "Test 121. qvm-tags: qvm-tags running \"set\" gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "set" gui'
}

@test "Test 122. qvm-tags: qvm-tags running \"set\" guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "set" guivm-dom0 '
}

@test "Test 123. qvm-tags: qvm-tags running \"set\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "set" guivm-dom0 created-by-dom0 '
}

@test "Test 124. qvm-tags: qvm-tags running \"set\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "set" guivm-dom0 created-by-dom0 '
}

@test "Test 125. qvm-tags: qvm-tags running \"set\" nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "set" nonexistent'
}

@test "Test 126. qvm-tags: qvm-tags running \"set\" nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "set" nonexistent '
}

@test "Test 127. qvm-tags: qvm-tags running \"a" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running "a'
}

@test "Test 128. qvm-tags: qvm-tags running \"a\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "a" '
}

@test "Test 129. qvm-tags: qvm-tags running \"a\" gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "a" gui'
}

@test "Test 130. qvm-tags: qvm-tags running \"a\" guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "a" guivm-dom0 '
}

@test "Test 131. qvm-tags: qvm-tags running \"a\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "a" guivm-dom0 created-by-dom0 '
}

@test "Test 132. qvm-tags: qvm-tags running \"a\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "a" guivm-dom0 created-by-dom0 '
}

@test "Test 133. qvm-tags: qvm-tags running \"a\" nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "a" nonexistent'
}

@test "Test 134. qvm-tags: qvm-tags running \"a\" nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "a" nonexistent '
}

@test "Test 135. qvm-tags: qvm-tags running \"del" {
    EXPECTED_COMPREPLY=([0]="del")
    test_wrapper 'qvm-tags running "del'
}

@test "Test 136. qvm-tags: qvm-tags running \"del\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "del" '
}

@test "Test 137. qvm-tags: qvm-tags running \"del\" gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "del" gui'
}

@test "Test 138. qvm-tags: qvm-tags running \"del\" guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "del" guivm-dom0 '
}

@test "Test 139. qvm-tags: qvm-tags running \"del\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "del" guivm-dom0 created-by-dom0 '
}

@test "Test 140. qvm-tags: qvm-tags running \"del\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "del" guivm-dom0 created-by-dom0 '
}

@test "Test 141. qvm-tags: qvm-tags running \"del\" nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "del" nonexistent'
}

@test "Test 142. qvm-tags: qvm-tags running \"del\" nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "del" nonexistent '
}

@test "Test 143. qvm-tags: qvm-tags running \"unset" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running "unset'
}

@test "Test 144. qvm-tags: qvm-tags running \"unset\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "unset" '
}

@test "Test 145. qvm-tags: qvm-tags running \"unset\" gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "unset" gui'
}

@test "Test 146. qvm-tags: qvm-tags running \"unset\" guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "unset" guivm-dom0 '
}

@test "Test 147. qvm-tags: qvm-tags running \"unset\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "unset" guivm-dom0 created-by-dom0 '
}

@test "Test 148. qvm-tags: qvm-tags running \"unset\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "unset" guivm-dom0 created-by-dom0 '
}

@test "Test 149. qvm-tags: qvm-tags running \"unset\" nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "unset" nonexistent'
}

@test "Test 150. qvm-tags: qvm-tags running \"unset\" nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "unset" nonexistent '
}

@test "Test 151. qvm-tags: qvm-tags running \"u" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running "u'
}

@test "Test 152. qvm-tags: qvm-tags running \"u\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "u" '
}

@test "Test 153. qvm-tags: qvm-tags running \"u\" gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "u" gui'
}

@test "Test 154. qvm-tags: qvm-tags running \"u\" guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "u" guivm-dom0 '
}

@test "Test 155. qvm-tags: qvm-tags running \"u\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "u" guivm-dom0 created-by-dom0 '
}

@test "Test 156. qvm-tags: qvm-tags running \"u\" guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "u" guivm-dom0 created-by-dom0 '
}

@test "Test 157. qvm-tags: qvm-tags running \"u\" nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "u" nonexistent'
}

@test "Test 158. qvm-tags: qvm-tags running \"u\" nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "u" nonexistent '
}

@test "Test 159. qvm-tags: qvm-tags running 'list" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running '\''list'
}

@test "Test 160. qvm-tags: qvm-tags running 'list' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''list'\'' '
}

@test "Test 161. qvm-tags: qvm-tags running 'list' gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''list'\'' gui'
}

@test "Test 162. qvm-tags: qvm-tags running 'list' guivm-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' guivm-dom0 '
}

@test "Test 163. qvm-tags: qvm-tags running 'list' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 164. qvm-tags: qvm-tags running 'list' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 165. qvm-tags: qvm-tags running 'list' nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' nonexistent'
}

@test "Test 166. qvm-tags: qvm-tags running 'list' nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' nonexistent '
}

@test "Test 167. qvm-tags: qvm-tags running 'ls" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'
}

@test "Test 168. qvm-tags: qvm-tags running 'ls' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''ls'\'' '
}

@test "Test 169. qvm-tags: qvm-tags running 'ls' gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''ls'\'' gui'
}

@test "Test 170. qvm-tags: qvm-tags running 'ls' guivm-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' guivm-dom0 '
}

@test "Test 171. qvm-tags: qvm-tags running 'ls' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 172. qvm-tags: qvm-tags running 'ls' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 173. qvm-tags: qvm-tags running 'ls' nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' nonexistent'
}

@test "Test 174. qvm-tags: qvm-tags running 'ls' nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' nonexistent '
}

@test "Test 175. qvm-tags: qvm-tags running 'l" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running '\''l'
}

@test "Test 176. qvm-tags: qvm-tags running 'l' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''l'\'' '
}

@test "Test 177. qvm-tags: qvm-tags running 'l' gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''l'\'' gui'
}

@test "Test 178. qvm-tags: qvm-tags running 'l' guivm-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' guivm-dom0 '
}

@test "Test 179. qvm-tags: qvm-tags running 'l' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 180. qvm-tags: qvm-tags running 'l' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 181. qvm-tags: qvm-tags running 'l' nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' nonexistent'
}

@test "Test 182. qvm-tags: qvm-tags running 'l' nonexistent " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' nonexistent '
}

@test "Test 183. qvm-tags: qvm-tags running 'add" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running '\''add'
}

@test "Test 184. qvm-tags: qvm-tags running 'add' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' '
}

@test "Test 185. qvm-tags: qvm-tags running 'add' gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''add'\'' gui'
}

@test "Test 186. qvm-tags: qvm-tags running 'add' guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' guivm-dom0 '
}

@test "Test 187. qvm-tags: qvm-tags running 'add' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 188. qvm-tags: qvm-tags running 'add' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 189. qvm-tags: qvm-tags running 'add' nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''add'\'' nonexistent'
}

@test "Test 190. qvm-tags: qvm-tags running 'add' nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' nonexistent '
}

@test "Test 191. qvm-tags: qvm-tags running 'set" {
    EXPECTED_COMPREPLY=([0]="set")
    test_wrapper 'qvm-tags running '\''set'
}

@test "Test 192. qvm-tags: qvm-tags running 'set' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' '
}

@test "Test 193. qvm-tags: qvm-tags running 'set' gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''set'\'' gui'
}

@test "Test 194. qvm-tags: qvm-tags running 'set' guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' guivm-dom0 '
}

@test "Test 195. qvm-tags: qvm-tags running 'set' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 196. qvm-tags: qvm-tags running 'set' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 197. qvm-tags: qvm-tags running 'set' nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''set'\'' nonexistent'
}

@test "Test 198. qvm-tags: qvm-tags running 'set' nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' nonexistent '
}

@test "Test 199. qvm-tags: qvm-tags running 'a" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running '\''a'
}

@test "Test 200. qvm-tags: qvm-tags running 'a' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' '
}

@test "Test 201. qvm-tags: qvm-tags running 'a' gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''a'\'' gui'
}

@test "Test 202. qvm-tags: qvm-tags running 'a' guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' guivm-dom0 '
}

@test "Test 203. qvm-tags: qvm-tags running 'a' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 204. qvm-tags: qvm-tags running 'a' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 205. qvm-tags: qvm-tags running 'a' nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''a'\'' nonexistent'
}

@test "Test 206. qvm-tags: qvm-tags running 'a' nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' nonexistent '
}

@test "Test 207. qvm-tags: qvm-tags running 'del" {
    EXPECTED_COMPREPLY=([0]="del")
    test_wrapper 'qvm-tags running '\''del'
}

@test "Test 208. qvm-tags: qvm-tags running 'del' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' '
}

@test "Test 209. qvm-tags: qvm-tags running 'del' gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''del'\'' gui'
}

@test "Test 210. qvm-tags: qvm-tags running 'del' guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' guivm-dom0 '
}

@test "Test 211. qvm-tags: qvm-tags running 'del' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 212. qvm-tags: qvm-tags running 'del' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 213. qvm-tags: qvm-tags running 'del' nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''del'\'' nonexistent'
}

@test "Test 214. qvm-tags: qvm-tags running 'del' nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' nonexistent '
}

@test "Test 215. qvm-tags: qvm-tags running 'unset" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running '\''unset'
}

@test "Test 216. qvm-tags: qvm-tags running 'unset' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' '
}

@test "Test 217. qvm-tags: qvm-tags running 'unset' gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''unset'\'' gui'
}

@test "Test 218. qvm-tags: qvm-tags running 'unset' guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' guivm-dom0 '
}

@test "Test 219. qvm-tags: qvm-tags running 'unset' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 220. qvm-tags: qvm-tags running 'unset' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 221. qvm-tags: qvm-tags running 'unset' nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''unset'\'' nonexistent'
}

@test "Test 222. qvm-tags: qvm-tags running 'unset' nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' nonexistent '
}

@test "Test 223. qvm-tags: qvm-tags running 'u" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running '\''u'
}

@test "Test 224. qvm-tags: qvm-tags running 'u' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' '
}

@test "Test 225. qvm-tags: qvm-tags running 'u' gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''u'\'' gui'
}

@test "Test 226. qvm-tags: qvm-tags running 'u' guivm-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' guivm-dom0 '
}

@test "Test 227. qvm-tags: qvm-tags running 'u' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 228. qvm-tags: qvm-tags running 'u' guivm-dom0 created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' guivm-dom0 created-by-dom0 '
}

@test "Test 229. qvm-tags: qvm-tags running 'u' nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''u'\'' nonexistent'
}

@test "Test 230. qvm-tags: qvm-tags running 'u' nonexistent " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' nonexistent '
}

@test "Test 231. qvm-tags: qvm-tags running list" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running list'
}

@test "Test 232. qvm-tags: qvm-tags running list " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running list '
}

@test "Test 233. qvm-tags: qvm-tags running list \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running list "gui'
}

@test "Test 234. qvm-tags: qvm-tags running list \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list "guivm-dom0" '
}

@test "Test 235. qvm-tags: qvm-tags running list \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list "guivm-dom0" created-by-dom0 '
}

@test "Test 236. qvm-tags: qvm-tags running list \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list "guivm-dom0" "created-by-dom0" '
}

@test "Test 237. qvm-tags: qvm-tags running list \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list "nonexistent'
}

@test "Test 238. qvm-tags: qvm-tags running list \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list "nonexistent" '
}

@test "Test 239. qvm-tags: qvm-tags running ls" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls'
}

@test "Test 240. qvm-tags: qvm-tags running ls " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running ls '
}

@test "Test 241. qvm-tags: qvm-tags running ls \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running ls "gui'
}

@test "Test 242. qvm-tags: qvm-tags running ls \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls "guivm-dom0" '
}

@test "Test 243. qvm-tags: qvm-tags running ls \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls "guivm-dom0" created-by-dom0 '
}

@test "Test 244. qvm-tags: qvm-tags running ls \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls "guivm-dom0" "created-by-dom0" '
}

@test "Test 245. qvm-tags: qvm-tags running ls \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls "nonexistent'
}

@test "Test 246. qvm-tags: qvm-tags running ls \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls "nonexistent" '
}

@test "Test 247. qvm-tags: qvm-tags running l" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running l'
}

@test "Test 248. qvm-tags: qvm-tags running l " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running l '
}

@test "Test 249. qvm-tags: qvm-tags running l \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running l "gui'
}

@test "Test 250. qvm-tags: qvm-tags running l \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l "guivm-dom0" '
}

@test "Test 251. qvm-tags: qvm-tags running l \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l "guivm-dom0" created-by-dom0 '
}

@test "Test 252. qvm-tags: qvm-tags running l \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l "guivm-dom0" "created-by-dom0" '
}

@test "Test 253. qvm-tags: qvm-tags running l \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l "nonexistent'
}

@test "Test 254. qvm-tags: qvm-tags running l \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l "nonexistent" '
}

@test "Test 255. qvm-tags: qvm-tags running add" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running add'
}

@test "Test 256. qvm-tags: qvm-tags running add " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add '
}

@test "Test 257. qvm-tags: qvm-tags running add \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running add "gui'
}

@test "Test 258. qvm-tags: qvm-tags running add \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add "guivm-dom0" '
}

@test "Test 259. qvm-tags: qvm-tags running add \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add "guivm-dom0" created-by-dom0 '
}

@test "Test 260. qvm-tags: qvm-tags running add \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running add "guivm-dom0" "created-by-dom0" '
}

@test "Test 261. qvm-tags: qvm-tags running add \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running add "nonexistent'
}

@test "Test 262. qvm-tags: qvm-tags running add \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add "nonexistent" '
}

@test "Test 263. qvm-tags: qvm-tags running set" {
    EXPECTED_COMPREPLY=([0]="set")
    test_wrapper 'qvm-tags running set'
}

@test "Test 264. qvm-tags: qvm-tags running set " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set '
}

@test "Test 265. qvm-tags: qvm-tags running set \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running set "gui'
}

@test "Test 266. qvm-tags: qvm-tags running set \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set "guivm-dom0" '
}

@test "Test 267. qvm-tags: qvm-tags running set \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set "guivm-dom0" created-by-dom0 '
}

@test "Test 268. qvm-tags: qvm-tags running set \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running set "guivm-dom0" "created-by-dom0" '
}

@test "Test 269. qvm-tags: qvm-tags running set \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running set "nonexistent'
}

@test "Test 270. qvm-tags: qvm-tags running set \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set "nonexistent" '
}

@test "Test 271. qvm-tags: qvm-tags running a" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running a'
}

@test "Test 272. qvm-tags: qvm-tags running a " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a '
}

@test "Test 273. qvm-tags: qvm-tags running a \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running a "gui'
}

@test "Test 274. qvm-tags: qvm-tags running a \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a "guivm-dom0" '
}

@test "Test 275. qvm-tags: qvm-tags running a \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a "guivm-dom0" created-by-dom0 '
}

@test "Test 276. qvm-tags: qvm-tags running a \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running a "guivm-dom0" "created-by-dom0" '
}

@test "Test 277. qvm-tags: qvm-tags running a \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running a "nonexistent'
}

@test "Test 278. qvm-tags: qvm-tags running a \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a "nonexistent" '
}

@test "Test 279. qvm-tags: qvm-tags running del" {
    EXPECTED_COMPREPLY=([0]="del")
    test_wrapper 'qvm-tags running del'
}

@test "Test 280. qvm-tags: qvm-tags running del " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del '
}

@test "Test 281. qvm-tags: qvm-tags running del \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running del "gui'
}

@test "Test 282. qvm-tags: qvm-tags running del \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del "guivm-dom0" '
}

@test "Test 283. qvm-tags: qvm-tags running del \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del "guivm-dom0" created-by-dom0 '
}

@test "Test 284. qvm-tags: qvm-tags running del \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running del "guivm-dom0" "created-by-dom0" '
}

@test "Test 285. qvm-tags: qvm-tags running del \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running del "nonexistent'
}

@test "Test 286. qvm-tags: qvm-tags running del \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del "nonexistent" '
}

@test "Test 287. qvm-tags: qvm-tags running unset" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running unset'
}

@test "Test 288. qvm-tags: qvm-tags running unset " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset '
}

@test "Test 289. qvm-tags: qvm-tags running unset \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running unset "gui'
}

@test "Test 290. qvm-tags: qvm-tags running unset \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset "guivm-dom0" '
}

@test "Test 291. qvm-tags: qvm-tags running unset \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset "guivm-dom0" created-by-dom0 '
}

@test "Test 292. qvm-tags: qvm-tags running unset \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running unset "guivm-dom0" "created-by-dom0" '
}

@test "Test 293. qvm-tags: qvm-tags running unset \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running unset "nonexistent'
}

@test "Test 294. qvm-tags: qvm-tags running unset \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset "nonexistent" '
}

@test "Test 295. qvm-tags: qvm-tags running u" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running u'
}

@test "Test 296. qvm-tags: qvm-tags running u " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u '
}

@test "Test 297. qvm-tags: qvm-tags running u \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running u "gui'
}

@test "Test 298. qvm-tags: qvm-tags running u \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u "guivm-dom0" '
}

@test "Test 299. qvm-tags: qvm-tags running u \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u "guivm-dom0" created-by-dom0 '
}

@test "Test 300. qvm-tags: qvm-tags running u \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running u "guivm-dom0" "created-by-dom0" '
}

@test "Test 301. qvm-tags: qvm-tags running u \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running u "nonexistent'
}

@test "Test 302. qvm-tags: qvm-tags running u \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u "nonexistent" '
}

@test "Test 303. qvm-tags: qvm-tags running \"list" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running "list'
}

@test "Test 304. qvm-tags: qvm-tags running \"list\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "list" '
}

@test "Test 305. qvm-tags: qvm-tags running \"list\" \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "list" "gui'
}

@test "Test 306. qvm-tags: qvm-tags running \"list\" \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" "guivm-dom0" '
}

@test "Test 307. qvm-tags: qvm-tags running \"list\" \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" "guivm-dom0" created-by-dom0 '
}

@test "Test 308. qvm-tags: qvm-tags running \"list\" \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" "guivm-dom0" "created-by-dom0" '
}

@test "Test 309. qvm-tags: qvm-tags running \"list\" \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" "nonexistent'
}

@test "Test 310. qvm-tags: qvm-tags running \"list\" \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" "nonexistent" '
}

@test "Test 311. qvm-tags: qvm-tags running \"ls" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls'
}

@test "Test 312. qvm-tags: qvm-tags running \"ls\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "ls" '
}

@test "Test 313. qvm-tags: qvm-tags running \"ls\" \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "ls" "gui'
}

@test "Test 314. qvm-tags: qvm-tags running \"ls\" \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" "guivm-dom0" '
}

@test "Test 315. qvm-tags: qvm-tags running \"ls\" \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" "guivm-dom0" created-by-dom0 '
}

@test "Test 316. qvm-tags: qvm-tags running \"ls\" \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" "guivm-dom0" "created-by-dom0" '
}

@test "Test 317. qvm-tags: qvm-tags running \"ls\" \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" "nonexistent'
}

@test "Test 318. qvm-tags: qvm-tags running \"ls\" \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" "nonexistent" '
}

@test "Test 319. qvm-tags: qvm-tags running \"l" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running "l'
}

@test "Test 320. qvm-tags: qvm-tags running \"l\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "l" '
}

@test "Test 321. qvm-tags: qvm-tags running \"l\" \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "l" "gui'
}

@test "Test 322. qvm-tags: qvm-tags running \"l\" \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" "guivm-dom0" '
}

@test "Test 323. qvm-tags: qvm-tags running \"l\" \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" "guivm-dom0" created-by-dom0 '
}

@test "Test 324. qvm-tags: qvm-tags running \"l\" \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" "guivm-dom0" "created-by-dom0" '
}

@test "Test 325. qvm-tags: qvm-tags running \"l\" \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" "nonexistent'
}

@test "Test 326. qvm-tags: qvm-tags running \"l\" \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" "nonexistent" '
}

@test "Test 327. qvm-tags: qvm-tags running \"add" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running "add'
}

@test "Test 328. qvm-tags: qvm-tags running \"add\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "add" '
}

@test "Test 329. qvm-tags: qvm-tags running \"add\" \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "add" "gui'
}

@test "Test 330. qvm-tags: qvm-tags running \"add\" \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "add" "guivm-dom0" '
}

@test "Test 331. qvm-tags: qvm-tags running \"add\" \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "add" "guivm-dom0" created-by-dom0 '
}

@test "Test 332. qvm-tags: qvm-tags running \"add\" \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "add" "guivm-dom0" "created-by-dom0" '
}

@test "Test 333. qvm-tags: qvm-tags running \"add\" \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "add" "nonexistent'
}

@test "Test 334. qvm-tags: qvm-tags running \"add\" \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "add" "nonexistent" '
}

@test "Test 335. qvm-tags: qvm-tags running \"set" {
    EXPECTED_COMPREPLY=([0]="set")
    test_wrapper 'qvm-tags running "set'
}

@test "Test 336. qvm-tags: qvm-tags running \"set\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "set" '
}

@test "Test 337. qvm-tags: qvm-tags running \"set\" \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "set" "gui'
}

@test "Test 338. qvm-tags: qvm-tags running \"set\" \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "set" "guivm-dom0" '
}

@test "Test 339. qvm-tags: qvm-tags running \"set\" \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "set" "guivm-dom0" created-by-dom0 '
}

@test "Test 340. qvm-tags: qvm-tags running \"set\" \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "set" "guivm-dom0" "created-by-dom0" '
}

@test "Test 341. qvm-tags: qvm-tags running \"set\" \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "set" "nonexistent'
}

@test "Test 342. qvm-tags: qvm-tags running \"set\" \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "set" "nonexistent" '
}

@test "Test 343. qvm-tags: qvm-tags running \"a" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running "a'
}

@test "Test 344. qvm-tags: qvm-tags running \"a\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "a" '
}

@test "Test 345. qvm-tags: qvm-tags running \"a\" \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "a" "gui'
}

@test "Test 346. qvm-tags: qvm-tags running \"a\" \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "a" "guivm-dom0" '
}

@test "Test 347. qvm-tags: qvm-tags running \"a\" \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "a" "guivm-dom0" created-by-dom0 '
}

@test "Test 348. qvm-tags: qvm-tags running \"a\" \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "a" "guivm-dom0" "created-by-dom0" '
}

@test "Test 349. qvm-tags: qvm-tags running \"a\" \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "a" "nonexistent'
}

@test "Test 350. qvm-tags: qvm-tags running \"a\" \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "a" "nonexistent" '
}

@test "Test 351. qvm-tags: qvm-tags running \"del" {
    EXPECTED_COMPREPLY=([0]="del")
    test_wrapper 'qvm-tags running "del'
}

@test "Test 352. qvm-tags: qvm-tags running \"del\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "del" '
}

@test "Test 353. qvm-tags: qvm-tags running \"del\" \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "del" "gui'
}

@test "Test 354. qvm-tags: qvm-tags running \"del\" \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "del" "guivm-dom0" '
}

@test "Test 355. qvm-tags: qvm-tags running \"del\" \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "del" "guivm-dom0" created-by-dom0 '
}

@test "Test 356. qvm-tags: qvm-tags running \"del\" \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "del" "guivm-dom0" "created-by-dom0" '
}

@test "Test 357. qvm-tags: qvm-tags running \"del\" \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "del" "nonexistent'
}

@test "Test 358. qvm-tags: qvm-tags running \"del\" \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "del" "nonexistent" '
}

@test "Test 359. qvm-tags: qvm-tags running \"unset" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running "unset'
}

@test "Test 360. qvm-tags: qvm-tags running \"unset\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "unset" '
}

@test "Test 361. qvm-tags: qvm-tags running \"unset\" \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "unset" "gui'
}

@test "Test 362. qvm-tags: qvm-tags running \"unset\" \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "unset" "guivm-dom0" '
}

@test "Test 363. qvm-tags: qvm-tags running \"unset\" \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "unset" "guivm-dom0" created-by-dom0 '
}

@test "Test 364. qvm-tags: qvm-tags running \"unset\" \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "unset" "guivm-dom0" "created-by-dom0" '
}

@test "Test 365. qvm-tags: qvm-tags running \"unset\" \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "unset" "nonexistent'
}

@test "Test 366. qvm-tags: qvm-tags running \"unset\" \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "unset" "nonexistent" '
}

@test "Test 367. qvm-tags: qvm-tags running \"u" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running "u'
}

@test "Test 368. qvm-tags: qvm-tags running \"u\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "u" '
}

@test "Test 369. qvm-tags: qvm-tags running \"u\" \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "u" "gui'
}

@test "Test 370. qvm-tags: qvm-tags running \"u\" \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "u" "guivm-dom0" '
}

@test "Test 371. qvm-tags: qvm-tags running \"u\" \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "u" "guivm-dom0" created-by-dom0 '
}

@test "Test 372. qvm-tags: qvm-tags running \"u\" \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "u" "guivm-dom0" "created-by-dom0" '
}

@test "Test 373. qvm-tags: qvm-tags running \"u\" \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "u" "nonexistent'
}

@test "Test 374. qvm-tags: qvm-tags running \"u\" \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "u" "nonexistent" '
}

@test "Test 375. qvm-tags: qvm-tags running 'list" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running '\''list'
}

@test "Test 376. qvm-tags: qvm-tags running 'list' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''list'\'' '
}

@test "Test 377. qvm-tags: qvm-tags running 'list' \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''list'\'' "gui'
}

@test "Test 378. qvm-tags: qvm-tags running 'list' \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' "guivm-dom0" '
}

@test "Test 379. qvm-tags: qvm-tags running 'list' \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' "guivm-dom0" created-by-dom0 '
}

@test "Test 380. qvm-tags: qvm-tags running 'list' \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' "guivm-dom0" "created-by-dom0" '
}

@test "Test 381. qvm-tags: qvm-tags running 'list' \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' "nonexistent'
}

@test "Test 382. qvm-tags: qvm-tags running 'list' \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' "nonexistent" '
}

@test "Test 383. qvm-tags: qvm-tags running 'ls" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'
}

@test "Test 384. qvm-tags: qvm-tags running 'ls' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''ls'\'' '
}

@test "Test 385. qvm-tags: qvm-tags running 'ls' \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''ls'\'' "gui'
}

@test "Test 386. qvm-tags: qvm-tags running 'ls' \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' "guivm-dom0" '
}

@test "Test 387. qvm-tags: qvm-tags running 'ls' \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' "guivm-dom0" created-by-dom0 '
}

@test "Test 388. qvm-tags: qvm-tags running 'ls' \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' "guivm-dom0" "created-by-dom0" '
}

@test "Test 389. qvm-tags: qvm-tags running 'ls' \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' "nonexistent'
}

@test "Test 390. qvm-tags: qvm-tags running 'ls' \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' "nonexistent" '
}

@test "Test 391. qvm-tags: qvm-tags running 'l" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running '\''l'
}

@test "Test 392. qvm-tags: qvm-tags running 'l' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''l'\'' '
}

@test "Test 393. qvm-tags: qvm-tags running 'l' \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''l'\'' "gui'
}

@test "Test 394. qvm-tags: qvm-tags running 'l' \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' "guivm-dom0" '
}

@test "Test 395. qvm-tags: qvm-tags running 'l' \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' "guivm-dom0" created-by-dom0 '
}

@test "Test 396. qvm-tags: qvm-tags running 'l' \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' "guivm-dom0" "created-by-dom0" '
}

@test "Test 397. qvm-tags: qvm-tags running 'l' \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' "nonexistent'
}

@test "Test 398. qvm-tags: qvm-tags running 'l' \"nonexistent\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' "nonexistent" '
}

@test "Test 399. qvm-tags: qvm-tags running 'add" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running '\''add'
}

@test "Test 400. qvm-tags: qvm-tags running 'add' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' '
}

@test "Test 401. qvm-tags: qvm-tags running 'add' \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''add'\'' "gui'
}

@test "Test 402. qvm-tags: qvm-tags running 'add' \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' "guivm-dom0" '
}

@test "Test 403. qvm-tags: qvm-tags running 'add' \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' "guivm-dom0" created-by-dom0 '
}

@test "Test 404. qvm-tags: qvm-tags running 'add' \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''add'\'' "guivm-dom0" "created-by-dom0" '
}

@test "Test 405. qvm-tags: qvm-tags running 'add' \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''add'\'' "nonexistent'
}

@test "Test 406. qvm-tags: qvm-tags running 'add' \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' "nonexistent" '
}

@test "Test 407. qvm-tags: qvm-tags running 'set" {
    EXPECTED_COMPREPLY=([0]="set")
    test_wrapper 'qvm-tags running '\''set'
}

@test "Test 408. qvm-tags: qvm-tags running 'set' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' '
}

@test "Test 409. qvm-tags: qvm-tags running 'set' \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''set'\'' "gui'
}

@test "Test 410. qvm-tags: qvm-tags running 'set' \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' "guivm-dom0" '
}

@test "Test 411. qvm-tags: qvm-tags running 'set' \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' "guivm-dom0" created-by-dom0 '
}

@test "Test 412. qvm-tags: qvm-tags running 'set' \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''set'\'' "guivm-dom0" "created-by-dom0" '
}

@test "Test 413. qvm-tags: qvm-tags running 'set' \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''set'\'' "nonexistent'
}

@test "Test 414. qvm-tags: qvm-tags running 'set' \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' "nonexistent" '
}

@test "Test 415. qvm-tags: qvm-tags running 'a" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running '\''a'
}

@test "Test 416. qvm-tags: qvm-tags running 'a' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' '
}

@test "Test 417. qvm-tags: qvm-tags running 'a' \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''a'\'' "gui'
}

@test "Test 418. qvm-tags: qvm-tags running 'a' \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' "guivm-dom0" '
}

@test "Test 419. qvm-tags: qvm-tags running 'a' \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' "guivm-dom0" created-by-dom0 '
}

@test "Test 420. qvm-tags: qvm-tags running 'a' \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''a'\'' "guivm-dom0" "created-by-dom0" '
}

@test "Test 421. qvm-tags: qvm-tags running 'a' \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''a'\'' "nonexistent'
}

@test "Test 422. qvm-tags: qvm-tags running 'a' \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' "nonexistent" '
}

@test "Test 423. qvm-tags: qvm-tags running 'del" {
    EXPECTED_COMPREPLY=([0]="del")
    test_wrapper 'qvm-tags running '\''del'
}

@test "Test 424. qvm-tags: qvm-tags running 'del' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' '
}

@test "Test 425. qvm-tags: qvm-tags running 'del' \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''del'\'' "gui'
}

@test "Test 426. qvm-tags: qvm-tags running 'del' \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' "guivm-dom0" '
}

@test "Test 427. qvm-tags: qvm-tags running 'del' \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' "guivm-dom0" created-by-dom0 '
}

@test "Test 428. qvm-tags: qvm-tags running 'del' \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''del'\'' "guivm-dom0" "created-by-dom0" '
}

@test "Test 429. qvm-tags: qvm-tags running 'del' \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''del'\'' "nonexistent'
}

@test "Test 430. qvm-tags: qvm-tags running 'del' \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' "nonexistent" '
}

@test "Test 431. qvm-tags: qvm-tags running 'unset" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running '\''unset'
}

@test "Test 432. qvm-tags: qvm-tags running 'unset' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' '
}

@test "Test 433. qvm-tags: qvm-tags running 'unset' \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''unset'\'' "gui'
}

@test "Test 434. qvm-tags: qvm-tags running 'unset' \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' "guivm-dom0" '
}

@test "Test 435. qvm-tags: qvm-tags running 'unset' \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' "guivm-dom0" created-by-dom0 '
}

@test "Test 436. qvm-tags: qvm-tags running 'unset' \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''unset'\'' "guivm-dom0" "created-by-dom0" '
}

@test "Test 437. qvm-tags: qvm-tags running 'unset' \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''unset'\'' "nonexistent'
}

@test "Test 438. qvm-tags: qvm-tags running 'unset' \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' "nonexistent" '
}

@test "Test 439. qvm-tags: qvm-tags running 'u" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running '\''u'
}

@test "Test 440. qvm-tags: qvm-tags running 'u' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' '
}

@test "Test 441. qvm-tags: qvm-tags running 'u' \"gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''u'\'' "gui'
}

@test "Test 442. qvm-tags: qvm-tags running 'u' \"guivm-dom0\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' "guivm-dom0" '
}

@test "Test 443. qvm-tags: qvm-tags running 'u' \"guivm-dom0\" created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' "guivm-dom0" created-by-dom0 '
}

@test "Test 444. qvm-tags: qvm-tags running 'u' \"guivm-dom0\" \"created-by-dom0\" " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''u'\'' "guivm-dom0" "created-by-dom0" '
}

@test "Test 445. qvm-tags: qvm-tags running 'u' \"nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''u'\'' "nonexistent'
}

@test "Test 446. qvm-tags: qvm-tags running 'u' \"nonexistent\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' "nonexistent" '
}

@test "Test 447. qvm-tags: qvm-tags running list" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running list'
}

@test "Test 448. qvm-tags: qvm-tags running list " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running list '
}

@test "Test 449. qvm-tags: qvm-tags running list 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running list '\''gui'
}

@test "Test 450. qvm-tags: qvm-tags running list 'guivm-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list '\''guivm-dom0'\'' '
}

@test "Test 451. qvm-tags: qvm-tags running list 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 452. qvm-tags: qvm-tags running list 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 453. qvm-tags: qvm-tags running list 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list '\''nonexistent'
}

@test "Test 454. qvm-tags: qvm-tags running list 'nonexistent' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running list '\''nonexistent'\'' '
}

@test "Test 455. qvm-tags: qvm-tags running ls" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls'
}

@test "Test 456. qvm-tags: qvm-tags running ls " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running ls '
}

@test "Test 457. qvm-tags: qvm-tags running ls 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running ls '\''gui'
}

@test "Test 458. qvm-tags: qvm-tags running ls 'guivm-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls '\''guivm-dom0'\'' '
}

@test "Test 459. qvm-tags: qvm-tags running ls 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 460. qvm-tags: qvm-tags running ls 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 461. qvm-tags: qvm-tags running ls 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls '\''nonexistent'
}

@test "Test 462. qvm-tags: qvm-tags running ls 'nonexistent' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running ls '\''nonexistent'\'' '
}

@test "Test 463. qvm-tags: qvm-tags running l" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running l'
}

@test "Test 464. qvm-tags: qvm-tags running l " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running l '
}

@test "Test 465. qvm-tags: qvm-tags running l 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running l '\''gui'
}

@test "Test 466. qvm-tags: qvm-tags running l 'guivm-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l '\''guivm-dom0'\'' '
}

@test "Test 467. qvm-tags: qvm-tags running l 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 468. qvm-tags: qvm-tags running l 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 469. qvm-tags: qvm-tags running l 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l '\''nonexistent'
}

@test "Test 470. qvm-tags: qvm-tags running l 'nonexistent' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running l '\''nonexistent'\'' '
}

@test "Test 471. qvm-tags: qvm-tags running add" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running add'
}

@test "Test 472. qvm-tags: qvm-tags running add " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add '
}

@test "Test 473. qvm-tags: qvm-tags running add 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running add '\''gui'
}

@test "Test 474. qvm-tags: qvm-tags running add 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add '\''guivm-dom0'\'' '
}

@test "Test 475. qvm-tags: qvm-tags running add 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 476. qvm-tags: qvm-tags running add 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 477. qvm-tags: qvm-tags running add 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running add '\''nonexistent'
}

@test "Test 478. qvm-tags: qvm-tags running add 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running add '\''nonexistent'\'' '
}

@test "Test 479. qvm-tags: qvm-tags running set" {
    EXPECTED_COMPREPLY=([0]="set")
    test_wrapper 'qvm-tags running set'
}

@test "Test 480. qvm-tags: qvm-tags running set " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set '
}

@test "Test 481. qvm-tags: qvm-tags running set 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running set '\''gui'
}

@test "Test 482. qvm-tags: qvm-tags running set 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set '\''guivm-dom0'\'' '
}

@test "Test 483. qvm-tags: qvm-tags running set 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 484. qvm-tags: qvm-tags running set 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 485. qvm-tags: qvm-tags running set 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running set '\''nonexistent'
}

@test "Test 486. qvm-tags: qvm-tags running set 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running set '\''nonexistent'\'' '
}

@test "Test 487. qvm-tags: qvm-tags running a" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running a'
}

@test "Test 488. qvm-tags: qvm-tags running a " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a '
}

@test "Test 489. qvm-tags: qvm-tags running a 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running a '\''gui'
}

@test "Test 490. qvm-tags: qvm-tags running a 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a '\''guivm-dom0'\'' '
}

@test "Test 491. qvm-tags: qvm-tags running a 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 492. qvm-tags: qvm-tags running a 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 493. qvm-tags: qvm-tags running a 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running a '\''nonexistent'
}

@test "Test 494. qvm-tags: qvm-tags running a 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running a '\''nonexistent'\'' '
}

@test "Test 495. qvm-tags: qvm-tags running del" {
    EXPECTED_COMPREPLY=([0]="del")
    test_wrapper 'qvm-tags running del'
}

@test "Test 496. qvm-tags: qvm-tags running del " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del '
}

@test "Test 497. qvm-tags: qvm-tags running del 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running del '\''gui'
}

@test "Test 498. qvm-tags: qvm-tags running del 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del '\''guivm-dom0'\'' '
}

@test "Test 499. qvm-tags: qvm-tags running del 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 500. qvm-tags: qvm-tags running del 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 501. qvm-tags: qvm-tags running del 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running del '\''nonexistent'
}

@test "Test 502. qvm-tags: qvm-tags running del 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running del '\''nonexistent'\'' '
}

@test "Test 503. qvm-tags: qvm-tags running unset" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running unset'
}

@test "Test 504. qvm-tags: qvm-tags running unset " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset '
}

@test "Test 505. qvm-tags: qvm-tags running unset 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running unset '\''gui'
}

@test "Test 506. qvm-tags: qvm-tags running unset 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset '\''guivm-dom0'\'' '
}

@test "Test 507. qvm-tags: qvm-tags running unset 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 508. qvm-tags: qvm-tags running unset 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 509. qvm-tags: qvm-tags running unset 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running unset '\''nonexistent'
}

@test "Test 510. qvm-tags: qvm-tags running unset 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running unset '\''nonexistent'\'' '
}

@test "Test 511. qvm-tags: qvm-tags running u" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running u'
}

@test "Test 512. qvm-tags: qvm-tags running u " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u '
}

@test "Test 513. qvm-tags: qvm-tags running u 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running u '\''gui'
}

@test "Test 514. qvm-tags: qvm-tags running u 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u '\''guivm-dom0'\'' '
}

@test "Test 515. qvm-tags: qvm-tags running u 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 516. qvm-tags: qvm-tags running u 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 517. qvm-tags: qvm-tags running u 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running u '\''nonexistent'
}

@test "Test 518. qvm-tags: qvm-tags running u 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running u '\''nonexistent'\'' '
}

@test "Test 519. qvm-tags: qvm-tags running \"list" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running "list'
}

@test "Test 520. qvm-tags: qvm-tags running \"list\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "list" '
}

@test "Test 521. qvm-tags: qvm-tags running \"list\" 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "list" '\''gui'
}

@test "Test 522. qvm-tags: qvm-tags running \"list\" 'guivm-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" '\''guivm-dom0'\'' '
}

@test "Test 523. qvm-tags: qvm-tags running \"list\" 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 524. qvm-tags: qvm-tags running \"list\" 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 525. qvm-tags: qvm-tags running \"list\" 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" '\''nonexistent'
}

@test "Test 526. qvm-tags: qvm-tags running \"list\" 'nonexistent' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "list" '\''nonexistent'\'' '
}

@test "Test 527. qvm-tags: qvm-tags running \"ls" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls'
}

@test "Test 528. qvm-tags: qvm-tags running \"ls\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "ls" '
}

@test "Test 529. qvm-tags: qvm-tags running \"ls\" 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "ls" '\''gui'
}

@test "Test 530. qvm-tags: qvm-tags running \"ls\" 'guivm-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" '\''guivm-dom0'\'' '
}

@test "Test 531. qvm-tags: qvm-tags running \"ls\" 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 532. qvm-tags: qvm-tags running \"ls\" 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 533. qvm-tags: qvm-tags running \"ls\" 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" '\''nonexistent'
}

@test "Test 534. qvm-tags: qvm-tags running \"ls\" 'nonexistent' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "ls" '\''nonexistent'\'' '
}

@test "Test 535. qvm-tags: qvm-tags running \"l" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running "l'
}

@test "Test 536. qvm-tags: qvm-tags running \"l\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "l" '
}

@test "Test 537. qvm-tags: qvm-tags running \"l\" 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "l" '\''gui'
}

@test "Test 538. qvm-tags: qvm-tags running \"l\" 'guivm-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" '\''guivm-dom0'\'' '
}

@test "Test 539. qvm-tags: qvm-tags running \"l\" 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 540. qvm-tags: qvm-tags running \"l\" 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 541. qvm-tags: qvm-tags running \"l\" 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" '\''nonexistent'
}

@test "Test 542. qvm-tags: qvm-tags running \"l\" 'nonexistent' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "l" '\''nonexistent'\'' '
}

@test "Test 543. qvm-tags: qvm-tags running \"add" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running "add'
}

@test "Test 544. qvm-tags: qvm-tags running \"add\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "add" '
}

@test "Test 545. qvm-tags: qvm-tags running \"add\" 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "add" '\''gui'
}

@test "Test 546. qvm-tags: qvm-tags running \"add\" 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "add" '\''guivm-dom0'\'' '
}

@test "Test 547. qvm-tags: qvm-tags running \"add\" 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "add" '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 548. qvm-tags: qvm-tags running \"add\" 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "add" '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 549. qvm-tags: qvm-tags running \"add\" 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "add" '\''nonexistent'
}

@test "Test 550. qvm-tags: qvm-tags running \"add\" 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "add" '\''nonexistent'\'' '
}

@test "Test 551. qvm-tags: qvm-tags running \"set" {
    EXPECTED_COMPREPLY=([0]="set")
    test_wrapper 'qvm-tags running "set'
}

@test "Test 552. qvm-tags: qvm-tags running \"set\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "set" '
}

@test "Test 553. qvm-tags: qvm-tags running \"set\" 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "set" '\''gui'
}

@test "Test 554. qvm-tags: qvm-tags running \"set\" 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "set" '\''guivm-dom0'\'' '
}

@test "Test 555. qvm-tags: qvm-tags running \"set\" 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "set" '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 556. qvm-tags: qvm-tags running \"set\" 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "set" '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 557. qvm-tags: qvm-tags running \"set\" 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "set" '\''nonexistent'
}

@test "Test 558. qvm-tags: qvm-tags running \"set\" 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "set" '\''nonexistent'\'' '
}

@test "Test 559. qvm-tags: qvm-tags running \"a" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running "a'
}

@test "Test 560. qvm-tags: qvm-tags running \"a\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "a" '
}

@test "Test 561. qvm-tags: qvm-tags running \"a\" 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "a" '\''gui'
}

@test "Test 562. qvm-tags: qvm-tags running \"a\" 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "a" '\''guivm-dom0'\'' '
}

@test "Test 563. qvm-tags: qvm-tags running \"a\" 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "a" '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 564. qvm-tags: qvm-tags running \"a\" 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "a" '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 565. qvm-tags: qvm-tags running \"a\" 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "a" '\''nonexistent'
}

@test "Test 566. qvm-tags: qvm-tags running \"a\" 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "a" '\''nonexistent'\'' '
}

@test "Test 567. qvm-tags: qvm-tags running \"del" {
    EXPECTED_COMPREPLY=([0]="del")
    test_wrapper 'qvm-tags running "del'
}

@test "Test 568. qvm-tags: qvm-tags running \"del\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "del" '
}

@test "Test 569. qvm-tags: qvm-tags running \"del\" 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "del" '\''gui'
}

@test "Test 570. qvm-tags: qvm-tags running \"del\" 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "del" '\''guivm-dom0'\'' '
}

@test "Test 571. qvm-tags: qvm-tags running \"del\" 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "del" '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 572. qvm-tags: qvm-tags running \"del\" 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "del" '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 573. qvm-tags: qvm-tags running \"del\" 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "del" '\''nonexistent'
}

@test "Test 574. qvm-tags: qvm-tags running \"del\" 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "del" '\''nonexistent'\'' '
}

@test "Test 575. qvm-tags: qvm-tags running \"unset" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running "unset'
}

@test "Test 576. qvm-tags: qvm-tags running \"unset\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "unset" '
}

@test "Test 577. qvm-tags: qvm-tags running \"unset\" 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "unset" '\''gui'
}

@test "Test 578. qvm-tags: qvm-tags running \"unset\" 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "unset" '\''guivm-dom0'\'' '
}

@test "Test 579. qvm-tags: qvm-tags running \"unset\" 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "unset" '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 580. qvm-tags: qvm-tags running \"unset\" 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "unset" '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 581. qvm-tags: qvm-tags running \"unset\" 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "unset" '\''nonexistent'
}

@test "Test 582. qvm-tags: qvm-tags running \"unset\" 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "unset" '\''nonexistent'\'' '
}

@test "Test 583. qvm-tags: qvm-tags running \"u" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running "u'
}

@test "Test 584. qvm-tags: qvm-tags running \"u\" " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "u" '
}

@test "Test 585. qvm-tags: qvm-tags running \"u\" 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running "u" '\''gui'
}

@test "Test 586. qvm-tags: qvm-tags running \"u\" 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "u" '\''guivm-dom0'\'' '
}

@test "Test 587. qvm-tags: qvm-tags running \"u\" 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "u" '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 588. qvm-tags: qvm-tags running \"u\" 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "u" '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 589. qvm-tags: qvm-tags running \"u\" 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running "u" '\''nonexistent'
}

@test "Test 590. qvm-tags: qvm-tags running \"u\" 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running "u" '\''nonexistent'\'' '
}

@test "Test 591. qvm-tags: qvm-tags running 'list" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running '\''list'
}

@test "Test 592. qvm-tags: qvm-tags running 'list' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''list'\'' '
}

@test "Test 593. qvm-tags: qvm-tags running 'list' 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''list'\'' '\''gui'
}

@test "Test 594. qvm-tags: qvm-tags running 'list' 'guivm-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' '\''guivm-dom0'\'' '
}

@test "Test 595. qvm-tags: qvm-tags running 'list' 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 596. qvm-tags: qvm-tags running 'list' 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 597. qvm-tags: qvm-tags running 'list' 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' '\''nonexistent'
}

@test "Test 598. qvm-tags: qvm-tags running 'list' 'nonexistent' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''list'\'' '\''nonexistent'\'' '
}

@test "Test 599. qvm-tags: qvm-tags running 'ls" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'
}

@test "Test 600. qvm-tags: qvm-tags running 'ls' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''ls'\'' '
}

@test "Test 601. qvm-tags: qvm-tags running 'ls' 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''ls'\'' '\''gui'
}

@test "Test 602. qvm-tags: qvm-tags running 'ls' 'guivm-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' '\''guivm-dom0'\'' '
}

@test "Test 603. qvm-tags: qvm-tags running 'ls' 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 604. qvm-tags: qvm-tags running 'ls' 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 605. qvm-tags: qvm-tags running 'ls' 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' '\''nonexistent'
}

@test "Test 606. qvm-tags: qvm-tags running 'ls' 'nonexistent' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''ls'\'' '\''nonexistent'\'' '
}

@test "Test 607. qvm-tags: qvm-tags running 'l" {
    EXPECTED_COMPREPLY=([0]="list")
    test_wrapper 'qvm-tags running '\''l'
}

@test "Test 608. qvm-tags: qvm-tags running 'l' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''l'\'' '
}

@test "Test 609. qvm-tags: qvm-tags running 'l' 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''l'\'' '\''gui'
}

@test "Test 610. qvm-tags: qvm-tags running 'l' 'guivm-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' '\''guivm-dom0'\'' '
}

@test "Test 611. qvm-tags: qvm-tags running 'l' 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 612. qvm-tags: qvm-tags running 'l' 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 613. qvm-tags: qvm-tags running 'l' 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' '\''nonexistent'
}

@test "Test 614. qvm-tags: qvm-tags running 'l' 'nonexistent' " {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''l'\'' '\''nonexistent'\'' '
}

@test "Test 615. qvm-tags: qvm-tags running 'add" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running '\''add'
}

@test "Test 616. qvm-tags: qvm-tags running 'add' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' '
}

@test "Test 617. qvm-tags: qvm-tags running 'add' 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''add'\'' '\''gui'
}

@test "Test 618. qvm-tags: qvm-tags running 'add' 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' '\''guivm-dom0'\'' '
}

@test "Test 619. qvm-tags: qvm-tags running 'add' 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 620. qvm-tags: qvm-tags running 'add' 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 621. qvm-tags: qvm-tags running 'add' 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''add'\'' '\''nonexistent'
}

@test "Test 622. qvm-tags: qvm-tags running 'add' 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''add'\'' '\''nonexistent'\'' '
}

@test "Test 623. qvm-tags: qvm-tags running 'set" {
    EXPECTED_COMPREPLY=([0]="set")
    test_wrapper 'qvm-tags running '\''set'
}

@test "Test 624. qvm-tags: qvm-tags running 'set' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' '
}

@test "Test 625. qvm-tags: qvm-tags running 'set' 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''set'\'' '\''gui'
}

@test "Test 626. qvm-tags: qvm-tags running 'set' 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' '\''guivm-dom0'\'' '
}

@test "Test 627. qvm-tags: qvm-tags running 'set' 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 628. qvm-tags: qvm-tags running 'set' 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 629. qvm-tags: qvm-tags running 'set' 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''set'\'' '\''nonexistent'
}

@test "Test 630. qvm-tags: qvm-tags running 'set' 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''set'\'' '\''nonexistent'\'' '
}

@test "Test 631. qvm-tags: qvm-tags running 'a" {
    EXPECTED_COMPREPLY=([0]="add")
    test_wrapper 'qvm-tags running '\''a'
}

@test "Test 632. qvm-tags: qvm-tags running 'a' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' '
}

@test "Test 633. qvm-tags: qvm-tags running 'a' 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''a'\'' '\''gui'
}

@test "Test 634. qvm-tags: qvm-tags running 'a' 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' '\''guivm-dom0'\'' '
}

@test "Test 635. qvm-tags: qvm-tags running 'a' 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 636. qvm-tags: qvm-tags running 'a' 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 637. qvm-tags: qvm-tags running 'a' 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''a'\'' '\''nonexistent'
}

@test "Test 638. qvm-tags: qvm-tags running 'a' 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''a'\'' '\''nonexistent'\'' '
}

@test "Test 639. qvm-tags: qvm-tags running 'del" {
    EXPECTED_COMPREPLY=([0]="del")
    test_wrapper 'qvm-tags running '\''del'
}

@test "Test 640. qvm-tags: qvm-tags running 'del' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' '
}

@test "Test 641. qvm-tags: qvm-tags running 'del' 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''del'\'' '\''gui'
}

@test "Test 642. qvm-tags: qvm-tags running 'del' 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' '\''guivm-dom0'\'' '
}

@test "Test 643. qvm-tags: qvm-tags running 'del' 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 644. qvm-tags: qvm-tags running 'del' 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 645. qvm-tags: qvm-tags running 'del' 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''del'\'' '\''nonexistent'
}

@test "Test 646. qvm-tags: qvm-tags running 'del' 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''del'\'' '\''nonexistent'\'' '
}

@test "Test 647. qvm-tags: qvm-tags running 'unset" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running '\''unset'
}

@test "Test 648. qvm-tags: qvm-tags running 'unset' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' '
}

@test "Test 649. qvm-tags: qvm-tags running 'unset' 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''unset'\'' '\''gui'
}

@test "Test 650. qvm-tags: qvm-tags running 'unset' 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' '\''guivm-dom0'\'' '
}

@test "Test 651. qvm-tags: qvm-tags running 'unset' 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 652. qvm-tags: qvm-tags running 'unset' 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 653. qvm-tags: qvm-tags running 'unset' 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''unset'\'' '\''nonexistent'
}

@test "Test 654. qvm-tags: qvm-tags running 'unset' 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''unset'\'' '\''nonexistent'\'' '
}

@test "Test 655. qvm-tags: qvm-tags running 'u" {
    EXPECTED_COMPREPLY=([0]="unset")
    test_wrapper 'qvm-tags running '\''u'
}

@test "Test 656. qvm-tags: qvm-tags running 'u' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' '
}

@test "Test 657. qvm-tags: qvm-tags running 'u' 'gui" {
    EXPECTED_COMPREPLY=([0]="guivm-dom0")
    test_wrapper 'qvm-tags running '\''u'\'' '\''gui'
}

@test "Test 658. qvm-tags: qvm-tags running 'u' 'guivm-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' '\''guivm-dom0'\'' '
}

@test "Test 659. qvm-tags: qvm-tags running 'u' 'guivm-dom0' created-by-dom0 " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' '\''guivm-dom0'\'' created-by-dom0 '
}

@test "Test 660. qvm-tags: qvm-tags running 'u' 'guivm-dom0' 'created-by-dom0' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' '\''guivm-dom0'\'' '\''created-by-dom0'\'' '
}

@test "Test 661. qvm-tags: qvm-tags running 'u' 'nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags running '\''u'\'' '\''nonexistent'
}

@test "Test 662. qvm-tags: qvm-tags running 'u' 'nonexistent' " {
    EXPECTED_COMPREPLY=([0]="audiovm-dom0" [1]="created-by-dom0" [2]="guivm-dom0" [3]="anon-vm" [4]="anon-gateway" [5]="whonix-updatevm" [6]="debian")
    test_wrapper 'qvm-tags running '\''u'\'' '\''nonexistent'\'' '
}

@test "Test 663. qvm-tags: qvm-tags --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-tags --something_unknown '
}

@test "Test 664. qvm-tags: qvm-tags --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags --something_unknown='
}

@test "Test 665. qvm-tags: qvm-tags --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="-v" [2]="--quiet" [3]="-q" [4]="--help" [5]="-h")
    test_wrapper 'qvm-tags --something_unknown -'
}

@test "Test 666. qvm-tags: qvm-tags --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--verbose" [1]="--quiet" [2]="--help")
    test_wrapper 'qvm-tags --something_unknown --'
}

@test "Test 667. qvm-tags: qvm-tags --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-tags --something_unknown -- '
}

@test "Test 668. qvm-tags: qvm-tags --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-tags --something_unknown -h'
}

@test "Test 669. qvm-tags: qvm-tags --something_unknown --d" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-tags --something_unknown --d'
}

