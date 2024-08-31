if status is-interactive
    if ! functions -q fisher
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && \
	    fisher install jorgebucaran/fisher

	fisher install PatrickF1/fzf.fish
    end

    set -x MOZ_ENABLE_WAYLAND 1
    set -x DESKTOP_APP_I_KNOW_ABOUT_GTK_INCOMPATIBILITY 1
    set -x PAGER less
    set -x MANPAGER less
    set -x EDITOR nvim
    set -x DOCKER_BUILDKIT 1

    set -x PATH "$PATH:/home/$USER/.cargo/bin:/home/$USER/texlive/bin/x86_64-linux:/home/$USER/.local/bin:/home/$USER/.roswell/bin"
end

function em -d 'Alias for terminal emacs client'
    emacsclient -nw $argv
end

function dbx -d 'Alias for distrobox'
    set -lx TERM xterm-256color
    distrobox $argv
end

function ssh -d 'Alias for ssh'
    set -lx TERM xterm-256color
    ssh $argv
end

function ll -d 'Alias for ls'
    ls --color -lAh $argv
end
