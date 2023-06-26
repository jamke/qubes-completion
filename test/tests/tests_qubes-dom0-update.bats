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

@test "Test 000. qubes-dom0-update: qubes-dom0-update -" {
    EXPECTED_COMPREPLY=([0]="-4" [1]="-6" [2]="-b" [3]="-c" [4]="-C" [5]="-d" [6]="-e" [7]="-h" [8]="-q" [9]="-R" [10]="-v" [11]="-x" [12]="-y" [13]="--advisory" [14]="--advisories" [15]="--allowerasing" [16]="--assumeno" [17]="--assumeyes" [18]="--best" [19]="--bugfix" [20]="--bz" [21]="--cacheonly" [22]="--config" [23]="--color" [24]="--cve" [25]="--debuglevel" [26]="--debugsolver" [27]="--disableexcludes" [28]="--disableplugin" [29]="--disableexcludepkgs" [30]="--disablerepo" [31]="--downloadonly" [32]="--destdir" [33]="--downloaddir" [34]="--errorlevel" [35]="--enableplugin" [36]="--enablerepo" [37]="--enhancement" [38]="--exclude" [39]="--excludepkgs" [40]="--help" [41]="--help-cmd" [42]="--installroot" [43]="--newpackage" [44]="--nodocs" [45]="--nogpgcheck" [46]="--noplugins" [47]="--noautoremove" [48]="--obsoletes" [49]="--quiet" [50]="--randomwait" [51]="--refresh" [52]="--releasever" [53]="--repofrompath" [54]="--repo" [55]="--repoid" [56]="--rpmverbosity" [57]="--sec-severity" [58]="--secseverity" [59]="--security" [60]="--setopt" [61]="--skip-broken" [62]="--showduplicates" [63]="--verbose" [64]="--version" [65]="--help" [66]="--action=" [67]="--clean" [68]="--check-only" [69]="--gui" [70]="--force-xen-upgrade" [71]="--console" [72]="--show-output" [73]="--preserve-terminal")
    test_wrapper 'qubes-dom0-update -'
}

@test "Test 001. qubes-dom0-update: qubes-dom0-update --" {
    EXPECTED_COMPREPLY=([0]="--advisory" [1]="--advisories" [2]="--allowerasing" [3]="--assumeno" [4]="--assumeyes" [5]="--best" [6]="--bugfix" [7]="--bz" [8]="--cacheonly" [9]="--config" [10]="--color" [11]="--cve" [12]="--debuglevel" [13]="--debugsolver" [14]="--disableexcludes" [15]="--disableplugin" [16]="--disableexcludepkgs" [17]="--disablerepo" [18]="--downloadonly" [19]="--destdir" [20]="--downloaddir" [21]="--errorlevel" [22]="--enableplugin" [23]="--enablerepo" [24]="--enhancement" [25]="--exclude" [26]="--excludepkgs" [27]="--help" [28]="--help-cmd" [29]="--installroot" [30]="--newpackage" [31]="--nodocs" [32]="--nogpgcheck" [33]="--noplugins" [34]="--noautoremove" [35]="--obsoletes" [36]="--quiet" [37]="--randomwait" [38]="--refresh" [39]="--releasever" [40]="--repofrompath" [41]="--repo" [42]="--repoid" [43]="--rpmverbosity" [44]="--sec-severity" [45]="--secseverity" [46]="--security" [47]="--setopt" [48]="--skip-broken" [49]="--showduplicates" [50]="--verbose" [51]="--version" [52]="--help" [53]="--action=" [54]="--clean" [55]="--check-only" [56]="--gui" [57]="--force-xen-upgrade" [58]="--console" [59]="--show-output" [60]="--preserve-terminal")
    test_wrapper 'qubes-dom0-update --'
}

@test "Test 002. qubes-dom0-update: qubes-dom0-update -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-dom0-update -h'
}

@test "Test 003. qubes-dom0-update: qubes-dom0-update --en" {
    EXPECTED_COMPREPLY=([0]="--enableplugin" [1]="--enablerepo" [2]="--enhancement")
    test_wrapper 'qubes-dom0-update --en'
}

@test "Test 004. qubes-dom0-update: qubes-dom0-update --enablerep" {
    EXPECTED_COMPREPLY=([0]="--enablerepo")
    test_wrapper 'qubes-dom0-update --enablerep'
}

