/// @description Insert description here
// You can write your code in this editor

if (game_over)
{
	global.vel_mult = .5;	
}
else
{
	global.vel_mult = 1;	
}

/*
if (keyboard_check(vk_up))
{
	game_over = true;	
}
else
{
	game_over = false;		
}
*/

image_index += image_speed;

if (image_index >= sprite_get_number(spr_tecla)) 
{
    image_index = 0;
}

if (keyboard_check(vk_space)) game_restart(); 