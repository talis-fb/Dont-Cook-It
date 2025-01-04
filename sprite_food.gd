extends Sprite2D


func _on_draggable_start(food: Food) -> void:
	modulate = Color(0.5, 1, 1, 0.8)


func _on_draggable_finish(food: Food) -> void:
	modulate = Color(1, 1, 1)

func _on_draggable_cancel(food: Food) -> void:
	modulate = Color(1, 1, 1)
