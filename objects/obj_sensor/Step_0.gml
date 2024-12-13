/// @description Insert description here
// You can write your code in this editor

//checando colisão com player

var player = place_meeting(x, y, obj_player);

if (player)
{
	//TRANSIÇÃO
	var tran = instance_create_layer(0, 0, layer, obj_transicao);
	tran.destino = destino;
	tran.destino_x = destino_x;
	tran.destino_y = destino_y;
}
