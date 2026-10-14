extends Node2D

@export var Ans: Array[PackedScene] = []
@export var Slots: Array[Marker2D] = []
var answering: Array[String] = ["", "", "", ""]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(4):
		_spawning(i)

func _spawning(loca: int) -> void:
	if Ans.is_empty():
		return
	
	var Pscene: PackedScene = Ans.pop_front()
	var dap: Answer = Pscene.instantiate()
	dap.global_position = Slots[loca].global_position
	var temp = dap.get_ans_name()
	answering[loca] = temp
	
	add_child(dap)
	
func _on_display_scene_destroy_answer(ans: Answer) -> void:
	var loca: int = answering.find(ans.get_ans_name())
	print(loca)
	if loca == -1:
		return
	_spawning(loca)
	
