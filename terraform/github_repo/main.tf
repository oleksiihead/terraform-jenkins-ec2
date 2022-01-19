resource "github_repository" "repo" {
  name       = var.repo_name
  visibility = var.repo_visibility
}

resource "github_repository_webhook" "gh_webhook" {
  events     = var.webhook_events
  repository = github_repository.repo.name

  configuration {
    url          = var.webhook_url
    content_type = var.content_type
  }
}
