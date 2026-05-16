extends StaticBody2D

signal destroyed

func destroy():
	destroyed.emit()
	queue_free()
