#                                                          -*- shell-script -*-
#
#   qubes-completion - BASH completion for Qubes OS
#
#   Copyright © 2022-2023, @jamke (https://github.com/jamke)
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2, or (at your option)
#   any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software Foundation,
#   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#   The latest version of this software can be obtained here:
#
#   https://github.com/jamke/qubes-completion
#
#
#   Project provides typing completions and hints for commands specific to Qubes OS
#   operation system by completing all flags and arguments, qube names,
#   firewall rules, devices, prefs, features, tags, packages and etc.
#   Typing completion are provided for almost all commands starting with `qvm-`
#   and `qubes-` prefixes and several others.
#
#   See README.md for more information about the code structure, style and etc.
#

# Common completion flags that are used for almost all commands
COMPLETION_ALL_BASIC="--verbose -v --quiet -q --help -h"

# NOTE: We do not use qvm-ls --help-formats or --help-columns because the
# output is human-readable (includes comments), it is not reliable in future.
# A proper way is to use something like --list-formats/--list-columns but
# there are no such options for parsable output as for today.
# cSpell:disable
QVM_COMMON_TAGS='audiovm-dom0 created-by-dom0 guivm-dom0 anon-vm anon-gateway whonix-updatevm debian'
QVM_VM_CLASSES='AdminVM AppVM DispVM StandaloneVM TemplateVM'
VM_PROPS_VALUES_FOR_LABEL='red orange yellow green gray blue purple black'

# NOTE: class `testclass` is not on the list as it is not documenteted at all
QVM_DEVICE_CLASSES='block mic pci usb'

# Tools to use for getting data for completion
QVMTOOL_QVM_FIREWALL='qvm-firewall'
QVMTOOL_QVM_LS='qvm-ls'
QVMTOOL_QVM_TAGS='qvm-tags'
QVMTOOL_QVM_DEVICE='qvm-device'
QVMTOOL_QVM_POOL='qvm-pools'
# cSpell:enable

QVM_FIREWALL_USE_TABLE_OUTPUT='1'


# The list of supported commands for completion
declare -a SUPPORTED_COMMANDS_LIST=(

    'qubes-dom0-update'         # Tests: Good  # Features: 100%

    'qvm-ls'                    # Tests: FULL  # Features: 100%
    'qvm-tags'                  # Tests: FULL  # Features: 100%
    'qvm-start'                 # Tests: Basic # Features: #TODOs
    'qvm-shutdown'              # Tests: FULL  # Features: 100%
    'qvm-kill'                  # Tests: Basic # Features: 100%
    'qvm-run'                   # Tests: Basic # Features: 100%

    'qvm-pause'                 # Tests: Basic # Features: 100%
    'qvm-unpause'               # Tests: Basic # Features: 100%

    'qvm-create'                # Tests: Basic # Features: #TODOs
    'qvm-clone'                 # Tests: Basic # Features: can be better and provide pool:volumes, but qvm-volume is too slow
    'qvm-remove'                # Tests: Basic # Features: 100%

    'qvm-device'                # Tests: Basic # Features: 100%
    'qvm-block'                 # Tests: Basic # Features: 100%
    'qvm-usb'                   # Tests: Basic # Features: 100%
    'qvm-pci'                   # Tests: Basic # Features: 100%

    'qvm-prefs'                 # Tests: Basic # Features: 100%
    'qvm-features'              # Tests: Basic # Features: 100%

    'qvm-volume'                # Tests: Basic # Features: #TODO

    'qvm-template'              #TODO: Not implemented yet
    'qvm-template-postprocess'  #TODO: Not implemented yet
    'qvm-backup'                #TODO: Not implemented yet
    'qvm-backup-restore'        #TODO: Not implemented yet

    'qvm-pool'                  #TODO: Not implemented yet

    'qvm-check'                 # Tests: Basic # Features: 100%
    'qvm-firewall'              # Tests: Basic # Features: 100%
    'qvm-service'               # Tests: Basic # Features: 100%

    'qvm-sync-appmenus'         # Tests: Basic # Features: 100%
    'qvm-appmenus'              # Tests: Basic # Features: #TODOs (But all known is done)

    'qvm-copy-to-vm'            # Tests: Basic # Features: 100%
    'qvm-move-to-vm'            # Tests: Basic # Features: 100%
    'qvm-copy'                  # Tests: Basic # Features: 100%
    'qvm-move'                  # Tests: Basic # Features: 100%

    'qvm-start-gui'             # Tests: Basic # Features: 100% # Symlink to start-daemon
    'qvm-start-daemon'          # Tests: Basic # Features: 100%

    'qvm-xkill'                 # Tests: Basic # Features: 100% # Supports no arguments
    'qvm-sync-clock'            # Tests: Basic # Features: 100% # Supports no arguments

    'qubes-prefs'               # Tests: Basic # Features: 100% # but can be better
    'qubes-guid'                # Tests: Basic # Features: 100% # can be better, but no need

     # Commands that have no --quiet/verbose
    'qubesctl'                  # Tests: Basic # Features: #TODOs
    'qubesd-query'              # Tests: Basic # Features: #TODOs
    'qubes-hcl-report'          # Tests: Basic # Features: 100%
    'qubes-bug-report'          # Tests: Basic # Features: 100%
    'qvm-get-image'             # Tests: Basic # Features: 100%
    'qvm-get-tinted-image'      # Tests: Basic # Features: 100%

    # No man available, only --help:
    'qubes-policy'              # Tests: Basic # Features: 100%
    'qubes-vm-settings'         # Tests: Basic # Features: 100%
    'qubes-vm-clone'            # Tests: Basic # Features: 100%
    'qubes-vm-boot-from-device' # Tests: Basic # Features: 100%
    'qubes-input-trigger'       # Tests: Basic # Features: 100%

    # No man, no --help:
    'qubes-guivm-session'       # Tests: Basic # Features: 100%

    # Commands that have no --help/quiet/verbose
    'qvm-console-dispvm'        # Tests: Basic # Features: 100%


    # -----------------------------------------------------------
    # LIST OF NOT IMPLEMENTED (because of reasons provided below):
    # -----------------------------------------------------------

    # -----------------------------------------------------------
    # GUI tools with no command line arguments
    # -----------------------------------------------------------
    # 'qvm-template-gui'        # Actually a GUI tool that has wrong qvm- name
    # 'qubes-qube-manager'
    # 'qubes-backup-restore'
    # 'qubes-backup'
    # 'qubes-template-manager'
    # 'qubes-global-settings'
    # 'qubes-update-gui'
    # -----------------------------------------------------------

    # -----------------------------------------------------------
    # Those have --help but no man.
    # Can be implemented if someone uses
    # actively those from command line
    # -----------------------------------------------------------
    # 'qubesdb-multiread'
    # 'qubesdb-read'
    # 'qubesdb-list'
    # 'qubesdb-write'
    # 'qubesdb-cmd'
    # 'qubesdb-rm'
    # 'qubesdb-watch'
    # -----------------------------------------------------------

    # -----------------------------------------------------------
    # No man, no --help argument available
    # -----------------------------------------------------------
    # 'qubesdb-daemon'
    # 'qubesdb-read-bool'
    # 'qubes-input-sender'
    # 'qubes-policy-admin'
    # 'qubes-log-viewer'        # Takes file. No docs nor --help
    # 'qubes-vm-create'         # Takes file. No docs nor --help
    # 'qubes-create'            # No documentation nor actual command line arguments
    # 'qubesd'
    # -----------------------------------------------------------

    # -----------------------------------------------------------
    # Not supported, outdated or deprecated
    # -----------------------------------------------------------
    # 'qvm-pool-legacy'
    # -----------------------------------------------------------
)


# =================================================================
# Global variables
# =================================================================
# Used to store results of __init_qubes_completion() and provide proper
# completion according to Qubes OS command-line call rules.
# Allows to avoid code duplications (DRY) of parsing details everywhere else.

QB_alone_args=()        # Standalone args that do not belong to (before cursor)
QB_alone_args_count=0   # Length of QB_alone_args (for convenience, used a lot)
QB_flag_args=()         # Flags (before cursor)
QB_all_args=()          # All args: flags, their values and standalone args (before cursor)
QB_full_line_args=()    # All args in all line, even after cursor (almost not used)

QB_cur=''               # Current word, can be different from cur due to different splitting
QB_prev_flag=''         # Previous arg only if it must be related to the next one (qt_cur)
QB_real_cur=''          # String that is used for __complete_string() and other __complete_* functions

QB_orig_cur=''          # Original value of cur that BASH really wants us to complete

# Keeping track of parsing command-line through out different functions:
__PARSING_ARGS_REQUIRE_ONE=0         # of being after flag that requires one argument
__PARSING_ARGS_REQUIRE_MULTIPLE=0    # of being after flag that allows multiple arguments


# =================================================================
# DEBUG-related stuff
# =================================================================
# For debugging and testing modes (can be changed from QB_DEBUG_OVERRIDE_FILE file)
QB_DEBUG_MODE=0

function __debug_init() {

    # Default is off, can be changed from QB_DEBUG_OVERRIDE_FILE file
    QB_DEBUG_MODE=0

    # Load QB_DEBUG_OVERRIDE_FILE file if it exists
    # This way it is possible to turn debug from external.

    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"

    QB_DEBUG_OVERRIDE_FILE="${script_dir}/debug_overrides.sh"

    if [[ -f "${QB_DEBUG_OVERRIDE_FILE}" ]]; then

        # shellcheck source=debug_overrides.sh
        source "${QB_DEBUG_OVERRIDE_FILE}"
    fi
}

# Log a message to the log file if debug mode is on
function __debug_msg() {

    if (( QB_DEBUG_MODE == 0 )) || (( QB_DEBUG_LOG == 0 )); then
        return
    fi

    # NOTE: file for "tail -f" monitoring
    local filename="${QB_DEBUG_LOG_PATH}"

    echo "${1}" >> "${filename}"
}


# Log an array to the log file if debug mode is on (similar to declare -p but cleaner and works with refs)
function __debug_print_array() {

    local array_name="${1}"
    local -n array_to_print="${2}"
    echo -n "${array_name}=("

    local i
    for (( i=0; i < "${#array_to_print[@]}"; i++ )); do

        if (( i != 0 )); then
            echo -n ' '
        fi

        echo -n "[${i}]=\"${array_to_print[${i}]}\""
    done

    echo ')'
}


# Log all BASH completion variables to the log file if debug mode is on
function __debug_log_env() {

    __debug_msg "COMP_LINE=\"${COMP_LINE}\""
    __debug_msg "COMP_POINT=\"${COMP_POINT}\""
    __debug_msg "$( __debug_print_array 'COMP_WORDS' COMP_WORDS )"
    __debug_msg "COMP_CWORD=\"${COMP_CWORD}\""
    # __debug_msg "COMP_TYPE=\"${COMP_TYPE}\""
    # __debug_msg "COMP_KEY=\"${COMP_KEY}\""
    # __debug_msg "COMP_WORDBREAKS=\"${COMP_WORDBREAKS}\""
}


function __debug_log_start_of_init_qubes_completion() {

    local flags_require_one="${1}"
    local flags_require_multiple="${2}"

    __debug_msg ''
    __debug_msg '========================================================'
    __debug_msg "$( date )"
    __debug_msg ''
    __debug_msg "flags_require_one=\"${flags_require_one}\""
    __debug_msg "flags_require_multiple=\"${flags_require_multiple}\""
    __debug_msg '========================================================'

    __debug_msg '--------------------------------------------------------'
    __debug_msg '* BASH original COMP env:'
    __debug_msg ''
    __debug_log_env
    __debug_msg '--------------------------------------------------------'

}


function __debug_log_after_modified_init_completion() {

    # shellcheck disable=SC2034 # Shellcheck does not understand usage of passing arrays
    local -n arr_words="${1}"

    __debug_msg '--------------------------------------------------------'
    __debug_msg "* After calling \"_init_completion -n ':='\":"
    __debug_msg ''
    __debug_msg "cur=\"${cur}\""
    __debug_msg "prev=\"${prev}\""
    __debug_msg "$( __debug_print_array 'words' arr_words )"
    __debug_msg "cword=\"${cword}\""
    __debug_msg '--------------------------------------------------------'
}


function __debug_log_parsing_results() {

    __debug_msg '--------------------------------------------------------'
    __debug_msg '* Final result of parsing:'
    __debug_msg ''
    __debug_msg "QB_cur = \"${QB_cur}\""
    __debug_msg "QB_prev_flag = \"${QB_prev_flag}\""
    __debug_msg "QB_orig_cur = \"${QB_orig_cur}\""
    __debug_msg "$( __debug_print_array 'QB_flag_args' QB_flag_args )"
    __debug_msg "$( __debug_print_array 'QB_alone_args' QB_alone_args )"
    __debug_msg "$( __debug_print_array 'QB_all_args' QB_all_args )"
    __debug_msg "$( __debug_print_array 'QB_full_line_args' QB_full_line_args )"
    __debug_msg '--------------------------------------------------------'
}
# =================================================================


