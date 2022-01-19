variable "github_owner" {
  type        = string
  default     = "oleksiihead"
  description = "GitHub owner"
}

variable "github_token" {
  type        = string
  description = "GitHub token"
}

variable "repo_name" {
  type        = string
  description = "Repository name"
}

variable "repo_visibility" {
  type        = string
  description = "Repository visibility"
}

variable "webhook_events" {
  type        = list(string)
  description = "GitHub events for webhook"
}

variable "webhook_url" {
  type        = string
  description = "Webhook URL"
}

variable "content_type" {
  type        = string
  description = "Content type"
}