#!/bin/bash
# ZnB Force Plus - Quick Setup Script

set -e

echo "🚀 ZnB Force Plus - Setup Script"
echo "================================"

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js 16+"
    exit 1
fi

echo "✅ Node.js $(node -v) detected"

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install

# Copy env files
echo ""
echo "⚙️  Setting up environment variables..."
cd apps/api
[ ! -f .env ] && cp .env.example .env && echo "✅ Created apps/api/.env"
cd ../web
[ ! -f .env.development ] && echo "✅ .env.development exists" || echo "ℹ️  apps/web/.env.development already exists"
cd ../..

echo ""
echo "✅ Setup complete!"
echo ""
echo "📝 Next steps:"
echo "1. Download PocketBase from https://pocketbase.io/"
echo "2. Run: cd apps/pocketbase && ./pocketbase serve"
echo "3. Run: npm run dev"
echo "4. Open http://localhost:3000"
echo ""
echo "📖 For detailed instructions, see:"
echo "   - DEVELOPMENT.md - Development guide"
echo "   - DEPLOYMENT.md - Deployment instructions"
echo "   - API.md - API reference"
