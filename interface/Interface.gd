extends Control

onready var health_bar = $health_bar
onready var player = get_tree().get_nodes_in_group("player")[0]

func _process(_delta):
	health_bar.value = player.life
	