function __run_filedir() {

    # We need file completion

    __debug_msg "Running completion for files (filedir)"

    # NOTE: we need to re-init in a default way to make it work properly
    local cur prev words cword
    _init_completion || return 1

    # files completion for rest args
    _filedir
    # _filedir "$@" # Not needed for this script

    return 0
}


function __need_flags() {

    # if -- was provided previously then we have to stop suggesting flags
    __was_flag_used '--' && return 1

    # no flags are needed, because prev flag expects sub-argument (e.g. --flag=)
    __is_prev_flag_not_empty && return 1;

    if [[ "${QB_cur}" == -* ]]; then
        return 0
    else
        return 1
    fi
}


function __was_flag_used() {

    local arg_to_find="${1}"

    local i
    for (( i=0; i < "${#QB_flag_args[@]}"; i++ )); do
        if [[ "${QB_flag_args[${i}]}" == "${arg_to_find}" ]]; then
            return 0
        fi
    done

    return 1
}


function __is_prev_flag_not_empty() {

    if [[ "${QB_prev_flag}" != '' ]]; then
        return 0
    else
        return 1
    fi
}


function __reset_result_variables() {

    # Reset all result variables
    QB_alone_args=()
    QB_alone_args_count=0
    QB_flag_args=()
    QB_all_args=()
    QB_full_line_args=()

    # Previous arg only if it can be related to the current one
    QB_prev_flag=''

    # Current word, that can be affected by splitting and be different from cur
    QB_cur=''

    # String that is used for __complete_string() and other __complete_* functions
    QB_real_cur=''
}


function __parse_required_one() {

    local cur_word="${1}"

    # state
    local before_cursor="${2}"

    QB_full_line_args+=( "${cur_word}" )
    if (( before_cursor == 1)); then
        QB_all_args+=( "${cur_word}" )
        QB_prev_flag=''
    fi
}


function __parse_require_multiple() {

    local cur_word="${1}"

    # state
    local before_cursor="${2}"

    QB_full_line_args+=( "${cur_word}" )
    if (( before_cursor == 1)); then
        QB_all_args+=( "${cur_word}" )
    fi
}


function __parse_flags_stopper() {

    local cur_word="${1}"

    # state
    local before_cursor="${2}"

    QB_full_line_args+=( "${cur_word}" )
    if (( before_cursor == 1)); then
        QB_flag_args+=( "${cur_word}" )
        QB_all_args+=( "${cur_word}" )
        QB_prev_flag=''
    fi
}


function __parse_flag() {

    local cur_word="${1}"

    # state
    local flags_require_one="${2}"
    local flags_require_multiple="${3}"
    local before_cursor="${4}"
    local is_current_cursor="${5}"

    # try to split it with '=', maybe it already has a value
    if [[ "${cur_word}" == *=* ]]; then

        local flag_name="${cur_word%%=*}"
        local flag_value="${cur_word#*=}"
        # __debug_msg "flag_name=\"${flag_name}\""
        # __debug_msg "flag_value=\"${flag_value}\""

        QB_full_line_args+=( "${flag_name}" )
        QB_full_line_args+=( "${flag_value}" )

        # store results depending on cursor position
        if (( is_current_cursor == 1 )); then
            # current words is not finished, complete flag value
            QB_flag_args+=( "${flag_name}" )
            QB_all_args+=( "${flag_name}" )
            QB_prev_flag="${flag_name}"

        elif (( before_cursor == 1)); then
            # flag name and value are finished, forget about previous flag
            QB_flag_args+=( "${flag_name}" )
            QB_all_args+=( "${flag_name}" )
            QB_all_args+=( "${flag_value}" )
            QB_prev_flag=''
        fi

    else
        # remove trailing = if needed
        # local flag_name="${cur_word%=}"

        local flag_name="${cur_word}"

        # __debug_msg "flag_name=\"${flag_name}\""

        QB_full_line_args+=( "${flag_name}" )
        if (( before_cursor == 1)); then
            QB_flag_args+=( "${flag_name}" )
            QB_all_args+=( "${flag_name}" )

            if __is_argument_in_list_string "${flag_name}" "${flags_require_one}" ||
               __is_argument_in_list_string "${flag_name}" "${flags_require_multiple}" ; then
                QB_prev_flag="${flag_name}"
            else
                QB_prev_flag='' # unknown flag, we will not save it as important
            fi
        fi

        if __is_argument_in_list_string "${flag_name}" "${flags_require_one}" ; then
            __PARSING_ARGS_REQUIRE_ONE=1
            # continue
        elif __is_argument_in_list_string "${flag_name}" "${flags_require_multiple}" ; then
            __PARSING_ARGS_REQUIRE_MULTIPLE=1
            # continue
        fi
    fi
}


function __parse_standalone() {

    local cur_word="${1}"
    # state
    local flags_require_one="${2}"
    local flags_require_multiple="${3}"
    local before_cursor="${4}"

    QB_full_line_args+=( "${cur_word}" )
    if (( before_cursor == 1)); then
        QB_prev_flag=''

        QB_alone_args+=( "${cur_word}" )
        QB_all_args+=( "${cur_word}" )
    fi
}


function __parse_and_fix_cur() {

    local orig_cur="${1}"
    # state
    local flags_require_one="${2}"
    local flags_require_multiple="${3}"
    local allow_flags_in_cur="${4}"

    # __debug_msg '--------------------------------------------------------'
    # __debug_msg '* Fixing cur, getting QB_cur from cur:'
    # __debug_msg ''
    # __debug_msg "orig_cur = ${orig_cur}"

    # The argument under cursor can be a --flag=something that needs splitting,
    # or something complicated like: --flag=key=value=something=else

    # strip quotes at the beginning, let __complete_string() worry about it
    orig_cur="$( __strip_quotes_on_left "${orig_cur}" )"

    QB_cur="${orig_cur}"

    if (( allow_flags_in_cur == 1 )) && [[ "${orig_cur}" == -* ]]; then
        # a flag argument
        # try to split it with = char, maybe it has a required value already
        if [[ "${orig_cur}" == *=* ]]; then

            local flag_name="${orig_cur%%=*}"
            local flag_value="${orig_cur#*=}"

            QB_prev_flag="${flag_name}"

            QB_cur="${flag_value}"
            QB_cur="$( __strip_quotes_on_left "${QB_cur}" )"
        fi
    fi

    # __debug_msg "QB_cur = \"${QB_cur}\""
    # __debug_msg '--------------------------------------------------------'

    # __debug_msg '--------------------------------------------------------'
    # __debug_msg '* Init default QB_real_cur string'
    # __debug_msg ''

    # TODO: remove this support? (replace with the second approach)
    # We kind of support --option=name=value=something arguments,
    # to use that the caller should provide completion options
    # only for the last part "something"
    QB_real_cur="${QB_cur##*=}"
    # Another approach is to provide "value=something":
    #QB_real_cur="${QB_cur#*=}"

    # strip quotes at the beginning
    QB_real_cur="$( __strip_quotes_on_left "${QB_real_cur}" )"
    # __debug_msg "QB_real_cur = \"${QB_real_cur}\""
    # __debug_msg '--------------------------------------------------------'
}


# strip quotes at the beginning
function __strip_quotes_on_left() {

    local str="${1}"

    str="${str#\"}"
    str="${str#\'}"

    echo "${str}"
}

# strip both types of quotes
function __strip_quotes() {

    local str="${1}"

    str="${str#\"}"
    str="${str%\"}"

    str="${str#\'}"
    str="${str%\'}"

    echo "${str}"
}


