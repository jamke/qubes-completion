**`qubes-completion` - Bash tab completion for Qubes OS commands**

## What the project does

Project `qubes-completion` provides typing completions and hints for commands specific to [Qubes OS](https://www.qubes-os.org) operation system by completing all flags and arguments, qube names, firewall rules, devices, prefs, features, tags, packages and etc.
Typing completion are provided for almost all commands starting with `qvm-` and `qubes-` prefixes and several others.

While the project is expected to be the most valuable for advanced users who frequently use terminal in `Qubes OS` to manage the system, it can also be useful for average users. To use bash completions user should press `Tab` key once or twice when typing commands in terminal that runs `bash`.

## What is supported

The project supports completion for:

#### 1. Qube names (VM names):

```
$ qvm-firewall sys-<TAB><TAB>

sys-firewall  sys-net  sys-whonix
```

Running **states** of qubes are respected, e.g. provide only halted qubes for `qvm-start`:

```
$ qvm-start <TAB><TAB>

work  sys-whonix  fedora-37
```

Also **classes (types)** of qubes are used, like `TemplateVMs` and `DispVMs`:

```
$ qvm-create --template <TAB><TAB>

debian-11  fedora-37  fedora-37-minimal
```

#### 2. All flags of commands (long and short versions):

```
$ qvm-ls --raw-<TAB><TAB>

--raw-data  --raw-list
```

```
$ qvm-ls -<TAB><TAB>

--all         --help          -o            --spinner
-d            --help-columns  -O            -t
--disk        --help-formats  --paused      --tags
--exclude     -k              -q            --tree
--fields      --kernel        --quiet       -v
--format      -n              --raw-data    --verbose
-h            --network       --raw-list    
--halted      --no-spinner    --running     
```


#### 3. Predefined arguments (e.g. column names, colors of qubes and etc.):

```
$ qvm-ls --raw-data --fields=<TAB><TAB>

CLASS  FLAGS    MEMORY  PRIV-CURR  PRIV-USED  ROOT-MAX   STATE
DISK   GATEWAY  NAME    PRIV-MAX   ROOT-CURR  ROOT-USED
```

```
$ qvm-block <TAB><TAB>

attach  detach  list
```

#### 4. Firewall rule management (including rule numbers with hints)

```
$ qvm-firewall sys-firewall <TAB><TAB>

add    del    list   reset
```

```
$ qvm-firewall sys-firewall add <TAB><TAB>

action=    dst6=       dstports=   icmptype=   specialtarget=
dst4=      dsthost=    expire=     proto=
```

```
$ qvm-firewall sys-firewall del -<TAB>
=> qvm-firewall sys-firewall del --rule-no=
```

```
$ qvm-firewall sys-firewall del --rule-no=<TAB><TAB>

NO  ACTION  HOST                PROTOCOL  PORT(S)  SPECIAL TARGET  ICMP TYPE  EXPIRE   COMMENT
0   accept  1.1.1.1/32          tcp       443      -               -          -       -                      
1   accept  200.200.200.200/32  udp       443      -               -          -       -                      
2   accept  222.222.222.222/32  udp       80       -               -          -       -                      
3   drop    111.111.111.111/32  udp       443      -               -          -       -                      
4   drop    111.111.111.112/32  udp       443      -               -          -       -                      
5   drop    111.111.111.113/32  udp       443      -               -          -       -                      
6   drop    92.168.0.2/16       udp       443      -               -          -       -                      
7   drop    192.168.0.0/16      tcp       81-90    dns             -          -       -                      
8   drop    -                   icmp      -        dns             7          +1905s  -                      
9   drop    92.168.0.2/16       icmp      -        dns             6          +99905s -                      
10  drop    111.111.111.114/32  udp       443      -               -          -       -                      
11  drop    -                   -         -        -               -          -       -                      
```

```
$ qvm-firewall sys-firewall del --rule-no=1<TAB><TAB>

NO  ACTION  HOST                PROTOCOL  PORT(S)  SPECIAL TARGET  ICMP TYPE  EXPIRE   COMMENT
1   accept  200.200.200.200/32  udp       443      -               -          -       -                      
10  drop    111.111.111.114/32  udp       443      -               -          -       -                      
11  drop    -                   -         -        -               -          -       -                      
```

#### 5. Device IDs with name hints for all types (block, usb, pci and mic).

```
$ qvm-block attach sys-usb <TAB><TAB>

dom0:sda        WDC_SOMEDISK ()   sys-usb (read-only=no, frontend-dev=xvdx)
dom0:sdb        WORK_SOMEDISK ()
dom0:sdb1       WORK_SOMEDISK ()  work (read-only=no)
cryptvm:dm-0    somecrypt1        work (read-only=no, frontend-dev=xvdf)
cryptvm:dm-4    somecrypt5        personal (read-only=no)
```

```
$ qvm-device block detach work <TAB><TAB>

dom0:sdb1       WORK_SOMEDISK ()  work (read-only=no)
cryptvm:dm-0    somecrypt1        work (read-only=no, frontend-dev=xvdf)
```


#### 6. Property names (prefs), actual and common values for them

```
$ qvm-prefs personal <TAB><TAB>

audiovm             installed_by_rpm   name                 uuid
autostart           ip                 netvm                vcpus
backup_timestamp    ip6                provides_network     virt_mode
debug               kernel             qid                  visible_gateway
default_dispvm      kernelopts         qrexec_timeout       visible_gateway6
default_user        keyboard_layout    shutdown_timeout     visible_ip
dns                 klass              start_time           visible_ip6
gateway             label              stubdom_mem          visible_netmask
gateway6            mac                stubdom_xid          xid
guivm               management_dispvm  template             
icon                maxmem             template_for_dispvms 
include_in_backups  memory             updateable           
```

```
$ qvm-prefs personal label <TAB><TAB>

black  blue  --default  gray  green  orange  purple  red  yellow
```

```
$ qvm-prefs personal klass <TAB><TAB>

AdminVM  AppVM  --default  DispVM  StandaloneVM  TemplateVM
```

#### 7. Common qube features

```
qvm-features work gui<TAB>

gui    gui-default-allow-utf8-titles    gui-emulated
```

```
$ qvm-features --<TAB><TAB>

--D   --default  --delete  --help  --quiet  --unset  --verbose
```

#### 8. Tags of qubes

```
$ qvm-tags sys-firewall <TAB><TAB>

add    del    list    set    unset
```

```
$ qvm-tags sys-firewall del <TAB><TAB>

audiovm-dom0   created-by-dom0   guivm-dom0
```

#### 9. Pool names:

```
$ qvm-create -P <TAB><TAB>

linux-kernel   varlibqubes   vm-pool
```

Note that volume-completion features currently are not available because `qvm-volume` tool is not optimized and executes too slow for providing responsive completions. If it gets optimized it will be possible to provide proper completion for volumes, too.

#### 10. Arguments and flags provided by `dnf` for `qubes-dom0-update`:

```
$ sudo qubes-dom0-update --action=<TAB><TAB>

alias          distro-sync   install     reinstall            search
autoremove     downgrade     list        remove               shell
check          group         makecache   repoinfo             swap
check-update   help          mark        repolist             updateinfo
clean          history       module      repoquery            upgrade
deplist        info          provides    repository-packages  upgrade-minimal
```

```
$ sudo qubes-dom0-update --<TAB><TAB>

--action=             --disableexcludes     --noplugins
--advisories          --disableplugin       --obsoletes
--advisory            --disablerepo         --preserve-terminal
--allowerasing        --downloaddir         --quiet
--assumeno            --downloadonly        --randomwait
--assumeyes           --enableplugin        --refresh
--best                --enablerepo          --releasever
--bugfix              --enhancement         --repo
--bz                  --errorlevel          --repofrompath
--cacheonly           --exclude             --repoid
--check-only          --excludepkgs         --rpmverbosity
--clean               --force-xen-upgrade   --sec-severity
--color               --gui                 --secseverity
--config              --help                --security
--console             --help-cmd            --setopt
--cve                 --installroot         --show-output
--debuglevel          --newpackage          --showduplicates
--debugsolver         --noautoremove        --skip-broken
--destdir             --nodocs              --verbose
--disableexcludepkgs  --nogpgcheck          --version
```

```
$ sudo qubes-dom0-update --en<TAB>

--enableplugin   --enablerepo   --enhancement
```

#### 11. Packages for `qubes-dom0-update` (limited)

Note: Currently Qubes OS (as of R4.1) does not have dnf databases of **packages** and **repos** available for installation inside `dom0`, so it is not possible to provide completion of them (unlike inside other qubes).
If the situation with dnf databases in `dom0` ever changes and completion of repos and packages for both `dnf` and `qubes-dom0-update` will start to work well out of the box.

Currently the project provides completion of packages that are possible to remove:

```
$ qubes-dom0-update --action=remove gtk-<TAB>

gtk-murrine-engine-0.98.2-18.fc32.x86_64
gtk-unico-engine-1.0.3-0.15.20140109bzr152.fc32.x86_64
gtk-update-icon-cache-3.24.28-2.fc32.x86_64
gtk-xfce-engine-3.2.0-11.fc32.x86_64
```

#### 12. And more...

See yourself.

## List of supported commands

Currently completion is provided for Qubes OS commands listed below.

Symbol `*` marks commands that have completion with limited implementation or a room for improvement.

* `qvm-ls`
* `qvm-tags`
* `qvm-start` *
* `qvm-shutdown`
* `qvm-kill`
* `qvm-run`
* `qvm-pause`
* `qvm-unpause`
* `qvm-create` *
* `qvm-clone`
* `qvm-remove`
* `qvm-device`
* `qvm-block`
* `qvm-usb`
* `qvm-pci`
* `qvm-prefs`
* `qvm-features`
* `qvm-volume` *
* `qvm-check`
* `qvm-firewall`
* `qvm-service`
* `qvm-sync-appmenus`
* `qvm-appmenus` *
* `qvm-copy-to-vm`
* `qvm-move-to-vm`
* `qvm-copy`
* `qvm-move`
* `qvm-start-gui`
* `qvm-start-daemon`
* `qvm-xkill`
* `qvm-sync-clock`
* `qvm-get-image`
* `qvm-get-tinted-image`
* `qvm-console-dispvm`
* `qubes-dom0-update` *
* `qubes-prefs`
* `qubes-guid`
* `qubes-hcl-report`
* `qubes-bug-report`
* `qubes-policy`
* `qubes-vm-settings`
* `qubes-vm-clone`
* `qubes-vm-boot-from-device`
* `qubes-input-trigger`
* `qubes-guivm-session`
* `qubesctl` *
* `qubesd-query` *

## How to install and use

### 1. Install `bash-completion`

The first step is to install `bash-completion`. To do so run in terminal of `dom0`:

`$ sudo qubes-dom0-update -y bash-completion`

Explanation: the project `qubes-completion` requires `bash-completion`. For some reason `bash-completion` package is not installed in `dom0` by default in Qubes OS `R4.0` and `R4.1` (that may be changed in the future releases). Project `bash-completion` is great and installed in almost all GNU/Linux distributions out of box, so it worth installing it whether you plan to use `qubes-completion` or not.

### 2. Install `qubes-completion`

Currently `qubes-completion` does not belong to any package but can be copied as a file to `dom0` and saved as
`/etc/bash_completion.d/qubes-completion.sh`.
To copy it from some qube user should run in terminal of `dom0` something like:

`$ qvm-run --pass-io qubename 'cat /home/user/Downloads/qubes-completion.sh' | sudo tee '/etc/bash_completion.d/qubes-completion.sh' | wc -l`

Where:

* `qubename` is a name of the qube used to download `qubes-completion.sh` script (e.g. `personal`).
* `/home/user/Downloads/qubes-completion.sh` is an example of full path to the downloaded file inside `qubename` qube.

As the output user should see a number of lines that where copied and it should not be zero.

### All done
Completions should start working in all new instances of `bash` terminals.


## About the code

### Code style

The code uses style guide from Google:
[Shell Style Guide](https://google.github.io/styleguide/shellguide.html)

It is used for everything except indentation which is 4 spaces and no tabs.

The code was verified with a great [bash script checker ShellCheck](shellcheck.net) using a [FLOSS extension](https://github.com/streetsidesoftware/vscode-spell-checker/) for `Codium`/`VS Code`, thanks to the authors, they helped a lot.

### Notes on structure of the code

* Shebang is not used for bash completion scripts, it is absent on purpose.

* Execution is started with the function `main()` at the end of the script.

* All completion functions are named after the commands, but with underscores.
E.g. for completion of `qvm-create` the `_qvm_create()` function is called.
All functions initialize specific `Qubes OS` completion model by calling `__init_qubes_completion()` function.

### Tests

The project has tests that are performed by BATS ([Bash Automated Testing System](https://github.com/bats-core/bats-core)).
Tests are located in `test/tests` sub-directory.

#### Install the testing tools

The necessary BATS modules are included as Git submodules.

```sh
# Initialize the repository to use the submodules:
git submodule init

# Download the tools:
git submodule update
```

#### Run the test suite

Once the testing tools are installed, the test suite can run:

```sh
cd test/ && ./bats/bin/bats tests/
```

#### Writing tests

Testing bash completions in general is not that easy.
Unlike `bash completion` project that uses `python` and other third-party stuff to run tests the current project has it in Bash.
The magic of test preparation and execution is done by functions in file `test/tests_common.sh` that make Bash completion variables look the same as they are prepared by Bash in the terminal (using GNU function in C).

The approach also allows to generate tests (see `test/tests_generator.sh`).
Note that there still can be differences in parsing, so created tests should be checked manually before using.

Generation of tests and manual checks of the expected results is required.
If tests are created for all supported functions it will ensure that further changes are not breaking things. It is important because completion logic for Qubes OS is quite a complicated thing.

### Debugging

The project has debug-related stuff. Debug mode is managed by `QB_DEBUG_MODE` variable that is set to "0" by default (debug turned off).
Setting it to "1" makes debug code executable, otherwise it is skipped.

#### File `debug_overrides.sh` and stubs for `qvm-*` tools

Main script on the execution checks the existence of `debug_overrides.sh` file,
and if it exists it is sourced. The example of `debug_overrides.sh` is provided.

This way if debug output to log is not needed user can remove or rename `debug_overrides.sh` file and avoid modification of the source code. Also copying the project script alone to other places will automatically turn debug mode off as it is desired by default.

So, the proper way to turn debug mode on is not a direct modification of the main script, but overriding in `debug_overrides.sh` file, that also can have paths to stub versions of `qvm-` tools that do not exist outside of `dom0`.

Check out the provided example of `debug_overrides.sh` for better understanding.

#### Debug functions

The script has general logging functions that allow to debug the completion using extensive step-by-step real-time logging to an external log file:

*   Log a message to the log file if debug mode is on:
    `__debug_msg()`

*   Log an array to the log file if debug mode is on (similar to declare -p but cleaner and works with refs):
    `__debug_print_array()`

*   Log all BASH completion variables to the log file if debug mode is on:
    `__debug_log_env()`

### When arguments are changed for Qubes OS tools

When arguments or flags of Qubes OS tool were changed the completion script should be changed accordingly. The starting point of making such modifications should be the function that corresponds to the changed tool.
E.g. `_qvm_create()` function for `qvm-create` tool.

In most cases the strings with the list or arguments and flags are located inside these functions where they are used, and not in one place at the top of the file with some constant strings for all commands.

The rationality of this choice:

- Despite the fact that idea of keeping all strings in one place looks appealing,
  it's actually makes harder to support such code. The developer still needs to scroll to the place where the string is used and analyze how modification of
  flags or arguments will affect the code. So keeping the strings in one place of the file not only does not make it easier the support of the code, but also requires one to keep two distant places of the code coherent and consistent.

- The better approach is to keep the strings in place responsible for
  the corresponding command that uses them - the completion function with almost the same name as a command changed.

- Please note, that code still follows DRY principle and in some cases common strings are still moved away just to avoid redefinition and duplicates.

Note: look the chapter about tests in this document. Because tests should be a great help for monitoring of correctness of such code modifications.

### Additional notes

The project tries not to use short versions of flags and arguments of common third-party terminal tools and Bash builtin commands.
It allows to be more explicit, readable and error-proof.

The completion is expected to be quite smart, but it is not trying to completely validate the way user calls functions.
Is many cases the inappropriate or misplaced arguments or flags will not be provided to prevent user from calling something wrong, but there are still
millions of ways to call the commands improperly.
So, consider this completion script as an assistant, not a master.

`Qubes OS` tools has a specific thing in their syntax:

* The arguments for flags can be provided after both "=" char and space.
* And the value of the argument also can contain "=" char (maybe multiple?).

It makes impossible to parse commands in usual and general way, e.g. consider:

`qvm-example --foo bar=baz`

It's impossible to say if `--foo` is followed by `bar=baz` value or option `bar` has `baz` value.
So, to parse the command line some additional info is required (e.g. from docs).
It's a minor design problem and complicates the script a bit, but what can we do.
The better design would to avoid separation of `name=something` values with "=", replace that with ":" (as it is already used in some commands) or something else.
