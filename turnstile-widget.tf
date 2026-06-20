resource "cloudflare_turnstile_widget" "login_captcha" {
  account_id             = var.cloudflare_account_id
  domains                = var.turnstile_widget_domains
  mode                   = var.turnstile_widget_mode
  name                   = var.turnstile_widget_name
  bot_fight_mode         = var.turnstile_widget_bot_fight_mode
  clearance_level        = var.turnstile_widget_clearance_level
  ephemeral_id           = var.turnstile_widget_ephemeral_id
  offlabel               = var.turnstile_widget_offlabel
  region                 = var.turnstile_widget_region
}