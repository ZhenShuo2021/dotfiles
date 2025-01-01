#!/bin/bash

# 設定子模組和對應的上游分支名稱
declare -A SUBMODULES=(
    ["config.symlink/wezterm"]="master"
    ["config.symlink/nvim"]="main"
)

for SUBMODULE in "${!SUBMODULES[@]}"; do
    UPSTREAM_BRANCH="${SUBMODULES[$SUBMODULE]}"
    echo "Updating submodule: $SUBMODULE (Branch: $UPSTREAM_BRANCH)"
    cd "$SUBMODULE" || { echo "Failed to enter submodule directory $SUBMODULE"; exit 1; }

    git fetch origin
    git checkout custom || { echo "Branch 'custom' not found in $SUBMODULE"; exit 1; }
    echo "Rebasing $SUBMODULE to $UPSTREAM_BRANCH"
    git rebase "origin/$UPSTREAM_BRANCH" || { echo "Rebase failed for $SUBMODULE"; exit 1; }

    cd $ZDOTFILES

    git add "$SUBMODULE" || { echo "Failed to add submodule $SUBMODULE"; exit 1; }
done

echo "Submodule update and rebase completed successfully."
