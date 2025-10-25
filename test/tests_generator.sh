#!/bin/bash

function tests_generate_test_for_qvm_ls() {

    tests_setup_new_output 'qvm-ls'

    # cSpell:disable

    # basic
    tests_create_test_and_save 'qvm-ls '
    # flags
    tests_create_test_and_save 'qvm-ls -'
    tests_create_test_and_save 'qvm-ls --'
    tests_create_test_and_save 'qvm-ls -- '
    tests_create_test_and_save 'qvm-ls -h'
    tests_create_test_and_save 'qvm-ls --d'
    # flags
    tests_create_test_and_save 'qvm-ls --format '
    tests_create_test_and_save 'qvm-ls --format f'
    tests_create_test_and_save 'qvm-ls --format nonexistent'
    tests_create_test_and_save 'qvm-ls -o '
    tests_create_test_and_save 'qvm-ls -o d'
    tests_create_test_and_save 'qvm-ls -O nonexistent'
    tests_create_test_and_save 'qvm-ls --fields '
    tests_create_test_and_save 'qvm-ls --fields MEMOR'
    tests_create_test_and_save 'qvm-ls --fields nonexistent'
    tests_create_test_and_save 'qvm-ls -O '
    tests_create_test_and_save 'qvm-ls -O MEMOR'
    tests_create_test_and_save 'qvm-ls -O nonexistent'
    tests_create_test_and_save 'qvm-ls --format='
    tests_create_test_and_save 'qvm-ls --format=f'
    tests_create_test_and_save 'qvm-ls --format=nonexistent'
    tests_create_test_and_save 'qvm-ls --fields='
    tests_create_test_and_save 'qvm-ls --fields=MEMOR'
    tests_create_test_and_save 'qvm-ls --fields=nonexistent'
    # flag with quotes
    tests_create_test_and_save 'qvm-ls "--forma'
    tests_create_test_and_save 'qvm-ls "--format'
    tests_create_test_and_save 'qvm-ls "--format='
    tests_create_test_and_save 'qvm-ls "--format '
    tests_create_test_and_save 'qvm-ls "--format=f'
    tests_create_test_and_save "qvm-ls '--forma"
    tests_create_test_and_save "qvm-ls '--format"
    tests_create_test_and_save "qvm-ls '--format="
    tests_create_test_and_save "qvm-ls '--format "
    tests_create_test_and_save "qvm-ls '--format=f"
    # --tags
    tests_create_test_and_save 'qvm-ls --tags '
    tests_create_test_and_save 'qvm-ls --tags foo '
    tests_create_test_and_save 'qvm-ls --tags foo -'
    tests_create_test_and_save 'qvm-ls --tags foo --'
    tests_create_test_and_save 'qvm-ls --tags foo bar -'
    tests_create_test_and_save 'qvm-ls --tags foo bar --'
    # flags and values with quotes
    tests_create_test_and_save 'qvm-ls --exclude "'
    tests_create_test_and_save 'qvm-ls --exclude "run'
    tests_create_test_and_save 'qvm-ls --exclude "runnin'
    tests_create_test_and_save 'qvm-ls --exclude "running'
    tests_create_test_and_save 'qvm-ls --exclude "nonexistent'
    tests_create_test_and_save 'qvm-ls --exclude "nonexistent" '
    tests_create_test_and_save "qvm-ls --exclude '"
    tests_create_test_and_save "qvm-ls --exclude 'run"
    tests_create_test_and_save "qvm-ls --exclude 'runnin"
    tests_create_test_and_save "qvm-ls --exclude 'running"
    tests_create_test_and_save "qvm-ls --exclude 'nonexistent"
    tests_create_test_and_save "qvm-ls --exclude 'nonexistent' "
    tests_create_test_and_save 'qvm-ls --exclude="'
    tests_create_test_and_save 'qvm-ls --exclude="run'
    tests_create_test_and_save 'qvm-ls --exclude="runnin'
    tests_create_test_and_save 'qvm-ls --exclude="running'
    tests_create_test_and_save 'qvm-ls --exclude="nonexistent'
    tests_create_test_and_save 'qvm-ls --exclude="nonexistent" '
    tests_create_test_and_save "qvm-ls --exclude='"
    tests_create_test_and_save "qvm-ls --exclude='run"
    tests_create_test_and_save "qvm-ls --exclude='runnin"
    tests_create_test_and_save "qvm-ls --exclude='running"
    tests_create_test_and_save "qvm-ls --exclude='nonexistent"
    tests_create_test_and_save "qvm-ls --exclude='nonexistent' "
    # invalid arguments
    tests_create_test_and_save 'qvm-tags --something_unknown '
    tests_create_test_and_save 'qvm-tags --something_unknown='
    tests_create_test_and_save 'qvm-tags --something_unknown -'
    tests_create_test_and_save 'qvm-tags --something_unknown --'
    tests_create_test_and_save 'qvm-tags --something_unknown -- '
    tests_create_test_and_save 'qvm-tags --something_unknown -h'
    tests_create_test_and_save 'qvm-tags --something_unknown --d'

    # cSpell:enable
}


