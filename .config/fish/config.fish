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
    alias vim="nvim"
    alias cc="clear"
    alias g="git"
    alias ff="fuzz-preview"
    alias nff="fuzz-preview-nvim"
end
