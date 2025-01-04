class_name Ingredient
extends Node

# PRIVATE
@export var _cooking: int = 0

# PRIVATE
@export var _ingredient_stats: IngredientStats

func _init(_ingredient_stats: IngredientStats):
	self._ingredient_stats = _ingredient_stats
	

func get_texture() -> Texture2D:
	return _ingredient_stats.texture

func get_raw_tasty() -> int:
	return _ingredient_stats.raw_tasty

func get_tasty() -> int:
	return _ingredient_stats.raw_tasty * (_cooking * 0.15)
