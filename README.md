# 🍕 Pizza Token System - MVP Queue Management

A simple, real-time token/queue management system for pizza outlets built with **Supabase**, **HTML**, and **Tailwind CSS**.

## ✨ Features

- **Chef Panel**: Create tokens, mark orders as ready, delete completed tokens
- **Display Screen**: Real-time grid display of ready tokens (dynamically adjusts based on count)
- **Auto-incrementing tokens**: Tokens start from 1 and auto-increment
- **Real-time updates**: Both screens update instantly when changes occur
- **Simple deployment**: Just HTML files - no build step needed

## 🚀 Quick Setup

### 1. Create Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a free account
2. Create a new project (choose a region closest to you)
3. Wait for the project to be ready (~2 minutes)

### 2. Set Up Database

1. In your Supabase dashboard, go to **SQL Editor**
2. Click **New Query**
3. Copy and paste the contents of `back-end/supabase-schema.sql`
4. Click **Run** to execute the SQL

**If you already have the tokens table**, run the migration script:
1. Copy and paste the contents of `back-end/migration-add-served-status.sql`
2. Click **Run** to add the `served` status and `pizza_type` column

### 3. Get Your Supabase Credentials

1. Go to **Project Settings** → **API**
2. Copy your **Project URL** (looks like `https://xxxxx.supabase.co`)
3. Copy your **anon/public key** (starts with `eyJ...`)

### 4. Configure the Frontend

1. Open `front-end/supabase.js`
2. Replace the placeholders:
   ```javascript
   const SUPABASE_URL = "https://YOUR_PROJECT.supabase.co";
   const SUPABASE_ANON_KEY = "YOUR_ANON_KEY";
   ```
   with your actual credentials from step 3.

### 5. Deploy or Open Locally

**Option A: Local Development**
- Just open `chef.html` and `display.html` in your browser
- Or use a simple HTTP server:
  ```bash
  cd front-end
  python3 -m http.server 8000
  ```
  Then open `http://localhost:8000/chef.html` and `http://localhost:8000/display.html`

**Option B: Deploy to GitHub Pages** (Recommended for Production)

1. **Initialize Git Repository** (if not already done):
   ```bash
   cd "Pizza Token"
   git init
   git add .
   git commit -m "Initial commit: Pizza Token System"
   ```

2. **Create GitHub Repository**:
   - Go to [github.com](https://github.com) and create a new repository
   - Name it (e.g., `pizza-token-system`)
   - Don't initialize with README (you already have one)

3. **Push to GitHub**:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/pizza-token-system.git
   git branch -M main
   git push -u origin main
   ```

4. **Enable GitHub Pages**:
   - Go to your repository on GitHub
   - Click **Settings** → **Pages**
   - Under **Source**, select **Deploy from a branch**
   - Select **main** branch and **/ (root)** folder
   - Click **Save**

5. **Access Your Site**:
   - Your site will be available at: `https://YOUR_USERNAME.github.io/pizza-token-system/`
   - Admin Panel: `https://YOUR_USERNAME.github.io/pizza-token-system/front-end/chef.html`
   - Display Screen: `https://YOUR_USERNAME.github.io/pizza-token-system/front-end/display.html`

**Note**: Make sure your Supabase credentials are configured in `front-end/supabase.js` before deploying!

**Other Deployment Options**:
- **Vercel**: Drag and drop the `front-end` folder to [vercel.com](https://vercel.com)
- **Netlify**: Drag and drop the `front-end` folder to [netlify.com](https://netlify.com)
- **Surge.sh**: `surge front-end/` (after installing surge)

## 📱 Usage

### Chef Panel (`chef.html`)
- **Create Token**: Click "Create Token" to create a new order token
- **Mark Ready**: Click "✓ Ready" button when the order is ready
- **Delete Token**: Click "✕ Delete" when customer picks up order

### Display Screen (`display.html`)
- Automatically shows all tokens with status "ready"
- Grid dynamically adjusts based on number of ready tokens
- Updates in real-time when chef marks tokens as ready or deletes them

## 🗄️ Database Schema

The system uses a single `tokens` table:

| Column | Type | Description |
|--------|------|-------------|
| `id` | BIGSERIAL | Primary key (auto-increment) |
| `token_no` | INTEGER | Token number (1, 2, 3...) |
| `status` | TEXT | Either "pending" or "ready" |
| `created_at` | TIMESTAMP | When token was created |
| `updated_at` | TIMESTAMP | Last update time |

## 🔒 Security Notes

**For MVP**: The current setup allows public read/write access (for simplicity).

**For Production**, you should:
1. Enable proper Row Level Security policies
2. Consider adding authentication for the chef panel
3. Restrict display screen to read-only
4. Use service role key only on backend if you add one

## 🛠️ Tech Stack

- **Supabase**: Database + Real-time subscriptions
- **HTML/CSS**: Pure HTML with Tailwind CDN (no build step)
- **JavaScript**: Vanilla JS (no frameworks)

## 📝 Troubleshooting

**Tokens not showing up?**
- Check browser console for errors
- Verify Supabase credentials in `supabase.js`
- Check if Realtime is enabled in Supabase dashboard (Settings → API → Realtime)

**Real-time updates not working?**
- Ensure Realtime is enabled in Supabase project settings
- Check browser console for subscription errors

**Grid not displaying properly?**
- Make sure Tailwind CDN is loaded (check network tab)
- Check browser console for JavaScript errors

## 🎨 Customization

- **Change grid size**: Edit `getGridCols()` function in `display.html`
- **Change colors**: Modify Tailwind classes (e.g., `bg-green-600` → `bg-blue-600`)
- **Add more statuses**: Update the CHECK constraint in the SQL schema

## 📄 License

MIT - Feel free to use and modify for your pizza outlet!