# strip quotes around (only once and if needed)
function __strip_quotes_once_if_needed() {

    local str="${1}"

    if [[ "${str}" == \"*\" ]]; then
        str="${str#\"}"
        str="${str%\"}"
    elif [[ "${str}" == \'*\' ]]; then
        str="${str#\'}"
        str="${str%\'}"
    fi

    echo "${str}"
}


# Qubes OS tools use colon and equal sign as a value separation and
# as foo=bar separation for the value of the argument.
#
# So, this chars should not be used to break arguments.
# Modification of global COMP_WORDBREAKS is almost always not a good
# idea, even when one plans to set it back.
#
# The better approach that we use:
# 1) To keep default values for COMP_WORDBREAKS, COMP_CWORD and COMP_WORDS,
# 2) Use the result of "_init_completion -n ':='" and rearrange
#    the resulting arrays the way we expect them to be for Qubes OS.
# It also minimizes code duplication for cases with and without '='.
function __init_qubes_completion() {

    # List of arguments that require value after them
    # like --exclude=work or --exclude=work
    local flags_require_one="${1}"

    # List of arguments that require multiple values till some flag
    # like --tags tag1 tag2 tag3 --other-flag
    local flags_require_multiple="${2}"

    __debug_log_start_of_init_qubes_completion "${flags_require_one}" "${flags_require_multiple}"

    if [[ $(type -t _init_completion) != function ]]; then
        __debug_msg 'ERROR: _init_completion() does not exist'
        return 3
    fi

    # Run _init_completion() with options
    local cur prev words cword
    _init_completion -n ':=' || return 1
    __debug_log_after_modified_init_completion words

    # Reset all result variables
    __reset_result_variables

    # Keeping track:
    __PARSING_ARGS_REQUIRE_ONE=0         # of being after flag that requires one argument
    __PARSING_ARGS_REQUIRE_MULTIPLE=0    # of being after flag that allows multiple arguments
    local allow_flags=1                    # of getting flags stopper ('--' argument)
    local allow_flags_in_cur=1             # for understanding if cur argument is before a possible flag stopper
    local before_cursor=1                  # of being before cursor (cur word)
    local at_cursor=0                      # we are at cursor (cur word)

    # loop variables:
    local loop_cur_word=''
    local i

    # start from i = 1 to skip the command name
    for (( i=1; i < "${#words[@]}"; i++ )); do

        loop_cur_word="${words[${i}]}"

        # Save information about '--' forbidding flags for parsing and fixing cur later
        if (( i == cword )); then
            (( allow_flags_in_cur = allow_flags ))
            at_cursor=1
        else
            at_cursor=0
        fi

        # Keep track if we are before cursor, because often only this part matters
        if (( i >= cword )); then
            before_cursor=0
        fi

        # strip quotes around the loop_cur_word (but once)
        loop_cur_word="$( __strip_quotes_once_if_needed "${loop_cur_word}" )"

        __debug_msg "#${i} word: \"${loop_cur_word}\""

        if (( __PARSING_ARGS_REQUIRE_ONE == 1 )); then
            # consider the word as required dependent argument mo matter what it is.
            # It can even be '--', '--some=foo=bar' or anything.
            # If the user skipped the required value by mistake - it's not our problem,
            # because we should allow passing any argument even ones that look like flags

            __parse_required_one "${loop_cur_word}" "${before_cursor}"
            __debug_msg "__parse_required_one \"${loop_cur_word}\""

            __PARSING_ARGS_REQUIRE_ONE=0
            continue
        fi

        if (( __PARSING_ARGS_REQUIRE_MULTIPLE == 1 )); then

            # NOTE: it is not allowed to use something like:
            # qvm-something --tags=foo
            # because it has space separated list
            # Because of that, the case like:
            # qvm-something "--tags"=foo
            # will not be parsed properly (quotes are will not be removed) and it is OK
            if (( allow_flags == 1 )) && [[ "${loop_cur_word}" == -* ]]; then

                # if the current word is a flag then stop requiring more dependent arguments,
                if  (( before_cursor == 1 )) ||
                    (( at_cursor == 1 )); then
                    QB_prev_flag=''
                fi
                __PARSING_ARGS_REQUIRE_MULTIPLE=0
            else
                # otherwise continue collecting arguments as required values

                __parse_require_multiple "${loop_cur_word}" "${before_cursor}"
                __debug_msg "__parse_require_multiple \"${loop_cur_word}\""

                continue
            fi
        fi

        # Stop parsing flags after '--'
        if [[ "${loop_cur_word}" == '--' ]]; then

            # Stop processing flag arguments
            allow_flags=0

            # but save the last flag if it's not the last word
            __parse_flags_stopper "${loop_cur_word}" "${before_cursor}"
            __debug_msg "__parse_flags_stopper \"${loop_cur_word}\""

            continue
        fi

        if (( allow_flags == 1 )) && [[ "${loop_cur_word}" == -* ]]; then

            # a flag argument

            # Special flag for case current words is like --some=thing,
            # in this case we want to put --some as a flag as it is like before cursor
            local is_current_cursor=0
            if (( i == cword )); then
                is_current_cursor=1
            fi

            __parse_flag "${loop_cur_word}" "${flags_require_one}" "${flags_require_multiple}" "${before_cursor}" "${is_current_cursor}"
            __debug_msg "__parse_flag \"${loop_cur_word}\""

        else
            # not a flag argument
            # consider it to be a standalone argument

            __parse_standalone "${loop_cur_word}" "${flags_require_one}" "${flags_require_multiple}" "${before_cursor}"
            __debug_msg "__parse_standalone \"${loop_cur_word}\""
        fi
    done

    # Count QB_alone_args because it is used quite frequently
    QB_alone_args_count="${#QB_alone_args[@]}"

    __parse_and_fix_cur "${cur}" "${flags_require_one}" "${flags_require_multiple}" "${allow_flags_in_cur}"

    __find_original_really_completing

    __debug_log_parsing_results

    return 0
}


function __find_original_really_completing() {

    # Now recompute once again buy using default shell settings,
    # this way we get what terminal is actually being completing:
    local cur cword words=()
    __get_cword_at_cursor_by_ref '' words cword cur
    QB_orig_cur="${cur}"
    if [[ "${QB_orig_cur}" == '=' ]]; then
        # Provide completion after = with no space before it as it's a new word already
        QB_orig_cur=''
    fi
    if [[ "${QB_orig_cur}" == ':' ]]; then
        # Colon is also a delimiter for BASH by default
        QB_orig_cur=''
    fi
    # __debug_msg "QB_orig_cur = \"${QB_orig_cur}\""
}


function __is_argument_in_list_string() {

    local needle="${1}"
    local list_string="${2}"

    if [[ " ${list_string} " == *" ${needle} "* ]]; then
        return 0
    fi

    return 1
}


function __get_firewall_rules_raw_data() {

    local qube="${1}"

    local command_to_run="${QVMTOOL_QVM_FIREWALL}"

    if ! builtin command -v "${command_to_run}" >/dev/null 2>&1 ; then
        __debug_msg "No command to run: ${command_to_run}"
        return
    fi

    if (( QVM_FIREWALL_USE_TABLE_OUTPUT == 1)); then
        "${command_to_run}" "${qube}" list
    else
        "${command_to_run}" --raw "${qube}" list
    fi
}


function __get_qube_tags() {

    local qube="${1}"

    local command_to_run="${QVMTOOL_QVM_TAGS}"

    if ! builtin command -v "${command_to_run}" >/dev/null 2>&1 ; then
        __debug_msg "No command to run: ${command_to_run}"
        return
    fi

    "${command_to_run}" "${qube}" "list"
}


function __get_device_ids_raw_data() {

    local device_class="${1}"
    local qube="${2}"

    local command_to_run="${QVMTOOL_QVM_DEVICE}"

    if ! builtin command -v "${command_to_run}" >/dev/null 2>&1 ; then
        __debug_msg "No command to run: ${command_to_run}"
        return
    fi

    if [[ "${qube}" == '' ]]; then
        "${command_to_run}" "${device_class}" list
    else
        "${command_to_run}" "${device_class}" list "${qube}"
    fi
}


function __get_qubes_list_raw_data() {

    local need_state_column="${1}"
    local need_class_column="${2}"

    local command_to_run="${QVMTOOL_QVM_LS}"

    if ! builtin command -v "${command_to_run}" >/dev/null 2>&1 ; then
        __debug_msg "No command to run: ${command_to_run}"
        return
    fi

    # Limiting the columns count to the bare minimum of required ones

    # Compile --fields argument
    local fields='NAME'
    if (( need_state_column == 1 )); then
        fields="${fields},STATE"
    fi
    if (( need_class_column == 1 )); then
        fields="${fields},CLASS"
    fi

    "${command_to_run}" --raw-data --fields="${fields}"
}


function __get_qubes_list() {

    # NOTE: We can not use qvm-ls with arguments like --running or --halted
    # because it has no Transient state (it just skips qubes in this state).
    # To keep consistent code we have to use the grepping
    # NOTE: When qvm-ls gets support of --transient argument then it will
    # be better to change this function to remove grepping.

    # NOTE: We use regexp to match the second column and nothing else to
    # avoid any problems with name of the qube or any columns with
    # potentially arbitrary text and meaning.
    # We only rely on the first column to be a qube name,
    # and optional second and third - its state and class (type)

    local state="${1}"
    local class="${2}"

    local delim_char='|'

    local state_regex=''
    local need_state_column='1'

    case "${state}" in
        running)    state_regex='Running' ;;
        transient)  state_regex='Transient' ;;
        run_and_transient)  state_regex='\(Running\|Transient\)' ;;
        halted)     state_regex='Halted' ;;
        paused)     state_regex='Paused' ;;
        all|*)      need_state_column='0' ;;
    esac

    local class_regex=''
    local need_class_column='1'
    case "${class}" in
        AdminVM)        class_regex='AdminVM' ;;
        AppVM)          class_regex='AppVM' ;;
        DispVM)         class_regex='DispVM' ;;
        StandaloneVM)   class_regex='StandaloneVM' ;;
        TemplateVM)     class_regex='TemplateVM' ;;
        all|*)          need_class_column='0' ;;
    esac

    # This part was made so complicated to make completion faster
    # by limiting the columns count to the bare minimum of required ones
    local result_qubes=''
    result_qubes="$( __get_qubes_list_raw_data "${need_state_column}" "${need_class_column}" )"

    if (( need_state_column == 1 )); then
        result_qubes="$( echo "${result_qubes}" | grep --basic-regexp "^[^${delim_char}]\+${delim_char}${state_regex}" )"

        if (( need_class_column == 1 )); then
            result_qubes="$( echo "${result_qubes}" | grep --basic-regexp "^[^${delim_char}]\+${delim_char}[^${delim_char}]\+${delim_char}${class_regex}\s*$" )"
        fi
    else
        if (( need_class_column == 1 )); then
            result_qubes="$( echo "${result_qubes}" | grep --basic-regexp "^[^${delim_char}]\+${delim_char}${class_regex}" )"
        fi
    fi

    result_qubes="$( echo "${result_qubes}" \
        | cut --fields=1 --delimiter="${delim_char}" \
        | sort )"

    echo "${result_qubes}"
    return 0
}


function __format_firewall_rule_desc() {

    local raw_desc="${1}"

    # cSpell:disable
    raw_desc="${raw_desc//action=/}"
    raw_desc="${raw_desc//proto=/}"
    raw_desc="${raw_desc//dsthost=/to }"
    raw_desc="${raw_desc//dst4=/to }"
    raw_desc="${raw_desc//dst6=/to }"
    raw_desc="${raw_desc// dstports=/:}"
    # cSpell:enable

    # Do not know how to make this human-readable:
    # cSpell:disable
    # raw_desc="${raw_desc//icmptype=/}"
    # raw_desc="${raw_desc//specialtarget=/}"
    # raw_desc="${raw_desc//expire=/}"
    # cSpell:enable

    echo "${raw_desc}"
}


function __complete_firewall_rule_numbers() {

    local qube="${1}"

    local raw_data
    raw_data="$( __get_firewall_rules_raw_data "${qube}" )"

    local rules_array=()
    readarray -t rules_array < <(printf '%s' "${raw_data}")
    __debug_msg "$( __debug_print_array 'rules_array' rules_array )"

    # short (only-numbers) and long (with description) versions:
    local only_numbers_rules_array=()
    local with_desc_rules_array=()

    # NOTE: we can avoid creating $only_numbers_rules_array and use index of
    # $with_desc_rules_array, but for code consistency we better not
    local i
    local rules_array_count="${#rules_array[@]}"
    local table_header=''
    local formatted_rule_desc=''
    for (( i=0; i < rules_array_count; i++ )); do

        if (( QVM_FIREWALL_USE_TABLE_OUTPUT == 1)); then

            formatted_rule_desc="${rules_array[${i}]}"

            if (( i == 0 )); then
                # header
                # table_header=" N${formatted_rule_desc:2}"
                table_header="${formatted_rule_desc}"
            else
                local only_number="${formatted_rule_desc%%[[:space:]]*}"
                only_numbers_rules_array+=( "${only_number}" )

                with_desc_rules_array+=( "${formatted_rule_desc}" )
            fi

        else
            formatted_rule_desc="$( __format_firewall_rule_desc "${rules_array[${i}]}" )"

            only_numbers_rules_array+=( "${i}" )
            with_desc_rules_array+=( "${i}: ${formatted_rule_desc}" )
        fi
    done

    __debug_msg "$( __debug_print_array 'only_numbers_rules_array' only_numbers_rules_array )"
    __debug_msg "$( __debug_print_array 'with_desc_rules_array' with_desc_rules_array )"


    local count_completions
    count_completions="$( __count_completions_for_array only_numbers_rules_array )"
    # count_completions="$( __count_completions_for_string "${only_numbers_rules_array[*]}" )"

    __debug_msg "count_completions=\"${count_completions}\""

    if (( count_completions == 1 )); then
        __complete_array only_numbers_rules_array
    elif (( count_completions > 1 )); then

        if (( QVM_FIREWALL_USE_TABLE_OUTPUT == 1)); then
            # reset COMPREPLY and add header (not in one line to be explicit)
            COMPREPLY=()
            COMPREPLY+=( "${table_header}" )
        fi
        __complete_array with_desc_rules_array
        __completion_add_padding_for_completion_to_make_new_lines
    fi

    # We want our proper sorting (numeric)
    compopt -o nosort &>/dev/null # to /dev/null because output interferes with running tests
}


function __get_pools_list_raw_data() {

    local command_to_run="${QVMTOOL_QVM_POOL}"

    if ! builtin command -v "${command_to_run}" >/dev/null 2>&1 ; then
        __debug_msg "No command to run: ${command_to_run}"
        return
    fi

    "${command_to_run}" list
}


function __get_pools_list() {

    # skip title of the columns and take the first column
    local result_pools_list
    result_pools_list="$( __get_pools_list_raw_data \
        | tail --lines=+2 \
        | cut --fields=1 --delimiter=' ')"

    echo "${result_pools_list}"
}


function __complete_pools_list() {

    local result_pools_list
    result_pools_list="$( __get_pools_list )"

    __complete_string "${result_pools_list}"
}


function __complete_device_ids() {

    local device_class="${1}"
    local qube="${2}"

    # NOTE: we do not need to skip the header line of the qvm-device * list output
    # because is is not printed if the output is a pipe (not-obvious thing)

    # NOTE: qvm-device * list VMNAME for some reason lists both:
    # - devices attached to VMNAME
    # - provided by VMNAME (as a BACKEND)
    # No way to separate property, as there is no flag for that for qvm-device
    # and filtering the general output of qvm-device is not an option too,
    # because it is not formatted for reliable parsing - it has spaces as delimiters
    # but devices' names are already full of spaces and can be quite random.
    #
    # So, we use this trick: we get qvm-device list VMNAME, hoping it will work
    # properly and provide both used and provided devices,
    # then we remove provided devices that we can reliably parse
    # (first column before devices names) and we are left with attached devices.

    # local result_device_ids=''

    # if [[ "${qube}" != '' ]]; then
    #     result_device_ids="$( __get_device_ids_raw_data "${device_class}" "${qube}" \
    #         | grep --invert-match --basic-regexp "^${qube}:.*" \
    #         | cut --fields=1 --delimiter=' ' \
    #         | sort )"
    # else
    #     result_device_ids="$( __get_device_ids_raw_data "${device_class}" '' \
    #         | cut --fields=1 --delimiter=' ' \
    #         | sort )"
    # fi

    local raw_data
    raw_data="$( __get_device_ids_raw_data "${device_class}" "${qube}" )"
    if [[ "${qube}" != '' ]]; then
        raw_data="$( echo "${raw_data}" | grep --invert-match --basic-regexp "^${qube}:.*" )"
    fi

    local data_array=()
    readarray -t data_array < <(printf '%s' "${raw_data}")
    __debug_msg "$( __debug_print_array 'data_array' data_array )"

    # short and long (with description) strings for completion:
    local result_device_ids_short_array=()
    local result_device_ids_long_array=()

    local i
    local data_array_count="${#data_array[@]}"
    for (( i=0; i < data_array_count; i++ )); do
        result_device_ids_short_array+=( "$( echo "${data_array[${i}]}" | cut --fields=1 --delimiter=' ' )" )
        result_device_ids_long_array+=( "${data_array[${i}]}" )
    done

    __debug_msg "$( __debug_print_array 'result_device_ids_short_array' result_device_ids_short_array )"
    __debug_msg "$( __debug_print_array 'result_device_ids_long_array' result_device_ids_long_array )"

    local count_completions
    count_completions="$( __count_completions_for_array result_device_ids_short_array )"
    __debug_msg "count_completions=\"${count_completions}\""

    if (( count_completions <= 1 )); then
        __complete_array result_device_ids_short_array
    else
        __complete_array result_device_ids_long_array
        __completion_add_padding_for_completion_to_make_new_lines
    fi

    # We want our proper sorting (numeric)
    compopt -o nosort &>/dev/null # to /dev/null because output interferes with running tests
}


