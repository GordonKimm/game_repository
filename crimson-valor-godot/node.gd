extends Node

var time := 0.0

@onready var minutes_label = $Minutes
@onready var seconds_label = $Seconds
@onready var msecs_label = $Msecs

func _ready():
	print("Labels found:", minutes_label, seconds_label, msecs_label)
	set_process(true)

func _process(delta: float) -> void:
	time += delta

	var msec = int(fmod(time, 1) * 1000)
	var seconds = int(fmod(time, 60))
	var minutes = int(time / 60)

	if minutes_label and seconds_label and msecs_label:
		minutes_label.text = "%02d:" % minutes
		seconds_label.text = "%02d." % seconds
		msecs_label.text = "%03d" % msec
	else:
		print("❌ One or more label nodes are missing!")
