/// @description Insert description here
// You can write your code in this editor

//MUSICA PRINCIPAL
if (room == rm_menu)
{
	som_musga = audio_play_sound(snd_musga, 1, true);
}
else if (som_musga != noone)
{
	audio_stop_sound(som_musga);
	som_musga = noone;
}

if (room == Room2)
{
	som_musga2 = audio_play_sound(snd_musga, 1, true);
}
else if (som_musga2 != noone)
{
	audio_stop_sound(som_musga2);
	som_musga2 = noone;
}
//SOM DE CHUVA NA ROOM0
if (room == Room0)
{
	som_chuva1 = audio_play_sound(sfx_rain, 1, true);	
}
else if (som_chuva1 != noone)
{
	audio_stop_sound(som_chuva1);
	som_chuva1 = noone;
}

//SOM DE CHUVA ABAFADO NA ROOM1
if (room == Room1)
{
	som_chuva1 = audio_play_sound(sfx_interiorrain, 1, true);	
}
else if (som_chuva2!= noone)
{
	audio_stop_sound(som_chuva2);
	som_chuva2 = noone;
}

