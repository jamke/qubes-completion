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

@test "Test 000. qvm-features: qvm-features " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-features '
}

@test "Test 001. qvm-features: qvm-features -" {
    EXPECTED_COMPREPLY=([0]="--unset" [1]="--default" [2]="--delete" [3]="--D" [4]="--verbose" [5]="-v" [6]="--quiet" [7]="-q" [8]="--help" [9]="-h")
    test_wrapper 'qvm-features -'
}

@test "Test 002. qvm-features: qvm-features --" {
    EXPECTED_COMPREPLY=([0]="--unset" [1]="--default" [2]="--delete" [3]="--D" [4]="--verbose" [5]="--quiet" [6]="--help")
    test_wrapper 'qvm-features --'
}

@test "Test 003. qvm-features: qvm-features -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-features -- '
}

@test "Test 004. qvm-features: qvm-features -- -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-features -- -'
}

@test "Test 005. qvm-features: qvm-features -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-features -h'
}

@test "Test 006. qvm-features: qvm-features --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-features --h'
}

@test "Test 007. qvm-features: qvm-features run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-features run'
}

@test "Test 008. qvm-features: qvm-features runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-features runnin'
}

@test "Test 009. qvm-features: qvm-features running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-features running'
}

@test "Test 010. qvm-features: qvm-features running " {
    EXPECTED_COMPREPLY=([0]="gui" [1]="gui-emulated" [2]="gui-default-allow-utf8-titles" [3]="input-dom0-proxy" [4]="qrexec" [5]="rpc-clipboard" [6]="no-monitor-layout" [7]="internal" [8]="appmenus-legacy" [9]="appmenus-dispvm" [10]="qubes-firewall" [11]="updates-available" [12]="video-model" [13]="net.fake-ip" [14]="net.fake-gateway" [15]="net.fake-netmask" [16]="pci-e820-host" [17]="linux-stubdom" [18]="tag-created-vm-with" [19]="set-created-guivm" [20]="check-updates" [21]="menu-items" [22]="qubesmanager.maxmem_value" [23]="servicevm" [24]="service.clocksync" [25]="service.qubes-update-check" [26]="default-menu-items" [27]="netvm-menu-items" [28]="os" [29]="vmexec" [30]="template-name" [31]="template-epoch" [32]="template-version" [33]="template-release" [34]="template-reponame" [35]="template-buildtime" [36]="template-installtime" [37]="template-license" [38]="template-url" [39]="template-summary" [40]="template-description" [41]="supported-service.guivm-gui-agent" [42]="supported-service.qubes-update-check" [43]="supported-service.qubes-updates-proxy" [44]="supported-service.qubes-firewall" [45]="supported-service.qubes-network" [46]="supported-service.clocksync" [47]="supported-service.updates-proxy-setup" [48]="supported-service.meminfo-writer" [49]="audio-model" [50]="stubdom-qrexec" [51]="timezone" [52]="timer-period" [53]="out.latency" [54]="out.buffer-length")
    test_wrapper 'qvm-features running '
}

@test "Test 011. qvm-features: qvm-features \"run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-features "run'
}

@test "Test 012. qvm-features: qvm-features \"runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-features "runnin'
}

@test "Test 013. qvm-features: qvm-features \"running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-features "running'
}

@test "Test 014. qvm-features: qvm-features \"running\" " {
    EXPECTED_COMPREPLY=([0]="gui" [1]="gui-emulated" [2]="gui-default-allow-utf8-titles" [3]="input-dom0-proxy" [4]="qrexec" [5]="rpc-clipboard" [6]="no-monitor-layout" [7]="internal" [8]="appmenus-legacy" [9]="appmenus-dispvm" [10]="qubes-firewall" [11]="updates-available" [12]="video-model" [13]="net.fake-ip" [14]="net.fake-gateway" [15]="net.fake-netmask" [16]="pci-e820-host" [17]="linux-stubdom" [18]="tag-created-vm-with" [19]="set-created-guivm" [20]="check-updates" [21]="menu-items" [22]="qubesmanager.maxmem_value" [23]="servicevm" [24]="service.clocksync" [25]="service.qubes-update-check" [26]="default-menu-items" [27]="netvm-menu-items" [28]="os" [29]="vmexec" [30]="template-name" [31]="template-epoch" [32]="template-version" [33]="template-release" [34]="template-reponame" [35]="template-buildtime" [36]="template-installtime" [37]="template-license" [38]="template-url" [39]="template-summary" [40]="template-description" [41]="supported-service.guivm-gui-agent" [42]="supported-service.qubes-update-check" [43]="supported-service.qubes-updates-proxy" [44]="supported-service.qubes-firewall" [45]="supported-service.qubes-network" [46]="supported-service.clocksync" [47]="supported-service.updates-proxy-setup" [48]="supported-service.meminfo-writer" [49]="audio-model" [50]="stubdom-qrexec" [51]="timezone" [52]="timer-period" [53]="out.latency" [54]="out.buffer-length")
    test_wrapper 'qvm-features "running" '
}

