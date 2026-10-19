extends Control


@onready var lab = $"../Twxt"


func show_temporary_text(text: Label, duration: float) -> void:
	lab.show()
	
	# Wait for the specified duration (in seconds)
	await get_tree().create_timer(duration).timeout
	
	lab.hide()
