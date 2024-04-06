extends CharacterBody2D


var player

func _ready():
	player = get_node("/root/Timeline/PastScene/Decebalus")
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	move_and_slide()
