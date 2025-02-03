if status is-interactive
    set -g fish_greeting
    # Commands to run in interactive sessions can go here
    set -gx PATH /opt/homebrew/bin $PATH
    set -gx PATH "/Users/lolimaster/Library/Android/sdk/ndk/27.0.11902837" $PATH
    set -gx PATH /opt/homebrew/opt/make/libexec/gnubin $PATH
    set -gx PATH /Users/lolimaster/go/bin $PATH
    set -gx NEMU_HOME /Users/lolimaster/projects/ics2024/nemu
    set -gx AM_HOME /Users/lolimaster/projects/ics2024/abstract-machine
    set -gx ANDROID_HOME /Users/lolimaster/Library/Android/sdk
    set -gx NDK_HOME /Users/lolimaster/Library/Android/sdk/ndk/27.0.11902837

    # NVM setup
    # set -gx NVM_DIR "/Users/lolimaster/.nvm"
    # if test -s "$NVM_DIR/nvm.sh"
    #    source "$NVM_DIR/nvm.sh"
    # end

    # Add binutils to PATH
    set -gx PATH /opt/homebrew/opt/binutils/bin $PATH
    set -gx LDFLAGS -L/opt/homebrew/opt/binutils/lib
    set -gx CPPFLAGS -I/opt/homebrew/opt/binutils/include

    # Git repo URL
    set -gx REPO_URL 'https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'

    # Alias
    alias ai "gemini --model gemini-2.0-flash-thinking-exp"

    starship init fish | source
end


function code
    set location "$PWD/$argv"
    open -n -b "com.microsoft.VSCode" --args $location
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/lolimaster/.lmstudio/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/lolimaster/miniconda3/bin/conda
    eval /Users/lolimaster/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/Users/lolimaster/miniconda3/etc/fish/conf.d/conda.fish"
        . "/Users/lolimaster/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /Users/lolimaster/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<
