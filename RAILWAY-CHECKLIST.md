# ✅ Railway Deployment Checklist

Use this checklist to deploy AutoGraph to Railway successfully.

## Pre-Deployment

- [ ] Read `DEPLOYMENT-SUMMARY.md` for overview
- [ ] Run `./generate-secrets.sh` and save the output
- [ ] Commit all changes: `git add . && git commit -m "Ready for Railway deployment"`
- [ ] Push to GitHub: `git push`

## Railway Setup

### 1. Create Project
- [ ] Go to [railway.app](https://railway.app)
- [ ] Sign in with GitHub
- [ ] Click **"New Project"** → **"Deploy from GitHub repo"**
- [ ] Select your AutoGraph repository
- [ ] Wait for initial deployment to fail (it will - that's expected!)

### 2. Add Environment Variables
- [ ] Go to your service → **"Variables"** tab
- [ ] Add the following variables (copy from `railway-secrets.txt`):

```env
NODE_ENV=production
HOST=0.0.0.0
PORT=1337

# From generate-secrets.sh output:
APP_KEYS=<paste-your-keys>
ADMIN_JWT_SECRET=<paste-your-secret>
API_TOKEN_SALT=<paste-your-salt>
TRANSFER_TOKEN_SALT=<paste-your-salt>
JWT_SECRET=<paste-your-secret>

# Database (SQLite)
DATABASE_CLIENT=sqlite
DATABASE_FILENAME=.tmp/data.db
```

### 3. Add Persistent Volume (CRITICAL!)
- [ ] Go to **"Settings"** → **"Volumes"**
- [ ] Click **"New Volume"**
- [ ] **Mount Path:** `/app/backend/.tmp`
- [ ] Click **"Add"**

> ⚠️ **Important:** Without this volume, your database will be deleted on every deploy!

### 4. Configure Networking
- [ ] Go to **"Settings"** → **"Networking"**
- [ ] Click **"Generate Domain"**
- [ ] Save the domain (e.g., `your-app.up.railway.app`)

### 5. Deploy
- [ ] Railway will automatically redeploy after adding variables
- [ ] Go to **"Deployments"** tab
- [ ] Wait 3-5 minutes for build to complete
- [ ] Check logs for any errors

## Post-Deployment

### 1. Verify Deployment
- [ ] Visit `https://your-app.up.railway.app/admin`
- [ ] Page loads without errors
- [ ] No console errors in browser

### 2. Create Admin Account
- [ ] Click **"Create the first administrator"**
- [ ] Fill in:
  - [ ] Username
  - [ ] Email
  - [ ] Password (strong!)
- [ ] Click **"Let's start"**

### 3. Test Basic Functionality
- [ ] Dashboard loads
- [ ] Can navigate between sections
- [ ] Content Manager accessible
- [ ] Media Library accessible

### 4. Test Data Persistence
- [ ] Create a test content entry
- [ ] Trigger a redeploy (push a small change)
- [ ] Verify test content still exists after redeploy
- [ ] If content is gone → check volume configuration!

## Troubleshooting

### Build Fails
- [ ] Check **"Deployments"** → **"View Logs"**
- [ ] Verify all environment variables are set
- [ ] Check Dockerfile syntax

### Can't Access Admin Panel
- [ ] Wait 3-5 minutes after first deploy
- [ ] Check deployment status (should be green)
- [ ] Visit `/admin` path specifically
- [ ] Check browser console for errors

### "Missing admin.auth.secret" Error
- [ ] Verify `ADMIN_JWT_SECRET` is set in Variables
- [ ] Check for typos in variable names
- [ ] Redeploy after adding variables

### Data Lost After Redeploy
- [ ] Verify persistent volume is mounted at `/app/backend/.tmp`
- [ ] Check volume is attached in Settings → Volumes
- [ ] Verify `DATABASE_FILENAME=.tmp/data.db`

## Optional: Custom Domain

- [ ] Go to **"Settings"** → **"Networking"**
- [ ] Click **"Custom Domain"**
- [ ] Add your domain
- [ ] Update DNS records as shown
- [ ] Wait for SSL certificate (automatic)

## Cost Management

### Free Tier
- [ ] Check usage in Dashboard
- [ ] 500 hours/month = ~21 days continuous
- [ ] Turn off when not in use to save hours

### Upgrade to Hobby ($5/month)
- [ ] Unlimited hours
- [ ] Better resources
- [ ] 100GB disk space
- [ ] Recommended for production

## Done! 🎉

Your AutoGraph CMS is now live on Railway!

### Next Steps:
- [ ] Share the admin URL with your team
- [ ] Start creating content types
- [ ] Configure plugins as needed
- [ ] Set up CI/CD (already automatic with Railway)
- [ ] Monitor usage and costs

### Resources:
- **Railway Dashboard**: https://railway.app/dashboard
- **Strapi Docs**: https://docs.strapi.io/
- **Full Guide**: See `RAILWAY-DEPLOY.md`
- **Quick Reference**: See `RAILWAY-QUICK-START.md`

---

**Questions?** Check `RAILWAY-DEPLOY.md` troubleshooting section or Railway's support docs.
