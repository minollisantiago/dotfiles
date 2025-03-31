if status is-interactive

    cd ~

    # Add Homebrew to PATH for Fish
    set -Ux fish_user_paths /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin $fish_user_paths

    # Oh my posh config
    oh-my-posh init fish --config ~/.config/oh-my-posh/santiago.omp.json | source

    # Bat syntax highlighting
    set -Ux BAT_THEME kanagawa

    # Python UVX shell completions
    uvx --generate-shell-completion fish | source

    # Direnv
    direnv hook fish | source

    # NVM setup (nvm.fish)
    set -Ux nvm_default_version lts
    set -gx nvm_mirror "https://nodejs.org/dist"
    set -gx nvm_default_packages npm pnpm yarn

    # Remove Windows Node.js paths from PATH
    set -x PATH (string split : "$PATH" | string match -v "*scoop/apps/nvm*" | string join :)

    # Ensure nvm.fish is loaded
    if not test -d $HOME/.local/share/nvm
        # Initialize nvm if not already done
        nvm install lts
        nvm use lts
    end

    # Use default nodejs
    nvm use default

    # Fuzzy finder with preview: open with cat explorer mode, similar to Telescope
    function fuzz-preview
        fzf --preview="bat --color=always {}" --color="hl:#FDBD9C,hl+:#F81A70"
    end

    function fuzz-preview-nvim
        nvim (fzf -m --preview="bat --color=always {}" --color="hl:#FDBD9C,hl+:#F81A70")
    end

    #zoxide directory jumper
    zoxide init fish | source

    # Function to activate Python uv venv without changing directory
    function activate-venv
        if test -n "$argv[1]"
            set -l venv_path "$HOME/projects/$argv[1]/.venv/bin/activate.fish"
            if test -f $venv_path
                source $venv_path
            else
                echo "Virtual environment not found at: $venv_path"
                echo "Make sure the project exists and has a virtual environment"
            end
        else
            echo "Please provide a project name"
        end
    end

    # Navigation shortcuts
    function ..
        cd ..
    end

    function ...
        cd ../..
    end

    function ....
        cd ../../..
    end

    # Aliases
    alias g="git"
    alias vim="nvim"
    alias cc="clear"
    alias ll="ls -lat"
    alias ff="fuzz-preview"
    alias vv="activate-venv"
    alias nff="fuzz-preview-nvim"
    alias trees="eza --tree"
    alias tree="eza --tree --git-ignore"

    # Theme: Kanagawa
    set -l foreground DCD7BA normal
    set -l selection 2D4F67 brcyan
    set -l comment 727169 brblack
    set -l red C34043 red
    set -l orange FF9E64 brred
    set -l yellow C0A36E yellow
    set -l green 76946A green
    set -l purple 957FB8 magenta
    set -l cyan 7AA89F cyan
    set -l pink D27E99 brmagenta

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment

    #Avante nvim
    set -gx XAI_API_KEY your_grok_apy_key

    #Your Local IP if you are on WSL and the model is hosted on windows with LM studio
    set -gx WINDOWS_LOCALHOST 999.999.9.999

    # Set up XDG runtime directory for user-specific temporary files
    # The directory must exist and have restrictive permissions (700) for security
    # We need this for avante to work with local llms, otherwise curl cant write to the default runtime location
    set -gx XDG_RUNTIME_DIR /tmp/runtime-$USER
    mkdir -p $XDG_RUNTIME_DIR
    chmod 700 $XDG_RUNTIME_DIR

end
