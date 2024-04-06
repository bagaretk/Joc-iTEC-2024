extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Timeline/PastScene/Decebalus")
var xp = preload("res://xp.tscn").instantiate()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	move_and_slide()
	
func take_damage():
	
	health -= 1
	if health == 0:
		xp.global_position = %FootSoldier.global_position
		get_parent().add_child(xp)
		queue_free()
