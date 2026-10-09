Deploy to Fly.io

1. Install the Fly CLI

Mac or Linux: curl -L https://fly.io/install.sh | sh
Windows (PowerShell): iwr https://fly.io/install.ps1 -useb | iex

2. Sign in

fly auth login

Use fly auth signup if you don’t have an account. Fly may ask for payment details. Check its pricing page first, since the free allowance for new accounts is limited.

3. Create the app, without deploying yet

From the same portfolio-book folder:

fly launch --no-deploy

Choose an app name, which becomes your-name.fly.dev, and a region near your visitors. Say no to a database or Redis. Fly detects your Dockerfile and should set the port to 80.

4. Check fly.toml

Open the file fly launch created and make sure it contains:

toml
[http_service]
  internal_port = 80
  force_https = true
  auto_stop_machines = "stop"
  auto_start_machines = true
  min_machines_running = 0

The port must be 80. If it says 8080, change it, or the site won’t load. The last three lines let the app stop when idle to keep costs low. The first visit after a quiet spell is then a little slower.

5. Deploy

fly deploy
fly open

fly open opens your live site.

Later: to update the book, replace Portfolio_Tech_Book.html and run fly deploy again. For a custom domain, run fly certs add yourdomain.com and add the DNS records it shows you.

I haven’t run any of this on a real machine, so tell me what the terminal prints if something fails. The error message usually points to the fix.