function __complete_qubes_list() {

    local state="${1}"
    local type="${2}"

    local qubes
    qubes="$( __get_qubes_list "${state}" "${type}" )"

    __complete_string "${qubes}"
}


function __complete_tags_of_qube() {

    local qube="${1}"

    local qube_tags
    qube_tags="$( __get_qube_tags "${qube}" )"

    __complete_string "${qube_tags}"
}


function __count_completions_for_array() {

    # in this function we should support spaces in completion strings
    local IFS=$'\n'

    local -n arr="${1}"

    # original completion based on "${QB_real_cur}"
    # This does not work properly on bash 5.0.17(1) that is used in R4.1
    # local full_comp=( "$(compgen -W "${arr[*]}" -- "${QB_real_cur}")" )

    local full_comp=()
    local i
    for (( i=0; i < "${#arr[@]}"; i++ )); do
        local comp_str
        comp_str="$(compgen -W "${arr[${i}]}" -- "${QB_real_cur}")"
        if (( "${#comp_str}" > 0 )); then
            full_comp+=( "${comp_str}" )
        fi
    done

    echo "${#full_comp[@]}"
}


function __complete_array() {

    # in this function we should support spaces in completion strings
    local IFS=$'\n'

    local -n arr="${1}"

    __debug_msg '--------------------------------------------------------'
    __debug_msg '* Called __complete_array()'
    __debug_msg ''
    __debug_msg "=> $( __debug_print_array 'arr' arr )"
    __debug_msg "=> QB_cur = \"${QB_cur}\""
    __debug_msg "=> QB_real_cur = \"${QB_real_cur}\""
    __debug_msg "=> QB_orig_cur = \"${QB_orig_cur}\""

    # TODO: consider case with quotes at the beginning? Or it all will work by itself?

    # original completion based on "${QB_real_cur}"
    # local full_comp=( "$(compgen -W "${arr[*]}" -- "${QB_real_cur}")" )

    local full_comp=()
    local i
    for (( i=0; i < "${#arr[@]}"; i++ )); do
        local comp_str
        comp_str="$(compgen -W "${arr[${i}]}" -- "${QB_real_cur}")"
        if (( "${#comp_str}" > 0 )); then
            full_comp+=( "${comp_str}" )
        fi
    done

    # local full_comp=( $(compgen -W "${options}" -- "${QB_cur}") ) #TODO: use something like that?
    __debug_msg "$( __debug_print_array 'full_comp' full_comp )"

    # result for completing for "${QB_orig_cur}"
    local converted_comp=()

    # We need to cut left QB_real_cur and insert left the QB_orig_cur,
    # so that BASH will complete it properly even with separators like '':'' and '='
    local i
    local full_comp_count="${#full_comp[@]}"
    for (( i=0; i < full_comp_count; i++ )); do

        # __debug_msg "    => full_comp[${i}] = \"${full_comp[${i}]}\""

        local without_beginning="${full_comp[${i}]:${#QB_real_cur}}"
        # __debug_msg "    => without_beginning = \"${without_beginning}\""

        local with_bash_beginning="${QB_orig_cur}${without_beginning}"
        # __debug_msg "    => with_bash_beginning = \"${with_bash_beginning}\""

        converted_comp+=( "${with_bash_beginning}" )
    done

    COMPREPLY+=( $(compgen -W "${converted_comp[*]}" -- "${QB_orig_cur}") )
    __debug_msg "$( __debug_print_array 'COMPREPLY' COMPREPLY )"
}


function __complete_string() {

    local options="${1}"

    __debug_msg '--------------------------------------------------------'
    __debug_msg '* Called __complete_string()'
    __debug_msg ''
    __debug_msg "=> options = \"${options}\""
    __debug_msg "=> QB_cur = \"${QB_cur}\""
    __debug_msg "=> QB_real_cur = \"${QB_real_cur}\""
    __debug_msg "=> QB_orig_cur = \"${QB_orig_cur}\""

    # TODO: consider case with quotes at the beginning? Or it all will work by itself?

    # original completion based on "${QB_real_cur}"
    local full_comp=( $(compgen -W "${options}" -- "${QB_real_cur}") )
    # local full_comp=( $(compgen -W "${options}" -- "${QB_cur}") ) #TODO: use something like that?
    __debug_msg "$( __debug_print_array 'full_comp' full_comp )"

    # result for completing for "${QB_orig_cur}"
    local converted_comp=()

    # We need to cut left QB_real_cur and insert left the QB_orig_cur,
    # so that BASH will complete it properly even with separators like '':'' and '='
    local i
    local full_comp_count="${#full_comp[@]}"
    for (( i=0; i < full_comp_count; i++ )); do

        # __debug_msg "    => full_comp[${i}] = \"${full_comp[${i}]}\""

        local without_beginning="${full_comp[${i}]:${#QB_real_cur}}"
        # __debug_msg "    => without_beginning = \"${without_beginning}\""

        local with_bash_beginning="${QB_orig_cur}${without_beginning}"
        # __debug_msg "    => with_bash_beginning = \"${with_bash_beginning}\""

        converted_comp+=( "${with_bash_beginning}" )
    done

    COMPREPLY+=( $(compgen -W "${converted_comp[*]}" -- "${QB_orig_cur}") )
    __debug_msg "$( __debug_print_array 'COMPREPLY' COMPREPLY )"
}


function __complete_general_firewall_rule() {

    # if only one = char and not from the beginning
    # then it's a proper option=value candidate
    if [[ "${QB_cur}" == *=*=* ]]; then
        # not a valid option=value candidate, too many = chars
        return 0
    fi


    if [[ "${QB_cur}" == *?=* ]]; then

        local option_name="${QB_cur%%=*}"
        option_name="$( __strip_quotes "${option_name}" )"
        # __debug_msg "option_name = ${option_name}"
        # option_value="${QB_cur#*=}"

        case "${option_name}" in
            action)
                __complete_string 'accept drop'
                return 0
                ;;
            dsthost | dst4 | dst6)
                # TODO: check if it works when IP entered with CIDP notation a hostname
                return 0
                ;;
            proto)
                __complete_string 'tcp udp icmp'
                return 0
                ;;
            dstports)
                # Nothing to provide (maybe common ports?)
                return 0
                ;;
            icmptype)
                # Nothing to provide
                return 0
                ;;
            specialtarget)
                __complete_string 'dns'
                return 0
                ;;
            expire)
                # Nothing to provide
                return 0
                ;;
            *)
                # Unknown option_name
                return 0
                ;;
        esac
    else
        __complete_string 'tcp udp icmp' # accept and drop are not here, because they must be first, not general
        __complete_string 'action= dsthost= dst4= dst6= dstports= icmptype= proto= specialtarget= expire='

        if (( "${#COMPREPLY[@]}" == 1 )) && [[ "${COMPREPLY[0]}" == *= ]]; then
            compopt -o nospace &>/dev/null # to /dev/null because output interferes with running tests
        fi
        return 0
    fi
}


function __complete_all_flags_if_needed() {

    local flags="${1}"

    if __need_flags ; then
        __complete_string "${flags}"
        __complete_string "${COMPLETION_ALL_BASIC}"
        return 0
    fi

    return 1
}


function __complete_all_starting_flags_if_needed() {

    local flags="${1}"

    # flags should be used only before qubes names and other standalone args
    if (( QB_alone_args_count == 0 )); then
        __complete_all_flags_if_needed "${flags}" && return 0
    fi

    return 1
}


function _qvm_ls() {

    __init_qubes_completion '-o --format -O --fields --exclude' '--tags' || return 0

    # __debug_msg "_qvm_ls(): QB_alone_args_count = \"${QB_alone_args_count}\""

    case "${QB_prev_flag}" in
        -o | --format)
            local qvm_ls_formats='disk full kernel network simple'
            __complete_string "${qvm_ls_formats}"
            return 0
            ;;
        -O | --fields)
            # Complete comma separated list
            local last_qube_name_typing="${QB_cur##*,}"
            # strip quotes at the beginning
            last_qube_name_typing="$( __strip_quotes_on_left "${last_qube_name_typing}" )"

            __debug_msg "last_qube_name_typing = \"${last_qube_name_typing}\""

            # NOTE: qvm-ls has a bug that it does not provide NAME in a list --help-columns nor in --help!
            # cSpell:disable-next-line
            local qvm_ls_columns='NAME CLASS DISK FLAGS GATEWAY MEMORY PRIV-CURR PRIV-MAX PRIV-USED ROOT-CURR ROOT-MAX ROOT-USED STATE'

            # NOTE: we save the original QB_real_cur value and return it back, should work even without it
            local saved_QB_real_cur="${QB_real_cur}"     # save original QB_real_cur just in case
            #
                # We have to manually set QB_real_cur, because comma is non-standard separator
                QB_real_cur="${last_qube_name_typing}"
                __complete_string "${qvm_ls_columns}"
            #
            QB_real_cur="${saved_QB_real_cur}"           # return the original value of QB_real_cur back

            # Nospace because it is comma separated
            compopt -o nospace &>/dev/null # to /dev/null because output interferes with running tests
            return 0
            ;;
        --tags)
            # Space separated list of tags
            __complete_string "${QVM_COMMON_TAGS}"
            return 0
            ;;
        --exclude)
            __complete_qubes_list 'all'
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    local flags='--help-columns --help-formats --all \
        --exclude --format -o --fields -O --tags --running --paused --halted \
        --raw-data --raw-list --tree -t --disk -d --network -n --kernel -k \
        --spinner --no-spinner'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    return 0
}


function _qvm_create() {

    __init_qubes_completion '--class -C --property --prop -P --pool -p --template -t --label -l --root-copy-from -r --root-move-from -R'  || return 0

    # Call with --help-classes needs no more arguments
    __was_flag_used '--help-classes' && return 0

    case "${QB_prev_flag}" in
        -C | --class)
            __complete_string "${QVM_VM_CLASSES}"
            return 0
            ;;
        -P)
            __complete_pools_list
            return 0
            ;;
        -p | --pool)
            # NOTE: unfortunately, we do not list the volumes because
            # qvm-volume list takes like seconds on a modern computer,
            # that is 10 times slower than sudo lvs that provides almost
            # the same information.
            #
            # The completion for volumes can be added when qvm-volume
            # is either optimized or rewritten to be not that slow.
            __complete_pools_list
            return 0
            ;;
        --property | --prop)
            # TODO: use code from qvm-prefs?
            return 0
            ;;
        -t | --template)
            __complete_qubes_list 'all' 'TemplateVM'
            return 0
            ;;
        -l | --label)
            __complete_string "${VM_PROPS_VALUES_FOR_LABEL}"
            return 0
            ;;
        --root-copy-from | -r | --root-move-from | -R)
            __run_filedir
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    # NOTE: skipping --prop (short version of --property)
    local flags='--class -C --property -P --pool -p --template -t --label -l --root-copy-from -r --root-move-from -R --standalone --disp --help-classes --force-root'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    # List qubes (up to 2)
    if (( QB_alone_args_count = 0 )); then
        # Provide names of qubes to make it easy to create qube with similar name
        __complete_qubes_list 'all'
    fi

    return 0
}


function _qvm_clone() {

    __init_qubes_completion '--class -C -P --pool -p'  || return 0

    case "${QB_prev_flag}" in
        -C | --class)
            __complete_string "${QVM_VM_CLASSES}"
            return 0
            ;;
        -P)
            __complete_pools_list
            return 0
            ;;
        -p | --pool)
            # NOTE: unfortunately, we do not list the volumes because
            # qvm-volume list takes like seconds on a modern computer,
            # that is 10 times slower than sudo lvs that provides almost
            # the same information.

            # The completion for volumes can be added when qvm-volume
            # is either optimized or rewritten to be not that slow.

            __complete_pools_list

            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac


    local flags='--class -C --ignore-errors -p -P --pool'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    # List qubes (up to 2)
    if (( QB_alone_args_count < 2 )); then
        __complete_qubes_list 'all'
    fi

    return 0
}


