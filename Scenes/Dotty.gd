extends KinematicBody2D

export var gravity = 10
export var run_speed = 200
export var jump_speed = 200
var velocity = Vector2(0, 0)
var direction = Vector2(1, 0)

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_SPACE:
			if is_on_floor():
				velocity.y -= jump_speed
			
func _physics_process(_delta):
	if !is_on_floor():
		velocity.y += gravity
	
	if Input.is_key_pressed(KEY_A):
		velocity.x = - run_speed
	elif Input.is_key_pressed(KEY_D):
		velocity.x = run_speed
	else:
		velocity.x = 0

	if velocity != Vector2.ZERO:
		direction = velocity.normalized()

	if velocity == Vector2.ZERO:
		$AnimatedSprite.animation = "run"
	else:
		$AnimatedSprite.animation = "run"
	
	if velocity.x > 0:
		$AnimatedSprite.scale = Vector2(1.0, 1.0)
	elif velocity.x < 0:
		$AnimatedSprite.scale = Vector2(-1.0, 1.0)

	var _returned_velocity = move_and_slide(velocity, Vector2(0, -1.0), false, 4, 0, false)
	
	if is_on_floor():
		velocity.y = 0