function tests_generate_test_for_qvm_tags() {

    tests_setup_new_output 'qvm-tags'

    # cSpell:disable

    # basic
    tests_create_test_and_save 'qvm-tags '
    # flags
    tests_create_test_and_save 'qvm-tags -'
    tests_create_test_and_save 'qvm-tags --'
    tests_create_test_and_save 'qvm-tags -- '
    tests_create_test_and_save 'qvm-tags -h'
    tests_create_test_and_save 'qvm-tags --h'
    # arguments without qube name (wrong way to call)
    tests_create_test_and_save 'qvm-tags list'
    tests_create_test_and_save 'qvm-tags list '
    # qubes
    tests_create_test_and_save 'qvm-tags '
    tests_create_test_and_save 'qvm-tags run'
    tests_create_test_and_save 'qvm-tags runnin'
    tests_create_test_and_save 'qvm-tags running'
    tests_create_test_and_save 'qvm-tags running '
    tests_create_test_and_save 'qvm-tags nonexistent'
    tests_create_test_and_save 'qvm-tags nonexistent '

    # qubes is selected, commands and tags left
    local aq
    local cq
    local cmd
    for aq in '' '"' "'" ; do
        for cq in '' '"' "'" ; do
            for cmd in 'list' 'ls' 'l' 'add' 'set' 'a' 'del' 'unset' 'u' ; do
                tests_create_test_and_save "qvm-tags running ${cq}${cmd}"
                tests_create_test_and_save "qvm-tags running ${cq}${cmd}${cq} "
                tests_create_test_and_save "qvm-tags running ${cq}${cmd}${cq} ${aq}gui"
                tests_create_test_and_save "qvm-tags running ${cq}${cmd}${cq} ${aq}guivm-dom0${aq} "
                tests_create_test_and_save "qvm-tags running ${cq}${cmd}${cq} ${aq}guivm-dom0${aq} created-by-dom0 "
                tests_create_test_and_save "qvm-tags running ${cq}${cmd}${cq} ${aq}guivm-dom0${aq} ${aq}created-by-dom0${aq} "
                tests_create_test_and_save "qvm-tags running ${cq}${cmd}${cq} ${aq}nonexistent"
                tests_create_test_and_save "qvm-tags running ${cq}${cmd}${cq} ${aq}nonexistent${aq} "
            done
        done
    done

    # invalid arguments
    tests_create_test_and_save 'qvm-tags --something_unknown '
    tests_create_test_and_save 'qvm-tags --something_unknown='
    tests_create_test_and_save 'qvm-tags --something_unknown -'
    tests_create_test_and_save 'qvm-tags --something_unknown --'
    tests_create_test_and_save 'qvm-tags --something_unknown -- '
    tests_create_test_and_save 'qvm-tags --something_unknown -h'
    tests_create_test_and_save 'qvm-tags --something_unknown --d'

    # cSpell:enable
}


