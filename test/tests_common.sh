#!/bin/bash


function tests_common_setup() {

    source '/usr/share/bash-completion/bash_completion'

    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"

    # shellcheck source=./../src/qubes-completion.sh
    source "${script_dir}/../src/qubes-completion.sh"
}


function test_prepare_env() {

    local command_line="${1}"
    __debug_msg "command_line=\"${command_line}\""

    # Not used actually by the project's code:
    COMP_TYPE="63"
    COMP_KEY="9"

    # Should be default, never modify it, or it will break third-party completions
    COMP_WORDBREAKS=$'\n"\'><=;|&(:'
    # I checked that bash actually does not honor " and ' as word breaks,
    # it is done due to ability to wrap arguments with spaces and other spec chars
    # So we remove quotes from the list
    local real_word_breaks
    real_word_breaks="${COMP_WORDBREAKS}"
    real_word_breaks="${real_word_breaks//\'/}"
    real_word_breaks="${real_word_breaks//\"/}"

    # NOTE: we do not declare those, only change values
    COMP_LINE="${command_line}"
    COMP_POINT="${#command_line}"
    COMP_WORDS=()
    (( COMP_CWORD = 0 ))

    # Filling COMP_WORDS the same way as BASH does

    local cur_word='' # current word
    # once quotes are activated it will be till deactivated and real word break
    # e.g. `qvm-shutdown q": "b` will make 2 words: `qvm-shutdown` and `q": "b`
    # e.g. `qvm-shutdown q": "b:` will make 3 words: `qvm-shutdown`, `q": "b` and `:`
    local quote_is_active=''
    local quotes_were_used='0'
    local prev_char_was_word_break='0'
    local cur_word_has_non_breaks='0' # 1 if current word has not-work-breaks chars
    local i
    for (( i=0; i < "${#COMP_LINE}"; i++)); do

        local ch="${COMP_LINE:i:1}" # current char
        # __debug_msg "i=\"${i}\", ch=\"${ch}\", cur_word=\"${cur_word}\", cur_word_has_non_breaks=\"${cur_word_has_non_breaks}\""

        # Special case - quotes are used first time before it was a word break
        # e.g. `qvm-shutdown --exclude="`
        if (( quotes_were_used == 0 )); then
            if [[ "${ch}" == "\"" || "${ch}" == "\'" ]] &&
               [[ "${cur_word}" != '' ]] &&
               (( prev_char_was_word_break == 1 )); then

                # save current word
                COMP_WORDS+=("${cur_word}")
                # empty word (will append quote later)
                cur_word=""
                cur_word_has_non_breaks='0'
            fi
        fi

        if [[ "${ch}" == "\"" || "${ch}" == "\'"  ]]; then
            (( quotes_were_used = 1 ))

            if [[ "${quote_is_active}" == '' ]]; then
                quote_is_active="${ch}" # start quote mode
            elif [[ "${ch}" == "${quote_is_active}" ]]; then
                quote_is_active='' # quotes were ended
            # else
                # different quote type inside quotes considered to be a usual char
            fi
        fi

        if (( quotes_were_used == 1 )); then

            if [[ "${quote_is_active}" != '' ]]; then
                # append char
                cur_word="${cur_word}${ch}"
                cur_word_has_non_breaks='1'
                continue
            else
                # we have a chance to finish the word
                if [[ "${ch}" == [[:space:]] ]]; then
                    # save current word
                    COMP_WORDS+=("${cur_word}")
                    cur_word=''
                    cur_word_has_non_breaks='0'
                    prev_char_was_word_break='1'

                    quote_is_active='0'
                    quotes_were_used='0'

                elif [[ "${real_word_breaks}" == *"${ch}"* ]]; then
                    # save current word
                    COMP_WORDS+=("${cur_word}")
                    # and start a new word
                    cur_word="${ch}"
                    cur_word_has_non_breaks='0'
                    prev_char_was_word_break='1'

                    quote_is_active='0'
                    quotes_were_used='0'
                else
                    # append char
                    cur_word="${cur_word}${ch}"
                    cur_word_has_non_breaks='1'
                fi
            fi

        # NOTE: quotes_were_used ==  is finished
        elif [[ "${ch}" == [[:space:]] ]]; then

            # ch is space (space, tab, new lines)
            # __debug_msg "ch is space (space, tab, new lines)"

            if [[ "${cur_word}" != '' ]]; then
                # __debug_msg "if previous word is not empty - append it to the list"
                # if previous word is not empty - append it to the list
                COMP_WORDS+=("${cur_word}")
                cur_word=''
                cur_word_has_non_breaks='0'
                prev_char_was_word_break='1'
            fi
        elif [[ "${real_word_breaks}" == *"${ch}"* ]]; then
            # __debug_msg "it is a word break, but not a space"
            # it is a word break, but not a space

            if [[ "${cur_word}" != '' ]]; then
                if (( cur_word_has_non_breaks == 1 )); then
                    # save current word
                    COMP_WORDS+=("${cur_word}")
                    # and start a new word
                    cur_word="${ch}"
                    cur_word_has_non_breaks='0'
                    prev_char_was_word_break='1'
                else
                    # stack breaks together
                    cur_word="${cur_word}${ch}"
                fi
            else
                # __debug_msg "start a new word"
                # start a new word
                cur_word="${ch}"
                prev_char_was_word_break='1'
            fi
        else
            # __debug_msg "it is not a word break"
            # it is not a word break

            if [[ "${cur_word}" != '' ]] && (( cur_word_has_non_breaks == 0 )); then
                # current word has only breaks, append it as a separate word
                COMP_WORDS+=("${cur_word}")
                cur_word=''
            fi
            # append char
            cur_word="${cur_word}${ch}"
            cur_word_has_non_breaks='1'
            prev_char_was_word_break='0'
        fi
    done

    if [[ "${cur_word}" != '' ]]; then
        COMP_WORDS+=("${cur_word}")
        cur_word=''
        cur_word_has_non_breaks='0'
    else
        if (( quotes_were_used == 0 )); then
            COMP_WORDS+=('') # This is what bash (GNU readline) does
        fi
    fi

    (( COMP_CWORD = "${#COMP_WORDS[@]}" - 1 ))
}


