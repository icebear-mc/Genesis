extends Camera2D

@export var zoom_speed := 0.08
@export var min_zoom := 0.2
@export var max_zoom := 2.5


@export var world_min := Vector2(-3200, -3200)
@export var world_max := Vector2( 3200,  3200)

var dragging := false


func _ready() -> void:
	global_position = Vector2.ZERO
	zoom = Vector2.ONE


func _unhandled_input(event) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MIDDLE:
			dragging = event.pressed

		match event.button_index:
			MOUSE_BUTTON_WHEEL_UP:
				zoom += Vector2.ONE * zoom_speed
			MOUSE_BUTTON_WHEEL_DOWN:
				zoom -= Vector2.ONE * zoom_speed

	if event is InputEventMouseMotion and dragging:
		global_position -= event.relative / zoom.x


func _process(delta: float) -> void:

	zoom.x = clamp(zoom.x, min_zoom, max_zoom)
	zoom.y = zoom.x

	global_position.x = clamp(global_position.x, world_min.x, world_max.x)
	global_position.y = clamp(global_position.y, world_min.y, world_max.y)
