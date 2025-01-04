extends Area2D

@onready var food := $Food

func _on_dropable_drag_item_entered(food: Food) -> void:
	$ColorRect.visible = true

func _on_dropable_drag_item_exited(food: Food) -> void:
	$ColorRect.visible = false

func _on_dropable_dropped(food: Food) -> void:
	print("Dropped")
	print(food)
	$ColorRect.visible = false
	$Food.combine(food)
	$SpriteFood.texture = $Food.get_texture()
	$ColorRect.visible = false

func _on_draggable_finish(food: Food) -> void:
	print("FINISH")
	print(food)
	$Food.clear()
	$SpriteFood.texture = null
	$ColorRect.visible = false
