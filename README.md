# Terraform Cloudflare Turnstile

This Terraform project provisions and manages **Cloudflare Turnstile** widgets for your applications. Turnstile is a privacy-first CAPTCHA alternative that protects your website from bots, spam, and abuse while providing a seamless user experience.

---

## What is Cloudflare Turnstile?

Cloudflare Turnstile is a free, privacy-focused CAPTCHA replacement that uses machine learning and non-interactive challenges to distinguish between humans and bots. Key features include:

- **Multiple Widget Modes**:
  - `managed`: Automatically adjusts the challenge difficulty based on user behavior (recommended)
  - `non-interactive`: No user input required
  - `invisible`: Runs in the background without any UI
- **Privacy-First**: No tracking, no personal data collection
- **Easy Integration**: Works with any website or application
- **Global Coverage**: Leverages Cloudflare's 300+ data centers worldwide

---

## Prerequisites

1. **Terraform**: Install from [terraform.io](https://developer.hashicorp.com/terraform/downloads)
2. **Cloudflare Account**: Sign up at [dash.cloudflare.com](https://dash.cloudflare.com/)

---

## Setup Guide

### Step 1: Get your Cloudflare Account ID

1. Log in to the Cloudflare dashboard
2. Your Account ID is visible in the right sidebar of the Account Home page, or you can find it in the URL: `https://dash.cloudflare.com/<YOUR_ACCOUNT_ID>`

### Step 2: Create a Cloudflare API Token

1. Go to **My Profile → API Tokens** in the Cloudflare dashboard
2. Click **Create Token**
3. Select **Create Custom Token**
4. Add this permission:
   - **Account → Turnstile → Edit**
5. Under **Account Resources**, select your account
6. Click **Continue to summary** → **Create Token**
7. Save the token securely (you won't be able to see it again!)

---

## Usage

1. **Configure your variables**:

   Copy `terraform.tfvars.example` to `terraform.tfvars` and update the values:
   ```hcl
   # Required
   cloudflare_account_id = "your-account-id"
   cloudflare_api_token = "your-cloudflare-api-token"

   # Optional (use defaults or customize)
   turnstile_widget_name                = "My Login Widget"
   turnstile_widget_domains             = ["example.com", "app.example.com"]
   turnstile_widget_mode                = "managed"
   turnstile_widget_bot_fight_mode      = false
   turnstile_widget_clearance_level     = "auto"
   turnstile_widget_ephemeral_id        = false
   turnstile_widget_offlabel            = false
   turnstile_widget_region              = "world"
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Preview changes**:
   ```bash
   terraform plan
   ```

4. **Apply the configuration**:
   ```bash
   terraform apply
   ```

---

## Variables Reference

| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `cloudflare_account_id` | Your Cloudflare Account ID | `string` | (required) |
| `cloudflare_api_token` | Cloudflare API Token with Turnstile permissions | `string` | (required, sensitive) |
| `turnstile_widget_name` | Name of the Turnstile widget | `string` | `"My Turnstile Widget"` |
| `turnstile_widget_domains` | List of domains where the widget can be used | `list(string)` | `["example.com", "blog.example.com"]` |
| `turnstile_widget_mode` | Widget mode: `managed`, `non-interactive`, or `invisible` | `string` | `"managed"` |
| `turnstile_widget_bot_fight_mode` | Enable bot fight mode | `bool` | `false` |
| `turnstile_widget_clearance_level` | Clearance level: `auto`, `interactive`, or `non-interactive` | `string` | `"auto"` |
| `turnstile_widget_ephemeral_id` | Use ephemeral ID | `bool` | `false` |
| `turnstile_widget_offlabel` | Enable offlabel use | `bool` | `false` |
| `turnstile_widget_region` | Region: `world`, `us`, `eu`, or `apac` | `string` | `"world"` |

---

## Outputs

| Output | Description |
|--------|-------------|
| `turnstile_sitekey` | Public Sitekey for frontend integration |
| `turnstile_secret_key` | Secret key for backend verification (sensitive) |

---

## Resources Created

- `cloudflare_turnstile_widget`: The Cloudflare Turnstile widget configuration
