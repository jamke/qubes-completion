# Debug overriding to activate debug logging for qubes-completion


QB_DEBUG_MODE=1

if (( QB_DEBUG_MODE != 0 )); then

    __debug_overrides_script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"

    # Relative paths (one way to use it):
    QVMTOOL_QVM_FIREWALL="${__debug_overrides_script_dir}/../stubs/qvm-firewall"
    QVMTOOL_QVM_LS="${__debug_overrides_script_dir}/../stubs/qvm-ls"
    QVMTOOL_QVM_TAGS="${__debug_overrides_script_dir}/../stubs/qvm-tags"
    QVMTOOL_QVM_DEVICE="${__debug_overrides_script_dir}/../stubs/qvm-device"
    QVMTOOL_QVM_POOL="${__debug_overrides_script_dir}/../stubs/qvm-pool"

    # These full paths of stubs are provided as an example,
    # if you want absolute paths, you should change them according to your locations:
    # QVMTOOL_QVM_FIREWALL='/home/user/projects/bash/qubes-completion/stubs/qvm-firewall'
    # QVMTOOL_QVM_LS='/home/user/projects/bash/qubes-completion/stubs/qvm-ls'
    # QVMTOOL_QVM_TAGS='/home/user/projects/bash/qubes-completion/stubs/qvm-tags'
    # QVMTOOL_QVM_DEVICE='/home/user/projects/bash/qubes-completion/stubs/qvm-device'
    # QVMTOOL_QVM_POOL='/home/user/projects/bash/qubes-completion/stubs/qvm-pool'

    QB_DEBUG_LOG=1
    QB_DEBUG_LOG_PATH="${__debug_overrides_script_dir}/../log/qubes_completion_debug.log"
    
    QB_DEBUG_STUB_FILEDIR_OUTPUT='dir1 dir2 _dir file1 file2 file33 file _file something'
    QB_DEBUG_STUB_PROFILES_DIR="${__debug_overrides_script_dir}/../stubs/profiles"
fi

# ex: filetype=sh