function _qvm_start() {

    __init_qubes_completion '--drive --hddisk --cdrom --exclude'  || return 0

    case "${QB_prev_flag}" in
        --drive)
            # TODO:
            # idea - provide qubes names and after qube being typed - device (no path)
            # hd:qube_name:device or hd:qube_name:path
            # cdrom:qube_name:device or cdrom:qube_name:path
            return 0
            ;;
        --hddisk)
            # TODO:
            # the same as --drive=hd:
            return 0
            ;;
        --cdrom)
            # TODO:
            # the same as --drive=cdrom:
            return 0
            ;;
        --exclude)
            __complete_qubes_list 'halted'
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    local flags='--skip-if-running --all --exclude --drive --hddisk --cdrom --install-windows-tools'
    __complete_all_starting_flags_if_needed "${flags}" && return 0


    if (( QB_alone_args_count == 0 )); then
        __complete_qubes_list 'halted'
        return 0
    fi

    return 0
}


function _qvm_shutdown() {

    __init_qubes_completion '--timeout --exclude'  || return 0

    case "${QB_prev_flag}" in
        --exclude)
            __complete_qubes_list 'running'
            return 0
            ;;
        --timeout)
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    local flags='--all --exclude --wait --timeout --force --dry-run'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    # NOTE: provide qube names indefinitely as the qvm-shutdown --help says
    # but man qvm-shutdown shows that only one qube is allowed
    # I checked and currently multiple qubes are allowed
    __complete_qubes_list 'running'

    return 0
}


function _qvm_kill() {

    __init_qubes_completion '--exclude'  || return 0

    case "${QB_prev_flag}" in
        --exclude)
            __complete_qubes_list 'run_and_transient'
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    local flags='--all --exclude'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    __complete_qubes_list 'run_and_transient'

    return 0
}


function _qvm_pause() {

    __init_qubes_completion '--exclude'  || return 0

    case "${QB_prev_flag}" in
        --exclude)
            __complete_qubes_list 'running'
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    local flags='--all --exclude'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    # NOTE: provide qube names indefinitely as the qvm-pause --help says
    # but man qvm-pause shows that only one qube is allowed
    # I checked and currently multiple qubes are allowed
    __complete_qubes_list 'running'

    return 0
}


function _qvm_unpause() {

    __init_qubes_completion '--exclude' || return 0

    case "${QB_prev_flag}" in
        --exclude)
            __complete_qubes_list 'paused'
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    local flags='--all --exclude'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    # NOTE: provide qube names indefinitely as the qvm-unpause --help says
    # but man qvm-unpause shows that only one qube is allowed
    # I checked and currently multiple qubes are allowed
    __complete_qubes_list 'paused'

    return 0
}


function _qvm_tags() {

    __init_qubes_completion || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    if (( QB_alone_args_count == 2 )); then
        case "${QB_alone_args[1]}" in
            list | ls | l)
                __complete_tags_of_qube "${QB_alone_args[0]}"
                return 0
                ;;
        esac
    fi

    if (( QB_alone_args_count >= 2 )); then
        case "${QB_alone_args[1]}" in
            add | set | a)
                __complete_string "${QVM_COMMON_TAGS}"
                return 0
                ;;
        esac

        case "${QB_alone_args[1]}" in
            del | unset | u)
                __complete_tags_of_qube "${QB_alone_args[0]}"
                return 0
                ;;
        esac
    fi

    if (( QB_alone_args_count == 1 )); then

        # NOTE: provide long options without very short
        # duplicates 'ls a u' as completion will do the work
        __complete_string 'list set unset add del'
        return 0
    fi

    local flags=''
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    if (( QB_alone_args_count == 0 )); then
        __complete_qubes_list 'all'
    fi

    return 0
}


function _qvm_remove() {

    __init_qubes_completion '--exclude' || return 0

    case "${QB_prev_flag}" in
        --exclude)
            __complete_qubes_list 'all'
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    local flags='--all --exclude --force -f --force-root --just-db'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    __complete_qubes_list 'all'

    return 0
}


function __prepare_device_completion() {

    local device_class="${1}"
    local shift_args="${2}"

    local command=''
    if (( QB_alone_args_count >= 1 - shift_args )); then
        command="${QB_alone_args[ (( 1 - shift_args )) ]}"
    fi

    local qube_name=''
    if (( QB_alone_args_count >= 2 - shift_args )); then
        qube_name="${QB_alone_args[ (( 2 - shift_args )) ]}"
    fi

    # BACKEND:DEVICE_ID or another qube name in case of list COMMAND
    local extra_argument=''
    if (( QB_alone_args_count >= 3 - shift_args )); then
        extra_argument="${QB_alone_args[ (( 3 - shift_args )) ]}"
    fi

    __process_device_completion "${device_class}" "${command}" "${qube_name}" "${extra_argument}"

    return $?
}


function __process_device_completion() {

    local device_class="${1}"
    local command="${2}"
    local qube_name="${3}"
    local extra_argument="${4}"

    # Stop completion is --list-device-classes was used and device_class is known
    __was_flag_used '--list-device-classes' && return 0

    __debug_msg "device_class = ${device_class}"
    __debug_msg "command = ${command}"
    __debug_msg "qube_name = ${qube_name}"
    __debug_msg "extra_argument = ${extra_argument}"

    if [[ "${command}" == '' ]]; then

        __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

        # As of the moment this script allows to use --list-device-classes
        # before and after device class like:
        # $ qvm-device usb --list-device-classes
        # $ qvm-device --list-device-classes usb
        # but not after COMMAND, not like :
        # $ qvm-device usb list --list-device-classes)
        # Even `man qvm-device` and `qvm-device --help` provide these two ways.

        local flags='--list-device-classes'
        __complete_all_flags_if_needed "${flags}" && return 0

        # Short duplicate versions 'ls l at a dt d' are not provided
        # because they interfere typing long and proper ones,
        # and are too short for completion to be used anyway.
        __complete_string 'list attach detach'
        return 0
    fi

    case "${command}" in
        list | ls | l)
            if [[ "${qube_name}" == '' ]]; then

                case "${QB_prev_flag}" in
                    --exclude)
                        __complete_qubes_list 'all'
                        return 0
                        ;;
                    ?*)
                        # unknown prev flag expects sub-argument
                        return 0
                        ;;
                esac

                local flags='--all --exclude'
                __complete_all_flags_if_needed "${flags}" && return 0
            fi

            __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

            # complete qube_name or any additional qubes names
            __complete_qubes_list 'all'
            return 0
            ;;

        attach | a | at)
            if [[ "${qube_name}" == '' ]]; then

                case "${QB_prev_flag}" in
                    --option | -o)

                        # if only one = char and not from the beginning
                        # then it's a proper option=value candidate
                        if [[ "${QB_cur}" == *=*=* ]]; then
                            # not a valid option=value candidate, too many = chars
                            return 0
                        fi

                        case "${device_class}" in
                            block)

                                if [[ "${QB_cur}" == *?=* ]]; then

                                    local option_name="${QB_cur%%=*}"
                                    option_name="$( __strip_quotes "${option_name}" )"
                                    # __debug_msg "option_name = ${option_name}"
                                    # local option_value="${QB_cur#*=}"

                                    case "${option_name}" in
                                        frontend-dev)
                                            # cSpell:disable-next-line
                                            __complete_string 'xvda xvdb xvdc xvdd xvde xvdf xvdj xvdh xvdi xvdj xvdk xvdl xvdm xvdn xvdo xvdp xvdq xvdr xvds xvdt xvdu xvdv xvdw xvdx xvdy xvdz'
                                            return 0
                                            ;;
                                        read-only)
                                            __complete_string 'yes no'
                                            return 0
                                            ;;
                                        devtype)
                                            __complete_string 'disk cdrom'
                                            return 0
                                            ;;
                                        *)
                                            return 0
                                            ;;
                                    esac
                                else
                                    __complete_string 'frontend-dev= read-only= devtype='
                                    compopt -o nospace &>/dev/null # to /dev/null because output interferes with running tests
                                    return 0
                                fi
                                ;;

                            pci)

                                if [[ "${QB_cur}" == *?=* ]]; then

                                    local option_name="${QB_cur%%=*}"
                                    option_name="$( __strip_quotes "${option_name}" )"
                                    # __debug_msg "option_name = ${option_name}"
                                    # local option_value="${QB_cur#*=}"

                                    case "${option_name}" in
                                        no-strict-reset)
                                            __complete_string 'True False'
                                            return 0
                                            ;;
                                        permissive)
                                            __complete_string 'True False'
                                            return 0
                                            ;;
                                        *)
                                            return 0
                                            ;;
                                    esac
                                else
                                    __complete_string 'no-strict-reset= permissive='
                                    compopt -o nospace &>/dev/null # to /dev/null because output interferes with running tests
                                    return 0
                                fi
                                ;;
                            *)
                                # usb and mic does not support options
                                return 0
                                ;;
                        esac
                        ;;
                    ?*)
                        # unknown prev flag expects sub-argument
                        return 0
                        ;;
                esac

                local flags='--ro --persistent -p --option -o'
                __complete_all_flags_if_needed "${flags}" && return 0

                __complete_qubes_list 'all'
                return 0

            elif [[ "${extra_argument}" == '' ]]; then
                # qube name is set

                # helping wth BACKEND_DOMAIN:DEVICE_ID

                __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

                __complete_device_ids "${device_class}" ''
                return 0
            fi

            # no more arguments are allowed
            return 0
            ;;

        detach | dt | d)

            if [[ "${qube_name}" == '' ]]; then

                __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

                __complete_qubes_list 'all'

                return 0

            elif [[ "${extra_argument}" == '' ]]; then

                __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

                __complete_device_ids "${device_class}" "${qube_name}"
                return 0
            fi

            # no more arguments are allowed
            return 0
            ;;
    esac
}


function _qvm_device() {

    __init_qubes_completion '--exclude --option -o' || return 0

    if (( QB_alone_args_count == 0 )); then

        __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

        # NOTE: qvm-device --list-device-classes is not working, at least in R4.1,
        # but something like "qvm-device --list-device-classes usb" works and
        # is allowed according to --help (but not man)
        local flags='--list-device-classes'
        __complete_all_flags_if_needed "${flags}" && return 0

        __complete_string "${QVM_DEVICE_CLASSES}"
        return 0
    fi

    local device_class="${QB_alone_args[0]}"

    __prepare_device_completion "${device_class}" '0'
    res="$?"

    return "${res}"
}


function _qvm_pci() {

    __init_qubes_completion '--exclude --option -o' || return 0

    __prepare_device_completion  'pci' '1'
    return ${?}
}


function _qvm_usb() {

    __init_qubes_completion '--exclude --option -o' || return 0

    __prepare_device_completion  'usb' '1'
    return ${?}
}


function _qvm_block() {

    __init_qubes_completion '--exclude --option -o' || return 0

    __prepare_device_completion  'block' '1'
    return ${?}
}


function _qvm_prefs() {

    __init_qubes_completion || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    # cSpell:disable
    local vm_properties_bool='autostart debug template_for_dispvms include_in_backups provides_network installed_by_rpm updateable'
    local vm_properties_qube='audiovm default_dispvm netvm template guivm management_dispvm'
    local vm_properties_string='default_user ip kernel kernelopts mac maxmem memory name qrexec_timeout stubdom_mem stubdom_xid vcpus backup_timestamp dns gateway gateway6 icon ip6 keyboard_layout qid shutdown_timeout start_time uuid visible_gateway visible_gateway6 visible_ip visible_ip6 visible_netmask xid'
    local vm_properties_custom='label virt_mode klass'
    local vm_properties_all="${vm_properties_bool} ${vm_properties_qube} ${vm_properties_string} ${vm_properties_custom}"

    local vm_properties_values_generic_bool='True true on 1 False false off 0'
    local vm_properties_values_for_virt_mode='hvm pv'
    local vm_properties_values_for_klass="${QVM_VM_CLASSES}"
    # cSpell:enable

    # NOTE: --get --set -g -s are deprecated and ignored
    local flags='--force-root --help-properties --hide-default'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    if (( QB_alone_args_count == 0 )); then
        __complete_qubes_list 'all'
        return 0
    fi

    if (( QB_alone_args_count == 1 )); then

        # we should stop if there was --help-properties
        __was_flag_used "--help-properties" && return 0

        # or provide all properties otherwise
        __complete_string "${vm_properties_all}"
        return 0
    fi

    if (( QB_alone_args_count == 2 )); then

        # default is always a valid option for value
        __complete_string '--default'

        # we have a property that defines type
        local property="${QB_alone_args[1]}"

        case "${property}" in
            label)
                __complete_string "${VM_PROPS_VALUES_FOR_LABEL}"
                return 0
                ;;
            virt_mode)
                __complete_string "${vm_properties_values_for_virt_mode}"
                return 0
                ;;
            klass)
                __complete_string "${vm_properties_values_for_klass}"
                return 0
                ;;
        esac

        if __is_argument_in_list_string "${property}" "${vm_properties_bool}" ; then
            __complete_string "${vm_properties_values_generic_bool}"
            return 0
        elif __is_argument_in_list_string "${property}" "${vm_properties_qube}" ; then
            __complete_qubes_list 'all' # TODO: we can change the list of VMs based on property, will be even better
            return 0
        elif __is_argument_in_list_string "${property}" "${vm_properties_string}" ; then
            # Can be anything
            return 0
        fi
    fi

    # too many args, completion should not work
    return 0
}


