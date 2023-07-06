extends Area2D

var plBullet := preload("res://projectiles/bullet_player.tscn")

onready var fireDelayTimer := $fireDelayTimer

export var speed: float = 500
export var fireDelay: float = 0.2
export var acc: float = 80
var vel := Vector2(0, 0)
var life = 10


func _process(_delta):
	
	#rotate the player in the movement direction
	rotation_degrees = vel.x/60
	
	#check if shooting
	if Input.is_action_pressed("shoot") and fireDelayTimer.is_stopped():
		fireDelayTimer.start(fireDelay)
		#create bullet
		var bullet := plBullet.instance()
		bullet.position = position
		bullet.position.y -= 30
		bullet.rotation_degrees = rotation_degrees
		get_tree().current_scene.add_child(bullet)
		
	


func _physics_process(delta):
	var dirVec := Vector2(0, 0)
	
	#input left and right
	if Input.is_action_pressed("move_left"):
		dirVec.x -= 1
	if Input.is_action_pressed("move_right"):
		dirVec.x += 1
	
	#input up and down
	if Input.is_action_pressed("move_up"):
		dirVec.y -= 1
	if Input.is_action_pressed("move_down"):
		dirVec.y += 1
	
	#normalize the velocity for diagonal movement
	vel += dirVec.normalized() * acc
	
	#move the player and add friction
	position += vel * delta
	vel.x = vel.x/1.1
	vel.y = vel.y/1.1
	
	# stop the player from leaving the screen
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x, 0, viewRect.size.x)
	position.y = clamp(position.y, 0, viewRect.size.y)
	


func damage(amount: int):
	life -= amount
