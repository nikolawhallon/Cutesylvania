extends Node2D

signal portal_to

func _on_PortalToRoom002_body_entered(body):
	if body.is_in_group("Dotty"):
		emit_signal("portal_to", "Room002", Vector2(-120 + 24, 48))

func _on_PortalToRoom000_body_entered(body):
	if body.is_in_group("Dotty"):
		emit_signal("portal_to", "Room000", Vector2(248 - 24, 24))