function _qvm_features() {

    __init_qubes_completion || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    # cSpell:disable-next-line
    local vm_common_features='gui gui-emulated gui-default-allow-utf8-titles input-dom0-proxy qrexec rpc-clipboard no-monitor-layout internal appmenus-legacy appmenus-dispvm qubes-firewall updates-available video-model net.fake-ip net.fake-gateway net.fake-netmask pci-e820-host linux-stubdom tag-created-vm-with set-created-guivm check-updates menu-items qubesmanager.maxmem_value servicevm service.clocksync service.qubes-update-check default-menu-items netvm-menu-items os vmexec template-name template-epoch template-version template-release template-reponame template-buildtime template-installtime template-license template-url template-summary template-description supported-service.guivm-gui-agent supported-service.qubes-update-check supported-service.qubes-updates-proxy supported-service.qubes-firewall supported-service.qubes-network supported-service.clocksync supported-service.updates-proxy-setup supported-service.meminfo-writer audio-model stubdom-qrexec timezone timer-period out.latency out.buffer-length'

    local flags='--unset --default --delete --D'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    if (( QB_alone_args_count == 0 )); then
        __complete_qubes_list 'all'
        return 0
    fi

    if (( QB_alone_args_count == 1 )); then
        # provide all common features. The list is not full nor it can be,
        # as everything can be used as a name and value actually.
        __complete_string "${vm_common_features}"
        return 0
    fi

    if (( QB_alone_args_count == 2 )); then
        # The value can be anything
        return 0
    fi

    return 0
}


function _qvm_volume() {

    __init_qubes_completion || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)


    if (( QB_alone_args_count == 0 )); then
        __complete_string 'list info config resize revert import'
        return 0
    fi

    if (( QB_alone_args_count >= 1 )); then

        local command="${QB_alone_args[0]}"

        __debug_msg "command = \"${command}\""

        case "${command}" in
            list)
                # TODO
                return 0
                ;;

            info)
                # TODO
                return 0
                ;;

            config)
                # TODO
                return 0
                ;;

            resize)
                # TODO
                return 0
                ;;

            revert)
                # TODO
                return 0
                ;;

            import)
                # TODO
                return 0
                ;;

            *)
                # Not a valid action
                return 0
                ;;

        esac

        # local flags='--force-root --force-rpc --regenerate-only'
        # __complete_all_starting_flags_if_needed "${flags}" && return 0


        # # provide all common features. The list is not full nor it can be,
        # # as everything can be used as a name and value actually.
        # __complete_string "${vm_common_features}"
        # return 0
    fi

    if (( QB_alone_args_count == 2 )); then
        # The value can be anything
        return 0
    fi

    return 0
}


function _qvm_sync_appmenus() {

    __init_qubes_completion || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    if (( QB_alone_args_count > 0 )); then
        # nothing after qubes's name
        return 0
    fi

    local flags='--force-root --force-rpc --regenerate-only'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    __complete_qubes_list 'all'

    return 0
}


function _qvm_appmenus() {

    __init_qubes_completion '--set-whitelist --set-default-whitelist --get-default-whitelist --source --file-field --template' || return 0

    case "${QB_prev_flag}" in
        --set-whitelist)
            # TODO
            return 0
            ;;
        --set-default-whitelist)
            # TODO
            return 0
            ;;
        --get-default-whitelist)
            # TODO
            return 0
            ;;
        --source)
            # TODO: is it right to show all qubes?
            __complete_qubes_list 'all'
            return 0
            ;;
        --file-field)
            # TODO
            return 0
            ;;
        --template)
            # TODO
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac


    local flags='--force-root --init --create --remove --update --get-available --get-whitelist --set-whitelist --set-default-whitelist --get-default-whitelist --source --force --i-understand-format-is-unstable --file-field --template --all'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    __complete_qubes_list 'all'

    return 0
}


function _qvm_copy_to_vm() {

    __init_qubes_completion || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    local flags='--without-progress'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    if (( QB_alone_args_count == 0 )); then
        __complete_qubes_list 'all'
        return 0
    fi

    # files completion for rest args
    __run_filedir

    return 0
}


function _qvm_move_to_vm() {

    _qvm_copy_to_vm
    return $?
}


function _qvm_copy() {

    __init_qubes_completion || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    local flags='--without-progress'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    # files completion for rest args
    __run_filedir

    return 0
}


function _qvm_move() {

    _qvm_copy
    return $?
}


function _qvm_start_daemon() {

    __init_qubes_completion '--exclude --pidfile' || return 0

    case "${QB_prev_flag}" in
        --exclude)
            __complete_qubes_list 'all' # TODO: we can do better?
            return 0
            ;;
        --pidfile)
            __run_filedir
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    # cSpell:disable-next-line
    local flags='--all --exclude --watch --force-stubdomain --pidfile --notify-monitor-layout --kde --force'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    __complete_qubes_list 'all' # TODO: we can do better?

    return 0
}


function _qvm_start_gui() {

    # Currently qvm-start-gui is a symlink to qvm-start-daemon
    _qvm_start_daemon
    return $?
}


function _qvm_xkill() {

    # The command does not support any arguments
    return 0
}


function _qvm_sync_clock() {

    # The command does not support any arguments
    return 0
}


function _qvm_run() {

    # cSpell:disable-next-line
    __init_qubes_completion '--exclude --user -u --localcmd --colour-output --color-output --colour-stderr --color-stderr --dispvm' || return 0

    # NOTE: We do not check if the previous argument was correctly used or placed
    case "${QB_prev_flag}" in
        --user | -u | --localcmd | \
        --colour-output | --color-output | \
        --colour-stderr | --color-stderr)
            return 0
            ;;
        --exclude)
            __complete_qubes_list 'all'
            return 0
            ;;
        --dispvm)
            # will be processed later
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac


    # We have to find out which of 3 uses of command we deal with
    if __was_flag_used '--all'; then
        # Case 2 - no qube name, run all
        # __debug_msg "Case 2 - no qube name, run all"
        # --exclude or COMMAND are allowed
        if (( QB_alone_args_count == 0 )); then
            case "${QB_prev_flag}" in
                --exclude)
                    __complete_qubes_list 'all'
                    return 0
                    ;;
                ?*)
                    # unknown prev flag expects sub-argument
                    return 0
                    ;;
            esac
        fi

        # not completing COMMAND nor ARGS (nothing else is not allowed after --dispvm)
        return 0

    elif __was_flag_used '--dispvm'; then
        # Case 3 - uses dispvm
        # __debug_msg "Case 3 - uses dispvm"
        # The --dispvm flag can be followed by qube name or --all
        if (( QB_alone_args_count == 0 )); then
            case "${QB_prev_flag}" in
                --dispvm)
                    __complete_qubes_list 'all' 'DispVM'
                    return 0
                    ;;
                ?*)
                    # unknown prev flag expects sub-argument
                    return 0
                    ;;
            esac
        fi

        # not completing COMMAND nor ARGS (nothing else is not allowed after --dispvm)
        # and standalone qube name is not allowed too
        return 0
    else
        # Case 1 - default use with qube name
        # __debug_msg "Case 1 - default use with qube name"

        __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

        # cSpell:disable-next-line
        local flags='--all --exclude --dispvm --user -u --auto --autostart -a --no-auto --no-autostart -n --pass-io -p --localcmd --gui --no-gui --nogui --service --colour-output --color-output --colour-stderr --color-stderr --no-colour-output --no-color-output --no-colour-stderr --no-color-stderr --filter-escape-chars --no-filter-escape-chars --no-shell'
        __complete_all_flags_if_needed "${flags}" && return 0

        if (( QB_alone_args_count == 0 )); then
            __complete_qubes_list 'all'
        elif (( QB_alone_args_count > 0 )); then
            # not completing COMMAND nor ARGS
            return 0
        fi
    fi

    return 0
}


function _qvm_check() {

    __init_qubes_completion '--exclude' || return 0

    case "${QB_prev_flag}" in
        --exclude)
            __complete_qubes_list 'all'
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    local flags='--all --exclude --running --paused --template --networked'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

   # NOTE: here we can stop providing qube names if --all was used. Should we?
    __complete_qubes_list 'all'

    return 0
}


function _qvm_firewall() {

    __init_qubes_completion '--before --rule-no' || return 0

    # Problem of unknown prev flags is taken into account depending on amount of alone args

    if (( QB_alone_args_count == 0 )); then

        __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

        local flags='--reload -r --raw'
        __complete_all_starting_flags_if_needed "${flags}" && return 0

        __complete_qubes_list 'all'
        return 0
    fi

    if (( QB_alone_args_count == 1 )); then

        __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

        # limit completion  if --raw was used
        if __was_flag_used '--raw'; then
            # The use case with only list being allowed (case 3 in man)
            __complete_string 'list'
            return 0
        fi

        __complete_string 'add del list reset'
        return 0
    fi

    if (( QB_alone_args_count == 2 )); then

        local qube="${QB_alone_args[0]}" # can be used for del and add
        local action="${QB_alone_args[1]}"

        __debug_msg "qube = \"${qube}\""
        __debug_msg "action = \"${action}\""

        case "${action}" in
            add)
                case "${QB_prev_flag}" in
                    --before)
                        # Provide rule numbers (with comments if not the only one choice left)
                        __complete_firewall_rule_numbers "${qube}"
                        return 0
                        ;;
                    ?*)
                        # unknown prev flag expects sub-argument
                        return 0
                        ;;
                esac

                # NOTE: '--' does not block flags here (I checked)
                if [[ "${QB_cur}" == -* ]]; then
                    __complete_string '--before='
                    compopt -o nospace &>/dev/null # to /dev/null because output interferes with running tests
                    return 0
                fi

                __complete_string 'accept drop'
                __complete_general_firewall_rule
                return 0
                ;;

            del)
                case "${QB_prev_flag}" in
                    --rule-no)
                        # Provide rule numbers (with comments if not the only one choice left)
                        __complete_firewall_rule_numbers "${qube}"
                        return 0
                        ;;
                    ?*)
                        # unknown prev flag expects sub-argument
                        return 0
                        ;;
                esac

                if __was_flag_used '--rule-no'; then
                    # Nothing to complete, no RULE is allowed if we used rule-no already
                    return 0
                fi

                # # NOTE: '--' does not block flags here (I checked on R4.1)
                # if [[ "${QB_cur}" == -* ]]; then
                #     __complete_string '--rule-no='
                #     compopt -o nospace &>/dev/null # to /dev/null because output interferes with running tests
                #     return 0
                # fi

                # We always want this flag to be shown for del, as it is used too often
                __complete_string '--rule-no='

                __complete_string 'accept drop'
                __complete_general_firewall_rule
                return 0
                ;;

            list | reset)
                # Nothing to complete
                return 0
                ;;

            *)
                # Not a valid action
                return 0
                ;;

        esac
    fi

    # QB_alone_args_count > 2 from here on

    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    __complete_general_firewall_rule

    return 0
}


function _qvm_service() {

    __init_qubes_completion || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    local flags='--list -l --enable -e --disable -d --default -D --delete --unset'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    if (( QB_alone_args_count == 0 )); then
        __complete_qubes_list 'all'
        return 0
    fi

    if (( QB_alone_args_count == 1 )); then

        # list usage case requires no further arguments
        __was_flag_used '--list' && return 0
        __was_flag_used '-l' && return 0

        # cSpell:disable-next-line
        __complete_string 'qubes-firewall qubes-network qubes-update-check cups crond network-manager clocksync qubes-updates-proxy updates-proxy-setup disable-default-route disable-dns-server lightdm guivm guivm-gui-agent guivm-vnc'
        return 0
    fi

    if (( QB_alone_args_count == 2 )); then
        # NOTE: we check for arguments --enable, -e, --disable, -d
        # because they should not be used combined with this on|off
        __was_flag_used '--enable' && return 0
        __was_flag_used '--e' && return 0
        __was_flag_used '--disable' && return 0
        __was_flag_used '--d' && return 0

        __complete_string 'on off'
        compopt -o nosort &>/dev/null # to /dev/null because output interferes with running tests
        return 0
    fi

    # Too many arguments, no completion
    return 0
}


