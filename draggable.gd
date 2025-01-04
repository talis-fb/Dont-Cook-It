extends Node2D

signal start(food: Food)
signal cancel(food: Food)
signal finish(food: Food)

@export var food: Food
@export var area_draggable: Area2D

func _ready() -> void:
	area_draggable.input_event.connect(_on_area_input_event)

func _on_area_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if Input.is_action_just_pressed("click") and not GlobalDragging.is_dragging() and food.ingredients.size() > 0:
		GlobalDragging.start_dragging.connect(start.emit, CONNECT_ONE_SHOT)
		GlobalDragging.cancel_dragging.connect(_on_cancel, CONNECT_ONE_SHOT)
		GlobalDragging.finish_dragging.connect(_on_finish, CONNECT_ONE_SHOT)
		GlobalDragging.start(food)

func _on_cancel(food: Food):
	cancel.emit(food)
	GlobalDragging.finish_dragging.disconnect(_on_finish)

func _on_finish(food: Food):
	finish.emit(food)
	GlobalDragging.cancel_dragging.disconnect(_on_cancel)
