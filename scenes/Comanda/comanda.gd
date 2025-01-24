#comanda
extends Node2D

signal dropped(food: Food)

@export var _requested_food: Food

func _ready() -> void:
	$Dropable.setup()
	$ShowOnHoverDrop.setup()
	
func _on_dropable_dropped(food: Food) -> void:
	dropped.emit(food)
	print("Command entregue!")
	self.queue_free()
