extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("YOU DIED")
	timer.start()


func _on_timer_timeout():
	get_tree().reload_current_scene()
