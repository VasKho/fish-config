function toggle_private_mode --description 'Toggle private mode'
    if test -n "$fish_private_mode"
	set -g fish_private_mode
	if functions -q _old_fish_prompt
            functions -e fish_prompt
            functions -c _old_fish_prompt fish_prompt
            functions -e _old_fish_prompt
        end
    else
	set -g fish_private_mode 1
	functions -c fish_prompt _old_fish_prompt
	function fish_prompt
	    echo -n (set_color normal)"(private) "
	    _old_fish_prompt
	end
    end
end
