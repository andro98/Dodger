extends CharacterBody2D

class_name Player

signal player_hited

var SPEED = 300.0
var viewport_size 
const OFFSET = 25
@export var player_increase_speed_rate = 20

func increase_speed():
	SPEED += player_increase_speed_rate

func _ready():
	viewport_size = get_viewport_rect().size
	
	global_position.x = viewport_size.x / 2
	global_position.y = viewport_size.y - 50
	
	global_scale.x = viewport_size.x * 0.0015
	global_scale.y = viewport_size.x * 0.0015

func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if global_position.x > viewport_size.x + OFFSET:
		global_position.x = OFFSET
	if global_position.x < -OFFSET:
		global_position.x = viewport_size.x - OFFSET

func took_damage():
	player_hited.emit()