function tests_generate_test_for_qvm_shutdown() {

    tests_setup_new_output 'qvm-shutdown'

    # cSpell:disable

    # basic
    tests_create_test_and_save 'qvm-shutdown '
    # flags
    tests_create_test_and_save 'qvm-shutdown -'
    tests_create_test_and_save 'qvm-shutdown --'
    tests_create_test_and_save 'qvm-shutdown -- '
    tests_create_test_and_save 'qvm-shutdown -h'
    tests_create_test_and_save 'qvm-shutdown --d'
    # --exclude flag
    tests_create_test_and_save 'qvm-shutdown --exclude '
    tests_create_test_and_save 'qvm-shutdown --exclude run'
    tests_create_test_and_save 'qvm-shutdown --exclude runnin'
    tests_create_test_and_save 'qvm-shutdown --exclude running'
    tests_create_test_and_save 'qvm-shutdown --exclude nonexistent'
    tests_create_test_and_save 'qvm-shutdown --exclude nonexistent '
    tests_create_test_and_save 'qvm-shutdown --exclude='
    tests_create_test_and_save 'qvm-shutdown --exclude=run'
    tests_create_test_and_save 'qvm-shutdown --exclude=runnin'
    tests_create_test_and_save 'qvm-shutdown --exclude=running'
    tests_create_test_and_save 'qvm-shutdown --exclude=nonexistent'
    tests_create_test_and_save 'qvm-shutdown --exclude=nonexistent '
    # --exclude flag with quotes
    tests_create_test_and_save 'qvm-shutdown "--exclu'
    tests_create_test_and_save 'qvm-shutdown "--exclude'
    tests_create_test_and_save 'qvm-shutdown "--exclude='
    tests_create_test_and_save 'qvm-shutdown "--exclude '
    tests_create_test_and_save 'qvm-shutdown "--exclude=run'
    tests_create_test_and_save 'qvm-shutdown "--exclude=running'
    tests_create_test_and_save "qvm-shutdown '--exclu"
    tests_create_test_and_save "qvm-shutdown '--exclude"
    tests_create_test_and_save "qvm-shutdown '--exclude="
    tests_create_test_and_save "qvm-shutdown '--exclude "
    tests_create_test_and_save "qvm-shutdown '--exclude=run"
    tests_create_test_and_save "qvm-shutdown '--exclude=running"
    # --timeout
    tests_create_test_and_save 'qvm-shutdown --timeout '
    tests_create_test_and_save 'qvm-shutdown --timeout 99'
    # qubes
    tests_create_test_and_save 'qvm-shutdown '
    tests_create_test_and_save 'qvm-shutdown run'
    tests_create_test_and_save 'qvm-shutdown runnin'
    tests_create_test_and_save 'qvm-shutdown running'
    tests_create_test_and_save 'qvm-shutdown running '
    tests_create_test_and_save 'qvm-shutdown nonexistent'
    tests_create_test_and_save 'qvm-shutdown nonexistent '
    # qubes and quotes
    tests_create_test_and_save 'qvm-shutdown "'
    tests_create_test_and_save 'qvm-shutdown "run'
    tests_create_test_and_save 'qvm-shutdown "runnin'
    tests_create_test_and_save 'qvm-shutdown "nonexistent'
    tests_create_test_and_save 'qvm-shutdown "nonexistent" '
    tests_create_test_and_save "qvm-shutdown 'run"
    tests_create_test_and_save "qvm-shutdown '"
    tests_create_test_and_save "qvm-shutdown 'runnin"
    tests_create_test_and_save "qvm-shutdown 'nonexistent"
    tests_create_test_and_save "qvm-shutdown 'nonexistent' "
    # --exclude and qubes and quotes
    tests_create_test_and_save 'qvm-shutdown --exclude "'
    tests_create_test_and_save 'qvm-shutdown --exclude "run'
    tests_create_test_and_save 'qvm-shutdown --exclude "runnin'
    tests_create_test_and_save 'qvm-shutdown --exclude "running'
    tests_create_test_and_save 'qvm-shutdown --exclude "nonexistent'
    tests_create_test_and_save 'qvm-shutdown --exclude "nonexistent" '
    tests_create_test_and_save "qvm-shutdown --exclude '"
    tests_create_test_and_save "qvm-shutdown --exclude 'run"
    tests_create_test_and_save "qvm-shutdown --exclude 'runnin"
    tests_create_test_and_save "qvm-shutdown --exclude 'running"
    tests_create_test_and_save "qvm-shutdown --exclude 'nonexistent"
    tests_create_test_and_save "qvm-shutdown --exclude 'nonexistent' "
    tests_create_test_and_save 'qvm-shutdown --exclude="'
    tests_create_test_and_save 'qvm-shutdown --exclude="run'
    tests_create_test_and_save 'qvm-shutdown --exclude="runnin'
    tests_create_test_and_save 'qvm-shutdown --exclude="running'
    tests_create_test_and_save 'qvm-shutdown --exclude="nonexistent'
    tests_create_test_and_save 'qvm-shutdown --exclude="nonexistent" '
    tests_create_test_and_save "qvm-shutdown --exclude='"
    tests_create_test_and_save "qvm-shutdown --exclude='run"
    tests_create_test_and_save "qvm-shutdown --exclude='runnin"
    tests_create_test_and_save "qvm-shutdown --exclude='running"
    tests_create_test_and_save "qvm-shutdown --exclude='nonexistent"
    tests_create_test_and_save "qvm-shutdown --exclude='nonexistent' "
    # invalid arguments
    tests_create_test_and_save 'qvm-shutdown --something_unknown '
    tests_create_test_and_save 'qvm-shutdown --something_unknown='
    tests_create_test_and_save 'qvm-shutdown --something_unknown -'
    tests_create_test_and_save 'qvm-shutdown --something_unknown --'
    tests_create_test_and_save 'qvm-shutdown --something_unknown -- '
    tests_create_test_and_save 'qvm-shutdown --something_unknown -h'
    tests_create_test_and_save 'qvm-shutdown --something_unknown --d'

    # cSpell:enable
}


