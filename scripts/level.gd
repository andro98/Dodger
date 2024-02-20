extends Node2D

var score = 0
var health = 3

@onready var deathzone = $DeathZone
@onready var player = $Player
@onready var spwaner = $ProjectileSpwaner
@onready var hud = $UILayer/HUD

func _ready():
	deathzone.player_score.connect(_on_player_score)
	player.player_hited.connect(_on_player_hited)
	spwaner.patch_passed.connect(_on_patch_passed)
	hud.set_score(score)

func _on_player_score():
	score += 1
	hud.set_score(score)

func _on_player_hited():
	health -= 1
	
	if health <= 0:
		pass

func _on_patch_passed():
	player.increase_speed()
