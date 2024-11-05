if status is-interactive

    # Add Homebrew to PATH for Fish
    set -Ux fish_user_paths /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin $fish_user_paths

    # Oh my posh config
    oh-my-posh init fish --config ~/.config/oh-my-posh/santiago.omp.json | source

    # Python UVX shell completions
    uvx --generate-shell-completion fish | source

    # NVM setup
    function nvm
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
    end

    # Load nvm on terminal start
    if test -f ~/.nvm/nvm.sh
        set -gx NVM_DIR ~/.nvm
        bass source ~/.nvm/nvm.sh --no-use

        # If you have a default node version, load it
        nvm use default
    end

    # Fuzzy finder with preview: open with cat explorer mode, similar to Telescope
    function fuzz-preview
        fzf --preview="bat --color=always {}"
    end

    function fuzz-preview-nvim
        nvim (fzf -m --preview="bat --color=always {}")
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

end
