# Output the keys so your application can read them
output "turnstile_sitekey" {
  description = "The public Sitekey to embed in your frontend HTML"
  value       = cloudflare_turnstile_widget.login_captcha.sitekey
}

output "turnstile_secret_key" {
  description = "The secret key used by your backend server for verification"
  value       = cloudflare_turnstile_widget.login_captcha.secret
  sensitive   = true
}