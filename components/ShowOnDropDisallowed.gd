class_name ShowOnDropDisallowed
extends Node2D

@export var dropable: Dropable

func _process(delta: float) -> void:
	self.visible = not dropable.allowed
