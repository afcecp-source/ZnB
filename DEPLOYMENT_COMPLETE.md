# ZnB Force Plus - Complete Deployment Instructions

## Platform Overview

| Platform | Component | Purpose |
|----------|-----------|---------|
| **Vercel** | Frontend (React) | Hosting, CDN, Auto-scaling |
| **Railway** | Backend (Node.js API) | API Server, Database proxy |
| **Supabase** | Database | PostgreSQL alternative to PocketBase |
| **PocketBase** | Database | Self-hosted SQLite + API |

---

## Deployment Option 1: Vercel + Railway + PocketBase

### Step 1: Prepare Repository

```bash
cd ZnB
git remote add origin https://github.com/YOUR_USERNAME/znb-force-plus.git
git push -u origin main
```

### Step 2: Deploy Backend to Railway

1. **Visit**: https://railway.app
2. **Click**: "New Project" > "Deploy from GitHub"
3. **Select**: Your `znb-force-plus` repository
4. **Select root directory**: `/apps/api`
5. **Add environment variables**:
   ```
   NODE_ENV=production
   PORT=3001
   POCKETBASE_URL=<your-pocketbase-url>
   POCKETBASE_ADMIN_EMAIL=admin@znbforceplus.com
   POCKETBASE_ADMIN_PASSWORD=<secure-password>
   JWT_SECRET=<generated-secret-key>
   SMTP_USER=<your-gmail>
   SMTP_PASS=<app-password>
   CORS_ORIGIN=<vercel-frontend-url>
   ```
6. **Deploy**: Click "Deploy"
7. **Get URL**: Copy the Railway app URL (e.g., `https://znb-api.railway.app`)

### Step 3: Deploy Frontend to Vercel

1. **Visit**: https://vercel.com
2. **Click**: "New Project"
3. **Import**: Your GitHub repository
4. **Framework**: Vite
5. **Root directory**: `apps/web`
6. **Add environment**:
   ```
   VITE_API_URL=https://znb-api.railway.app
   ```
7. **Deploy**: Click "Deploy"
8. **Get URL**: Copy the Vercel URL (e.g., `https://znb-force-plus.vercel.app`)

### Step 4: Set Up PocketBase

#### Option A: Self-Hosted (Local or VPS)

```bash
# Download PocketBase
wget https://github.com/pocketbase/pocketbase/releases/download/v0.20.0/pocketbase_0.20.0_linux_amd64.zip
unzip pocketbase_0.20.0_linux_amd64.zip

# Run
./pocketbase serve

# Access admin: http://your-server:8090/_/
```

#### Option B: Use with VPS (DigitalOcean, Linode)

1. Deploy PocketBase on separate VPS
2. Update `POCKETBASE_URL` in Railway environment
3. Configure firewall rules

### Step 5: Create Collections in PocketBase

Access http://your-pocketbase-url/_/ and create:

- **users** ✓
- **payments** ✓
- **otp_logs** ✓
- **policies** ✓
- **upgrade_applications** ✓
- **activity_logs** ✓

See [PocketBase Schema](apps/pocketbase/SCHEMA.md)

---

## Deployment Option 2: Vercel + Railway + Supabase

### Similar to Option 1, but:

1. **Create Supabase project**: https://supabase.com
2. **Get PostgreSQL connection**
3. **Update backend** to use PostgreSQL instead of PocketBase
4. **Update `POCKETBASE_URL`** to Supabase endpoint

---

## Post-Deployment Configuration

### 1. Update CORS in Backend

Set in Railway environment:
```
CORS_ORIGIN=https://znb-force-plus.vercel.app,https://your-domain.com
```

### 2. Update Frontend API URL

If adding custom domain, update in Vercel:
```
VITE_API_URL=https://api.your-domain.com
```

### 3. Configure Custom Domains

#### Vercel (Frontend)
- Settings > Domains > Add Domain
- Update DNS records as shown

#### Railway (Backend)
- Project > Settings > Domains > Add Domain
- Update DNS records as shown

