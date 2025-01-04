/// @description Insert description here
// You can write your code in this editor

if (distance_to_object(obj_player) <= 72)
{
	image_xscale= -1;
	if(keyboard_check_pressed(ord("F")))
	{
		var dialogo = instance_create_layer(0, 0, "Dialogo", obj_dialogue);
		for(var	i = 0; i < array_length(texto); i++)
		{
			array_push(dialogo.texto, texto[i]);	
		}
	}
}