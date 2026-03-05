# GitHub Repository Setup Guide

## Initial Setup

After creating the repository on GitHub:

```bash
cd ZnB
git init
git add .
git commit -m "Initial commit: ZnB Force Plus - Complete Application Build"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/znb-force-plus.git
git push -u origin main
```

## Secrets Configuration

Go to GitHub Settings > Secrets and add:

### Deployment Secrets

1. **RAILWAY_TOKEN** - Railway API token for backend deployment
2. **VERCEL_TOKEN** - Vercel authentication token for frontend
3. **VERCEL_ORG_ID** - Your Vercel organization ID
4. **VERCEL_PROJECT_ID** - Frontend project ID in Vercel

### Environment Secrets (if using GitHub Secrets)

3. **JWT_SECRET** - JWT secret key for API
4. **POCKETBASE_ADMIN_PASSWORD** - PocketBase admin password
5. **SMTP_PASSWORD** - Email service password

## Branch Strategy

- `main` - Production-ready code
- `develop` - Development/staging code
- `feature/*` - Feature branches

## CI/CD Workflows

### Automatic Deployments

- **deploy-api.yml**: Deploys backend to Railway when changes pushed to `apps/api/`
- **deploy-web.yml**: Deploys frontend to Vercel when changes pushed to `apps/web/`
- **lint.yml**: Runs code quality checks on all PRs

## How to Deploy

### Option 1: Via GitHub Push
```bash
git push origin main
# Workflows automatically trigger
```

### Option 2: Manual Deployment

```bash
# Backend via Railway
railway login
cd apps/api
railway up

# Frontend via Vercel
vercel --prod --cwd apps/web
```

## Setting Up Secrets in GitHub UI

1. Go to repository Settings
2. Click "Secrets and variables" > "Actions"
3. Click "New repository secret"
4. Add each secret from the list above

## Environment Variables

### Backend (Railway)
Copy from `.env.example` to Railway dashboard environment variables

### Frontend (Vercel)
Configure in Vercel project settings:
```
VITE_API_URL=https://your-railway-app.railway.app
```

## Monitoring Deployments

View deployment status:
1. GitHub: Actions tab
2. Railway: Dashboard > Deployments
3. Vercel: Deployments page

## Troubleshooting

- **Deployment failed**: Check workflow logs in Actions tab
- **Secret not recognized**: Verify secret name matches workflow file
- **Build error**: Check logs in Railway/Vercel dashboard

## Documentation

- [GitHub Actions](https://docs.github.com/actions)
- [Railway CI/CD](https://railway.app/docs/deploy/railway-yaml)
- [Vercel Deployments](https://vercel.com/docs/deployments)
