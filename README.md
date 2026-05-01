# Useful Scripts

A curated collection of practical scripts, shell functions, and developer utilities for everyday workflows.

Built to reduce repetitive manual tasks, improve system hygiene, and streamline development operations.

---

## Purpose

This repository serves as a personal and shareable toolbox for:

* Git maintenance
* Shell productivity
* AWS utilities
* macOS/Linux helpers
* CI/CD shortcuts
* Automation scripts
* Developer quality-of-life improvements

---

## Repository Structure

```text
useful-scripts/
│
├── README.md
│
├── git/
│   ├── git-clean-gone.sh
│   └── README.md
│
├── shell/
│   └── ...
│
├── aws/
│   └── ...
│
├── macos/
│   └── ...
│
└── linux/
    └── ...
```

---

## Current Scripts

### Git

| Script              | Description                                                                          |
| ------------------- | ------------------------------------------------------------------------------------ |
| `git-clean-gone.sh` | Prunes stale remote branches and safely cleans local branches with deleted upstreams |

---

## Philosophy

Scripts in this repo aim to be:

* Safe by default
* Interactive where destructive
* Minimal dependencies
* Copy-paste friendly
* Practical for real-world developer environments
* Easily adaptable

---

## Installation

Clone the repository:

```bash id="6n2sy6"
git clone https://github.com/yourusername/useful-scripts.git
```

Then add desired scripts/functions to your shell profile:

```bash id="4abajg"
source git/git-clean-gone.sh
```

---

## Usage

Each script includes its own documentation within its subdirectory.

Example:

```bash id="jlwm1k"
git-clean-gone
```

---

## Contributing

This is primarily a practical utility collection, but contributions, improvements, and additional scripts are welcome.

Suggested contributions:

* Better safety checks
* Cross-platform compatibility
* Performance improvements
* Additional dev tooling
* Documentation enhancements

---

## Roadmap

Potential future additions:

* Git branch cleanup enhancements
* Docker cleanup tools
* AWS deployment helpers
* Jenkins utility scripts
* macOS maintenance scripts
* Backup automation
* Security audit helpers

---

## License

MIT License

---

## Disclaimer

Always review scripts before use, particularly those involving:

* Branch deletion
* File deletion
* Infrastructure modification
* Deployment actions

Use responsibly.

---

## Author

Designed for developers who prefer automation over repetitive maintenance.
