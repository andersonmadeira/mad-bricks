extends KinematicBody2D

const ball_scene = preload("res://Scenes/Ball.xml")

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	var y = get_pos().y
	var mouse_x = get_viewport().get_mouse_pos().x
	set_pos(Vector2(mouse_x, y))
	
func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed():
		var balls = get_tree().get_nodes_in_group("Ball")
		if balls.size() == 0:
			var ball = ball_scene.instance()
			ball.set_pos(get_pos()-Vector2(0, 25))
			ball.add_to_group("Ball")
			get_tree().get_root().add_child(ball)
