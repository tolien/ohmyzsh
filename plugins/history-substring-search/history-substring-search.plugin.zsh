0=${(%):-%N}
source ${0:A:h}/history-substring-search.zsh

# Bind terminal-specific up and down keys
# Bind in both emacs and vi modes so it works in both, and is not
# sensitive to whether this is loaded before or after the vi-mode plugin
omz_bindkey -M emacs -t kcuu1 history-substring-search-up
omz_bindkey -M viins -t kcuu1 history-substring-search-up
omz_bindkey -M emacs -t kcud1 history-substring-search-down
omz_bindkey -M viins -t kcud1 history-substring-search-down

