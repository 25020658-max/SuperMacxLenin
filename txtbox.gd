extends CanvasLayer

@onready var pc: PanelContainer = $PanelContainer
@onready var txt = $PanelContainer/MarginContainer/Label
@onready var controler = $PanelContainer/MarginContainer/Control
var active: bool = false
var txt_que: Array[String] = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	TextMana.show_text.connect(_on_show_text_requested)
func _on_show_text_requested(lines: Array[String]) -> void:
	txt_que.append_array(lines)
	if not active:
		show()
		active = true
		_advance_text()
func _advance_text() -> void:
	if txt_que.is_empty():
		_close()
		return
	
	txt.text = txt_que.pop_front()
func _close() -> void:
	active = false
	hide()
	TextMana.dialogue_finished.emit()
