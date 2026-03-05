# ZnB Force Plus - Insurance Management Application

A complete insurance management platform with admin dashboard, agent management, and payment processing.

## Features

- **OTP-based Authentication** - Secure login with email verification
- **Role-Based Access** - Admin, SubAdmin, Agent, and Client roles
- **Payment Management** - M-PESA integration with payment verification
- **Policy Catalogue** - Browse and compare insurance policies
- **Upgrade System** - Handle role upgrades with approval workflow
- **Analytics** - Role-specific dashboards and reporting
- **Chat Assistant** - Google AI-powered chat support

## Project Structure

```
├── apps/
│   ├── api/          # Node.js/Express backend
│   ├── web/          # React frontend
│   └── pocketbase/   # PocketBase database
├── package.json      # Root monorepo config
└── README.md
```

## Quick Start

### Prerequisites

- Node.js 16+
- npm or yarn
- PocketBase

### Installation

```bash
# Clone repository
git clone <repo-url>
cd ZnB

# Install dependencies
npm install

# Set up environment variables
cp apps/api/.env.example apps/api/.env
cp apps/web/.env.example apps/web/.env

# Start development servers
npm run dev
```

### Development

- **Backend**: `npm run dev:api` (http://localhost:3001)
- **Frontend**: `npm run dev:web` (http://localhost:3000)
- **PocketBase**: `npm run dev:pocketbase` (http://localhost:8090)

## Deployment

### Vercel (Frontend)
```bash
cd apps/web
vercel deploy
```

### Railway (Backend + Database)
```bash
npm install -g railway
railway up
```

### Supabase (Database Alternative)
- Configure PocketBase connection in Railway
- Or use Supabase PostgreSQL directly

## Key API Endpoints

### Authentication
- `POST /auth/request-otp` - Request OTP for login
- `POST /auth/verify-otp` - Verify OTP and get token
- `POST /auth/logout` - User logout

### Payments
- `GET /ledger/payments` - List payments
- `POST /ledger/payments` - Record payment
- `PUT /ledger/payments/:id` - Verify payment

### Policies
- `GET /policies` - List all policies
- `GET /policies/:id` - Policy details
- `POST /policies/apply` - Apply for policy

### Admin
- `GET /admin/users` - List users
- `POST /admin/users` - Create user
- `GET /admin/payments/pending` - Pending verifications

## Documentation

- **Critical Fixes**: See FIXES.md
- **API Documentation**: See API.md
- **Deployment Guide**: See DEPLOY.md

## Support

Created: March 5, 2026
Version: 1.0.0
Status: Production Ready
