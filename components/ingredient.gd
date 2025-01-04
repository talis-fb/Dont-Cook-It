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
	var points: Array[Vector2] = []
	points.append(Vector2(0, _ingredient_stats.raw_tasty))
	points.append_array(_ingredient_stats.cooking_tasty)
	var x = _cooking
	
	if x > points[points.size() - 1][0]:
		return points[points.size() - 1][1]
	
	for i in range(points.size() - 1):
		var p1 = points[i]
		var p2 = points[i + 1]
		if p1.x <= x and x <= p2.x:
			# Perform linear interpolation
			return p1.y + (p2.y - p1.y) * (x - p1.x) / (p2.x - p1.x)
	
	return _ingredient_stats.raw_tasty

func _compare_x(a: Vector2, b: Vector2) -> int:
		return int(a.x - b.x)
