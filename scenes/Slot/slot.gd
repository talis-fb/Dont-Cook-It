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
