/// @description Insert description here
// You can write your code in this editor

var player = place_meeting(x, y, obj_player);
var interact = keyboard_check_pressed(ord("F"));

if (player && interact)
{
	//TRANSIÇÃO
	var tran = instance_create_layer(0, 0, layer, obj_transicao);
	tran.destino = destino;
	tran.destino_x = destino_x;
	tran.destino_y = destino_y;
}

if (room = Room1)
{
	visible = false;	
} 