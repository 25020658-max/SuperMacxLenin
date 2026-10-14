extends Area2D

signal destroy_answer(ans: Answer)
var ans_array : Array[String] = []
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("answer") and area.has_method("get_is_grabbing"):
		if not area.get_is_grabbing():
			area.ans_hide()
			destroy_answer.emit(area)
			var temp = area.get_ans_name();
			ans_array.append(temp)
