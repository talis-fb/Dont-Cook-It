class_name Ingredient
extends Node

# PRIVATE
@export var _cooking: int = 0

# PRIVATE
@export var _ingredient_stats: IngredientStats

func set_ingredient_stats(ingredient_stats: IngredientStats):
	_ingredient_stats = ingredient_stats

func set_cooking(cooking: int):
	_cooking = cooking

func clone() -> Ingredient:
	var new_ingredient = Ingredient.new()
	new_ingredient.set_cooking(_cooking)
	new_ingredient.set_ingredient_stats(_ingredient_stats)
	return new_ingredient

func increase_cooking(n: int):
	_cooking += n

func get_texture() -> Texture2D:
	return _ingredient_stats.texture

func get_raw_tasty() -> int:
	return _ingredient_stats.raw_tasty

func get_tasty() -> int:
	return _ingredient_stats.raw_tasty * (1.05 ** _cooking)
