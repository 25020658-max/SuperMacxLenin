extends Area2D
class_name Answer 

@export var ans_name: String
@export var ans_text: String
var is_grabbing = false
var offset = Vector2.ZERO

func _process(delta: float) -> void:
	if is_grabbing:
		position = get_global_mouse_position() - offset

func _on_button_button_down() -> void:
	is_grabbing = true
	offset = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	is_grabbing = false

func get_is_grabbing():
	if is_grabbing:
		return true
	else:
		return false