function _qubesctl() {

    # TODO: NOTE: R4.1 has version that lacks several latest flags,
    # so this has to be updated for R4.2 when it is ready

    # NOTE: this command supports no --quiet and --verbose args.
    # So, we have to do things manually

    __init_qubes_completion '--max-concurrency --targets' || return 0

    if (( QB_alone_args_count > 0 )); then
        # all options should be only before first standalone argument

        # TODO: we can provide suggestions for states and stuff,
        # but I am not sure what should I list here.
        # This may have sense:
        # https://www.qubes-os.org/doc/salt/#all-qubes-specific-states

        return 0;
    fi

    case "${QB_prev_flag}" in
        --max-concurrency)
            # Number here, no completion
            return 0
            ;;
        --targets)
            # complete comma separated list of qubes

            local last_qube_name_typing="${QB_cur##*,}"
            # strip quotes at the beginning
            last_qube_name_typing="$( __strip_quotes_on_left "${last_qube_name_typing}" )"
            __debug_msg "last_qube_name_typing=\"${last_qube_name_typing}\""

            # NOTE: we save the original QB_real_cur value and return it back, should work even without it
            local saved_QB_real_cur="${QB_real_cur}"     # save original QB_real_cur just in case
            #
                # We have to manually set QB_real_cur, because comma is non-standard separator
                QB_real_cur="${last_qube_name_typing}"
                __complete_qubes_list 'all'
            #
            QB_real_cur="${saved_QB_real_cur}"           # return the original value of QB_real_cur back

            # Nospace because it is comma separated list of qubes
            compopt -o nospace &>/dev/null # to /dev/null because output interferes with running tests

            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    if __need_flags ; then

        # cSpell:disable-next-line
        local flags='--help -h --shot-output --force-color -skip-dom0 --max-concurrency --templates --standalones --app'

        if ! __was_flag_used '--all' && ! __was_flag_used '--targets'; then
            flags+=' --targets --all'
        fi

        __complete_string "${flags}"
        return 0
    fi
}


function _qubesd_query() {

    # NOTE: this command supports no --quiet and --verbose args.
    # So, we have to do things manually

    __init_qubes_completion '--connect -c' || return 0

    if (( QB_alone_args_count == 0 )); then

        case "${QB_prev_flag}" in
            --connect | -c)
                __run_filedir
                return 0
                ;;
            ?*)
                # unknown prev flag expects sub-argument
                return 0
                ;;
        esac

        if __need_flags ; then
            __complete_string '--help -h --connect -c --empty -e --fail'
            return 0
        fi

        # SRC qube
        __complete_qubes_list 'all'
        return 0
    fi

    # Complete "DST" qube name
    if (( QB_alone_args_count == 2 )); then

        __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

        __complete_qubes_list 'all'
        return 0
    fi

    # NOTE: we can provide more, but documentation is awful, so no source of info
    return 0
}


function _qubes_hcl_report() {

    __init_qubes_completion || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    # NOTE: this command supports no --quiet and --verbose args.
    # It also has no `man qubes-hcl-report`
    # So, we have to do things manually

    if (( QB_alone_args_count == 0 )); then

        if __need_flags ; then
            __complete_string '--help -h --support -s'
            return 0
        fi

        __complete_qubes_list 'all'
        return 0
    fi

    # Too many arguments, no completion
    return 0
}


function _qubes_bug_report() {

    __init_qubes_completion '--dest-vm -d' || return 0

    # NOTE: this command supports no --quiet and --verbose args.
    # It also has no `man qubes-bug-report`
    # So, we have to do things manually

    if (( QB_alone_args_count == 0 )); then

        case "${QB_prev_flag}" in
            --dest-vm | -d)
                __complete_qubes_list 'all'
                return 0
                ;;
            ?*)
                # unknown prev flag expects sub-argument
                return 0
                ;;
        esac

        if __need_flags ; then
            __complete_string '--help -h --dest-vm -d --print-report -p'
            return 0
        fi

        __complete_qubes_list 'all'
        return 0
    fi

    # Too many arguments, no completion
    return 0
}


function _qvm_console_dispvm() {

    __init_qubes_completion '' || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    # NOTE: this command supports no --quiet and --verbose args.
    # It also has no `man qvm-console-dispvm`

    # So, we have to do things manually

    if (( QB_alone_args_count == 0 )); then

        if __need_flags ; then
            __complete_string '--autostart'
            return 0
        fi

        __complete_qubes_list 'all'
        return 0
    fi

    # Too many arguments, no completion
    return 0
}


function _qvm_get_image() {

    __init_qubes_completion '' || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    # NOTE: this command supports no --quiet and --verbose args.
    # It also has no `man qvm-get-image`

    # So, we have to do things manually

    if (( QB_alone_args_count == 0 )); then

        if __need_flags ; then
            __complete_string '--help -h'
            return 0
        fi

        __complete_qubes_list 'all'
        return 0
    fi

    if (( QB_alone_args_count == 1 )); then

        # NOTE: we could consider providing path from inside
        # the source qube (QB_alone_args[0]), e.g. via qvm-run,
        # but it will require execution of something inside that qube,
        # and I am not sure that this what bash completion should ever do.

        return 0
    fi

    if (( QB_alone_args_count == 2 )); then
        __run_filedir
        return 0
    fi

    # Too many arguments, no completion
    return 0
}


function _qvm_get_tinted_image() {

    __init_qubes_completion '' || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    # NOTE: this command supports no --quiet and --verbose args.
    # It also has no `man qvm-get-image`

    # So, we have to do things manually

    if (( QB_alone_args_count == 0 )); then

        if __need_flags ; then
            __complete_string '--help -h'
            return 0
        fi

        __complete_qubes_list 'all'
        return 0
    fi

    if (( QB_alone_args_count == 1 )); then

        # NOTE: I know nothing what is COLOUR here
        # Probably no completion anyway

        return 0
    fi

    if (( QB_alone_args_count == 2 )); then

        # NOTE: we could consider providing path from inside
        # the source qube (QB_alone_args[0]), e.g. via qvm-run,
        # but it will require execution of something inside that qube,
        # and I am not sure that this what bash completion should ever do.

        return 0
    fi

    if (( QB_alone_args_count == 3 )); then
        __run_filedir
        return 0
    fi

    # Too many arguments, no completion
    return 0
}


function _qubes_guid() {

    # cSpell:disable-next-line
    __init_qubes_completion '--config -C --domid -d --target-domid -t --name -N --color -c --label -l --icon -i --kill-on-connect -K --prop -p --trayicon-mode --screensaver-name --override-redirect' || return 0

    case "${QB_prev_flag}" in
        --config | -C)
            __run_filedir
            return 0
            ;;
        --domid | -d)
            # nothing # can be better?
            return 0
            ;;
        --target-domid | -t)
            # nothing  # can be better?
            return 0
            ;;
        --name | -N)
            __complete_qubes_list 'all'
            return 0
            ;;
        --color | -c)
            __complete_string '0x'
            # Nospace because we write prefix of color only, not the color itself
            compopt -o nospace &>/dev/null # to /dev/null because output interferes with running tests
            return 0
            ;;
        --label | -l)
            # nothing  # can be better?
            return 0
            ;;
        --icon | -i)
            __run_filedir
            return 0
            ;;
        --kill-on-connect | -K)
            # nothing
            return 0
            ;;
        --prop | -p)
            # nothing # can be better
            return 0
            ;;
        --trayicon-mode)
            __complete_string 'bg border1 border2 tint'
            return 0
            ;;
        --screensaver-name)
            __complete_string 'xscreensaver' # default
            return 0
            ;;
        --override-redirect)
            __complete_string 'disable'
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    # cSpell:disable-next-line
    local flags='--config -C --domid -d --target-domid -t --name -N --color -c --label -l --icon -i --kill-on-connect -K --prop -p --trayicon-mode --screensaver-name --override-redirect --qrexec-for-clipboard -Q --background -n --foreground -f --invisible -I --title-name -T'
    __complete_all_flags_if_needed "${flags}" && return 0

    return 0
}


function _qubes_policy() {

    __init_qubes_completion '' || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    # NOTE: this command supports no --quiet and --verbose args.
    # It also has no `man`

    # So, we have to do things manually

    if (( QB_alone_args_count == 0 )); then

        if __need_flags ; then
            __complete_string '--help -h --list -l --get -g --replace -r --remove -d'
            return 0
        fi
        return 0
    fi

    # NOTE: `qubes-policy --list` requires to be run as root.
    # No more completion
    return 0
}


function _qubes_vm_settings() {

    __init_qubes_completion '--tab' || return 0

    if (( QB_alone_args_count > 0 )); then
        # Too many arguments, no completion
        return 0
    fi

    case "${QB_prev_flag}" in
        --tab)
            __complete_string 'basic advanced firewall devices applications services'
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    local flags='--tab'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    __complete_qubes_list 'all'

    return 0
}


function _qubes_vm_clone() {

    __command_standard_flags_with_one_vmname

    return 0
}


function _qubes_vm_boot_from_device() {

    __command_standard_flags_with_one_vmname

    return 0
}


function __command_standard_flags_with_one_vmname() {

    __init_qubes_completion || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    if (( QB_alone_args_count > 0 )); then
        # Too many arguments, no completion
        return 0
    fi

    __complete_all_starting_flags_if_needed '' && return 0

    __complete_qubes_list 'all'

    return 0
}


function _qubes_guivm_session() {

    __init_qubes_completion || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    if (( QB_alone_args_count > 0 )); then
        # Too many arguments, no completion
        return 0
    fi

    __complete_qubes_list 'all'

    return 0
}


function _qubes_input_trigger() {

    __init_qubes_completion '--action --event' || return 0

    if (( QB_alone_args_count > 0 )); then
        # Too many arguments, no completion
        return 0
    fi

    case "${QB_prev_flag}" in
        --action)
            __complete_string 'add remove'
            return 0
            ;;
        --event)
            # NOTE: probably only event* file names should be allowed but I am not sure
            local event_files=("/dev/input/event"*)
            if (( "${#event_files[@]}" > 0 )); then
                __complete_string "${event_files[*]##*/}"
            fi
            return 0
            ;;
        ?*)
            # unknown prev flag expects sub-argument
            return 0
            ;;
    esac

    # no --verbose and --quiet flags
    local flags='-h --help --all --action --event --dom0'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    __complete_qubes_list 'all'

    return 0
}


function _qubes_prefs() {

    __init_qubes_completion '' || return 0
    __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)

    local sys_properties_bool='check_updates_vm'
    # cSpell:disable-next-line
    local sys_properties_qube='clockvm default_audiovm default_dispvm default_guivm default_netvm default_template management_dispvm updatevm'
    # TODO: add completion of pools?
    local sys_properties_pools='default_pool default_pool_kernel default_pool_private default_pool_root default_pool_volatile'
    local sys_properties_string="${sys_properties_pools} default_kernel default_qrexec_timeout default_shutdown_timeout stats_interval"
    local sys_properties_all="${sys_properties_bool} ${sys_properties_qube} ${sys_properties_string}"

    local sys_properties_values_generic_bool='True False'

    # NOTE: --get --set -g -s are deprecated and ignored
    local flags='--force-root --help-properties --hide-default'
    __complete_all_starting_flags_if_needed "${flags}" && return 0

    if (( QB_alone_args_count == 0 )); then

        # we should stop if there was --help-properties
        __was_flag_used "--help-properties" && return 0

        # or provide all properties otherwise
        __complete_string "${sys_properties_all}"
        return 0
    fi

    if (( QB_alone_args_count == 1 )); then

        # default is always a valid option for value
        __complete_string '--default'

        # we have a property that defines type
        local property="${QB_alone_args[0]}"

        if __is_argument_in_list_string "${property}" "${sys_properties_bool}" ; then
            __complete_string "${sys_properties_values_generic_bool}"
            return 0
        elif __is_argument_in_list_string "${property}" "${sys_properties_qube}" ; then
            __complete_qubes_list 'all' # TODO: we can change the list of VMs based on property, will be even better
            return 0
        elif __is_argument_in_list_string "${property}" "${sys_properties_string}" ; then
            # Can be anything
            return 0
        fi
    fi

    # too many args, completion should not work
    return 0
}


