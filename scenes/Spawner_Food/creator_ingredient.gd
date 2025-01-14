#creator_ingredient
extends Area2D

signal new_food(new_food: Food)

@export var spawn_ingredient: IngredientStats

var food: Food:
	set(value):
		$PreviewFoodSprite.texture = value.get_texture()
		$Draggable.food = value
		food = value

func _ready() -> void:
	food = spawn_ingredient.to_food_entity()
	$Draggable.setup()

func _on_draggable_start(food: Food) -> void:
	new_food.emit(food.clone())
