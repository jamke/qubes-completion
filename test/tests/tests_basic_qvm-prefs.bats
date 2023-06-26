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

@test "Test 000. qvm-prefs: qvm-prefs " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-prefs '
}

@test "Test 001. qvm-prefs: qvm-prefs -" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--help-properties" [2]="--hide-default" [3]="--verbose" [4]="-v" [5]="--quiet" [6]="-q" [7]="--help" [8]="-h")
    test_wrapper 'qvm-prefs -'
}

@test "Test 002. qvm-prefs: qvm-prefs --" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--help-properties" [2]="--hide-default" [3]="--verbose" [4]="--quiet" [5]="--help")
    test_wrapper 'qvm-prefs --'
}

@test "Test 003. qvm-prefs: qvm-prefs -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-prefs -- '
}

@test "Test 004. qvm-prefs: qvm-prefs -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-prefs -- -'
}

@test "Test 005. qvm-prefs: qvm-prefs -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-prefs -h'
}

@test "Test 006. qvm-prefs: qvm-prefs --h" {
    EXPECTED_COMPREPLY=([0]="--help-properties" [1]="--hide-default" [2]="--help")
    test_wrapper 'qvm-prefs --h'
}

@test "Test 007. qvm-prefs: qvm-prefs run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-prefs run'
}

@test "Test 008. qvm-prefs: qvm-prefs runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-prefs runnin'
}

@test "Test 009. qvm-prefs: qvm-prefs running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-prefs running'
}

@test "Test 010. qvm-prefs: qvm-prefs running " {
    EXPECTED_COMPREPLY=([0]="autostart" [1]="debug" [2]="template_for_dispvms" [3]="include_in_backups" [4]="provides_network" [5]="installed_by_rpm" [6]="updateable" [7]="audiovm" [8]="default_dispvm" [9]="netvm" [10]="template" [11]="guivm" [12]="management_dispvm" [13]="default_user" [14]="ip" [15]="kernel" [16]="kernelopts" [17]="mac" [18]="maxmem" [19]="memory" [20]="name" [21]="qrexec_timeout" [22]="stubdom_mem" [23]="stubdom_xid" [24]="vcpus" [25]="backup_timestamp" [26]="dns" [27]="gateway" [28]="gateway6" [29]="icon" [30]="ip6" [31]="keyboard_layout" [32]="qid" [33]="shutdown_timeout" [34]="start_time" [35]="uuid" [36]="visible_gateway" [37]="visible_gateway6" [38]="visible_ip" [39]="visible_ip6" [40]="visible_netmask" [41]="xid" [42]="label" [43]="virt_mode" [44]="klass")
    test_wrapper 'qvm-prefs running '
}

@test "Test 011. qvm-prefs: qvm-prefs \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-prefs "run'
}

@test "Test 012. qvm-prefs: qvm-prefs \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-prefs "runnin'
}

@test "Test 013. qvm-prefs: qvm-prefs \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-prefs "running'
}

@test "Test 014. qvm-prefs: qvm-prefs \"running\" " {
    EXPECTED_COMPREPLY=([0]="autostart" [1]="debug" [2]="template_for_dispvms" [3]="include_in_backups" [4]="provides_network" [5]="installed_by_rpm" [6]="updateable" [7]="audiovm" [8]="default_dispvm" [9]="netvm" [10]="template" [11]="guivm" [12]="management_dispvm" [13]="default_user" [14]="ip" [15]="kernel" [16]="kernelopts" [17]="mac" [18]="maxmem" [19]="memory" [20]="name" [21]="qrexec_timeout" [22]="stubdom_mem" [23]="stubdom_xid" [24]="vcpus" [25]="backup_timestamp" [26]="dns" [27]="gateway" [28]="gateway6" [29]="icon" [30]="ip6" [31]="keyboard_layout" [32]="qid" [33]="shutdown_timeout" [34]="start_time" [35]="uuid" [36]="visible_gateway" [37]="visible_gateway6" [38]="visible_ip" [39]="visible_ip6" [40]="visible_netmask" [41]="xid" [42]="label" [43]="virt_mode" [44]="klass")
    test_wrapper 'qvm-prefs "running" '
}

@test "Test 015. qvm-prefs: qvm-prefs 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-prefs '\''run'
}

@test "Test 016. qvm-prefs: qvm-prefs 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-prefs '\''runnin'
}

@test "Test 017. qvm-prefs: qvm-prefs 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-prefs '\''running'
}

@test "Test 018. qvm-prefs: qvm-prefs 'running' " {
    EXPECTED_COMPREPLY=([0]="autostart" [1]="debug" [2]="template_for_dispvms" [3]="include_in_backups" [4]="provides_network" [5]="installed_by_rpm" [6]="updateable" [7]="audiovm" [8]="default_dispvm" [9]="netvm" [10]="template" [11]="guivm" [12]="management_dispvm" [13]="default_user" [14]="ip" [15]="kernel" [16]="kernelopts" [17]="mac" [18]="maxmem" [19]="memory" [20]="name" [21]="qrexec_timeout" [22]="stubdom_mem" [23]="stubdom_xid" [24]="vcpus" [25]="backup_timestamp" [26]="dns" [27]="gateway" [28]="gateway6" [29]="icon" [30]="ip6" [31]="keyboard_layout" [32]="qid" [33]="shutdown_timeout" [34]="start_time" [35]="uuid" [36]="visible_gateway" [37]="visible_gateway6" [38]="visible_ip" [39]="visible_ip6" [40]="visible_netmask" [41]="xid" [42]="label" [43]="virt_mode" [44]="klass")
    test_wrapper 'qvm-prefs '\''running'\'' '
}

