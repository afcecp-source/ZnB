#!/bin/bash
# ZnB Force Plus - Quick Verification
# Run this to verify the project structure

echo "🔍 ZnB Force Plus - Project Verification"
echo "========================================="
echo ""

# Check directories
echo "📁 Checking directory structure..."
dirs_ok=0
dirs_total=0

for dir in "apps/api" "apps/web" "apps/pocketbase" ".github/workflows"; do
    dirs_total=$((dirs_total + 1))
    if [ -d "$dir" ]; then
        echo "  ✅ $dir"
        dirs_ok=$((dirs_ok + 1))
    else
        echo "  ❌ $dir (missing)"
    fi
done

echo ""
echo "📄 Checking configuration files..."
files_ok=0
files_total=0

files=(
    "package.json"
    "README.md"
    "QUICKSTART.md"
    "DEPLOYMENT.md"
    "CRITICAL_FIXES.md"
    "apps/api/src/main.js"
    "apps/web/src/App.jsx"
    "apps/web/src/pages/auth/OTPLoginPage.jsx"
    "apps/pocketbase/SCHEMA.md"
)

for file in "${files[@]}"; do
    files_total=$((files_total + 1))
    if [ -f "$file" ]; then
        echo "  ✅ $file"
        files_ok=$((files_ok + 1))
    else
        echo "  ❌ $file (missing)"
    fi
done

echo ""
echo "✅ Verification Results:"
echo "   Directories: $dirs_ok/$dirs_total"
echo "   Files: $files_ok/$files_total"

if [ $dirs_ok -eq $dirs_total ] && [ $files_ok -eq $files_total ]; then
    echo ""
    echo "🎉 Project structure verified successfully!"
    echo ""
    echo "📚 Next steps:"
    echo "   1. Review QUICKSTART.md"
    echo "   2. Run: npm install"
    echo "   3. Download PocketBase from https://pocketbase.io/"
    echo "   4. Run: npm run dev"
    exit 0
else
    echo ""
    echo "⚠️  Some files are missing. Please review the project structure."
    exit 1
fi
