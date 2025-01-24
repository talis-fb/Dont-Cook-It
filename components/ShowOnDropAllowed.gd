class_name ShowOnDropAllowed
extends Node2D

@export var dropable: Dropable

func _process(delta: float) -> void:
	self.visible = dropable.allowed