@test "Test 019. qvm-prefs: qvm-prefs nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-prefs nonexistent'
}

@test "Test 020. qvm-prefs: qvm-prefs nonexistent " {
    EXPECTED_COMPREPLY=([0]="autostart" [1]="debug" [2]="template_for_dispvms" [3]="include_in_backups" [4]="provides_network" [5]="installed_by_rpm" [6]="updateable" [7]="audiovm" [8]="default_dispvm" [9]="netvm" [10]="template" [11]="guivm" [12]="management_dispvm" [13]="default_user" [14]="ip" [15]="kernel" [16]="kernelopts" [17]="mac" [18]="maxmem" [19]="memory" [20]="name" [21]="qrexec_timeout" [22]="stubdom_mem" [23]="stubdom_xid" [24]="vcpus" [25]="backup_timestamp" [26]="dns" [27]="gateway" [28]="gateway6" [29]="icon" [30]="ip6" [31]="keyboard_layout" [32]="qid" [33]="shutdown_timeout" [34]="start_time" [35]="uuid" [36]="visible_gateway" [37]="visible_gateway6" [38]="visible_ip" [39]="visible_ip6" [40]="visible_netmask" [41]="xid" [42]="label" [43]="virt_mode" [44]="klass")
    test_wrapper 'qvm-prefs nonexistent '
}

@test "Test 021. qvm-prefs: qvm-prefs nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-prefs nonexistent -'
}

@test "Test 022. qvm-prefs: qvm-prefs nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-prefs nonexistent --'
}

@test "Test 023. qvm-prefs: qvm-prefs nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="autostart" [1]="debug" [2]="template_for_dispvms" [3]="include_in_backups" [4]="provides_network" [5]="installed_by_rpm" [6]="updateable" [7]="audiovm" [8]="default_dispvm" [9]="netvm" [10]="template" [11]="guivm" [12]="management_dispvm" [13]="default_user" [14]="ip" [15]="kernel" [16]="kernelopts" [17]="mac" [18]="maxmem" [19]="memory" [20]="name" [21]="qrexec_timeout" [22]="stubdom_mem" [23]="stubdom_xid" [24]="vcpus" [25]="backup_timestamp" [26]="dns" [27]="gateway" [28]="gateway6" [29]="icon" [30]="ip6" [31]="keyboard_layout" [32]="qid" [33]="shutdown_timeout" [34]="start_time" [35]="uuid" [36]="visible_gateway" [37]="visible_gateway6" [38]="visible_ip" [39]="visible_ip6" [40]="visible_netmask" [41]="xid" [42]="label" [43]="virt_mode" [44]="klass")
    test_wrapper 'qvm-prefs nonexistent -- '
}

@test "Test 024. qvm-prefs: qvm-prefs nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-prefs nonexistent -h'
}

@test "Test 025. qvm-prefs: qvm-prefs nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-prefs nonexistent --h'
}

@test "Test 026. qvm-prefs: qvm-prefs --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-prefs --something_unknown'
}

@test "Test 027. qvm-prefs: qvm-prefs --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-prefs --something_unknown '
}

@test "Test 028. qvm-prefs: qvm-prefs --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-prefs --something_unknown='
}

@test "Test 029. qvm-prefs: qvm-prefs --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--help-properties" [2]="--hide-default" [3]="--verbose" [4]="-v" [5]="--quiet" [6]="-q" [7]="--help" [8]="-h")
    test_wrapper 'qvm-prefs --something_unknown -'
}

@test "Test 030. qvm-prefs: qvm-prefs --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--force-root" [1]="--help-properties" [2]="--hide-default" [3]="--verbose" [4]="--quiet" [5]="--help")
    test_wrapper 'qvm-prefs --something_unknown --'
}

@test "Test 031. qvm-prefs: qvm-prefs --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="halted" [2]="other" [3]="paused" [4]="personal" [5]="runname2" [6]="running" [7]="standalone1" [8]="standalone2" [9]="standalone3" [10]="standalone4" [11]="sys-usb" [12]="template1" [13]="template2" [14]="template3" [15]="template4" [16]="transient" [17]="vault" [18]="work")
    test_wrapper 'qvm-prefs --something_unknown -- '
}

@test "Test 032. qvm-prefs: qvm-prefs --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-prefs --something_unknown -h'
}

@test "Test 033. qvm-prefs: qvm-prefs --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help-properties" [1]="--hide-default" [2]="--help")
    test_wrapper 'qvm-prefs --something_unknown --h'
}

