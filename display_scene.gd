extends Area2D
signal win
signal destroy_answer(ans: Answer)
var ans_array : Array[String] = []
@onready var lab = $Twxt
@onready var controler = $Control
@export var finall: PackedScene
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
			var tem2 = area.get_ans_text();
			if tem2 == "3" or tem2 == "1":
				$Correct.play()
			elif tem2 == "6":
				$Bass.play()
			elif tem2 == "7":
				pass
			else :
				$Wrong.play()
			ans_array.append(tem2)
			rendering()
			false_ans(tem2)
func rendering() ->void:
	if ans_array.has("1") && !ans_array.has("3"):
		$Diss.play("nature")
	if ans_array.has("3") && !ans_array.has("1"):
		$Diss.play("human")
	if ans_array.has("3") && ans_array.has("1"):
		$Diss.play("nh")
	if ans_array.has("3") && ans_array.has("1") && ans_array.has("6"):
		$Diss.play("meo")
func false_ans(s: String) -> void:
	if s == "3" or s == "1":
		lab.text = "Chính xác!"
		controler.show_temporary_text(lab, 4)
	if (s=="2"):
		lab.text = "Nhóm 9 chúng tôi đã ăn hết chỗ thức ăn, đây không phải đáp án đúng!"
		controler.show_temporary_text(lab, 4)
	if (s=="4"):
		lab.text = "Lướt mạng xã hội 181 phút không giúp xã hội phát triển lắm."
		controler.show_temporary_text(lab, 4)
	if (s=="5"):
		lab.text = "Anh K đã dùng hết số tiền vào tài xỉu, Đây không phải đáp án đúng!"
		controler.show_temporary_text(lab, 4)
	if (s=="6"):
		lab.text = "Mấy con mèo không giúp tạo ra xã hội, nhưng chúng được phép ở lại."
		controler.show_temporary_text(lab, 4)
	if (s=="8"):
		lab.text = "Đáp án chưa chính xác rồi, các em thông cảm"
		controler.show_temporary_text(lab, 4)
	if (s =="7"):
		win.emit()
	

	
	
