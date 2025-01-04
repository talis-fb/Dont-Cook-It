extends Node2D

@export var _requested_food: Food

func _ready() -> void:
	$Dropable.setup()
	$ShowOnHoverDrop.setup()

func _on_dropable_dropped(food: Food) -> void:
	print("Command entregue!")
	self.queue_free()