function test_command() {

    local command_line="${1}"

    __debug_msg "===================================="
    __debug_msg "Test is running..."
    __debug_msg "===================================="

    test_prepare_env "${command_line}"

    __debug_log_env

    COMPREPLY=()

    # Run command for completion (not based on complete state to be more reliable)
    local command_processor
    command_processor="$(echo "_${COMP_WORDS[0]}" | tr '-' '_')"
        if [[ $(type -t "${command_processor}") != function ]]; then
        echo "Completion function \"${command_processor}\" was not found"
        __debug_msg "Completion function \"${command_processor}\" was not found"
        __debug_msg "===================================="
        __debug_msg "ERROR: TEST FAILED"
        __debug_msg "===================================="
        return 1
    fi

    # NOTE: We can turn debug output off during test run (but stubs may be used anyway)
    # local prev_QB_DEBUG_LOG="${QB_DEBUG_LOG}"
    # export QB_DEBUG_LOG=0
    #
        # Run function for completion
        "${command_processor}"
    #
    # Revert QB_DEBUG_LOG in case we changed it above
    # export QB_DEBUG_LOG="${prev_QB_DEBUG_LOG}"

    __debug_msg "$( declare -p EXPECTED_COMPREPLY )"
    __debug_msg "$( declare -p COMPREPLY )"

    # Compare results

    # Compare size
    if (( "${#COMPREPLY[@]}" != "${#EXPECTED_COMPREPLY[@]}" )); then
        __debug_msg_and_echo "Wrong COMPREPLY size: expected '${#EXPECTED_COMPREPLY[@]}', got '${#COMPREPLY[@]}'"
        __debug_msg_and_echo "===================================="
        __debug_msg_and_echo "Expected: "
        local i1
        for (( i1=0; i1 < "${#EXPECTED_COMPREPLY[@]}"; i1++ )); do
            __debug_msg_and_echo "[${i1}]='${EXPECTED_COMPREPLY[${i1}]}'"
        done
        __debug_msg_and_echo "===================================="
        __debug_msg_and_echo "Got: "
        local i2
        for (( i2=0; i2 < "${#COMPREPLY[@]}"; i2++ )); do
            __debug_msg_and_echo "[${i2}]='${COMPREPLY[${i2}]}'"
        done
        __debug_msg "===================================="
        __debug_msg "ERROR: TEST FAILED"
        __debug_msg "===================================="
        return 2
    fi

    # Compare elements
    local i
    for (( i=0; i < "${#COMPREPLY[@]}"; i++ )); do
        if [[ "${COMPREPLY[${i}]}" != "${EXPECTED_COMPREPLY[${i}]}" ]]; then
            __debug_msg_and_echo "Wrong COMPREPLY value: expected '${EXPECTED_COMPREPLY[${i}]}', got '${COMPREPLY[${i}]}'"
            __debug_msg "===================================="
            __debug_msg "ERROR: TEST FAILED"
            __debug_msg "===================================="
            return 3
        fi
    done

    # Success
    __debug_msg "===================================="
    __debug_msg "Test succeeded"
    __debug_msg "===================================="

    return 0
}


function create_test() {

    local test_name="${1}"
    local command_line="${2}"

    __debug_msg "===================================="
    __debug_msg "Creating test for \"${command_line}\"..."
    __debug_msg "===================================="

    test_prepare_env "${command_line}"

    __debug_log_env

    COMPREPLY=()

    # Run command for completion (not based on complete state to be more reliable)
    local command_processor
    command_processor="$(echo "_${COMP_WORDS[0]}" | tr '-' '_')"
        if [[ $(type -t "${command_processor}") != function ]]; then
        echo "Completion function \"${command_processor}\" was not found"
        __debug_msg "Completion function \"${command_processor}\" was not found"
        __debug_msg "ERROR: FAILED TO CREATE TEST"
        __debug_msg "===================================="
        return 1
    fi

    # NOTE: We can turn debug output off during test creation (but stubs may be used anyway)
    local prev_QB_DEBUG_LOG="${QB_DEBUG_LOG}"
    export QB_DEBUG_LOG=0
    #
        # Run function for completion
        "${command_processor}"
    #
    # Revert QB_DEBUG_LOG in case we changed it above
    export QB_DEBUG_LOG="${prev_QB_DEBUG_LOG}"


    # Formatting test output
    local result_compreply
    result_compreply="$( declare -p COMPREPLY )"
    result_compreply="${result_compreply#"declare -a COMPREPLY="}"
    result_compreply="EXPECTED_COMPREPLY=${result_compreply}"

    # escape single quotes
    local escaped_command_line="${command_line//\'/\'\\\'\'}"

    local test_desc="${command_line%% *}: ${command_line}"
    # Escape double quotes (to workaround possible bug in BATS)
    test_desc="${test_desc//\"/\\\"}"
    # test_desc="${test_desc//\'/\\\'}"

    echo "@test \"Test ${test_name}. ${test_desc}\" {"
    echo "    ${result_compreply}"
    echo "    test_wrapper '${escaped_command_line}'"
    echo '}'
    echo ''

    __debug_msg "Test created"
    __debug_msg "===================================="

    return 0
}
