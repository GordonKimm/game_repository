extends Node

const UPDATE_INTERVAL = 1.0 / 60.0  # 60 FPS update rate (optional)

var time := 0.0

@onready var minutes_label: Label = $Minutes
@onready var seconds_label: Label = $Seconds
@onready var msecs_label: Label = $Msecs

func _process(delta: float) -> void:
	time += delta

	var msec = fmod(time, 1) * 1000
	var seconds = int(fmod(time, 60))
	var minutes = int(time / 60)

	minutes_label.text = "%02d:" % minutes
	seconds_label.text = "%02d." % seconds
	msecs_label.text = "%03d" % int(msec)

func stop() -> void:
	set_process(false)

func get_time_formatted() -> String:
	var msec = int(fmod(time, 1) * 1000)
	var seconds = int(fmod(time, 60))
	var minutes = int(time / 60)
	return "%02d:%02d.%03d" % [minutes, seconds, msec]
