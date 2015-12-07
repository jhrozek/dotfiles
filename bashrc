# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Function declarations
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
 
function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
 
export PS1=$PS1"$BLUE[$GREEN\$(parse_git_branch)$BLUE]$GREEN\[\033[0m\] "
PS2='> '
PS4='+ '
}

function git-am {
    until [ -z "$1" ]
    do
        sed -i 's/^>From/From/' $1
        git am $1
        shift
    done
}

function git-show-hash {
   git log --pretty=oneline $1 | awk '{print $1}'
}

# don't spam about new mail
export MAILCHECK=99999999999999999999999999999

#vim as the default editor
export EDITOR=/usr/bin/vim

# large history
export HISTSIZE=50000

#nice colorized prompt
export PS1="\[\033[1;37m\][\[\033[1;34m\]\u\[\033[1;37m\]@\[\033[0;35m\]\h\[\033[1;37m\]] \[\033[0;37m\]\W \[\033[1;37m\]$\[\033[0m\] "

#append history from multiple windows rather than overwrite
shopt -s histappend

# my aliases
alias l="ls"
alias ll="ls -l"
alias lsp="ls -l *.patch"
alias rmp="rm *.patch"
alias rmc="rm core.*"
alias rm="rm -i"
alias crontab="crontab -i"
alias mc='mc'
alias git-fp='git format-patch -M -C --patience --full-index'
alias git-branch-diff='git log --oneline --cherry-pick --left-right'
alias git-fp-all='git format-patch -M -C --patience --full-index origin/master..HEAD'
alias top='htop'
alias make='make -j4'
alias cds='cd $HOME/devel/sssd'
alias cdr='cd $HOME/devel/rhel-git/'
alias cdt='cd $HOME/tmp'
alias cdb='cd /dev/shm/sssd'
alias bodhi='bodhi -u jhrozek'
alias lgdb='libtool --mode=execute gdb'
alias ci="git push ci HEAD:master"

alias multihead="xrandr --output LVDS1 --auto --output HDMI2 --auto --left-of LVDS1"
alias singlehead="xrandr --output LVDS1"

# allow core
ulimit -c unlimited

# http://udrepper.livejournal.com/11429.html
export MALLOC_PERTURB_=$(($RANDOM % 255 + 1))

proml

#CC="/usr/bin/clang"
CC="/usr/bin/gcc"
CFLAGS="${CFLAGS:--O0 -Wp,-U_FORTIFY_SOURCE -ggdb -pipe -Wall -Wextra -Wshadow -Wformat -Wformat-security -Werror=unused-function -Wunused-variable -Wno-missing-field-initializers -Wno-missing-field-initializers -Wno-unused-parameter -Wno-cast-align -Wno-sign-compare -Werror=implicit-function-declaration -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic}" ; export CFLAGS ; 
CXXFLAGS="${CXXFLAGS:--O0 -ggdb -pipe -Wall -Wextra -Wshadow -Wformat -Wformat-security -Werror=unused-function -Wunused-variable -Wno-unused-parameter -Wno-cast-align -Wno-sign-compare -Werror=implicit-function-declaration -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic}" ; export CXXFLAGS ; 
FFLAGS="${FFLAGS:--O0 -ggdb -pipe -Wall -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic -I/usr/lib64/gfortran/modules}" ; export FFLAGS ; 
export CC
export CFLAGS
export CXXFLAGS
export FFLAGS

export DISABLE_AUTO_TITLE=true

# run check tests in nofork mode to ease debugging
export CK_FORK="no"

alias configure='./configure --build=x86_64-unknown-linux-gnu --host=x86_64-unknown-linux-gnu --target=x86_64-redhat-linux-gnu --program-prefix= --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man --with-test-dir=/dev/shm --infodir=/usr/share/info --enable-silent-rules --enable-nsslibdir=/lib64 --enable-pammoddir=/lib64/security --enable-all-experimental-features'
alias configure-stable='./configure --build=x86_64-unknown-linux-gnu --host=x86_64-unknown-linux-gnu --target=x86_64-redhat-linux-gnu --program-prefix= --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man --with-test-dir=/dev/shm --infodir=/usr/share/info --enable-silent-rules --enable-nsslibdir=/lib64'

if [ -f /home/remote/jhrozek/.bashrc_sssd ]; then
    . /home/remote/jhrozek/.bashrc_sssd
fi

export PATH="/home/remote/jhrozek/bin:$PATH"
