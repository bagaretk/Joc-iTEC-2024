extends Area2D

func _physics_process(delta):
	var enemiesInRange = get_overlapping_bodies()
	if enemiesInRange.size() > 0:
		var target_enemy = enemiesInRange.front()
		look_at(target_enemy.global_position)

func shoot():
	#load() le incarca mereu cand e nevoie
	#preload() le incarca la inceputu jocului, static, absolut path
	const BULLET = preload("res://laserAlbastru.tscn")
	var newBullet = BULLET.instantiate()
	newBullet.global_position = %ShootingPoint.global_position
	newBullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(newBullet)


func _on_timer_timeout():
	var enemiesInRange = get_overlapping_bodies()
	if enemiesInRange.size() > 0:
		shoot()
