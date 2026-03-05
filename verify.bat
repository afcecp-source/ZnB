@echo off
REM ZnB Force Plus - Quick Verification (Windows)

echo.
echo 🔍 ZnB Force Plus - Project Verification
echo =========================================
echo.

echo 📁 Checking directory structure...

set dirs_ok=0
set dirs_total=0

for %%D in (apps\api apps\web apps\pocketbase .github\workflows) do (
    set /a dirs_total+=1
    if exist "%%D" (
        echo   ✅ %%D
        set /a dirs_ok+=1
    ) else (
        echo   ❌ %%D (missing)
    )
)

echo.
echo 📄 Checking key files...

set files_ok=0
set files_total=0

for %%F in (
    "package.json"
    "README.md"
    "QUICKSTART.md"
    "DEPLOYMENT.md"
    "CRITICAL_FIXES.md"
    "apps\api\package.json"
    "apps\web\package.json"
) do (
    set /a files_total+=1
    if exist "%%F" (
        echo   ✅ %%F
        set /a files_ok+=1
    ) else (
        echo   ❌ %%F (missing)
    )
)

echo.
echo ✅ Verification Results:
echo    Directories: %dirs_ok%/%dirs_total%
echo    Files: %files_ok%/%files_total%

if "%dirs_ok%"=="%dirs_total%" if "%files_ok%"=="%files_total%" (
    echo.
    echo 🎉 Project structure verified successfully!
    echo.
    echo 📚 Next steps:
    echo    1. Review QUICKSTART.md
    echo    2. Run: npm install
    echo    3. Download PocketBase from https://pocketbase.io/
    echo    4. Run: npm run dev
    exit /b 0
) else (
    echo.
    echo ⚠️  Some files are missing. Please review the project structure.
    exit /b 1
)