### 4. SSL Certificates

Both Vercel and Railway provide free SSL automatically.

---

## GitHub Actions CI/CD

Workflows automatically deploy on push:

- **Backend**: Push to main > Auto-deploy to Railway
- **Frontend**: Push to main > Auto-deploy to Vercel

Configure secrets in GitHub:
1. Settings > Secrets > New repository secret
2. Add:
   - `RAILWAY_TOKEN`
   - `VERCEL_TOKEN`
   - `VERCEL_ORG_ID`
   - `VERCEL_PROJECT_ID`

---

## Testing Deployment

### Backend Health Check

```bash
curl https://znb-api.railway.app/health
# Expected: {"success": true, "data": {"status": "ok", ...}}
```

### Frontend Access

```
https://znb-force-plus.vercel.app
```

### Login Flow Test

1. Visit frontend URL
2. Click "Login"
3. Enter email
4. Should receive OTP email
5. Enter OTP to login

---

## Monitoring & Logging

### Vercel
- **Deployments**: https://vercel.com/dashboard
- **Logs**: Each deployment shows build & runtime logs
- **Analytics**: Real-time performance metrics

### Railway
- **Dashboard**: https://railway.app/dashboard
- **Logs**: Real-time streaming logs
- **Metrics**: CPU, Memory, Disk usage

### PocketBase
- **Admin**: http://pocketbase-url/_/
- **Logs**: Logs tab in admin panel

---

## Troubleshooting

### "Cannot reach PocketBase"
- Verify POCKETBASE_URL in Railway environment
- Check firewall rules on PocketBase server
- Ensure PocketBase is running

### "CORS Error"
- Update CORS_ORIGIN in Railway with frontend URL
- Restart Railway deployment

### "Payment Recording Failed"
- Check if users collection exists in PocketBase
- Verify database credentials
- Check payment collection schema

### "Email Not Sending"
- Verify SMTP credentials
- Enable "Less secure apps" for Gmail
- Use app password if 2FA enabled

### "Login Page Shows Error"
- Check VITE_API_URL in Vercel
- Verify backend is running
- Check browser console for errors

---

## Security Checklist

Before going live:

- [ ] Change all default passwords
- [ ] Generate strong JWT_SECRET (32+ chars)
- [ ] Enable 2FA on all platform accounts
- [ ] Configure database backups
- [ ] Set up monitoring & alerts
- [ ] Review CORS configuration
- [ ] Rotate API keys periodically
- [ ] Test SSL/TLS certificate
- [ ] Set up rate limiting
- [ ] Enable API authentication tests

---

## Production Checklist

- [ ] Backend API responding on all endpoints
- [ ] Frontend loads without errors
- [ ] OTP flow works end-to-end
- [ ] Payment recording works
- [ ] Role-based access enforced
- [ ] Error messages display correctly
- [ ] Database backups configured
- [ ] Monitoring dashboard visible
- [ ] Team access configured
- [ ] Documentation updated

---

## Rollback Procedure

### Vercel
1. Go to Deployments
2. Select previous deployment
3. Click "Promote to Production"

### Railway
1. Go to Deployments
2. Select previous version
3. Click "Redeploy"

---

## Support Resources

- **Vercel Docs**: https://vercel.com/docs
- **Railway Docs**: https://railway.app/docs
- **PocketBase Docs**: https://pocketbase.io/docs/
- **Supabase Docs**: https://supabase.com/docs
- **Express Docs**: https://expressjs.com/
- **React Docs**: https://react.dev/

---

## Next Steps

1. ✅ Project created
2. ✅ Code committed to GitHub
3. ⏳ Deploy to Vercel (frontend)
4. ⏳ Deploy to Railway (backend)
5. ⏳ Set up PocketBase
6. ⏳ Configure custom domains
7. ⏳ Monitor in production
8. ⏳ Gather user feedback

**Estimated Time**: 24-48 hours for complete setup

**Support**: Contact deployment platform support for specific issues
