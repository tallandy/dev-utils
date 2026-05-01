git-clean-gone() {
  git fetch --prune

  gone_branches=$(git branch -vv | awk '/: gone]/{print $1}')

  if [ -z "$gone_branches" ]; then
    echo "No local branches with gone upstreams."
    return 0
  fi

  safe_branches=""
  force_branches=""

  for branch in $gone_branches; do
    if git branch --merged | grep -q " $branch$"; then
      safe_branches="$safe_branches $branch"
    else
      force_branches="$force_branches $branch"
    fi
  done

  echo "Safe to delete (merged):"
  [ -n "$safe_branches" ] && echo "$safe_branches" || echo "None"

  echo
  echo "Not fully merged (force delete optional):"
  [ -n "$force_branches" ] && echo "$force_branches" || echo "None"

  echo
  read "confirm?Delete safe branches? [y/N] "
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    echo "$safe_branches" | xargs -n 1 git branch -d
  fi

  if [ -n "$force_branches" ]; then
    echo
    read "force_confirm?Force delete unmerged branches too? [y/N] "
    if [[ "$force_confirm" =~ ^[Yy]$ ]]; then
      echo "$force_branches" | xargs -n 1 git branch -D
    fi
  fi
}