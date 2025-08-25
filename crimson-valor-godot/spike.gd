extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"): # Only affect the player
		print("Player died on spikes!")
		if body.has_method("die"):
			body.die()
		else:
			body.queue_free()
		get_tree().reload_current_scene()
