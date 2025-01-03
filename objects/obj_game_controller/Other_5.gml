/// @description Insert description here
// You can write your code in this editor

//SOM DE CHUVA PARA AO SAIR DA ROOM
if (som_chuva != noone)
{
	audio_stop_sound(som_chuva);
	som_chuva = noone;
}