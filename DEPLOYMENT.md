# Deployment Guide

## Prerequisites

- Node.js 16+ installed
- GitHub account configured
- Deployment platform account (Vercel, Railway, or Supabase)

## Step 1: Initialize Git Repository

```bash
cd ZnB
git init
git add .
git commit -m "Initial commit: ZnB Force Plus application"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/ZnB-Force-Plus.git
git push -u origin main
```

## Step 2: Database Setup (PocketBase)

### Option A: Self-Hosted PocketBase

1. Download from https://pocketbase.io/
2. Run locally: `./pocketbase serve`
3. Create collections via admin panel (http://localhost:8090/_/)
4. Set environment variables in deployment platform

### Option B: Supabase (PostgreSQL Alternative)

1. Create Supabase project
2. Get connection string
3. Update POCKETBASE_URL or create new database adapter
4. Update environment variables

## Step 3: Deploy Backend to Railway

```bash
npm install -g railway
railway login
cd apps/api
railway init
railway up
```

Or via Railway Dashboard:
1. Connect GitHub repo
2. Select `apps/api` as root directory
3. Set environment variables
4. Deploy automatically

## Step 4: Deploy Frontend to Vercel

```bash
npm install -g vercel
cd apps/web
vercel
```

Configuration:
- Build Command: `npm run build`
- Output Directory: `dist`
- Root Directory: `apps/web`

Or via Vercel Dashboard:
1. Import GitHub repository
2. Select `apps/web` as root directory
3. Set VITE_API_URL environment variable
4. Deploy

## Step 5: Environment Variables

### Railway (Backend)

```
NODE_ENV=production
PORT=3001
POCKETBASE_URL=your_pocketbase_url
POCKETBASE_ADMIN_EMAIL=admin@example.com
POCKETBASE_ADMIN_PASSWORD=secure_password
JWT_SECRET=your_secure_secret_key
SMTP_USER=your_email@gmail.com
SMTP_PASS=your_app_password
CORS_ORIGIN=https://your-frontend-url.com
```

### Vercel (Frontend)

```
VITE_API_URL=https://your-api-url.railway.app
```

## Step 6: Domain Configuration

### Frontend (Vercel)
1. Go to Settings > Domains
2. Add your custom domain (e.g., znbforceplus.com)
3. Update DNS records

### Backend (Railway)
1. Railroad dashboard > Project > Domains
2. Add custom domain
3. Update DNS records

## Step 7: SSL Certificates

Both Vercel and Railway provide free SSL certificates automatically.

## Monitoring & Logs

### Vercel
- Deployments tab shows build logs
- Analytics shows performance metrics

### Railway
- Deployments tab with real-time logs
- Monitor CPU, memory, disk usage

## Rollback Procedure

### Vercel
1. Deployments tab > Select previous deployment > Promote to Production

### Railway
2. Go to Deployments > Select previous version > Redeploy

## Testing

After deployment:

1. **Test OTP Flow**
   ```bash
   curl -X POST https://your-api.railway.app/auth/request-otp \
     -H "Content-Type: application/json" \
     -d '{"email":"test@example.com"}'
   ```

2. **Test Health Check**
   ```bash
   curl https://your-api.railway.app/health
   ```

3. **Test Frontend**
   - Visit https://your-frontend.vercel.app
   - Test login flow
   - Verify API communication

## Troubleshooting

### CORS Errors
- Update CORS_ORIGIN in backend .env
- Ensure frontend URL is in CORS whitelist

### 404 on Frontend Routes
- Ensure Vercel is configured to redirect all routes to index.html
- Check next.json/vite.config.js configuration

### Payment Recording Fails
- Verify PocketBase is running and accessible
- Check database credentials in .env
- Review payment validation rules

### Email Not Sending
- Verify SMTP credentials
- Enable "Less secure app access" for Gmail
- Use app passwords for Gmail 2FA accounts

## Security Checklist

- [ ] JWT_SECRET is strong and unique
- [ ] Database credentials are secure
- [ ] SSL certificates are valid
- [ ] CORS origins are restricted
- [ ] Sensitive credentials not in repository
- [ ] Database backups configured
- [ ] Rate limiting enabled
- [ ] API keys rotated regularly

## Support & Monitoring

### Health Endpoint
```
GET /health
```

### Error Logging
All errors logged with timestamps. Check deployment logs for issues.

### Performance
Monitor via: Vercel Analytics, Railway Metrics
