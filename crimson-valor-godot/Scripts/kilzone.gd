extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("YOU DIED")
	Engine.time_scale = 0.7
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	if body.has_method("die"):   # check if the body has a die() method
		body.die()


func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
