class_name ShowOnHoverDrop
extends Node2D

@export var dropable: Dropable

func setup() -> void:
	dropable.drag_item_entered.connect(_on_dropable_drag_item_entered)
	dropable.drag_item_exited.connect(_on_dropable_drag_item_exited)
	dropable.dropped.connect(_on_dropable_drag_item_exited)
	
	# For fix when it keep visible when cancel
	GlobalDragging.cancel_dragging.connect(_on_dropable_drag_item_exited)

func _on_dropable_drag_item_entered(food: Food):
	self.visible = true
	
func _on_dropable_drag_item_exited(food: Food):
	self.visible = false
