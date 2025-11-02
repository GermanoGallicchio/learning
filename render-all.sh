#!/bin/bash
#
# render-all.sh - Render all Quarto presentation files
#
# Usage:
#   bash render-all.sh
#
# Description:
#   Automatically finds and renders all .qmd files in the current directory.
#   Output formats and destination directory are determined by _quarto.yml.
#   This script renders files individually to avoid Quarto's batch rendering bug.
#

echo "Rendering all .qmd files..."
echo ""

# Find all .qmd files in current directory (excluding subdirectories)
for qmd_file in *.qmd; do
    # Skip if no .qmd files found
    [ -e "$qmd_file" ] || continue
    
    echo "==> Rendering ${qmd_file}..."
    quarto render "${qmd_file}" --quiet
    if [ $? -eq 0 ]; then
        echo "    ✓ ${qmd_file} completed"
    else
        echo "    ✗ ${qmd_file} failed"
    fi
    echo ""
done

echo "Done! Check docs/ folder for output files."
