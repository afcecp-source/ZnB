## API Endpoints Reference

### Authentication
- `POST /auth/request-otp` - Request OTP code
- `POST /auth/verify-otp` - Login with OTP

### Profile
- `GET /profile` - Get user profile
- `PUT /profile` - Update profile

### Ledger & Payments
- `GET /ledger/payments` - List payments
- `GET /ledger/check-receipt/:receipt` - Check duplicate receipt
- `POST /ledger/payments` - Record payment
- `PUT /ledger/payments/:id/verify` - Verify payment (admin)
- `PUT /ledger/payments/:id/reject` - Reject payment (admin)

### Admin User Management
- `GET /admin/users` - List all users (admin)
- `GET /admin/users/:id` - Get user details
- `PUT /admin/users/:id` - Update user
- `DELETE /admin/users/:id` - Delete user (admin)
- `POST /admin/registration/register-user` - Create user

### Upgrades
- `POST /upgrades/applications` - Submit upgrade request
- `GET /upgrades/applications` - List upgrade applications
- `PUT /upgrades/applications/:id/approve` - Approve upgrade (admin)
- `PUT /upgrades/applications/:id/reject` - Reject upgrade (admin)

### Policies
- `GET /policies` - List all policies
- `GET /policies/:id` - Get policy details

### Utilities
- `POST /email/send` - Send email (testing)
- `POST /chat/message` - Chat with AI

### Password Reset
- `POST /password-reset/request` - Request password reset
- `POST /password-reset/reset` - Reset password with OTP

### Health & Diagnostics
- `GET /health` - Health check
- `GET /ready` - Readiness check
- `GET /diagnostics/system` - System diagnostics (admin)
- `GET /diagnostics/database` - Database diagnostics (admin)

## Response Format

### Success Response
```json
{
  "success": true,
  "data": { },
  "message": "Optional message"
}
```

### Error Response
```json
{
  "success": false,
  "message": "Error description"
}
```

## Authentication
Include JWT token in Authorization header:
```
Authorization: Bearer YOUR_JWT_TOKEN
```

## Rate Limiting
- Global: 100 requests per 15 minutes
- OTP Requests: 3 per hour per email
- Login Attempts: 5 per 15 minutes
