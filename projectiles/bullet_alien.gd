extends Area2D

export var speed: float = 600

func _physics_process(delta):
	position.y += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_bullet_alien_area_entered(area):
	if area.is_in_group("player"):
		area.damage(1)
		queue_free()
