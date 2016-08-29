# Path to your oh-my-zsh installation.
export ZSH=/home/remote/jhrozek/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lukerandall"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast vagrant tmuxinator tmux)

# User configuration

export PATH="/home/remote/jhrozek/bin:/home/remote/jhrozek/bin:/home/remote/jhrozek/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='/usr/bin/vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# my aliases
alias l="ls"
alias ll="ls -l"
alias lsp="ls -l *.patch"
alias rmp="rm *.patch"
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
alias cdb='cd /dev/shm/sssd'
alias bodhi='bodhi -u jhrozek'
#alias git='hub'

alias lexec='libtool --mode=execute '
alias lgdb='libtool --mode=execute gdb'
alias lvalgrind='libtool --mode=execute valgrind'

alias ci="git push ci HEAD:master"
alias download="wget --no-verbose --no-parent --recursive --level=1 --no-directories"

alias multihead="xrandr --output eDP1 --auto --output DP2-2 --auto --left-of eDP1"
alias singlehead="xrandr --output LVDS1"

alias posteo="mutt -F ~/.muttrc_posteo"
alias coverage_cflags="export CFLAGS=\"-g -O0 -Wall -W -Wno-unused-parameter -Wno-sign-compare -fprofile-arcs -ftest-coverage\"; export LDFLAGS=\"-fprofile-arcs -ftest-coverage\""

# allow core
ulimit -c unlimited

# http://udrepper.livejournal.com/11429.html
export MALLOC_PERTURB_=$(($RANDOM % 255 + 1))

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

export PATH="/home/remote/jhrozek/bin:/home/remote/jhrozek/devel/golang/bin:$PATH"

export GOPATH="/home/remote/jhrozek/devel/golang"
