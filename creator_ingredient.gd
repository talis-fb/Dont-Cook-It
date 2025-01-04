extends Area2D

@export var spawn_food: Food:
	set(value):
		$Draggable.food = value
		spawn_food = value

signal new_food(new_food: Food)

func _on_draggable_start(food: Food) -> void:
	new_food.emit(food)
