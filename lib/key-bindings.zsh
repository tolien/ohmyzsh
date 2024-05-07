# Specific key bindings
# See also key-binding-support.zsh for helper functions used here

# Use emacs key bindings
bindkey -e

omz_bindkey    '\ew' kill-region                      # [Esc-w] - Kill from the cursor to the mark
omz_bindkey -s '\el' 'ls\n'                           # [Esc-l] - run command: ls
omz_bindkey    '^r' history-incremental-search-backward  # [Ctrl-r] - Search backward incrementally for a specified string.
                                                      #    The string may begin with ^ to anchor the search to the beginning of the line.

# Start typing + [Up-Arrow] - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search

bindkey -M emacs "^[[A" up-line-or-beginning-search
bindkey -M viins "^[[A" up-line-or-beginning-search
bindkey -M vicmd "^[[A" up-line-or-beginning-search
if [[ -n "${terminfo[kcuu1]}" ]]; then
  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# Start typing + [Down-Arrow] - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -M emacs "^[[B" down-line-or-beginning-search
bindkey -M viins "^[[B" down-line-or-beginning-search
bindkey -M vicmd "^[[B" down-line-or-beginning-search
if [[ -n "${terminfo[kcud1]}" ]]; then
  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

omz_bindkey    '^?'   backward-delete-char          # [Backspace] - delete backward
omz_bindkey -t kdch1  delete-char                   # [Delete] - delete forward
if [[ $? != 0 ]]; then
  # Alternate forward-delete sequences, if not in terminfo
  omz_bindkey '\e[3~'  delete-char   # VT220 editing keypad Del
  omz_bindkey '\e3;5~' delete-char   # I don't know what this is, but it was here before -apjanke
fi

# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey -M vicmd '^[[3;5~' kill-word

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word


bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey ' ' magic-space                               # [Space] - don't do history expansion


# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
omz_bindkey '\C-x\C-e' edit-command-line

# File rename magick
omz_bindkey '\em' copy-prev-shell-word

