extends Camera2D

var dragging := false
var drag_controller

enum MouseControls {
	left_button = MOUSE_BUTTON_LEFT,
	right_button = MOUSE_BUTTON_RIGHT,
	middle_button = MOUSE_BUTTON_MIDDLE,
	both
}

@export var zoom_speed := 0.04
@export var min_zoom := 0.1
@export var max_zoom := 2.5
@export var controls : MouseControls = MouseControls.both


func _ready() -> void:
	position.x = 0
	position.y = 0

func _unhandled_input(event):
	if event is InputEventMouseButton:
		
		if controls != MouseControls.both:
			if event.button_index == controls:
				dragging = event.pressed
		else:
			if event.button_index == MOUSE_BUTTON_LEFT or event.button_index == MOUSE_BUTTON_RIGHT:
				dragging = event.pressed
				
		match event.button_index:
			MOUSE_BUTTON_WHEEL_DOWN:
				zoom -= Vector2.ONE * zoom_speed
				
			MOUSE_BUTTON_WHEEL_DOWN:
				zoom += Vector2.ONE * zoom_speed
			
	if event is InputEventMouseMotion and dragging:
		global_position -= event.relative / zoom
			
	zoom.x = clamp(zoom.x, min_zoom, max_zoom)
	zoom.y = zoom.x
