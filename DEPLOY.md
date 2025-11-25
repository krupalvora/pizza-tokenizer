# 🚀 GitHub Pages Deployment Guide

## Quick Deployment Steps

### 1. Initialize Git (if not already done)

```bash
cd "Pizza Token"
git init
git add .
git commit -m "Initial commit: Pizza Token System"
```

### 2. Create GitHub Repository

1. Go to [github.com](https://github.com) and sign in
2. Click the **+** icon in the top right → **New repository**
3. Name your repository (e.g., `pizza-token-system`)
4. Choose **Public** or **Private**
5. **Don't** initialize with README, .gitignore, or license (you already have these)
6. Click **Create repository**

### 3. Connect and Push to GitHub

```bash
# Replace YOUR_USERNAME and REPO_NAME with your actual values
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
git branch -M main
git push -u origin main
```

### 4. Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** (top menu)
3. Scroll down to **Pages** (left sidebar)
4. Under **Source**, select:
   - **Deploy from a branch**
   - Branch: **main**
   - Folder: **/ (root)**
5. Click **Save**

### 5. Wait for Deployment

- GitHub Pages will build your site (takes 1-2 minutes)
- You'll see a green checkmark when it's ready
- Your site URL will be shown: `https://YOUR_USERNAME.github.io/REPO_NAME/`

### 6. Access Your Application

- **Homepage**: `https://YOUR_USERNAME.github.io/REPO_NAME/`
- **Admin Panel**: `https://YOUR_USERNAME.github.io/REPO_NAME/front-end/chef.html`
- **Display Screen**: `https://YOUR_USERNAME.github.io/REPO_NAME/front-end/display.html`

## Important Notes

⚠️ **Before deploying, make sure:**
1. Your Supabase credentials are configured in `front-end/supabase.js`
2. Your Supabase database schema is set up (run `back-end/supabase-schema.sql`)
3. Realtime is enabled in your Supabase project settings

## Updating Your Site

After making changes:

```bash
git add .
git commit -m "Description of changes"
git push
```

GitHub Pages will automatically rebuild your site (usually within 1-2 minutes).

## Troubleshooting

**Site not loading?**
- Check that GitHub Pages is enabled in Settings → Pages
- Verify the branch and folder are set correctly
- Wait a few minutes for the initial build

**404 errors?**
- Make sure file paths use lowercase (GitHub Pages is case-sensitive)
- Check that `.nojekyll` file exists in root (prevents Jekyll processing)

**Supabase connection issues?**
- Verify your Supabase URL and anon key in `front-end/supabase.js`
- Check browser console for CORS errors
- Ensure your Supabase project allows requests from your GitHub Pages domain

## Custom Domain (Optional)

If you want to use a custom domain:

1. Add a `CNAME` file in the root with your domain name
2. Configure DNS records as instructed by GitHub
3. Update the domain in repository Settings → Pages

