extends Control

onready var player = get_tree().get_nodes_in_group("player")[0]
onready var healthbar := $ProgressBar

func _process(_delta):
	healthbar.set_percent_visible(player.life)