function _qubes_dom0_update() {

    # NOTE: qubes-dom0-update is written that way that it is not OK
    # with "--action install" format, so we does not allow it.

    __init_qubes_completion '--action' || return 0
    #__init_qubes_completion || return 0

    # NOTE: We do not check for __is_prev_flag_not_empty because
    # there can be a lot of different unknown flags from dnf
    # __is_prev_flag_not_empty && return 0; # unknown prev flag expects sub-argument (e.g. --unknown_flag=)


    # NOTE: maybe qubes-dom0-update does not expected to allow all valid actions of dnf
    # but it is not documented nor is it obvious from the source code of it.
    # NOTE: choose what to complete - everything or mostly used ones?
    # I do not know that the recommended action list should be.
    # local dnf_recommended_actions='install reinstall erase remove upgrade upgrade-to downgrade list search'
    # cSpell:disable-next-line
    local dnf_all_actions='alias autoremove check check-update clean deplist distro-sync downgrade group help history info install list makecache mark module provides reinstall remove repoinfo repolist repoquery repository-packages search shell swap updateinfo upgrade upgrade-minimal'

    if (( QB_alone_args_count == 0 )); then

        case "${QB_prev_flag}" in
            --action)
                __complete_string "${dnf_all_actions}"
                return 0
                ;;
        esac
    fi

    # get action (command) to pass to dnf
    local action_for_dnf='install' # install by default if --action is omitted
    local action_flag_name='--action'
    local max_arg_index="${#QB_full_line_args[@]}"
    (( max_arg_index-- ))   # because we want the next argument after the flag

    local i
    for (( i=0; i < "${max_arg_index}"; i++ )); do
        if [[ "${QB_full_line_args[${i}]}" == "${action_flag_name}" ]]; then
            (( i++ ))   # because we want the next argument after the flag
            action_for_dnf="${QB_full_line_args[${i}]}"
            break
        fi
    done

    __debug_msg "action_for_dnf = \"${action_for_dnf}\""

    # Call dnf completion (but only if action is a valid option)
    if __is_argument_in_list_string "${action_for_dnf}" "${dnf_all_actions}"; then
        __qubes_dom0_update_pass_completion_to_dnf "${action_for_dnf}"
    fi


    # NOTE: qubes-dom0-update has issues in man and output of --help,
    # e.g. not mentioning --help argument there at all.
    # It also requires --action to be followed only by '=', unlike other qvm/qubes tools,
    # so we provide this --action completion with = at the end.

    # Now we can add our flags if we need to
    if (( QB_alone_args_count == 0 )) && ! __is_prev_flag_not_empty && __need_flags ; then

        __complete_string '--help --action= --clean --check-only --gui --force-xen-upgrade --console --show-output --preserve-terminal'

        # Use for case of '--action='
        if (( "${#COMPREPLY[@]}" == 1 )) && [[ "${COMPREPLY[0]}" == *= ]]; then
            compopt -o nospace &>/dev/null # to /dev/null because output interferes with running tests
        fi

        # NOTE: new can keep order to separate dnf and qubes arguments better
    fi

    return 0
}


function __qubes_dom0_update_remove_action_from_compline() {

    # NOTE: we actually should remove --action=command substring and
    # remove 3 words form COMP_WORDS (--action, =, command)
    # but it works even without it, because dnf breaks this substring and
    # already uses command as a first standalone argument.

    local command="${1}"

    local action_arg_name='--action'
    local action_arg_sep='='
    local action_arg_value="${command}"
    local action_arg_full_substring="${action_arg_name}${action_arg_sep}${action_arg_value}"

    # If we have a '--action=command' substring
    if [[ "${COMP_LINE}" == *"${action_arg_full_substring}"* ]]; then

        # TODO: it as a minor flaw - the substring can be surrounded by
        # chars that are not from COMP_WORDBREAKS or there can be
        # multiple occurrences of substring and we will replace only one.
        # But this scenario is so improbable that currently we neglect it.

        COMP_LINE="${COMP_LINE/"${action_arg_full_substring}"/}"

        local words_to_skip=0
        local words_skipped=0
        local new_comp_words=()

        local i
        local cursor_is_after_skipped=0
        for (( i=0; i < "${#COMP_WORDS[@]}"; i++ )); do

            if (( words_to_skip > 0 )); then
                (( words_to_skip-- ))
                (( words_skipped++ ))
                continue; # skip
            fi

            if [[ "${COMP_WORDBREAKS}" == *"${action_arg_sep}"* ]]; then

                # we should skip 3 words (max)
                if [[ "${COMP_WORDS[${i}]}" == "${action_arg_name}" ]]; then

                    if (( COMP_CWORD >= i )) && (( COMP_CWORD <= i + 2 )); then
                        # completion from dnf for current word is not possible
                        __debug_msg "i=\"${i}\" COMP_CWORD=\"${COMP_CWORD}\""
                        __debug_msg "Completion from dnf for current word is not possible"
                        return 1;
                    fi

                    if (( i < COMP_CWORD )); then
                        cursor_is_after_skipped=1;
                    fi

                    (( words_to_skip = 2 ))
                    (( words_skipped++ ))
                    continue;
                fi
            else
                # we should skip 1 word
                if [[ "${COMP_WORDS[${i}]}" == "${action_arg_full_substring}" ]]; then

                    if (( i == COMP_CWORD )); then
                        # completion from dnf for current word is not possible
                        __debug_msg "i=\"${i}\" COMP_CWORD=\"${COMP_CWORD}\""
                        __debug_msg "Completion from dnf for current word is not possible"
                        return 1;
                    fi

                    if (( i < COMP_CWORD )); then
                        cursor_is_after_skipped=1;
                    fi

                    (( words_to_skip = 0 ))
                    (( words_skipped++ ))
                    continue;
                fi
            fi

            new_comp_words+=("${COMP_WORDS[${i}]}")
        done

        new_comp_words+=("${COMP_WORDS[${i}]}")
        COMP_WORDS=("${new_comp_words[@]}")
        unset new_comp_words


        # Replace the beginning of the line COMP_LINE
        if (( cursor_is_after_skipped == 1 )); then
            (( COMP_POINT = COMP_POINT - ${#action_arg_full_substring} ))

            (( COMP_CWORD = COMP_CWORD - words_skipped ))
        fi
    fi
}


# Replace starting 'qubes-dom0-update' with 'dnf command' (e.g. 'dnf install')
function __qubes_dom0_update_replace_beginning_of_compline() {

    local original_start="${COMP_WORDS[0]}" # 'qubes-dom0-update'
    local rewritten_word0_dnf='dnf'
    local rewritten_word1_command="${command}"
    local rewritten_start="${rewritten_word0_dnf} ${rewritten_word1_command}" # e.g. "dnf install"

    # Replace the beginning of the line COMP_LINE
    local original_length_of_COMP_LINE="${#COMP_LINE}"

    # remove leading whitespace characters
    COMP_LINE="${COMP_LINE#"${COMP_LINE%%[![:space:]]*}"}"

    COMP_LINE="${COMP_LINE#"${original_start}"}"
    COMP_LINE="${rewritten_start}${COMP_LINE}"

    # Recalculate cursor position COMP_POINT
    # (( COMP_POINT = COMP_POINT + ${#rewritten_start} - ${#original_start} ))
    (( COMP_POINT = COMP_POINT + ${#COMP_LINE} - original_length_of_COMP_LINE ))

    # Replace first word with two new
    COMP_WORDS[0]="${rewritten_word1_command}"
    COMP_WORDS=( "${rewritten_word0_dnf}" "${COMP_WORDS[@]}")

    # Recalculate the current word after adding one word at the beginning
    (( COMP_CWORD++ ))
}


# rewrite current completion context and invoke dnf completion
function __qubes_dom0_update_pass_completion_to_dnf() {

    local command="${1}"

    # NOTE: a trick to avoid huge duplication of dnf completion code
    # We ask dnf itself for completion similar to what sudo does
    #
    # We do something like _command_offset() but more complicated:
    # we reassemble the completion line (like for sudo).
    # We add "dnf command" and remove --action flag with its value.
    # So _dnf() completes the line "dnf command other_args"
    #
    # Everything hopefully works like miracle.

    # Save original values
    local original_COMP_LINE="${COMP_LINE}"
    local original_COMP_POINT="${COMP_POINT}"
    local original_COMP_WORDS=( "${COMP_WORDS[@]}" )
    local original_COMP_CWORD="${COMP_CWORD}"

    __debug_msg '--------------------------------------------------------'
    __debug_msg '1. Before passing completion to dnf'
    __debug_msg ''
    __debug_log_env

    # NOTE: We can hide some arguments used by qubes-dom0-update itself,
    # but it does not seem to be necessary as dnf completion does not worry
    # about any of them, nor completions do, probably by design.
    # The only exception is --action=command, because by default it is
    # separated to 3 arguments and dnf considers command to be a standalone
    # argument, like install/remove and etc.
    # It luckily still works but better to hide it anyway, because the
    # dnf completion script can be changed someday.

    __qubes_dom0_update_remove_action_from_compline "${command}" || return 1
    __debug_msg '--------------------------------------------------------'
    __debug_msg '2. After removing action from command line'
    __debug_msg ''
    __debug_log_env

    __qubes_dom0_update_replace_beginning_of_compline || return 1
    __debug_msg '--------------------------------------------------------'
    __debug_msg '3. After replacing the beginning of the command line'
    __debug_msg ''
    __debug_log_env

    __qubes_dom0_update_run_dnf_completion

    # Revert original values for bash completion variables,
    # to avoid possible problems with wrappers like sudo
    COMP_LINE="${original_COMP_LINE}"
    COMP_POINT="${original_COMP_POINT}"
    COMP_WORDS=( "${original_COMP_WORDS[@]}" )
    COMP_CWORD="${original_COMP_CWORD}"
    __debug_msg '--------------------------------------------------------'
    __debug_msg '4. After restoring the original values'
    __debug_msg ''
    __debug_log_env
}


function __qubes_dom0_update_run_dnf_completion() {

    # --------------------------------------------------------------------
    # NOTE: We can just all _dnf functions as we know it completes dnf
    # but this approach with search of this function is more reliable,
    # prevents thing from breaking in case _dnf is renamed or something.
    # It also is more flexible as it allows user to use custom dnf completion.
    #
    # NOTE: This code is mostly taken from _command_offset() of bash-completion
    # Modified just a bit and is a bit better according to shellcheck
    # cSpell:disable
    # BEGIN --------------------------------------------------------------
    local cmd=${COMP_WORDS[0]} compcmd=${COMP_WORDS[0]}
    local cspec
    cspec=$( complete -p "$cmd" 2>/dev/null )

    # If we have no completion for $cmd yet, see if we have for basename
    if [[ ! $cspec && $cmd == */* ]]; then
        cspec=$( complete -p "${cmd##*/}" 2>/dev/null )
        [[ $cspec ]] && compcmd=${cmd##*/}
    fi

    # If still nothing, just load it for the basename
    if [[ ! $cspec ]]; then
        compcmd=${cmd##*/}
        _completion_loader "$compcmd"
        cspec=$(complete -p "$compcmd" 2>/dev/null)
    fi

    if [[ -n $cspec ]]; then
        if [[ "${cspec#* -F }" != "$cspec" ]]; then
            # complete -F <function>

            # get function name
            local func=${cspec#*-F }
            func=${func%% *}

            if [[ ${#COMP_WORDS[@]} -ge 2 ]]; then
                # shellcheck disable=SC2086 # This block is an unchanged third-party code from bash-completion package
                $func $cmd "${COMP_WORDS[${#COMP_WORDS[@]}-1]}" "${COMP_WORDS[${#COMP_WORDS[@]}-2]}"
            else
                # shellcheck disable=SC2086 # This block is an unchanged third-party code from bash-completion package
                $func $cmd "${COMP_WORDS[${#COMP_WORDS[@]}-1]}"
            fi

            # restore initial compopts
            local opt
            while [[ $cspec == *" -o "* ]]; do
                # FIXME: should we take "+o opt" into account?
                cspec=${cspec#*-o }
                opt=${cspec%% *}
                # shellcheck disable=SC2086 # This block is an unchanged third-party code from bash-completion package
                compopt -o $opt &>/dev/null # to /dev/null because output interferes with running tests
                # shellcheck disable=SC2295 # This block is an unchanged third-party code from bash-completion package
                cspec=${cspec#$opt}
            done
        else
            cspec=${cspec#complete}
            # shellcheck disable=SC2295 # This block is an unchanged third-party code from bash-completion package
            cspec=${cspec%%$compcmd}
            COMPREPLY=( $( eval compgen "$cspec" -- '$cur' ) )
        fi
    fi
    # END ----------------------------------------------------------------
    # cSpell:enable
}


__completion_add_padding_for_completion_to_make_new_lines() {

    local padded_str=''
    local padding_size="${COLUMNS}"

    for (( i=0; i < "${#COMPREPLY[@]}"; i++ )); do

        printf -v 'padded_str' "%-${padding_size}s" "${COMPREPLY[i]}"

        COMPREPLY[i]="${padded_str}"
    done
}


function main() {

    __debug_init

    for supported_command in "${SUPPORTED_COMMANDS_LIST[@]}"; do
        if [[ -x /usr/bin/${supported_command} ]] || (( QB_DEBUG_MODE == 1 )) ; then
            command_processor="$(echo "_${supported_command}" | tr '-' '_')"
            complete -F "${command_processor}" "${supported_command}"
        fi
    done

}

main "$@"

# ex: filetype=sh
