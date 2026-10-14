extends Node2D

@export var Ans: Array[PackedScene] = []
@export var Slots: Array[Marker2D] = []
var answering: Array[Answer] = [null, null, null, null]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(4):
		_spawning(i)

func _on_display_scene_destroyed(ans: Answer) -> void:
	var loca: int = answering.find(ans)
	if loca == -1:
		return
	answering[loca] = null
	_spawning(loca)

func _spawning(loca: int) -> void:
	if Ans.is_empty():
		return
	var Pscene: PackedScene = Ans.pop_front()
	var dap: Answer = Pscene.instantiate()
	dap.global_position = Slots[loca].global_position
	add_child(dap)
	
