#lixo
extends Node2D

func _ready() -> void:
	$Dropable.setup()
	$ShowOnHoverDrop.setup()

func _on_dropable_dropped(food: Food) -> void:
	food.queue_free()
