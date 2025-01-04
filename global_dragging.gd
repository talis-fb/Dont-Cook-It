extends Node

signal start_dragging(food: Food)
signal cancel_dragging(food: Food)
signal finish_dragging(food: Food)

var dragging_food: Food = null

func is_dragging() -> bool:
	return self.dragging_food != null

func is_equals_food(food: Food) -> bool:
	return dragging_food == food

func start(food: Food):
	self.dragging_food = food
	start_dragging.emit(food)

func cancel() -> Food:
	var new_food = self.dragging_food.duplicate()
	self.dragging_food = null
	cancel_dragging.emit(new_food)
	return new_food

func finish() -> Food:
	var new_food = self.dragging_food.duplicate()
	self.dragging_food = null
	finish_dragging.emit(new_food)
	return new_food
