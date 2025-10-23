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
    EXPECTED_COMPREPLY=([0]="--unset" [1]="--default" [2]="--delete" [3]="-D" [4]="--verbose" [5]="-v" [6]="--quiet" [7]="-q" [8]="--help" [9]="-h")
    test_wrapper 'qvm-features -'
}

@test "Test 002. qvm-features: qvm-features --" {
    EXPECTED_COMPREPLY=([0]="--unset" [1]="--default" [2]="--delete" [3]="--verbose" [4]="--quiet" [5]="--help")
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
    EXPECTED_COMPREPLY=([0]="gui" [1]="gui-emulated" [2]="gui-default-allow-utf8-titles" [3]="input-dom0-proxy" [4]="qrexec" [5]="rpc-clipboard" [6]="no-monitor-layout" [7]="internal" [8]="appmenus-legacy" [9]="appmenus-dispvm" [10]="qubes-firewall" [11]="updates-available" [12]="video-model" [13]="net.fake-ip" [14]="net.fake-gateway" [15]="net.fake-netmask" [16]="pci-e820-host" [17]="linux-stubdom" [18]="tag-created-vm-with" [19]="set-created-guivm" [20]="check-updates" [21]="menu-items" [22]="qubesmanager.maxmem_value" [23]="servicevm" [24]="service.clocksync" [25]="service.qubes-update-check" [26]="default-menu-items" [27]="netvm-menu-items" [28]="os" [29]="vmexec" [30]="audio-model" [31]="stubdom-qrexec" [32]="timezone" [33]="timer-period" [34]="out.latency" [35]="out.buffer-length" [36]="gui-videoram-min" [37]="gui-videoram-overhead" [38]="gui-default-secure-copy-sequence" [39]="gui-default-secure-paste-sequence" [40]="last-update" [41]="last-update-check" [42]="selinux" [43]="apparmor" [44]="supported-service.apparmor" [45]="supported-service.crond" [46]="supported-service.network-manager" [47]="supported-service.pipewire" [48]="supported-service.cups" [49]="supported-service.gui-agent-clipboard-wipe" [50]="supported-service.guivm-gui-agent" [51]="supported-service.qubes-update-check" [52]="supported-service.qubes-updates-proxy" [53]="supported-service.qubes-firewall" [54]="supported-service.qubes-network" [55]="supported-service.clocksync" [56]="supported-service.updates-proxy-setup" [57]="supported-service.meminfo-writer" [58]="supported-service.modem-manager" [59]="supported-service.blueman" [60]="supported-rpc.qubes.SetMonitorLayout" [61]="supported-rpc.qubes.SelectFile" [62]="supported-rpc.qubes.UpdatesProxy" [63]="supported-rpc.qubes.TemplateDownload" [64]="supported-rpc.qubes.PostInstall" [65]="supported-rpc.qubes.VMExec" [66]="supported-rpc.qubes.Backup" [67]="supported-rpc.qubes.ShowInTerminal" [68]="supported-rpc.qubes.RegisterBackupLocation" [69]="supported-rpc.qubes.WaitForSession" [70]="supported-rpc.qubes.SetDateTime" [71]="supported-rpc.qubes.TemplateSearch" [72]="supported-rpc.qubes.GetAppmenus" [73]="supported-rpc.qubes.DetachPciDevice" [74]="supported-rpc.qubes.SuspendPost" [75]="supported-rpc.qubes.OpenURL" [76]="supported-rpc.qubes.StartApp" [77]="supported-rpc.qubes.ConnectTCP" [78]="supported-rpc.qubes.ResizeDisk" [79]="supported-rpc.qubes.SuspendPreAll" [80]="supported-rpc.qubes.SelectDirectory" [81]="supported-rpc.qubes.VMRootShell" [82]="supported-rpc.qubes.Gpg" [83]="supported-rpc.qubes.PdfConvert" [84]="supported-rpc.qubes.USBDetach" [85]="supported-rpc.qubes.RestoreById" [86]="supported-rpc.qubes.GpgImportKey" [87]="supported-rpc.qubes.GuiVMSession" [88]="supported-rpc.qubes.VMExecGUI" [89]="supported-rpc.qubes.USB" [90]="supported-rpc.qubes.Filecopy" [91]="supported-rpc.qubes.SuspendPostAll" [92]="supported-rpc.qubes.VMShell" [93]="supported-rpc.qubes.GetImageRGBA" [94]="supported-rpc.qubes.GetDate" [95]="supported-rpc.qubes.SuspendPre" [96]="supported-rpc.qubes.USBAttach" [97]="supported-rpc.qubes.InstallUpdatesGUI" [98]="supported-rpc.qubes.OpenInVM" [99]="supported-rpc.qubes.SaltLinuxVM" [100]="supported-rpc.qubes.Restore" [101]="supported-rpc.qubes.AudioInputEnable" [102]="supported-rpc.qubes.AudioInputDisable" [103]="template-name" [104]="template-epoch" [105]="template-version" [106]="template-release" [107]="template-reponame" [108]="template-buildtime" [109]="template-installtime" [110]="template-license" [111]="template-url" [112]="template-summary" [113]="template-description")
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
    EXPECTED_COMPREPLY=([0]="gui" [1]="gui-emulated" [2]="gui-default-allow-utf8-titles" [3]="input-dom0-proxy" [4]="qrexec" [5]="rpc-clipboard" [6]="no-monitor-layout" [7]="internal" [8]="appmenus-legacy" [9]="appmenus-dispvm" [10]="qubes-firewall" [11]="updates-available" [12]="video-model" [13]="net.fake-ip" [14]="net.fake-gateway" [15]="net.fake-netmask" [16]="pci-e820-host" [17]="linux-stubdom" [18]="tag-created-vm-with" [19]="set-created-guivm" [20]="check-updates" [21]="menu-items" [22]="qubesmanager.maxmem_value" [23]="servicevm" [24]="service.clocksync" [25]="service.qubes-update-check" [26]="default-menu-items" [27]="netvm-menu-items" [28]="os" [29]="vmexec" [30]="audio-model" [31]="stubdom-qrexec" [32]="timezone" [33]="timer-period" [34]="out.latency" [35]="out.buffer-length" [36]="gui-videoram-min" [37]="gui-videoram-overhead" [38]="gui-default-secure-copy-sequence" [39]="gui-default-secure-paste-sequence" [40]="last-update" [41]="last-update-check" [42]="selinux" [43]="apparmor" [44]="supported-service.apparmor" [45]="supported-service.crond" [46]="supported-service.network-manager" [47]="supported-service.pipewire" [48]="supported-service.cups" [49]="supported-service.gui-agent-clipboard-wipe" [50]="supported-service.guivm-gui-agent" [51]="supported-service.qubes-update-check" [52]="supported-service.qubes-updates-proxy" [53]="supported-service.qubes-firewall" [54]="supported-service.qubes-network" [55]="supported-service.clocksync" [56]="supported-service.updates-proxy-setup" [57]="supported-service.meminfo-writer" [58]="supported-service.modem-manager" [59]="supported-service.blueman" [60]="supported-rpc.qubes.SetMonitorLayout" [61]="supported-rpc.qubes.SelectFile" [62]="supported-rpc.qubes.UpdatesProxy" [63]="supported-rpc.qubes.TemplateDownload" [64]="supported-rpc.qubes.PostInstall" [65]="supported-rpc.qubes.VMExec" [66]="supported-rpc.qubes.Backup" [67]="supported-rpc.qubes.ShowInTerminal" [68]="supported-rpc.qubes.RegisterBackupLocation" [69]="supported-rpc.qubes.WaitForSession" [70]="supported-rpc.qubes.SetDateTime" [71]="supported-rpc.qubes.TemplateSearch" [72]="supported-rpc.qubes.GetAppmenus" [73]="supported-rpc.qubes.DetachPciDevice" [74]="supported-rpc.qubes.SuspendPost" [75]="supported-rpc.qubes.OpenURL" [76]="supported-rpc.qubes.StartApp" [77]="supported-rpc.qubes.ConnectTCP" [78]="supported-rpc.qubes.ResizeDisk" [79]="supported-rpc.qubes.SuspendPreAll" [80]="supported-rpc.qubes.SelectDirectory" [81]="supported-rpc.qubes.VMRootShell" [82]="supported-rpc.qubes.Gpg" [83]="supported-rpc.qubes.PdfConvert" [84]="supported-rpc.qubes.USBDetach" [85]="supported-rpc.qubes.RestoreById" [86]="supported-rpc.qubes.GpgImportKey" [87]="supported-rpc.qubes.GuiVMSession" [88]="supported-rpc.qubes.VMExecGUI" [89]="supported-rpc.qubes.USB" [90]="supported-rpc.qubes.Filecopy" [91]="supported-rpc.qubes.SuspendPostAll" [92]="supported-rpc.qubes.VMShell" [93]="supported-rpc.qubes.GetImageRGBA" [94]="supported-rpc.qubes.GetDate" [95]="supported-rpc.qubes.SuspendPre" [96]="supported-rpc.qubes.USBAttach" [97]="supported-rpc.qubes.InstallUpdatesGUI" [98]="supported-rpc.qubes.OpenInVM" [99]="supported-rpc.qubes.SaltLinuxVM" [100]="supported-rpc.qubes.Restore" [101]="supported-rpc.qubes.AudioInputEnable" [102]="supported-rpc.qubes.AudioInputDisable" [103]="template-name" [104]="template-epoch" [105]="template-version" [106]="template-release" [107]="template-reponame" [108]="template-buildtime" [109]="template-installtime" [110]="template-license" [111]="template-url" [112]="template-summary" [113]="template-description")
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
    EXPECTED_COMPREPLY=([0]="gui" [1]="gui-emulated" [2]="gui-default-allow-utf8-titles" [3]="input-dom0-proxy" [4]="qrexec" [5]="rpc-clipboard" [6]="no-monitor-layout" [7]="internal" [8]="appmenus-legacy" [9]="appmenus-dispvm" [10]="qubes-firewall" [11]="updates-available" [12]="video-model" [13]="net.fake-ip" [14]="net.fake-gateway" [15]="net.fake-netmask" [16]="pci-e820-host" [17]="linux-stubdom" [18]="tag-created-vm-with" [19]="set-created-guivm" [20]="check-updates" [21]="menu-items" [22]="qubesmanager.maxmem_value" [23]="servicevm" [24]="service.clocksync" [25]="service.qubes-update-check" [26]="default-menu-items" [27]="netvm-menu-items" [28]="os" [29]="vmexec" [30]="audio-model" [31]="stubdom-qrexec" [32]="timezone" [33]="timer-period" [34]="out.latency" [35]="out.buffer-length" [36]="gui-videoram-min" [37]="gui-videoram-overhead" [38]="gui-default-secure-copy-sequence" [39]="gui-default-secure-paste-sequence" [40]="last-update" [41]="last-update-check" [42]="selinux" [43]="apparmor" [44]="supported-service.apparmor" [45]="supported-service.crond" [46]="supported-service.network-manager" [47]="supported-service.pipewire" [48]="supported-service.cups" [49]="supported-service.gui-agent-clipboard-wipe" [50]="supported-service.guivm-gui-agent" [51]="supported-service.qubes-update-check" [52]="supported-service.qubes-updates-proxy" [53]="supported-service.qubes-firewall" [54]="supported-service.qubes-network" [55]="supported-service.clocksync" [56]="supported-service.updates-proxy-setup" [57]="supported-service.meminfo-writer" [58]="supported-service.modem-manager" [59]="supported-service.blueman" [60]="supported-rpc.qubes.SetMonitorLayout" [61]="supported-rpc.qubes.SelectFile" [62]="supported-rpc.qubes.UpdatesProxy" [63]="supported-rpc.qubes.TemplateDownload" [64]="supported-rpc.qubes.PostInstall" [65]="supported-rpc.qubes.VMExec" [66]="supported-rpc.qubes.Backup" [67]="supported-rpc.qubes.ShowInTerminal" [68]="supported-rpc.qubes.RegisterBackupLocation" [69]="supported-rpc.qubes.WaitForSession" [70]="supported-rpc.qubes.SetDateTime" [71]="supported-rpc.qubes.TemplateSearch" [72]="supported-rpc.qubes.GetAppmenus" [73]="supported-rpc.qubes.DetachPciDevice" [74]="supported-rpc.qubes.SuspendPost" [75]="supported-rpc.qubes.OpenURL" [76]="supported-rpc.qubes.StartApp" [77]="supported-rpc.qubes.ConnectTCP" [78]="supported-rpc.qubes.ResizeDisk" [79]="supported-rpc.qubes.SuspendPreAll" [80]="supported-rpc.qubes.SelectDirectory" [81]="supported-rpc.qubes.VMRootShell" [82]="supported-rpc.qubes.Gpg" [83]="supported-rpc.qubes.PdfConvert" [84]="supported-rpc.qubes.USBDetach" [85]="supported-rpc.qubes.RestoreById" [86]="supported-rpc.qubes.GpgImportKey" [87]="supported-rpc.qubes.GuiVMSession" [88]="supported-rpc.qubes.VMExecGUI" [89]="supported-rpc.qubes.USB" [90]="supported-rpc.qubes.Filecopy" [91]="supported-rpc.qubes.SuspendPostAll" [92]="supported-rpc.qubes.VMShell" [93]="supported-rpc.qubes.GetImageRGBA" [94]="supported-rpc.qubes.GetDate" [95]="supported-rpc.qubes.SuspendPre" [96]="supported-rpc.qubes.USBAttach" [97]="supported-rpc.qubes.InstallUpdatesGUI" [98]="supported-rpc.qubes.OpenInVM" [99]="supported-rpc.qubes.SaltLinuxVM" [100]="supported-rpc.qubes.Restore" [101]="supported-rpc.qubes.AudioInputEnable" [102]="supported-rpc.qubes.AudioInputDisable" [103]="template-name" [104]="template-epoch" [105]="template-version" [106]="template-release" [107]="template-reponame" [108]="template-buildtime" [109]="template-installtime" [110]="template-license" [111]="template-url" [112]="template-summary" [113]="template-description")
    test_wrapper 'qvm-features '\''running'\'' '
}

