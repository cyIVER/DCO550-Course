---
name: bash-linux
description: "Bash scripting and Linux/macOS terminal automation. Use this skill autonomously when the user requests a shell script, terminal automation, or command-line text processing (e.g. grep, sed, awk). Do not use this skill to run destructive commands without permission."
---

# Bash Linux Patterns

## 1. Definitive Goal Statement
Provide essential, defensive Bash/Linux patterns for file operations, process management, text processing, network interactions, and shell scripting.

## 2. Trigger Conditions and Operational Context
You must invoke this logical sequence when:
- Writing or debugging Bash scripts on Linux or macOS.
- Structuring terminal commands (piping, text processing).
- The user requests help with process management, environment variables, or basic networking strings in the shell.

## 3. Resource Discovery and Grounding
<available_resources>
See Section 7 (Reference Material) below for specific command patterns.
</available_resources>

## 4. Deterministic Execution Logic (Checklist)
You must process the following implementation steps sequentially. Do not proceed until the current step is fully executed.

* [ ] **Step 1: Identify Operation Category.** Determine if the user needs help with file operations, process management, text processing, network requests, or scripting.
* [ ] **Step 2: Retrieve Pattern.** Look up the safest pattern from the reference material below.
* [ ] **Step 3: Apply Error Handling.** Ensure `set -euo pipefail` or defensive checks are applied when composing scripts. Use `&&` to chain conditional success.
* [ ] **Step 4: Parameterize.** Ensure no destructive wildcards are used inadvertently. Use exact paths where possible.
* [ ] **Step 5: Output or Execute.** Provide the command to the user or execute it defensively in the environment.

## 5. Strict Constraints (Negative Guardrails)
- **DO NOT** execute destructive commands (`rm -rf`) without explicit user permission or an isolated test boundary.
- **DO NOT** use generic parsing (`grep`) where structured extractors (`awk`, `cut`, `jq`) are more appropriate.
- **DO NOT** write bash scripts without defensive flags (`set -e`) and traps around cleanup.

## 6. End Task Directive
Once the Bash logic has been successfully structured or executed, output the exact phrase: "Bash execution formulated. Awaiting next directive."
<END_TASK>

---

## 7. Reference Material

## 1. Operator Syntax

### Chaining Commands

| Operator | Meaning | Example |
|----------|---------|---------|
| `;` | Run sequentially | `cmd1; cmd2` |
| `&&` | Run if previous succeeded | `npm install && npm run dev` |
| `\|\|` | Run if previous failed | `npm test \|\| echo "Tests failed"` |
| `\|` | Pipe output | `ls \| grep ".js"` |

---

## 2. File Operations

### Essential Commands

| Task | Command |
|------|---------|
| List all | `ls -la` |
| Find files | `find . -name "*.js" -type f` |
| File content | `cat file.txt` |
| First N lines | `head -n 20 file.txt` |
| Last N lines | `tail -n 20 file.txt` |
| Follow log | `tail -f log.txt` |
| Search in files | `grep -r "pattern" --include="*.js"` |
| File size | `du -sh *` |
| Disk usage | `df -h` |

---

## 3. Process Management

| Task | Command |
|------|---------|
| List processes | `ps aux` |
| Find by name | `ps aux \| grep node` |
| Kill by PID | `kill -9 <PID>` |
| Find port user | `lsof -i :3000` |
| Kill port | `kill -9 $(lsof -t -i :3000)` |
| Background | `npm run dev &` |
| Jobs | `jobs -l` |
| Bring to front | `fg %1` |

---

## 4. Text Processing

### Core Tools

| Tool | Purpose | Example |
|------|---------|---------|
| `grep` | Search | `grep -rn "TODO" src/` |
| `sed` | Replace | `sed -i 's/old/new/g' file.txt` |
| `awk` | Extract columns | `awk '{print $1}' file.txt` |
| `cut` | Cut fields | `cut -d',' -f1 data.csv` |
| `sort` | Sort lines | `sort -u file.txt` |
| `uniq` | Unique lines | `sort file.txt \| uniq -c` |
| `wc` | Count | `wc -l file.txt` |

---

## 5. Environment Variables

| Task | Command |
|------|---------|
| View all | `env` or `printenv` |
| View one | `echo $PATH` |
| Set temporary | `export VAR="value"` |
| Set in script | `VAR="value" command` |
| Add to PATH | `export PATH="$PATH:/new/path"` |

---

## 6. Network

| Task | Command |
|------|---------|
| Download | `curl -O https://example.com/file` |
| API request | `curl -X GET https://api.example.com` |
| POST JSON | `curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' URL` |
| Check port | `nc -zv localhost 3000` |
| Network info | `ifconfig` or `ip addr` |

---

## 7. Script Template

```bash
#!/bin/bash
set -euo pipefail  # Exit on error, undefined var, pipe fail

# Colors (optional)
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Functions
log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1" >&2; }

# Main
main() {
    log_info "Starting..."
    # Your logic here
    log_info "Done!"
}

main "$@"
```

---

## 8. Common Patterns

### Check if command exists

```bash
if command -v node &> /dev/null; then
    echo "Node is installed"
fi
```

### Default variable value

```bash
NAME=${1:-"default_value"}
```

### Read file line by line

```bash
while IFS= read -r line; do
    echo "$line"
done < file.txt
```

### Loop over files

```bash
for file in *.js; do
    echo "Processing $file"
done
```

---

## 9. Differences from PowerShell

| Task | PowerShell | Bash |
|------|------------|------|
| List files | `Get-ChildItem` | `ls -la` |
| Find files | `Get-ChildItem -Recurse` | `find . -type f` |
| Environment | `$env:VAR` | `$VAR` |
| String concat | `"$a$b"` | `"$a$b"` (same) |
| Null check | `if ($x)` | `if [ -n "$x" ]` |
| Pipeline | Object-based | Text-based |

---

## 10. Error Handling

### Set options

```bash
set -e          # Exit on error
set -u          # Exit on undefined variable
set -o pipefail # Exit on pipe failure
set -x          # Debug: print commands
```

### Trap for cleanup

```bash
cleanup() {
    echo "Cleaning up..."
    rm -f /tmp/tempfile
}
trap cleanup EXIT
```

---

> **Remember:** Bash is text-based. Use `&&` for success chains, `set -e` for safety, and quote your variables!

## When to Use
This skill is applicable to execute the workflow or actions described in the overview.
