extends Area2D

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	for area in get_overlapping_areas():
		if area.is_in_group("answer") and area.has_method("get_is_grabbing"):
			if not area.get_is_grabbing():
				area.hide()
