function fish_custom_key_bindings -d "Custom keybindings"
    function kill_char_or_region
	if test -z (commandline -s)
	    commandline -f backward-delete-char
	else
	    commandline -f kill-selection
	    commandline -f end-selection
	end
    end

    bind \cB 'backward-char'
    bind \e\[D 'backward-char'
    bind \cF 'forward-char'
    bind \e\[C 'forward-char'

    bind \eb 'backward-word'
    bind \e\[1\;3D 'backward-word'
    bind \e\[1\;5D 'backward-word'
    bind \ef 'forward-word'
    bind \e\[1\;3C 'forward-word'
    bind \e\[1\;5C 'forward-word'

    bind \x7F 'kill_char_or_region'
    bind \cD 'delete-char'

    bind \e\x7F 'backward-kill-word'
    bind \e\x7F 'backward-kill-path-component'
    bind \ed 'kill-word'
    bind \cK 'kill-line'

    bind \cA 'beginning-of-line'
    bind \cE 'end-of-line'

    bind \cX\cU 'upcase-word'
    bind \cX\cL 'downcase-word'

    # bind \cR 'history-pager'
    # bind \cX\cD 'history-pager-delete'
    bind \cS 'pager-toggle-search'
    bind \e\[A 'up-or-search'
    bind \cP 'up-or-search'
    bind \e\[B 'down-or-search'
    bind \cN 'down-or-search'
    bind \c_ 'undo'
    bind \e/ 'redo'

    bind -k nul 'begin-selection'
    bind \cG 'end-selection' 'cancel'
    bind \cX\cX 'swap-selection-start-stop'

    bind \cY 'fish_clipboard_paste'
    bind \ew 'fish_clipboard_copy'
    bind \cX\cE 'edit_command_buffer'
    bind \t 'complete'

    bind \cX\cP 'toggle_private_mode; commandline -f repaint'
end

set -g fish_key_bindings fish_custom_key_bindings
