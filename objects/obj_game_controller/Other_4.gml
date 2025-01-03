/// @description Insert description here
// You can write your code in this editor

//SOM DE CHUVA
if (room == Room0)
{
	som_chuva = audio_play_sound(sfx_rain, 1, true);	
}
else if (som_chuva != noone)
{
	audio_stop_sound(som_chuva);
	som_chuva = noone;
}