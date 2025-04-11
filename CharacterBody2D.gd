extends CharacterBody2D

# Настройки скорости
@export var speed = 300.0
@export var acceleration = 15.0
@export var friction = 10.0

var input_vector = Vector2.ZERO

func _physics_process(delta):
	# Получаем ввод с клавиатуры (WASD или стрелки)
	input_vector.x = Input.get_axis("ui_left", "ui_right")
	input_vector.y = Input.get_axis("ui_up", "ui_down")
	input_vector = input_vector.normalized()  # Нормализуем, чтобы диагональное движение не было быстрее
	
	# Применяем движение
	if input_vector != Vector2.ZERO:
		velocity = velocity.lerp(input_vector * speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()  # Обрабатывает столкновения
