extends Area2D
class_name Answer 

signal answer_hide(name: String)

@export var ans_name: String
@export var ans_text: String
var is_grabbing = false
var offset = Vector2.ZERO
var is_hiding :bool = false

func _ready() -> void:
	if ans_name != null: 
		$Label.text = ans_name
		print (ans_name)
	else:
		print ("cac")

func _process(delta: float) -> void:
	if is_grabbing:
		position = get_global_mouse_position() - offset

func _on_button_button_down() -> void:
	is_grabbing = true
	offset = get_global_mouse_position() - global_position
	$CollisionShape2D.set_deferred("disabled", true)

func _on_button_button_up() -> void:
	is_grabbing = false
	$CollisionShape2D.set_deferred("disabled", false)
	
func get_is_grabbing():
	if is_grabbing:
		return true
	else:
		return false

func get_ans_name():
	if ans_name != null:
		return ans_name
func ans_hide():
	if is_hiding:
		pass
	else:
		hide()
		if ans_name != null:
			answer_hide.emit(ans_name)
		is_hiding = true
	
	
	
