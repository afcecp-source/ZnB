# Development Guide

## Project Structure

```
ZnB/
├── apps/
│   ├── api/          - Express backend
│   ├── web/          - React frontend
│   └── pocketbase/   - Database
├── package.json      - Root configuration
└── docs/             - Documentation
```

## Getting Started

### 1. Install Dependencies

```bash
npm install
```

This installs dependencies for all workspaces (api, web, pocketbase).

### 2. Environment Setup

Create `.env` files:

**apps/api/.env**
```
NODE_ENV=development
PORT=3001
POCKETBASE_URL=http://localhost:8090
POCKETBASE_ADMIN_EMAIL=admin@znbforceplus.local
POCKETBASE_ADMIN_PASSWORD=admin12345
JWT_SECRET=dev_secret_key
SMTP_USER=your_email@gmail.com
SMTP_PASS=your_password
```

**apps/web/.env.development**
```
VITE_API_URL=http://localhost:3001
```

### 3. Start PocketBase

```bash
cd apps/pocketbase
# Download from https://pocketbase.io/ first
./pocketbase serve

# Admin panel: http://localhost:8090/_/
```

Create collections from SCHEMA.md via admin panel.

### 4. Start Backend

```bash
cd apps/api
npm run dev
# Server: http://localhost:3001
```

### 5. Start Frontend

```bash
cd apps/web
npm run dev
# App: http://localhost:3000 or http://localhost:5173
```

## Code Style

### Backend
- Use async/await for all async operations
- Validate input with middleware
- Always return `{ success, message/data }` response
- Use bcryptjs for password hashing (async)

### Frontend
- Use React hooks (useState, useEffect, useContext)
- Import components from `@/` alias
- Use Tailwind CSS for styling
- Context for global state (Auth, App)

## Common Tasks

### Add New API Endpoint

1. Create route file in `apps/api/src/routes/`
2. Import in `apps/api/src/routes/index.js`
3. Add authentication/validation middleware
4. Return standardized response

Example:
```javascript
router.post('/data', authMiddleware, validateInput, async (req, res) => {
  try {
    // Your logic
    res.json(successResponse(data, 'Success message'));
  } catch (error) {
    res.status(500).json(errorResponse('Failed to process'));
  }
});
```

### Add New Frontend Page

1. Create component in `apps/web/src/pages/section/`
2. Add route in `apps/web/src/App.jsx`
3. Import API client: `import apiServerClient from '@/lib/apiServerClient'`
4. Use auth hook: `const { user } = useAuth()`

### Database Migration

1. Create collection in PocketBase admin panel
2. Document in `apps/pocketbase/SCHEMA.md`
3. Update API routes to use new collection

### Test Authentication Flow

```bash
# 1. Request OTP
curl -X POST http://localhost:3001/auth/request-otp \
  -H "Content-Type: application/json" \
  -d '{"email":"user@example.com"}'

# 2. Verify OTP
curl -X POST http://localhost:3001/auth/verify-otp \
  -H "Content-Type: application/json" \
  -d '{"email":"user@example.com","otp":"123456"}'
```

## Debugging

### Backend Logs
- Set `DEBUG=true` in .env
- Check console output or log files

### Frontend Debugging
- Use browser DevTools (F12)
- Check Network tab for API requests
- Use React DevTools extension

### Database Issues
- Check PocketBase admin panel
- Verify database credentials
- Review collection schemas

## Best Practices

1. **Security**
   - Never commit secrets to git
   - Use environment variables
   - Validate all inputs
   - Hash sensitive data

2. **Performance**
   - Use pagination for large data sets
   - Cache where appropriate
   - Optimize database queries
   - Lazy load images/components

3. **Maintenance**
   - Write comments for complex logic
   - Keep functions small and focused
   - Use meaningful variable names
   - Test before deploying

## Testing

### Manual Testing
1. Run all three services
2. Test OTP flow end-to-end
3. Test payment recording
4. Test role-based access

### Automated Testing (Future)
```bash
npm run test  # When test suite is added
```

## Troubleshooting

### Port Already in Use
```bash
# Kill process using port
# Linux/Mac: lsof -i :3001
# Windows: netstat -ano | findstr :3001
```

### Database Connection Error
- Verify PocketBase is running
- Check POCKETBASE_URL in .env
- Verify database credentials

### CORS Error
- Check CORS_ORIGIN in backend .env
- Ensure frontend URL is whitelisted

### Email Not Sending
- Verify SMTP credentials
- Enable Gmail "Less secure apps"
- Check spam folder

## Resources

- [Express.js Docs](https://expressjs.com/)
- [React Docs](https://react.dev/)
- [PocketBase Docs](https://pocketbase.io/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Vite Docs](https://vitejs.dev/)
