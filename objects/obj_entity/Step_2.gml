/// @description Insert description here
// You can write your code in this editor

//MID VELH INDO P/ VELH ENQUANTO ELE FOR MENOR Q O LIMITE  
if (abs(velh) <= max_velh)
{
	velh += mid_velh;	
}
else
{
	velh = 0;	
}
//SISTEMA DE COLISÃO E MOVIMENTAÇÃO
var _velh = sign(velh);
var _velv = sign(velv);

//HORIZONTAL
repeat(abs(velh))
{
	if (place_meeting(x + _velh, y, obj_block))	
	{
		velh = 0;
		break;
	}
	x += _velh;
}

//VERTICAL
repeat(abs(velv))
{
	if (place_meeting(x, y + _velv, obj_block))
	{
		velv = 0;
		break;
	}
	y += _velv;
}


