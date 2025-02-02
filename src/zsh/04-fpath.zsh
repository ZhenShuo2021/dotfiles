# Load FPATH for functions and completions
# ============================================================================

FPATH="$ZDOTFILES/src/fpath:$FPATH"
autoload -U $ZDOTFILES/src/fpath/*(:t)
