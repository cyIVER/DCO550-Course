#!/usr/bin/env python3
# /// script
# requires-python = ">=3.11"
# ///

import os
import json
import argparse
from pathlib import Path

def scan_directory(root_dir, max_depth=3):
    """Recursively scans directory up to max_depth."""
    tree = {}
    
    def _scan(current_path, current_depth):
        if current_depth > max_depth:
            return "... (max depth reached)"
        
        rel_path = os.path.relpath(current_path, root_dir)
        content = {}
        
        try:
            for item in os.listdir(current_path):
                if item in ['.git', 'node_modules', '__pycache__', '.venv', 'venv', 'env']:
                    continue
                
                item_path = os.path.join(current_path, item)
                if os.path.isdir(item_path):
                    content[item] = _scan(item_path, current_depth + 1)
                else:
                    content[item] = "file"
        except PermissionError:
            return "Permission Denied"
            
        return content

    return _scan(root_dir, 1)

def detect_stack(root_dir):
    """Looks for common manifest files to identify stack."""
    stack = []
    root = Path(root_dir)
    
    if (root / 'package.json').exists():
        stack.append('Node.js / NPM')
        
    if (root / 'requirements.txt').exists() or (root / 'pyproject.toml').exists():
        stack.append('Python')
        
    if (root / 'Cargo.toml').exists():
        stack.append('Rust')
        
    if (root / 'go.mod').exists():
        stack.append('Go')
        
    if (root / 'pom.xml').exists() or (root / 'build.gradle').exists():
        stack.append('Java')
        
    return stack

def main():
    parser = argparse.ArgumentParser(description="Scan a repository to extract context for a README.")
    parser.add_argument("--dir", type=str, default=".", help="Directory to scan")
    parser.add_argument("--depth", type=int, default=2, help="Max depth for tree traversal")
    args = parser.parse_args()
    
    root_dir = os.path.abspath(args.dir)
    if not os.path.exists(root_dir):
        print(json.dumps({"error": f"Directory not found: {root_dir}"}))
        return

    tree = scan_directory(root_dir, max_depth=args.depth)
    stack = detect_stack(root_dir)
    
    output = {
        "repository_path": root_dir,
        "detected_stack": stack,
        "file_tree": tree,
        "advice_to_agent": "Use this structured directory and stack information to populate the README.md placeholders rather than hallucinating the context."
    }
    
    print(json.dumps(output, indent=2))

if __name__ == "__main__":
    main()
