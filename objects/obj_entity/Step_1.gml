/// @description Insert description here
// You can write your code in this editor


//MUDANDO DE DIREÇÃO
if (velh != 0) xscale = sign(velh);
image_xscale = xscale;


//MOSTRA O ESTADO
if (position_meeting(mouse_x, mouse_y, id))
{
	if (keyboard_check_pressed(ord("J")))
		mostra_estado = !mostra_estado;
}

image_speed = (img_spd / room_speed) * global.vel_mult;