# git-clean-gone

A safer Git cleanup utility for pruning stale remote branches and tidying local branches whose upstreams have been deleted.

## Why?

Over time, repositories accumulate:

* Deleted remote feature branches
* Local branches tracking branches that no longer exist
* Stale branches cluttering `git branch`

This tool helps you:

* Prune stale remote references
* Detect local branches with deleted upstreams
* Separate:

  * Safe merged branches
  * Potentially unmerged branches
* Confirm before deletion
* Optionally force delete stale unmerged branches

## Features

* Safe by default
* Interactive confirmation
* Prevents accidental loss of unmerged work
* Works well for active feature-branch workflows
* Ideal for teams using GitHub/GitLab with frequent PR merges

---

## Installation

### Add to your shell config (`~/.zshrc` or `~/.bashrc`)

```bash
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
```

Then reload:

```bash
source ~/.zshrc
```

---

## Usage

```bash
git-clean-gone
```

### Example output:

```bash
Safe to delete (merged):
feature/old-branch
bugfix/legacy-fix

Not fully merged (force delete optional):
experimental/test-branch
```

---

## Safety Notes

### `git branch -d`

Deletes only branches already merged into your current branch.

### `git branch -D`

Force deletes regardless of merge state.

Use force deletion carefully.

---

## Recommended Workflow

Run regularly:

```bash
git-clean-gone
```

Especially useful after:

* Pull request merges
* Rebases
* Team branch cleanup
* Repository maintenance

---

## Future Improvements

Potential additions:

* Dry-run mode
* Colour output
* Alias installer
* Homebrew formula
* Standalone shell script version

---

## License

MIT License

---

## Author

Built for developers who are tired of stale branch chaos.