function tests_generate_test_for_qubes_dom0_update() {

    tests_setup_new_output 'qubes-dom0-update'

    # cSpell:disable

    # argument-less call is not used, because it provides a lot of packages, huge list
    # tests_create_test_and_save 'qubes-dom0-update '

    # flags
    tests_create_test_and_save 'qubes-dom0-update -'
    tests_create_test_and_save 'qubes-dom0-update --'
    tests_create_test_and_save 'qubes-dom0-update -h'

    tests_create_test_and_save 'qubes-dom0-update --en'
    tests_create_test_and_save 'qubes-dom0-update --enablerep'

    tests_create_test_and_save 'qubes-dom0-update --a'
    tests_create_test_and_save 'qubes-dom0-update --act'
    tests_create_test_and_save 'qubes-dom0-update --action'
    tests_create_test_and_save 'qubes-dom0-update --action='
    tests_create_test_and_save 'qubes-dom0-update --action=remo'
    tests_create_test_and_save 'qubes-dom0-update --action="'
    tests_create_test_and_save 'qubes-dom0-update --action='\'''
    tests_create_test_and_save 'qubes-dom0-update --action="remo'
    tests_create_test_and_save 'qubes-dom0-update --action='\''remo'

    tests_create_test_and_save 'qubes-dom0-update --action=remove'
    tests_create_test_and_save 'qubes-dom0-update --action=remove -'
    tests_create_test_and_save 'qubes-dom0-update --action=remove --'

    tests_create_test_and_save 'qubes-dom0-update --action="remove"'
    tests_create_test_and_save 'qubes-dom0-update --action="remove" -'
    tests_create_test_and_save 'qubes-dom0-update --action="remove" --'

    tests_create_test_and_save 'qubes-dom0-update --action='\''remove'\'''
    tests_create_test_and_save 'qubes-dom0-update --action='\''remove'\'' -'
    tests_create_test_and_save 'qubes-dom0-update --action='\''remove'\'' --'

    # NOTE:dnf itself provides the full list of packages for call:
    # dnf install --something_unknown=
    # It is a bug of dnf completion, we will not deal with it
    #tests_create_test_and_save 'qubes-dom0-update --something_unknown='

    # invalid flags
    tests_create_test_and_save 'qubes-dom0-update --something_unknown -'
    tests_create_test_and_save 'qubes-dom0-update --something_unknown --'
    tests_create_test_and_save 'qubes-dom0-update --something_unknown -- -'
    tests_create_test_and_save 'qubes-dom0-update --something_unknown -h'
    tests_create_test_and_save 'qubes-dom0-update --something_unknown --act'

    # invalid arguments
    tests_create_test_and_save 'qubes-dom0-update something_unknown='
    tests_create_test_and_save 'qubes-dom0-update something_unknown -'
    tests_create_test_and_save 'qubes-dom0-update something_unknown --'
    tests_create_test_and_save 'qubes-dom0-update something_unknown -- -'
    tests_create_test_and_save 'qubes-dom0-update something_unknown -h'
    tests_create_test_and_save 'qubes-dom0-update something_unknown --act'

    # cSpell:enable
}

function tests_generator_main() {

    # Source helper and initialize everything required:
    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"
    # shellcheck source=tests_generator_helper.sh
    source "${script_dir}/tests_generator_helper.sh"
    tests_generator_init
    tests_common_setup

    # Example for generation a single command basic test:
    # tests_create_all_basic_tests_and_save 'qvm-service'
    # return


    # manual full tests
    tests_generate_test_for_qvm_ls
    tests_generate_test_for_qvm_tags
    tests_generate_test_for_qvm_shutdown
    tests_generate_test_for_qubes_dom0_update

    # basic test:
    tests_create_all_basic_tests_and_save 'qvm-ls'
    tests_create_all_basic_tests_and_save 'qvm-tags'
    tests_create_all_basic_tests_and_save 'qvm-shutdown'
    tests_create_all_basic_tests_and_save 'qvm-kill'
    tests_create_all_basic_tests_and_save 'qvm-run'
    tests_create_all_basic_tests_and_save 'qvm-pause'
    tests_create_all_basic_tests_and_save 'qvm-unpause'
    tests_create_all_basic_tests_and_save 'qvm-clone'
    tests_create_all_basic_tests_and_save 'qvm-remove'
    tests_create_all_basic_tests_and_save 'qvm-device'
    tests_create_all_basic_tests_and_save 'qvm-block'
    tests_create_all_basic_tests_and_save 'qvm-usb'
    tests_create_all_basic_tests_and_save 'qvm-pci'
    tests_create_all_basic_tests_and_save 'qvm-prefs'
    tests_create_all_basic_tests_and_save 'qvm-features'
    tests_create_all_basic_tests_and_save 'qvm-check'
    tests_create_all_basic_tests_and_save 'qvm-firewall'
    tests_create_all_basic_tests_and_save 'qvm-service'
    tests_create_all_basic_tests_and_save 'qvm-sync-appmenus'
    tests_create_all_basic_tests_and_save 'qvm-copy-to-vm'
    tests_create_all_basic_tests_and_save 'qvm-move-to-vm'
    tests_create_all_basic_tests_and_save 'qvm-copy'
    tests_create_all_basic_tests_and_save 'qvm-move'
    tests_create_all_basic_tests_and_save 'qvm-start-gui'
    tests_create_all_basic_tests_and_save 'qvm-start-daemon'
    tests_create_all_basic_tests_and_save 'qvm-xkill'
    tests_create_all_basic_tests_and_save 'qvm-sync-clock'
    tests_create_all_basic_tests_and_save 'qvm-get-image'
    tests_create_all_basic_tests_and_save 'qvm-get-tinted-image'
    tests_create_all_basic_tests_and_save 'qvm-console-dispvm'
    tests_create_all_basic_tests_and_save 'qubes-prefs'
    tests_create_all_basic_tests_and_save 'qubes-guid'
    tests_create_all_basic_tests_and_save 'qubes-hcl-report'
    tests_create_all_basic_tests_and_save 'qubes-bug-report'
    tests_create_all_basic_tests_and_save 'qubes-policy'
    tests_create_all_basic_tests_and_save 'qubes-vm-settings'
    tests_create_all_basic_tests_and_save 'qubes-vm-clone'
    tests_create_all_basic_tests_and_save 'qubes-vm-boot-from-device'
    tests_create_all_basic_tests_and_save 'qubes-input-trigger'
    tests_create_all_basic_tests_and_save 'qubes-guivm-session'
    tests_create_all_basic_tests_and_save 'qvm-start'
    tests_create_all_basic_tests_and_save 'qvm-create'
    tests_create_all_basic_tests_and_save 'qvm-volume'
    tests_create_all_basic_tests_and_save 'qvm-appmenus'
    tests_create_all_basic_tests_and_save 'qubesctl'
    tests_create_all_basic_tests_and_save 'qubesd-query'
    tests_create_all_basic_tests_and_save 'qvm-backup'
    tests_create_all_basic_tests_and_save 'qvm-backup-restore'

    tests_create_all_basic_tests_and_save 'qubes-vm-update'


    # dnf provides too big output with a full list of packages that are also env-dependent
    #tests_create_all_basic_tests_and_save 'qubes-dom0-update'
}

# Calling main
tests_generator_main "$@"
