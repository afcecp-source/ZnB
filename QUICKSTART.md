# Quick Start Guide

## 5-Minute Setup

### 1. Install & Run

```bash
# Install dependencies
npm install

# Download & start PocketBase
# Visit https://pocketbase.io/ and download for your OS
cd apps/pocketbase
./pocketbase serve          # macOS/Linux
# or pocketbase.exe serve   # Windows

# In new terminal - start backend
cd apps/api
npm run dev

# In another terminal - start frontend
cd apps/web
npm run dev
```

### 2. Access the App

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:3001
- **PocketBase Admin**: http://localhost:8090/_/

### 3. Create Test Collections

Visit http://localhost:8090/_ and create collections:
1. users
2. payments
3. otp_logs
4. policies
5. upgrade_applications

(Detailed schema in `apps/pocketbase/SCHEMA.md`)

### 4. Test Login

1. Open http://localhost:3000
2. Click "Login"
3. Enter test email: `test@example.com`
4. Check backend console for OTP (printed to logs)
5. Enter OTP to login

## What's Included

✅ **Complete Backend** - Express API with all routes
✅ **Complete Frontend** - React app with all pages  
✅ **Database Setup** - PocketBase integration ready
✅ **Critical Fixes** - All issues resolved
✅ **Authentication** - OTP-based login
✅ **Payment System** - M-PESA integration ready
✅ **Role-Based Access** - Admin, Agent, Client support
✅ **Deployment Config** - Vercel, Railway, GitHub Actions

## Architecture

```
┌─────────────────┐
│  React (3000)   │
└────────┬────────┘
         │ API calls
         ▼
┌─────────────────┐
│  Express (3001) │
└────────┬────────┘
         │ Database
         ▼
┌─────────────────┐
│  PocketBase     │
│  (8090)         │
└─────────────────┘
```

## File Structure

```
ZnB/
├── apps/api/       - Backend (Node.js + Express)
│   ├── src/
│   │   ├── routes/     - API endpoints
│   │   ├── middleware/ - Validation, auth
│   │   └── utils/      - Helpers
│   └── package.json
├── apps/web/       - Frontend (React + Vite)
│   ├── src/
│   │   ├── pages/      - Page components
│   │   ├── components/ - UI components
│   │   └── lib/        - Utilities
│   └── package.json
└── apps/pocketbase/ - Database (PocketBase)
```

## Key Features

### Authentication
- OTP-based login (6-digit code)
- 10-minute OTP expiry
- 5 attempt limit
- Rate limiting (3 OTP requests/hour)

### Payments
- M-PESA receipt validation
- Duplicate prevention
- Payment status tracking
- Admin verification flow

### Policies
- Browse insurance policies
- Filter by category
- Compare policies
- Apply for policies

### User Roles
- **Admin** - Full system access
- **SubAdmin** - Manage payments & upgrades
- **Agent** - Record client payments
- **Client** - View own data & policies

## Troubleshooting

### "Port 3000/3001 already in use"
```bash
# Find process using port
lsof -i :3000  # macOS/Linux
netstat -ano | findstr :3000  # Windows

# Kill process if needed
kill -9 <PID>  # macOS/Linux
taskkill /PID <PID> /F  # Windows
```

### "Cannot reach PocketBase"
- Verify PocketBase is running
- Check http://localhost:8090 is accessible
- Verify environment variable POCKETBASE_URL

### "OTP not visible/received"
- Check backend console for OTP code
- OTP printed to logs in development mode
- In production, emails sent via SMTP

### "Build error in frontend"
```bash
cd apps/web
rm -rf node_modules dist
npm install
npm run dev
```

## Next Steps

1. **Explore the code** - Check out the implementation
2. **Test the flows** - Try login, payments, policies
3. **Customize** - Add your branding & features
4. **Deploy** - Follow DEPLOYMENT.md
5. **Monitor** - Set up logging & alerts

## Documentation

- [README.md](README.md) - Project overview
- [DEVELOPMENT.md](DEVELOPMENT.md) - Dev guide
- [DEPLOYMENT.md](DEPLOYMENT.md) - Production setup
- [CRITICAL_FIXES.md](CRITICAL_FIXES.md) - What was fixed
- [API.md](API.md) - API endpoints
- [GITHUB_SETUP.md](GITHUB_SETUP.md) - GitHub workflow

## Production Ready? ✅

The project is production-ready with:
- ✅ All critical fixes applied
- ✅ Environment configuration
- ✅ Error handling
- ✅ Rate limiting
- ✅ Input validation
- ✅ Database schema
- ✅ Deployment scripts
- ✅ CI/CD workflows
- ✅ Security best practices

**Estimated deployment time: 24 hours**

## Support

Need help? Check:
1. Documentation files (DEVELOPMENT.md, etc.)
2. Code comments
3. GitHub Issues
4. Platform documentation (Vercel, Railway, PocketBase)
