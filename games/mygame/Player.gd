extends KinematicBody2D

export var SPEED: float = 500
var linear_vel = Vector2()

var player_index
var player_color

# Inputs

var move_left = ""
var move_right = ""
var move_up = ""
var move_down = ""
var action_a = ""
var action_b = ""


func init(player_index, player_color):
	self.player_index = player_index
	self.player_color = player_color
	$Sprite.modulate = Party.available_colors[player_color]
	var spi = str(player_index)
	move_left = "move_left_" + spi
	move_right = "move_right_" + spi
	move_up = "move_up_" + spi
	move_down = "move_down_" + spi
	action_a = "action_a_" + spi
	action_b = "action_b_" + spi


func _physics_process(delta):
	var target_vel = Vector2(Input.get_action_strength(move_right) - Input.get_action_strength(move_left),
	Input.get_action_strength(move_down) - Input.get_action_strength(move_up)) * SPEED
	
	linear_vel = lerp(linear_vel, target_vel, 0.2)
	
	linear_vel = move_and_slide(linear_vel)
	
	if Input.is_action_pressed(move_left) and not Input.is_action_pressed(move_right):
		$Sprite.flip_h = true
	if Input.is_action_pressed(move_right) and not Input.is_action_pressed(move_left):
		$Sprite.flip_h = false
		
