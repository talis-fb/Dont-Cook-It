extends Node2D

func _ready() -> void:
	$Draggable.setup()
	$Dropable.setup()

func _on_timer_timeout() -> void:
	for el: Ingredient in $Food.ingredients:
		el.increase_cooking(1)

func _on_dropable_drag_item_entered(food: Food) -> void:
	$ColorRect.visible = true


func _on_dropable_drag_item_exited(food: Food) -> void:
	$ColorRect.visible = false


func _on_dropable_dropped(food: Food) -> void:
	$ColorRect.visible = false
	$Food.combine(food)
	
func _on_draggable_finish(food: Food) -> void:
	$ColorRect.visible = false
	$Food.clear()
