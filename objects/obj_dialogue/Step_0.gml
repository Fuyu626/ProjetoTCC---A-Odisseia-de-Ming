/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("E")))
{
	index++;
	index_letra = 1;
	if (index >= array_length(texto))
	{
		instance_destroy();	
	}
}