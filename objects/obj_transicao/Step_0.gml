/// @description Insert description here
// You can write your code in this editor

if (mudei)
{
	alpha -= 0.01;
}	
else //não mudou room
{
	alpha += .01;		
}

//QUANDO ALPHA > 1, MUDA ROOM
if (alpha >= 1)
{
	room_goto(destino);
	
	//posição do player
	obj_player.x = destino_x;
	obj_player.y = destino_y;
}