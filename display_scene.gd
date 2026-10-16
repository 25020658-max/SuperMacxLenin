extends Area2D

signal destroy_answer(ans: Answer)
var ans_array : Array[String] = []
func _ready() -> void:
	$Diss.play("default")
	pass
	
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("answer") and area.has_method("get_is_grabbing"):
		if not area.get_is_grabbing():
			area.ans_hide()
			destroy_answer.emit(area)
			var temp = area.get_ans_name();
			var tem2 = area.get_ans_text();
			ans_array.append(tem2)
			rendering()
func rendering() ->void:
	if ans_array.has("1") && !ans_array.has("3"):
		$Diss.play("nature")
	if ans_array.has("3") && !ans_array.has("1"):
		$Diss.play("human")
	if ans_array.has("3") && ans_array.has("1"):
		$Diss.play("nh")
	if ans_array.has("3") && ans_array.has("1") && ans_array.has("6"):
		$Diss.play("meo")
	
	
	
