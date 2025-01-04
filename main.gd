extends Node2D

func _on_area_2d_new_food(new_food: Food) -> void:
	GlobalDragging.start(new_food)

func _ready() -> void:
	$SpawnerFood.spawn_food = preload("res://ingredients/frango.tres").to_food_entity()