@test "Test 015. qvm-features: qvm-features 'run" {
    EXPECTED_COMPREPLY=([0]="runname2" [1]="running")
    test_wrapper 'qvm-features '\''run'
}

@test "Test 016. qvm-features: qvm-features 'runnin" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-features '\''runnin'
}

@test "Test 017. qvm-features: qvm-features 'running" {
    EXPECTED_COMPREPLY=([0]="running")
    test_wrapper 'qvm-features '\''running'
}

@test "Test 018. qvm-features: qvm-features 'running' " {
    EXPECTED_COMPREPLY=([0]="gui" [1]="gui-emulated" [2]="gui-default-allow-utf8-titles" [3]="input-dom0-proxy" [4]="qrexec" [5]="rpc-clipboard" [6]="no-monitor-layout" [7]="internal" [8]="appmenus-legacy" [9]="appmenus-dispvm" [10]="qubes-firewall" [11]="updates-available" [12]="video-model" [13]="net.fake-ip" [14]="net.fake-gateway" [15]="net.fake-netmask" [16]="pci-e820-host" [17]="linux-stubdom" [18]="tag-created-vm-with" [19]="set-created-guivm" [20]="check-updates" [21]="menu-items" [22]="qubesmanager.maxmem_value" [23]="servicevm" [24]="service.clocksync" [25]="service.qubes-update-check" [26]="default-menu-items" [27]="netvm-menu-items" [28]="os" [29]="vmexec" [30]="template-name" [31]="template-epoch" [32]="template-version" [33]="template-release" [34]="template-reponame" [35]="template-buildtime" [36]="template-installtime" [37]="template-license" [38]="template-url" [39]="template-summary" [40]="template-description" [41]="supported-service.guivm-gui-agent" [42]="supported-service.qubes-update-check" [43]="supported-service.qubes-updates-proxy" [44]="supported-service.qubes-firewall" [45]="supported-service.qubes-network" [46]="supported-service.clocksync" [47]="supported-service.updates-proxy-setup" [48]="supported-service.meminfo-writer" [49]="audio-model" [50]="stubdom-qrexec" [51]="timezone" [52]="timer-period" [53]="out.latency" [54]="out.buffer-length")
    test_wrapper 'qvm-features '\''running'\'' '
}

@test "Test 019. qvm-features: qvm-features nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-features nonexistent'
}

@test "Test 020. qvm-features: qvm-features nonexistent " {
    EXPECTED_COMPREPLY=([0]="gui" [1]="gui-emulated" [2]="gui-default-allow-utf8-titles" [3]="input-dom0-proxy" [4]="qrexec" [5]="rpc-clipboard" [6]="no-monitor-layout" [7]="internal" [8]="appmenus-legacy" [9]="appmenus-dispvm" [10]="qubes-firewall" [11]="updates-available" [12]="video-model" [13]="net.fake-ip" [14]="net.fake-gateway" [15]="net.fake-netmask" [16]="pci-e820-host" [17]="linux-stubdom" [18]="tag-created-vm-with" [19]="set-created-guivm" [20]="check-updates" [21]="menu-items" [22]="qubesmanager.maxmem_value" [23]="servicevm" [24]="service.clocksync" [25]="service.qubes-update-check" [26]="default-menu-items" [27]="netvm-menu-items" [28]="os" [29]="vmexec" [30]="template-name" [31]="template-epoch" [32]="template-version" [33]="template-release" [34]="template-reponame" [35]="template-buildtime" [36]="template-installtime" [37]="template-license" [38]="template-url" [39]="template-summary" [40]="template-description" [41]="supported-service.guivm-gui-agent" [42]="supported-service.qubes-update-check" [43]="supported-service.qubes-updates-proxy" [44]="supported-service.qubes-firewall" [45]="supported-service.qubes-network" [46]="supported-service.clocksync" [47]="supported-service.updates-proxy-setup" [48]="supported-service.meminfo-writer" [49]="audio-model" [50]="stubdom-qrexec" [51]="timezone" [52]="timer-period" [53]="out.latency" [54]="out.buffer-length")
    test_wrapper 'qvm-features nonexistent '
}

