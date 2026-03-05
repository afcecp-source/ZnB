@echo off
REM ZnB Force Plus - Quick Setup Script (Windows)

echo.
echo 🚀 ZnB Force Plus - Setup Script
echo ================================
echo.

REM Check Node.js
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js not found. Please install Node.js 16+
    exit /b 1
)

for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
echo ✅ Node.js %NODE_VERSION% detected

REM Install dependencies
echo.
echo 📦 Installing dependencies...
call npm install

REM Copy env files
echo.
echo ⚙️  Setting up environment variables...
cd apps\api
if not exist .env (
    copy .env.example .env 2>nul
    echo ✅ Created apps/api/.env
) else (
    echo ℹ️  apps/api/.env already exists
)
cd ..\web
if not exist .env.development (
    echo ✅ Creating apps/web/.env.development
) else (
    echo ℹ️  apps/web/.env.development already exists
)
cd ..\..

echo.
echo ✅ Setup complete!
echo.
echo 📝 Next steps:
echo 1. Download PocketBase from https://pocketbase.io/
echo 2. Run: cd apps\pocketbase ^& pocketbase.exe serve
echo 3. Run: npm run dev
echo 4. Open http://localhost:3000
echo.
echo 📖 For detailed instructions, see:
echo    - DEVELOPMENT.md - Development guide
echo    - DEPLOYMENT.md - Deployment instructions
echo    - API.md - API reference
pause
