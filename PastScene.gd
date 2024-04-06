extends Node2D	

func spawnMob():
	var newMob = preload("res://footSoldier.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	newMob.global_position = %PathFollow2D.global_position
	add_child(newMob)
	

func _on_timer_timeout():
	spawnMob()


func _on_decebalus_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true


func _on_timer_teleport_future_timeout():
	get_tree().paused = true
	#play cutscene
	get_tree().change_scene_to_file("res://FutureScene.tscn")
