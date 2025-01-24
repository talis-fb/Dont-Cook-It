#slot
extends Area2D

func _ready() -> void:
	$Draggable.setup()
	$Dropable.setup()
	$ShowOnHoverDrop.setup()

func _on_dropable_dropped(food: Food) -> void:
	$Food.combine(food)

func _on_draggable_finish(food: Food) -> void:
	$Food.clear()


func _on_dropable_drag_item_entered(new_food: Food) -> void:
	$Dropable.allowed = $Food.can_combine(new_food)

func _on_dropable_drag_item_exited(food: Food) -> void:
	$Dropable.allowed = true