@test "Test 021. qvm-features: qvm-features nonexistent -" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-features nonexistent -'
}

@test "Test 022. qvm-features: qvm-features nonexistent --" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-features nonexistent --'
}

@test "Test 023. qvm-features: qvm-features nonexistent -- " {
    EXPECTED_COMPREPLY=([0]="gui" [1]="gui-emulated" [2]="gui-default-allow-utf8-titles" [3]="input-dom0-proxy" [4]="qrexec" [5]="rpc-clipboard" [6]="no-monitor-layout" [7]="internal" [8]="appmenus-legacy" [9]="appmenus-dispvm" [10]="qubes-firewall" [11]="updates-available" [12]="video-model" [13]="net.fake-ip" [14]="net.fake-gateway" [15]="net.fake-netmask" [16]="pci-e820-host" [17]="linux-stubdom" [18]="tag-created-vm-with" [19]="set-created-guivm" [20]="check-updates" [21]="menu-items" [22]="qubesmanager.maxmem_value" [23]="servicevm" [24]="service.clocksync" [25]="service.qubes-update-check" [26]="default-menu-items" [27]="netvm-menu-items" [28]="os" [29]="vmexec" [30]="template-name" [31]="template-epoch" [32]="template-version" [33]="template-release" [34]="template-reponame" [35]="template-buildtime" [36]="template-installtime" [37]="template-license" [38]="template-url" [39]="template-summary" [40]="template-description" [41]="supported-service.guivm-gui-agent" [42]="supported-service.qubes-update-check" [43]="supported-service.qubes-updates-proxy" [44]="supported-service.qubes-firewall" [45]="supported-service.qubes-network" [46]="supported-service.clocksync" [47]="supported-service.updates-proxy-setup" [48]="supported-service.meminfo-writer" [49]="audio-model" [50]="stubdom-qrexec" [51]="timezone" [52]="timer-period" [53]="out.latency" [54]="out.buffer-length")
    test_wrapper 'qvm-features nonexistent -- '
}

@test "Test 024. qvm-features: qvm-features nonexistent -h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-features nonexistent -h'
}

@test "Test 025. qvm-features: qvm-features nonexistent --h" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-features nonexistent --h'
}

@test "Test 026. qvm-features: qvm-features --something_unknown" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-features --something_unknown'
}

@test "Test 027. qvm-features: qvm-features --something_unknown " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-features --something_unknown '
}

@test "Test 028. qvm-features: qvm-features --something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-features --something_unknown='
}

@test "Test 029. qvm-features: qvm-features --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="--unset" [1]="--default" [2]="--delete" [3]="--D" [4]="--verbose" [5]="-v" [6]="--quiet" [7]="-q" [8]="--help" [9]="-h")
    test_wrapper 'qvm-features --something_unknown -'
}

@test "Test 030. qvm-features: qvm-features --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--unset" [1]="--default" [2]="--delete" [3]="--D" [4]="--verbose" [5]="--quiet" [6]="--help")
    test_wrapper 'qvm-features --something_unknown --'
}

@test "Test 031. qvm-features: qvm-features --something_unknown -- " {
    EXPECTED_COMPREPLY=([0]="disp" [1]="dom0" [2]="halted" [3]="other" [4]="paused" [5]="personal" [6]="runname2" [7]="running" [8]="standalone1" [9]="standalone2" [10]="standalone3" [11]="standalone4" [12]="sys-usb" [13]="template1" [14]="template2" [15]="template3" [16]="template4" [17]="transient" [18]="vault" [19]="work")
    test_wrapper 'qvm-features --something_unknown -- '
}

@test "Test 032. qvm-features: qvm-features --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qvm-features --something_unknown -h'
}

@test "Test 033. qvm-features: qvm-features --something_unknown --h" {
    EXPECTED_COMPREPLY=([0]="--help")
    test_wrapper 'qvm-features --something_unknown --h'
}

