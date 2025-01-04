extends Node2D

signal dropped(food: Food)
signal drag_item_entered(food: Food)
signal drag_item_exited(food: Food)

@export var food: Food
@export var area_dropable: Area2D

func _ready() -> void:
	area_dropable.input_event.connect(_on_area_input_event)
	area_dropable.mouse_entered.connect(_on_area_mouse_entered)
	area_dropable.mouse_exited.connect(_on_area_mouse_exited)


func _on_area_mouse_entered() -> void:
	if GlobalDragging.is_dragging() and not GlobalDragging.is_equals_food(food):
		drag_item_entered.emit(GlobalDragging.dragging_food)
	
func _on_area_mouse_exited() -> void:
	if GlobalDragging.is_dragging() and not GlobalDragging.is_equals_food(food):
		drag_item_exited.emit(GlobalDragging.dragging_food)
	
func _on_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if GlobalDragging.is_dragging() and not GlobalDragging.is_equals_food(food):
		if Input.is_action_just_pressed("click"):
			var new_food = GlobalDragging.finish()
			dropped.emit(new_food)
