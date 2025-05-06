package terraform

required_tags := {"Owner", "Environment", "Project"}

deny contains msg if {
    resource := input.resource_changes[_]
    resource.type == "aws_s3_bucket"
    tags := resource.change.after.tags
    missing_tags := required_tags - {k | tags[k]}
    count(missing_tags) > 0
    msg := sprintf("Bucket S3 '%s' falta tags: %v", [resource.address, missing_tags])
}
