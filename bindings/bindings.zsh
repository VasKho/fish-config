#!/usr/bin/env zsh

function __copy() {
    if [[ ${REGION_ACTIVE} == "0" ]]; then return; fi
    if [[ "${CURSOR}" -gt "${MARK}" ]]
    then
	start=$((MARK + 1))
        end=$((CURSOR + 1))
    else
	start=$((CURSOR + 1))
        end=$((MARK + 1))
    fi
    echo ${BUFFER} | cut -c "${start}-${end}" | clipcopy
    CURSOR="${MARK}"
    REGION_ACTIVE=0
}

function __paste() {
    clipboard_info=$(clippaste -n)
    BUFFER="${LBUFFER}${clipboard_info}${RBUFFER}"
    CURSOR=$((${#LBUFFER} + ${#clipboard_info}))
}

function __kill-char-or-region() {
    if [[ ${REGION_ACTIVE} == "0" ]];
    then
	zle backward-delete-char
	return
    fi
    if [[ "${CURSOR}" -gt "${MARK}" ]]
    then
	start="${MARK}"
        end="${CURSOR}"
    else
	start="${CURSOR}"
        end="${MARK}"
    fi
    prefix=${BUFFER:0:${start}}
    suffix=${BUFFER:${end}}
    BUFFER="${prefix}${suffix}"
    REGION_ACTIVE=0
}

zle -N __copy
zle -N __paste
zle -N __kill-char-or-region

bindkey -rp ''

# Command modifiers
bindkey "^[-" neg-argument
bindkey "^[0" digit-argument
bindkey "^[1" digit-argument
bindkey "^[2" digit-argument
bindkey "^[3" digit-argument
bindkey "^[4" digit-argument
bindkey "^[5" digit-argument
bindkey "^[6" digit-argument
bindkey "^[7" digit-argument
bindkey "^[8" digit-argument
bindkey "^[9" digit-argument

# Bindings to configure writing of letters
bindkey "^[^I" self-insert-unmeta
bindkey "^[^J" self-insert-unmeta
bindkey "^[^M" self-insert-unmeta
bindkey -R "!"-"~" self-insert
bindkey -R "\M-^@"-"\M-^?" self-insert
bindkey " " magic-space
bindkey "^M" accept-line
bindkey "^J" accept-line

# Text navigation
bindkey "^[OC" forward-char
bindkey "^[OD" backward-char
bindkey "^F" forward-char
bindkey "^B" backward-char

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[f" forward-word
bindkey "^[b" backward-word

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# History navigation
bindkey "^[n" history-search-forward
bindkey "^[p" history-search-backward
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey "^R" fzf-history-widget

# Text editing
bindkey "^@" visual-mode
bindkey "^D" delete-char-or-list
bindkey "^[[3~" delete-char-or-list
bindkey "^?" __kill-char-or-region
bindkey "^[^?" backward-kill-word
bindkey "^H" backward-kill-word
bindkey "^[d" kill-word
bindkey "^K" kill-line

bindkey "^[t" transpose-words

bindkey "^_" undo
bindkey "^[/" redo

bindkey "^I" fzf-completion
bindkey "^[[Z" reverse-menu-complete
bindkey "^T" fzf-file-widget

# Other
bindkey "^V" quoted-insert
bindkey "^X^E" edit-command-line
bindkey "^G" send-break

bindkey "^[w" __copy
bindkey "^Y" __paste
