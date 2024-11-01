if status is-interactive

    # Add Homebrew to PATH for Fish
    set -Ux fish_user_paths /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin $fish_user_paths

    # Oh my posh config
    oh-my-posh init fish --config ~/.config/oh-my-posh/santiago.omp.json | source

    # Fuzzy finder with preview: open with cat explorer mode, similar to Telescope
    function fuzz-preview
        fzf --preview="bat --color=always {}"
    end

    function fuzz-preview-nvim
        nvim (fzf -m --preview="bat --color=always {}")
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
