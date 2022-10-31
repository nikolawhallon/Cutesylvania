extends Node2D

signal portal_to

func _on_Portal_body_entered(body):
	if body.is_in_group("Dotty"):
		emit_signal("portal_to", "Room001", Vector2(-504 + 24, 48))
