extends Node2D

func _ready() -> void:
	GlobalDragging.start_dragging.connect(_on_start_dragging)
	GlobalDragging.cancel_dragging.connect(_on_cancel_or_finish_dragging)
	GlobalDragging.finish_dragging.connect(_on_cancel_or_finish_dragging)

func _process(delta: float) -> void:
	self.position = get_global_mouse_position()
	
	if Input.is_action_just_pressed("cancel"):
		GlobalDragging.cancel()
	
func _on_start_dragging(food: Food):
	$Sprite2D.texture = food.get_texture()
	set_process(true)
	self.visible = true
	
func _on_cancel_or_finish_dragging(food: Food):
	set_process(false)
	self.visible = false
