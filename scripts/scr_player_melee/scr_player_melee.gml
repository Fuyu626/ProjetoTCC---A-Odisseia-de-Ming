// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_melee(){
//@arg player
//@arg distancia
//@arg xscale

var outro = argument0;
var distancia = argument1;
var xscale = argument2;

//DETECTANDO O PLAYER
var player = collision_line(x, y - sprite_height/2, x + distancia * xscale, y - sprite_height/2, outro, 0, 1)

//DETECTA O PLAYER
if(player)
{
	estado = "attack";
}	
}
