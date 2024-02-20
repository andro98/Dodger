extends Node2D

signal patch_passed

var projectile_scene = preload("res://scenes/projectile.tscn")

var current_patch = 1

@export var patch_size = 2
@export var patch_max_speed = 1

@export var patch_delay = 1
var current_time = 0

var current_patch_instance = 0
var viewport_size

func _ready():
	viewport_size = get_viewport_rect().size
	current_patch_instance = 0
	current_time = 0

func _process(delta):
	current_time += delta
	
	if current_time >= patch_delay:
		create_projectile()
		current_time = 0
	
	if current_patch_instance >= patch_size:
		_patch_passed()

func _patch_passed():
	current_patch += 1
	patch_delay -= 0.01
	if patch_delay < 0.01:
		patch_delay = 0.01
	patch_max_speed += 1
	current_patch_instance = 0
	patch_passed.emit()

func create_projectile():
	var projectile: Projectile = projectile_scene.instantiate()
	var gravity_rate = randf_range(0.1, patch_max_speed)
	projectile.setup_rate(gravity_rate)
	
	add_child(projectile)
	
	var location = Vector2.ZERO
	location.y = -200
	location.x = randf_range(0, viewport_size.x)
	projectile.global_position = location
	
	var scale_size = randf_range(0.1, 1)
	projectile.global_scale = Vector2(scale_size, scale_size)
	
	current_patch_instance += 1
	print("Path Number: ", current_patch, " Instance#: ", current_patch_instance, " Max Speed: ", patch_max_speed, " Delay: ", patch_delay)
