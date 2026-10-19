
extends Node


signal show_text(lines: Array[String])
signal dialogue_finished

func display_text(lines: Array[String]) -> void:
	show_text.emit(lines)
