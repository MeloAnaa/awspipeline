package cloudformation

# Tags obrigatórias
required_tags = {"Owner", "Environment", "Project"}

# Regra principal
deny contains msg if {   
    resource := input.Resources[name]
    tags := {tag | tag := resource.Properties.Tags[_].Key}
    missing_tags := required_tags - tags
    count(missing_tags) > 0
    msg := sprintf("Recurso %s (%s) falta tags: %v", [name, resource.Type, missing_tags])
}