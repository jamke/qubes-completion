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

@test "Test 000. qvm-service: qvm-service " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-service '
}

@test "Test 001. qvm-service: qvm-service -" {
    EXPECTED_COMPREPLY=([0]="--list" [1]="-l" [2]="--enable" [3]="-e" [4]="--disable" [5]="-d" [6]="--default" [7]="-D" [8]="--delete" [9]="--unset" [10]="--verbose" [11]="-v" [12]="--quiet" [13]="-q" [14]="--help" [15]="-h")
    test_wrapper 'qvm-service -'
}

@test "Test 002. qvm-service: qvm-service --" {
    EXPECTED_COMPREPLY=([0]="--list" [1]="--enable" [2]="--disable" [3]="--default" [4]="--delete" [5]="--unset" [6]="--verbose" [7]="--quiet" [8]="--help")
    test_wrapper 'qvm-service --'
}

@test "Test 003. qvm-service: qvm-service -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-service -- '
}

@test "Test 004. qvm-service: qvm-service -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-service -- -'
}

@test "Test 005. qvm-service: qvm-service -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-service -h'
}

@test "Test 006. qvm-service: qvm-service --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-service --h'
}

@test "Test 007. qvm-service: qvm-service run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-service run'
}

@test "Test 008. qvm-service: qvm-service runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-service runnin'
}

@test "Test 009. qvm-service: qvm-service running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-service running'
}

@test "Test 010. qvm-service: qvm-service running " {
    EXPECTED_COMPREPLY=([0]="meminfo-writer" [1]="qubes-firewall" [2]="qubes-network" [3]="qubes-update-check" [4]="cups" [5]="crond" [6]="network-manager" [7]="clocksync" [8]="qubes-updates-proxy" [9]="updates-proxy-setup" [10]="disable-default-route" [11]="disable-dns-server" [12]="lightdm" [13]="software-rendering" [14]="guivm" [15]="guivm-gui-agent" [16]="guivm-vnc" [17]="tracker" [18]="evolution-data-server" [19]="usb-reset-on-attach")
    test_wrapper 'qvm-service running '
}

@test "Test 011. qvm-service: qvm-service \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-service "run'
}

@test "Test 012. qvm-service: qvm-service \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-service "runnin'
}

@test "Test 013. qvm-service: qvm-service \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-service "running'
}

@test "Test 014. qvm-service: qvm-service \"running\" " {
    EXPECTED_COMPREPLY=([0]="meminfo-writer" [1]="qubes-firewall" [2]="qubes-network" [3]="qubes-update-check" [4]="cups" [5]="crond" [6]="network-manager" [7]="clocksync" [8]="qubes-updates-proxy" [9]="updates-proxy-setup" [10]="disable-default-route" [11]="disable-dns-server" [12]="lightdm" [13]="software-rendering" [14]="guivm" [15]="guivm-gui-agent" [16]="guivm-vnc" [17]="tracker" [18]="evolution-data-server" [19]="usb-reset-on-attach")
    test_wrapper 'qvm-service "running" '
}

@test "Test 015. qvm-service: qvm-service 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-service '\''run'
}

@test "Test 016. qvm-service: qvm-service 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-service '\''runnin'
}

@test "Test 017. qvm-service: qvm-service 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-service '\''running'
}

@test "Test 018. qvm-service: qvm-service 'running' " {
    EXPECTED_COMPREPLY=([0]="meminfo-writer" [1]="qubes-firewall" [2]="qubes-network" [3]="qubes-update-check" [4]="cups" [5]="crond" [6]="network-manager" [7]="clocksync" [8]="qubes-updates-proxy" [9]="updates-proxy-setup" [10]="disable-default-route" [11]="disable-dns-server" [12]="lightdm" [13]="software-rendering" [14]="guivm" [15]="guivm-gui-agent" [16]="guivm-vnc" [17]="tracker" [18]="evolution-data-server" [19]="usb-reset-on-attach")
    test_wrapper 'qvm-service '\''running'\'' '
}

@test "Test 019. qvm-service: qvm-service nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-service nonexistent'
}

@test "Test 020. qvm-service: qvm-service nonexistent " {
    EXPECTED_COMPREPLY=([0]="meminfo-writer" [1]="qubes-firewall" [2]="qubes-network" [3]="qubes-update-check" [4]="cups" [5]="crond" [6]="network-manager" [7]="clocksync" [8]="qubes-updates-proxy" [9]="updates-proxy-setup" [10]="disable-default-route" [11]="disable-dns-server" [12]="lightdm" [13]="software-rendering" [14]="guivm" [15]="guivm-gui-agent" [16]="guivm-vnc" [17]="tracker" [18]="evolution-data-server" [19]="usb-reset-on-attach")
    test_wrapper 'qvm-service nonexistent '
}

@test "Test 021. qvm-service: qvm-service nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-service nonexistent -'
}

@test "Test 022. qvm-service: qvm-service nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-service nonexistent --'
}

@test "Test 023. qvm-service: qvm-service nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="meminfo-writer" [1]="qubes-firewall" [2]="qubes-network" [3]="qubes-update-check" [4]="cups" [5]="crond" [6]="network-manager" [7]="clocksync" [8]="qubes-updates-proxy" [9]="updates-proxy-setup" [10]="disable-default-route" [11]="disable-dns-server" [12]="lightdm" [13]="software-rendering" [14]="guivm" [15]="guivm-gui-agent" [16]="guivm-vnc" [17]="tracker" [18]="evolution-data-server" [19]="usb-reset-on-attach")
    test_wrapper 'qvm-service nonexistent -- '
}

@test "Test 024. qvm-service: qvm-service nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-service nonexistent -h'
}

@test "Test 025. qvm-service: qvm-service nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-service nonexistent --h'
}

@test "Test 026. qvm-service: qvm-service --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-service --something_unknown'
}

@test "Test 027. qvm-service: qvm-service --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-service --something_unknown '
}

@test "Test 028. qvm-service: qvm-service --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-service --something_unknown='
}

@test "Test 029. qvm-service: qvm-service --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--list" [1]="-l" [2]="--enable" [3]="-e" [4]="--disable" [5]="-d" [6]="--default" [7]="-D" [8]="--delete" [9]="--unset" [10]="--verbose" [11]="-v" [12]="--quiet" [13]="-q" [14]="--help" [15]="-h")
    test_wrapper 'qvm-service --something_unknown -'
}

@test "Test 030. qvm-service: qvm-service --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--list" [1]="--enable" [2]="--disable" [3]="--default" [4]="--delete" [5]="--unset" [6]="--verbose" [7]="--quiet" [8]="--help")
    test_wrapper 'qvm-service --something_unknown --'
}

@test "Test 031. qvm-service: qvm-service --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-service --something_unknown -- '
}

@test "Test 032. qvm-service: qvm-service --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-service --something_unknown -h'
}

@test "Test 033. qvm-service: qvm-service --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-service --something_unknown --h'
}

