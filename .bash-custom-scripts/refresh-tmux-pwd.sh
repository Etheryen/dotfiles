tmux_refresh_pwd() {
	tmux refresh-client -S 2>/dev/null
}

if [[ -n "$TMUX" ]]; then
	PROMPT_COMMAND="tmux_refresh_pwd${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
fi
