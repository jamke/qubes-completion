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
    EXPECTED_COMPREPLY=([0]="autostart" [1]="debug" [2]="template_for_dispvms" [3]="include_in_backups" [4]="provides_network" [5]="installed_by_rpm" [6]="updateable" [7]="audiovm" [8]="default_dispvm" [9]="netvm" [10]="template" [11]="guivm" [12]="management_dispvm" [13]="default_user" [14]="ip" [15]="kernel" [16]="kernelopts" [17]="mac" [18]="maxmem" [19]="memory" [20]="name" [21]="qrexec_timeout" [22]="stubdom_mem" [23]="stubdom_xid" [24]="vcpus" [25]="backup_timestamp" [26]="dns" [27]="gateway" [28]="gateway6" [29]="icon" [30]="ip6" [31]="keyboard_layout" [32]="qid" [33]="shutdown_timeout" [34]="start_time" [35]="uuid" [36]="visible_gateway" [37]="visible_gateway6" [38]="visible_ip" [39]="visible_ip6" [40]="visible_netmask" [41]="xid" [42]="label" [43]="virt_mode" [44]="klass" [45]="CLASS" [46]="DISK" [47]="FLAGS" [48]="GATEWAY" [49]="MEMORY" [50]="PRIV-CURR" [51]="PRIV-MAX" [52]="PRIV-USED" [53]="ROOT-CURR" [54]="ROOT-MAX" [55]="ROOT-USED" [56]="STATE")
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
    EXPECTED_COMPREPLY=([0]="autostart" [1]="debug" [2]="template_for_dispvms" [3]="include_in_backups" [4]="provides_network" [5]="installed_by_rpm" [6]="updateable" [7]="audiovm" [8]="default_dispvm" [9]="netvm" [10]="template" [11]="guivm" [12]="management_dispvm" [13]="default_user" [14]="ip" [15]="kernel" [16]="kernelopts" [17]="mac" [18]="maxmem" [19]="memory" [20]="name" [21]="qrexec_timeout" [22]="stubdom_mem" [23]="stubdom_xid" [24]="vcpus" [25]="backup_timestamp" [26]="dns" [27]="gateway" [28]="gateway6" [29]="icon" [30]="ip6" [31]="keyboard_layout" [32]="qid" [33]="shutdown_timeout" [34]="start_time" [35]="uuid" [36]="visible_gateway" [37]="visible_gateway6" [38]="visible_ip" [39]="visible_ip6" [40]="visible_netmask" [41]="xid" [42]="label" [43]="virt_mode" [44]="klass" [45]="CLASS" [46]="DISK" [47]="FLAGS" [48]="GATEWAY" [49]="MEMORY" [50]="PRIV-CURR" [51]="PRIV-MAX" [52]="PRIV-USED" [53]="ROOT-CURR" [54]="ROOT-MAX" [55]="ROOT-USED" [56]="STATE")
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
    EXPECTED_COMPREPLY=([0]="autostart" [1]="debug" [2]="template_for_dispvms" [3]="include_in_backups" [4]="provides_network" [5]="installed_by_rpm" [6]="updateable" [7]="audiovm" [8]="default_dispvm" [9]="netvm" [10]="template" [11]="guivm" [12]="management_dispvm" [13]="default_user" [14]="ip" [15]="kernel" [16]="kernelopts" [17]="mac" [18]="maxmem" [19]="memory" [20]="name" [21]="qrexec_timeout" [22]="stubdom_mem" [23]="stubdom_xid" [24]="vcpus" [25]="backup_timestamp" [26]="dns" [27]="gateway" [28]="gateway6" [29]="icon" [30]="ip6" [31]="keyboard_layout" [32]="qid" [33]="shutdown_timeout" [34]="start_time" [35]="uuid" [36]="visible_gateway" [37]="visible_gateway6" [38]="visible_ip" [39]="visible_ip6" [40]="visible_netmask" [41]="xid" [42]="label" [43]="virt_mode" [44]="klass" [45]="CLASS" [46]="DISK" [47]="FLAGS" [48]="GATEWAY" [49]="MEMORY" [50]="PRIV-CURR" [51]="PRIV-MAX" [52]="PRIV-USED" [53]="ROOT-CURR" [54]="ROOT-MAX" [55]="ROOT-USED" [56]="STATE")
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
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
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
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
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
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
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
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
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
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
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
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
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

