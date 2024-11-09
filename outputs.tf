output "ld_sdk_endpoint" {
  value = aws_lightsail_container_service.brightly.url
}

output "github_repo_html_url" {
  value = github_repository.brightly_repo.html_url
}

output "github_repo_git_clone_url" {
  value = github_repository.brightly_repo.git_clone_url
}

output "environments" {
  value = module.brightly_environment
}

# These shouldn't be needed for daily use but can be helpful when troubleshooting:
output "aws_s3_bucket_name" {
  value = aws_s3_bucket.brightly_bucket.bucket
}

output "aws_lightsail_container_service_name" {
  value = aws_lightsail_container_service.brightly.name
}
