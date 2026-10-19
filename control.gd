extends Control


@onready var lab = $"../Twxt"


func show_temporary_text(text: Label, duration: float) -> void:
	lab.add_theme_font_size_override("font_size", 64)
	lab.show()
	
	# Wait for the specified duration (in seconds)
	await get_tree().create_timer(duration).timeout
	
	lab.hide()
