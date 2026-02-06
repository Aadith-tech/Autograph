#!/bin/bash
# Quick Railway Deploy Script
# Run this to prepare everything for deployment

set -e

echo "🚀 AutoGraph Railway Deployment Prep"
echo "====================================="
echo ""

# Step 1: Generate secrets
echo "📝 Step 1: Generating secrets..."
./generate-secrets.sh > railway-secrets.txt
echo "✅ Secrets saved to railway-secrets.txt"
echo ""

# Step 2: Check git status
echo "📦 Step 2: Checking git status..."
if git diff-index --quiet HEAD --; then
    echo "✅ No uncommitted changes"
else
    echo "⚠️  You have uncommitted changes. Run:"
    echo "   git add ."
    echo "   git commit -m 'Ready for Railway deployment'"
    echo ""
fi

# Step 3: Show next steps
echo "====================================="
echo "✅ PREP COMPLETE!"
echo "====================================="
echo ""
echo "Your secrets are in: railway-secrets.txt"
echo ""
echo "Next steps:"
echo "1. Push to GitHub:"
echo "   git add ."
echo "   git commit -m 'Add Railway deployment'"
echo "   git push"
echo ""
echo "2. Go to railway.app and deploy"
echo ""
echo "3. Add environment variables from railway-secrets.txt"
echo ""
echo "4. Add persistent volume: /app/backend/.tmp"
echo ""
echo "Full guide: See RAILWAY-CHECKLIST.md"
echo ""