@test "Test 005. qubes-dom0-update: qubes-dom0-update --a" {
    EXPECTED_COMPREPLY=([0]="--advisory" [1]="--advisories" [2]="--allowerasing" [3]="--assumeno" [4]="--assumeyes" [5]="--action=")
    test_wrapper 'qubes-dom0-update --a'
}

@test "Test 006. qubes-dom0-update: qubes-dom0-update --act" {
    EXPECTED_COMPREPLY=([0]="--action=")
    test_wrapper 'qubes-dom0-update --act'
}

@test "Test 007. qubes-dom0-update: qubes-dom0-update --action" {
    EXPECTED_COMPREPLY=([0]="--action=")
    test_wrapper 'qubes-dom0-update --action'
}

@test "Test 008. qubes-dom0-update: qubes-dom0-update --action=" {
    EXPECTED_COMPREPLY=([0]="alias" [1]="autoremove" [2]="check" [3]="check-update" [4]="clean" [5]="deplist" [6]="distro-sync" [7]="downgrade" [8]="group" [9]="help" [10]="history" [11]="info" [12]="install" [13]="list" [14]="makecache" [15]="mark" [16]="module" [17]="provides" [18]="reinstall" [19]="remove" [20]="repoinfo" [21]="repolist" [22]="repoquery" [23]="repository-packages" [24]="search" [25]="shell" [26]="swap" [27]="updateinfo" [28]="upgrade" [29]="upgrade-minimal")
    test_wrapper 'qubes-dom0-update --action='
}

@test "Test 009. qubes-dom0-update: qubes-dom0-update --action=remo" {
    EXPECTED_COMPREPLY=([0]="remove")
    test_wrapper 'qubes-dom0-update --action=remo'
}

@test "Test 010. qubes-dom0-update: qubes-dom0-update --action=\"" {
    EXPECTED_COMPREPLY=([0]="alias" [1]="autoremove" [2]="check" [3]="check-update" [4]="clean" [5]="deplist" [6]="distro-sync" [7]="downgrade" [8]="group" [9]="help" [10]="history" [11]="info" [12]="install" [13]="list" [14]="makecache" [15]="mark" [16]="module" [17]="provides" [18]="reinstall" [19]="remove" [20]="repoinfo" [21]="repolist" [22]="repoquery" [23]="repository-packages" [24]="search" [25]="shell" [26]="swap" [27]="updateinfo" [28]="upgrade" [29]="upgrade-minimal")
    test_wrapper 'qubes-dom0-update --action="'
}

