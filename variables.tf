# Variables definition file

variable "cloudflare_api_key" {
  type        = string
  description = "Your Cloudflare API Key (legacy) or API Token with appropriate permissions"
}

variable "cloudflare_api_email" {
  type        = string
  description = "Your Cloudflare account email (required if using API Key)"
}

variable "cloudflare_account_id" {
  type        = string
  description = "Your Cloudflare Account ID"
}

variable "turnstile_widget_name" {
  type        = string
  description = "Name of the Cloudflare Turnstile widget"
  default     = "My Turnstile Widget"
}

variable "turnstile_widget_domains" {
  type        = list(string)
  description = "List of domains where the Turnstile widget can be used"
  default     = ["example.com", "blog.example.com"]
}

variable "turnstile_widget_mode" {
  type        = string
  description = "Turnstile widget mode (managed, non-interactive, invisible)"
  default     = "managed"
}

variable "turnstile_widget_bot_fight_mode" {
  type        = bool
  description = "Whether to enable bot fight mode"
  default     = false
}

variable "turnstile_widget_clearance_level" {
  type        = string
  description = "Clearance level (no_clearance, jschallenge,managed, interactive)"
  default     = "interactive"
}

variable "turnstile_widget_ephemeral_id" {
  type        = bool
  description = "Whether to use ephemeral ID"
  default     = false
}

variable "turnstile_widget_offlabel" {
  type        = bool
  description = "Whether to enable offlabel use"
  default     = false
}

variable "turnstile_widget_region" {
  type        = string
  description = "Region for the widget (world, us, eu, apac)"
  default     = "world"
}