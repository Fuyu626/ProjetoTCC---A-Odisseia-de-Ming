/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_player)){
	if(bbox_bottom >= obj_player.bbox_bottom)
	{
		sprite_index = spr_ladder;
	}
	else
	{
		sprite_index = -1;		
	}

	with (obj_player) 
	{
		var _down = keyboard_check(ord("S"));
	
		if (_down)
		{
			other.sprite_index = -1;	
		}
	}
}