@test "Test 019. qvm-features: qvm-features nonexistent" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qvm-features nonexistent'
}

@test "Test 020. qvm-features: qvm-features nonexistent " {
    EXPECTED_COMPREPLY=([0]="gui" [1]="gui-emulated" [2]="gui-default-allow-utf8-titles" [3]="input-dom0-proxy" [4]="qrexec" [5]="rpc-clipboard" [6]="no-monitor-layout" [7]="internal" [8]="appmenus-legacy" [9]="appmenus-dispvm" [10]="qubes-firewall" [11]="updates-available" [12]="video-model" [13]="net.fake-ip" [14]="net.fake-gateway" [15]="net.fake-netmask" [16]="pci-e820-host" [17]="linux-stubdom" [18]="tag-created-vm-with" [19]="set-created-guivm" [20]="check-updates" [21]="menu-items" [22]="qubesmanager.maxmem_value" [23]="servicevm" [24]="service.clocksync" [25]="service.qubes-update-check" [26]="default-menu-items" [27]="netvm-menu-items" [28]="os" [29]="vmexec" [30]="audio-model" [31]="stubdom-qrexec" [32]="timezone" [33]="timer-period" [34]="out.latency" [35]="out.buffer-length" [36]="gui-videoram-min" [37]="gui-videoram-overhead" [38]="gui-default-secure-copy-sequence" [39]="gui-default-secure-paste-sequence" [40]="last-update" [41]="last-update-check" [42]="selinux" [43]="apparmor" [44]="supported-service.apparmor" [45]="supported-service.crond" [46]="supported-service.network-manager" [47]="supported-service.pipewire" [48]="supported-service.cups" [49]="supported-service.gui-agent-clipboard-wipe" [50]="supported-service.guivm-gui-agent" [51]="supported-service.qubes-update-check" [52]="supported-service.qubes-updates-proxy" [53]="supported-service.qubes-firewall" [54]="supported-service.qubes-network" [55]="supported-service.clocksync" [56]="supported-service.updates-proxy-setup" [57]="supported-service.meminfo-writer" [58]="supported-service.modem-manager" [59]="supported-service.blueman" [60]="supported-rpc.qubes.SetMonitorLayout" [61]="supported-rpc.qubes.SelectFile" [62]="supported-rpc.qubes.UpdatesProxy" [63]="supported-rpc.qubes.TemplateDownload" [64]="supported-rpc.qubes.PostInstall" [65]="supported-rpc.qubes.VMExec" [66]="supported-rpc.qubes.Backup" [67]="supported-rpc.qubes.ShowInTerminal" [68]="supported-rpc.qubes.RegisterBackupLocation" [69]="supported-rpc.qubes.WaitForSession" [70]="supported-rpc.qubes.SetDateTime" [71]="supported-rpc.qubes.TemplateSearch" [72]="supported-rpc.qubes.GetAppmenus" [73]="supported-rpc.qubes.DetachPciDevice" [74]="supported-rpc.qubes.SuspendPost" [75]="supported-rpc.qubes.OpenURL" [76]="supported-rpc.qubes.StartApp" [77]="supported-rpc.qubes.ConnectTCP" [78]="supported-rpc.qubes.ResizeDisk" [79]="supported-rpc.qubes.SuspendPreAll" [80]="supported-rpc.qubes.SelectDirectory" [81]="supported-rpc.qubes.VMRootShell" [82]="supported-rpc.qubes.Gpg" [83]="supported-rpc.qubes.PdfConvert" [84]="supported-rpc.qubes.USBDetach" [85]="supported-rpc.qubes.RestoreById" [86]="supported-rpc.qubes.GpgImportKey" [87]="supported-rpc.qubes.GuiVMSession" [88]="supported-rpc.qubes.VMExecGUI" [89]="supported-rpc.qubes.USB" [90]="supported-rpc.qubes.Filecopy" [91]="supported-rpc.qubes.SuspendPostAll" [92]="supported-rpc.qubes.VMShell" [93]="supported-rpc.qubes.GetImageRGBA" [94]="supported-rpc.qubes.GetDate" [95]="supported-rpc.qubes.SuspendPre" [96]="supported-rpc.qubes.USBAttach" [97]="supported-rpc.qubes.InstallUpdatesGUI" [98]="supported-rpc.qubes.OpenInVM" [99]="supported-rpc.qubes.SaltLinuxVM" [100]="supported-rpc.qubes.Restore" [101]="supported-rpc.qubes.AudioInputEnable" [102]="supported-rpc.qubes.AudioInputDisable" [103]="template-name" [104]="template-epoch" [105]="template-version" [106]="template-release" [107]="template-reponame" [108]="template-buildtime" [109]="template-installtime" [110]="template-license" [111]="template-url" [112]="template-summary" [113]="template-description")
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
    EXPECTED_COMPREPLY=([0]="gui" [1]="gui-emulated" [2]="gui-default-allow-utf8-titles" [3]="input-dom0-proxy" [4]="qrexec" [5]="rpc-clipboard" [6]="no-monitor-layout" [7]="internal" [8]="appmenus-legacy" [9]="appmenus-dispvm" [10]="qubes-firewall" [11]="updates-available" [12]="video-model" [13]="net.fake-ip" [14]="net.fake-gateway" [15]="net.fake-netmask" [16]="pci-e820-host" [17]="linux-stubdom" [18]="tag-created-vm-with" [19]="set-created-guivm" [20]="check-updates" [21]="menu-items" [22]="qubesmanager.maxmem_value" [23]="servicevm" [24]="service.clocksync" [25]="service.qubes-update-check" [26]="default-menu-items" [27]="netvm-menu-items" [28]="os" [29]="vmexec" [30]="audio-model" [31]="stubdom-qrexec" [32]="timezone" [33]="timer-period" [34]="out.latency" [35]="out.buffer-length" [36]="gui-videoram-min" [37]="gui-videoram-overhead" [38]="gui-default-secure-copy-sequence" [39]="gui-default-secure-paste-sequence" [40]="last-update" [41]="last-update-check" [42]="selinux" [43]="apparmor" [44]="supported-service.apparmor" [45]="supported-service.crond" [46]="supported-service.network-manager" [47]="supported-service.pipewire" [48]="supported-service.cups" [49]="supported-service.gui-agent-clipboard-wipe" [50]="supported-service.guivm-gui-agent" [51]="supported-service.qubes-update-check" [52]="supported-service.qubes-updates-proxy" [53]="supported-service.qubes-firewall" [54]="supported-service.qubes-network" [55]="supported-service.clocksync" [56]="supported-service.updates-proxy-setup" [57]="supported-service.meminfo-writer" [58]="supported-service.modem-manager" [59]="supported-service.blueman" [60]="supported-rpc.qubes.SetMonitorLayout" [61]="supported-rpc.qubes.SelectFile" [62]="supported-rpc.qubes.UpdatesProxy" [63]="supported-rpc.qubes.TemplateDownload" [64]="supported-rpc.qubes.PostInstall" [65]="supported-rpc.qubes.VMExec" [66]="supported-rpc.qubes.Backup" [67]="supported-rpc.qubes.ShowInTerminal" [68]="supported-rpc.qubes.RegisterBackupLocation" [69]="supported-rpc.qubes.WaitForSession" [70]="supported-rpc.qubes.SetDateTime" [71]="supported-rpc.qubes.TemplateSearch" [72]="supported-rpc.qubes.GetAppmenus" [73]="supported-rpc.qubes.DetachPciDevice" [74]="supported-rpc.qubes.SuspendPost" [75]="supported-rpc.qubes.OpenURL" [76]="supported-rpc.qubes.StartApp" [77]="supported-rpc.qubes.ConnectTCP" [78]="supported-rpc.qubes.ResizeDisk" [79]="supported-rpc.qubes.SuspendPreAll" [80]="supported-rpc.qubes.SelectDirectory" [81]="supported-rpc.qubes.VMRootShell" [82]="supported-rpc.qubes.Gpg" [83]="supported-rpc.qubes.PdfConvert" [84]="supported-rpc.qubes.USBDetach" [85]="supported-rpc.qubes.RestoreById" [86]="supported-rpc.qubes.GpgImportKey" [87]="supported-rpc.qubes.GuiVMSession" [88]="supported-rpc.qubes.VMExecGUI" [89]="supported-rpc.qubes.USB" [90]="supported-rpc.qubes.Filecopy" [91]="supported-rpc.qubes.SuspendPostAll" [92]="supported-rpc.qubes.VMShell" [93]="supported-rpc.qubes.GetImageRGBA" [94]="supported-rpc.qubes.GetDate" [95]="supported-rpc.qubes.SuspendPre" [96]="supported-rpc.qubes.USBAttach" [97]="supported-rpc.qubes.InstallUpdatesGUI" [98]="supported-rpc.qubes.OpenInVM" [99]="supported-rpc.qubes.SaltLinuxVM" [100]="supported-rpc.qubes.Restore" [101]="supported-rpc.qubes.AudioInputEnable" [102]="supported-rpc.qubes.AudioInputDisable" [103]="template-name" [104]="template-epoch" [105]="template-version" [106]="template-release" [107]="template-reponame" [108]="template-buildtime" [109]="template-installtime" [110]="template-license" [111]="template-url" [112]="template-summary" [113]="template-description")
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
    EXPECTED_COMPREPLY=([0]="--unset" [1]="--default" [2]="--delete" [3]="-D" [4]="--verbose" [5]="-v" [6]="--quiet" [7]="-q" [8]="--help" [9]="-h")
    test_wrapper 'qvm-features --something_unknown -'
}

@test "Test 030. qvm-features: qvm-features --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--unset" [1]="--default" [2]="--delete" [3]="--verbose" [4]="--quiet" [5]="--help")
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