@test "Test 011. qubes-dom0-update: qubes-dom0-update --action='" {
    EXPECTED_COMPREPLY=([0]="alias" [1]="autoremove" [2]="check" [3]="check-update" [4]="clean" [5]="deplist" [6]="distro-sync" [7]="downgrade" [8]="group" [9]="help" [10]="history" [11]="info" [12]="install" [13]="list" [14]="makecache" [15]="mark" [16]="module" [17]="provides" [18]="reinstall" [19]="remove" [20]="repoinfo" [21]="repolist" [22]="repoquery" [23]="repository-packages" [24]="search" [25]="shell" [26]="swap" [27]="updateinfo" [28]="upgrade" [29]="upgrade-minimal")
    test_wrapper 'qubes-dom0-update --action='\'''
}

@test "Test 012. qubes-dom0-update: qubes-dom0-update --action=\"remo" {
    EXPECTED_COMPREPLY=([0]="remove")
    test_wrapper 'qubes-dom0-update --action="remo'
}

@test "Test 013. qubes-dom0-update: qubes-dom0-update --action='remo" {
    EXPECTED_COMPREPLY=([0]="remove")
    test_wrapper 'qubes-dom0-update --action='\''remo'
}

@test "Test 014. qubes-dom0-update: qubes-dom0-update --action=remove" {
    EXPECTED_COMPREPLY=([0]="remove")
    test_wrapper 'qubes-dom0-update --action=remove'
}

@test "Test 015. qubes-dom0-update: qubes-dom0-update --action=remove -" {
    EXPECTED_COMPREPLY=([0]="-4" [1]="-6" [2]="-b" [3]="-c" [4]="-C" [5]="-d" [6]="-e" [7]="-h" [8]="-q" [9]="-R" [10]="-v" [11]="-x" [12]="-y" [13]="--advisory" [14]="--advisories" [15]="--allowerasing" [16]="--assumeno" [17]="--assumeyes" [18]="--best" [19]="--bugfix" [20]="--bz" [21]="--cacheonly" [22]="--config" [23]="--color" [24]="--cve" [25]="--debuglevel" [26]="--debugsolver" [27]="--disableexcludes" [28]="--disableplugin" [29]="--disableexcludepkgs" [30]="--disablerepo" [31]="--downloadonly" [32]="--destdir" [33]="--downloaddir" [34]="--errorlevel" [35]="--enableplugin" [36]="--enablerepo" [37]="--enhancement" [38]="--exclude" [39]="--excludepkgs" [40]="--help" [41]="--help-cmd" [42]="--installroot" [43]="--newpackage" [44]="--nodocs" [45]="--nogpgcheck" [46]="--noplugins" [47]="--noautoremove" [48]="--obsoletes" [49]="--quiet" [50]="--randomwait" [51]="--refresh" [52]="--releasever" [53]="--repofrompath" [54]="--repo" [55]="--repoid" [56]="--rpmverbosity" [57]="--sec-severity" [58]="--secseverity" [59]="--security" [60]="--setopt" [61]="--skip-broken" [62]="--showduplicates" [63]="--verbose" [64]="--version" [65]="--oldinstallonly" [66]="--duplicates" [67]="--duplicated" [68]="--help" [69]="--action=" [70]="--clean" [71]="--check-only" [72]="--gui" [73]="--force-xen-upgrade" [74]="--console" [75]="--show-output" [76]="--preserve-terminal")
    test_wrapper 'qubes-dom0-update --action=remove -'
}

@test "Test 016. qubes-dom0-update: qubes-dom0-update --action=remove --" {
    EXPECTED_COMPREPLY=([0]="--advisory" [1]="--advisories" [2]="--allowerasing" [3]="--assumeno" [4]="--assumeyes" [5]="--best" [6]="--bugfix" [7]="--bz" [8]="--cacheonly" [9]="--config" [10]="--color" [11]="--cve" [12]="--debuglevel" [13]="--debugsolver" [14]="--disableexcludes" [15]="--disableplugin" [16]="--disableexcludepkgs" [17]="--disablerepo" [18]="--downloadonly" [19]="--destdir" [20]="--downloaddir" [21]="--errorlevel" [22]="--enableplugin" [23]="--enablerepo" [24]="--enhancement" [25]="--exclude" [26]="--excludepkgs" [27]="--help" [28]="--help-cmd" [29]="--installroot" [30]="--newpackage" [31]="--nodocs" [32]="--nogpgcheck" [33]="--noplugins" [34]="--noautoremove" [35]="--obsoletes" [36]="--quiet" [37]="--randomwait" [38]="--refresh" [39]="--releasever" [40]="--repofrompath" [41]="--repo" [42]="--repoid" [43]="--rpmverbosity" [44]="--sec-severity" [45]="--secseverity" [46]="--security" [47]="--setopt" [48]="--skip-broken" [49]="--showduplicates" [50]="--verbose" [51]="--version" [52]="--oldinstallonly" [53]="--duplicates" [54]="--duplicated" [55]="--help" [56]="--action=" [57]="--clean" [58]="--check-only" [59]="--gui" [60]="--force-xen-upgrade" [61]="--console" [62]="--show-output" [63]="--preserve-terminal")
    test_wrapper 'qubes-dom0-update --action=remove --'
}

@test "Test 017. qubes-dom0-update: qubes-dom0-update --action=\"remove\"" {
    EXPECTED_COMPREPLY=([0]="remove")
    test_wrapper 'qubes-dom0-update --action="remove"'
}

@test "Test 018. qubes-dom0-update: qubes-dom0-update --action=\"remove\" -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--action=" [2]="--clean" [3]="--check-only" [4]="--gui" [5]="--force-xen-upgrade" [6]="--console" [7]="--show-output" [8]="--preserve-terminal")
    test_wrapper 'qubes-dom0-update --action="remove" -'
}

@test "Test 019. qubes-dom0-update: qubes-dom0-update --action=\"remove\" --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--action=" [2]="--clean" [3]="--check-only" [4]="--gui" [5]="--force-xen-upgrade" [6]="--console" [7]="--show-output" [8]="--preserve-terminal")
    test_wrapper 'qubes-dom0-update --action="remove" --'
}

@test "Test 020. qubes-dom0-update: qubes-dom0-update --action='remove'" {
    EXPECTED_COMPREPLY=([0]="remove")
    test_wrapper 'qubes-dom0-update --action='\''remove'\'''
}

@test "Test 021. qubes-dom0-update: qubes-dom0-update --action='remove' -" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--action=" [2]="--clean" [3]="--check-only" [4]="--gui" [5]="--force-xen-upgrade" [6]="--console" [7]="--show-output" [8]="--preserve-terminal")
    test_wrapper 'qubes-dom0-update --action='\''remove'\'' -'
}

@test "Test 022. qubes-dom0-update: qubes-dom0-update --action='remove' --" {
    EXPECTED_COMPREPLY=([0]="--help" [1]="--action=" [2]="--clean" [3]="--check-only" [4]="--gui" [5]="--force-xen-upgrade" [6]="--console" [7]="--show-output" [8]="--preserve-terminal")
    test_wrapper 'qubes-dom0-update --action='\''remove'\'' --'
}

@test "Test 023. qubes-dom0-update: qubes-dom0-update --something_unknown -" {
    EXPECTED_COMPREPLY=([0]="-4" [1]="-6" [2]="-b" [3]="-c" [4]="-C" [5]="-d" [6]="-e" [7]="-h" [8]="-q" [9]="-R" [10]="-v" [11]="-x" [12]="-y" [13]="--advisory" [14]="--advisories" [15]="--allowerasing" [16]="--assumeno" [17]="--assumeyes" [18]="--best" [19]="--bugfix" [20]="--bz" [21]="--cacheonly" [22]="--config" [23]="--color" [24]="--cve" [25]="--debuglevel" [26]="--debugsolver" [27]="--disableexcludes" [28]="--disableplugin" [29]="--disableexcludepkgs" [30]="--disablerepo" [31]="--downloadonly" [32]="--destdir" [33]="--downloaddir" [34]="--errorlevel" [35]="--enableplugin" [36]="--enablerepo" [37]="--enhancement" [38]="--exclude" [39]="--excludepkgs" [40]="--help" [41]="--help-cmd" [42]="--installroot" [43]="--newpackage" [44]="--nodocs" [45]="--nogpgcheck" [46]="--noplugins" [47]="--noautoremove" [48]="--obsoletes" [49]="--quiet" [50]="--randomwait" [51]="--refresh" [52]="--releasever" [53]="--repofrompath" [54]="--repo" [55]="--repoid" [56]="--rpmverbosity" [57]="--sec-severity" [58]="--secseverity" [59]="--security" [60]="--setopt" [61]="--skip-broken" [62]="--showduplicates" [63]="--verbose" [64]="--version" [65]="--help" [66]="--action=" [67]="--clean" [68]="--check-only" [69]="--gui" [70]="--force-xen-upgrade" [71]="--console" [72]="--show-output" [73]="--preserve-terminal")
    test_wrapper 'qubes-dom0-update --something_unknown -'
}

@test "Test 024. qubes-dom0-update: qubes-dom0-update --something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--advisory" [1]="--advisories" [2]="--allowerasing" [3]="--assumeno" [4]="--assumeyes" [5]="--best" [6]="--bugfix" [7]="--bz" [8]="--cacheonly" [9]="--config" [10]="--color" [11]="--cve" [12]="--debuglevel" [13]="--debugsolver" [14]="--disableexcludes" [15]="--disableplugin" [16]="--disableexcludepkgs" [17]="--disablerepo" [18]="--downloadonly" [19]="--destdir" [20]="--downloaddir" [21]="--errorlevel" [22]="--enableplugin" [23]="--enablerepo" [24]="--enhancement" [25]="--exclude" [26]="--excludepkgs" [27]="--help" [28]="--help-cmd" [29]="--installroot" [30]="--newpackage" [31]="--nodocs" [32]="--nogpgcheck" [33]="--noplugins" [34]="--noautoremove" [35]="--obsoletes" [36]="--quiet" [37]="--randomwait" [38]="--refresh" [39]="--releasever" [40]="--repofrompath" [41]="--repo" [42]="--repoid" [43]="--rpmverbosity" [44]="--sec-severity" [45]="--secseverity" [46]="--security" [47]="--setopt" [48]="--skip-broken" [49]="--showduplicates" [50]="--verbose" [51]="--version" [52]="--help" [53]="--action=" [54]="--clean" [55]="--check-only" [56]="--gui" [57]="--force-xen-upgrade" [58]="--console" [59]="--show-output" [60]="--preserve-terminal")
    test_wrapper 'qubes-dom0-update --something_unknown --'
}

@test "Test 025. qubes-dom0-update: qubes-dom0-update --something_unknown -- -" {
    EXPECTED_COMPREPLY=([0]="-4" [1]="-6" [2]="-b" [3]="-c" [4]="-C" [5]="-d" [6]="-e" [7]="-h" [8]="-q" [9]="-R" [10]="-v" [11]="-x" [12]="-y" [13]="--advisory" [14]="--advisories" [15]="--allowerasing" [16]="--assumeno" [17]="--assumeyes" [18]="--best" [19]="--bugfix" [20]="--bz" [21]="--cacheonly" [22]="--config" [23]="--color" [24]="--cve" [25]="--debuglevel" [26]="--debugsolver" [27]="--disableexcludes" [28]="--disableplugin" [29]="--disableexcludepkgs" [30]="--disablerepo" [31]="--downloadonly" [32]="--destdir" [33]="--downloaddir" [34]="--errorlevel" [35]="--enableplugin" [36]="--enablerepo" [37]="--enhancement" [38]="--exclude" [39]="--excludepkgs" [40]="--help" [41]="--help-cmd" [42]="--installroot" [43]="--newpackage" [44]="--nodocs" [45]="--nogpgcheck" [46]="--noplugins" [47]="--noautoremove" [48]="--obsoletes" [49]="--quiet" [50]="--randomwait" [51]="--refresh" [52]="--releasever" [53]="--repofrompath" [54]="--repo" [55]="--repoid" [56]="--rpmverbosity" [57]="--sec-severity" [58]="--secseverity" [59]="--security" [60]="--setopt" [61]="--skip-broken" [62]="--showduplicates" [63]="--verbose" [64]="--version")
    test_wrapper 'qubes-dom0-update --something_unknown -- -'
}

@test "Test 026. qubes-dom0-update: qubes-dom0-update --something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-dom0-update --something_unknown -h'
}

@test "Test 027. qubes-dom0-update: qubes-dom0-update --something_unknown --act" {
    EXPECTED_COMPREPLY=([0]="--action=")
    test_wrapper 'qubes-dom0-update --something_unknown --act'
}

@test "Test 028. qubes-dom0-update: qubes-dom0-update something_unknown=" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-dom0-update something_unknown='
}

@test "Test 029. qubes-dom0-update: qubes-dom0-update something_unknown -" {
    EXPECTED_COMPREPLY=([0]="-4" [1]="-6" [2]="-b" [3]="-c" [4]="-C" [5]="-d" [6]="-e" [7]="-h" [8]="-q" [9]="-R" [10]="-v" [11]="-x" [12]="-y" [13]="--advisory" [14]="--advisories" [15]="--allowerasing" [16]="--assumeno" [17]="--assumeyes" [18]="--best" [19]="--bugfix" [20]="--bz" [21]="--cacheonly" [22]="--config" [23]="--color" [24]="--cve" [25]="--debuglevel" [26]="--debugsolver" [27]="--disableexcludes" [28]="--disableplugin" [29]="--disableexcludepkgs" [30]="--disablerepo" [31]="--downloadonly" [32]="--destdir" [33]="--downloaddir" [34]="--errorlevel" [35]="--enableplugin" [36]="--enablerepo" [37]="--enhancement" [38]="--exclude" [39]="--excludepkgs" [40]="--help" [41]="--help-cmd" [42]="--installroot" [43]="--newpackage" [44]="--nodocs" [45]="--nogpgcheck" [46]="--noplugins" [47]="--noautoremove" [48]="--obsoletes" [49]="--quiet" [50]="--randomwait" [51]="--refresh" [52]="--releasever" [53]="--repofrompath" [54]="--repo" [55]="--repoid" [56]="--rpmverbosity" [57]="--sec-severity" [58]="--secseverity" [59]="--security" [60]="--setopt" [61]="--skip-broken" [62]="--showduplicates" [63]="--verbose" [64]="--version")
    test_wrapper 'qubes-dom0-update something_unknown -'
}

@test "Test 030. qubes-dom0-update: qubes-dom0-update something_unknown --" {
    EXPECTED_COMPREPLY=([0]="--advisory" [1]="--advisories" [2]="--allowerasing" [3]="--assumeno" [4]="--assumeyes" [5]="--best" [6]="--bugfix" [7]="--bz" [8]="--cacheonly" [9]="--config" [10]="--color" [11]="--cve" [12]="--debuglevel" [13]="--debugsolver" [14]="--disableexcludes" [15]="--disableplugin" [16]="--disableexcludepkgs" [17]="--disablerepo" [18]="--downloadonly" [19]="--destdir" [20]="--downloaddir" [21]="--errorlevel" [22]="--enableplugin" [23]="--enablerepo" [24]="--enhancement" [25]="--exclude" [26]="--excludepkgs" [27]="--help" [28]="--help-cmd" [29]="--installroot" [30]="--newpackage" [31]="--nodocs" [32]="--nogpgcheck" [33]="--noplugins" [34]="--noautoremove" [35]="--obsoletes" [36]="--quiet" [37]="--randomwait" [38]="--refresh" [39]="--releasever" [40]="--repofrompath" [41]="--repo" [42]="--repoid" [43]="--rpmverbosity" [44]="--sec-severity" [45]="--secseverity" [46]="--security" [47]="--setopt" [48]="--skip-broken" [49]="--showduplicates" [50]="--verbose" [51]="--version")
    test_wrapper 'qubes-dom0-update something_unknown --'
}

@test "Test 031. qubes-dom0-update: qubes-dom0-update something_unknown -- -" {
    EXPECTED_COMPREPLY=([0]="-4" [1]="-6" [2]="-b" [3]="-c" [4]="-C" [5]="-d" [6]="-e" [7]="-h" [8]="-q" [9]="-R" [10]="-v" [11]="-x" [12]="-y" [13]="--advisory" [14]="--advisories" [15]="--allowerasing" [16]="--assumeno" [17]="--assumeyes" [18]="--best" [19]="--bugfix" [20]="--bz" [21]="--cacheonly" [22]="--config" [23]="--color" [24]="--cve" [25]="--debuglevel" [26]="--debugsolver" [27]="--disableexcludes" [28]="--disableplugin" [29]="--disableexcludepkgs" [30]="--disablerepo" [31]="--downloadonly" [32]="--destdir" [33]="--downloaddir" [34]="--errorlevel" [35]="--enableplugin" [36]="--enablerepo" [37]="--enhancement" [38]="--exclude" [39]="--excludepkgs" [40]="--help" [41]="--help-cmd" [42]="--installroot" [43]="--newpackage" [44]="--nodocs" [45]="--nogpgcheck" [46]="--noplugins" [47]="--noautoremove" [48]="--obsoletes" [49]="--quiet" [50]="--randomwait" [51]="--refresh" [52]="--releasever" [53]="--repofrompath" [54]="--repo" [55]="--repoid" [56]="--rpmverbosity" [57]="--sec-severity" [58]="--secseverity" [59]="--security" [60]="--setopt" [61]="--skip-broken" [62]="--showduplicates" [63]="--verbose" [64]="--version")
    test_wrapper 'qubes-dom0-update something_unknown -- -'
}

@test "Test 032. qubes-dom0-update: qubes-dom0-update something_unknown -h" {
    EXPECTED_COMPREPLY=([0]="-h")
    test_wrapper 'qubes-dom0-update something_unknown -h'
}

@test "Test 033. qubes-dom0-update: qubes-dom0-update something_unknown --act" {
    EXPECTED_COMPREPLY=()
    test_wrapper 'qubes-dom0-update something_unknown --act'
}

