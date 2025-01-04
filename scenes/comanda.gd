extends Node2D

@export var _requested_food: Food

func _ready() -> void:
	$Dropable.setup()

func _on_dropable_dropped(food: Food) -> void:
	print("Command entregue!")
	self.queue_free()

func _on_dropable_drag_item_entered(food: Food) -> void:
	$ColorRect.visible = true


func _on_dropable_drag_item_exited(food: Food) -> void:
	$ColorRect.visible = false
