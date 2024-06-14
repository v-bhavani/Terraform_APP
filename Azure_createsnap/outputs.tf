output "snapshot_id" {
  description = "The ID of the created snapshot"
  value       = azurerm_snapshot.snapshot.id
}
output "snapshot_source_uri" {
  description = "The source URI of the created snapshot"
  value       = azurerm_snapshot.snapshot.source_uri
}