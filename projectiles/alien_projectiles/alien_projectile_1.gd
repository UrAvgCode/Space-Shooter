extends Area2D

export var speed: float = 600

func _physics_process(delta):
	position.y += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_alien_projectile_1_area_entered(area):
	if area.is_in_group("player"):
		area.damage(2)
		queue_free()
