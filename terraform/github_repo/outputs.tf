output "repo_url" {
  value = github_repository.repo.html_url
  description = "URL to the repository on the web."
}

output "ssh_clone_url" {
  value = github_repository.repo.ssh_clone_url
  description = "URL that can be provided to git clone to clone the repository via SSH."
}
