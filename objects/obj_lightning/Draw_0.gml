/// @description Insert description here
// You can write your code in this editor

//SURFACE NÃO EXISTE
if (!surface_exists(surf))
{
	//CRIAR SURFACE
	surf = surface_create(room_width, room_height);
	
}
else //SE A SURFACE EXISTE
{
	//ALVO
	surface_set_target(surf);
	//ESVAZIA A SURFACE
	draw_clear_alpha(c_black, .6);
	
	gpu_set_blendmode(bm_subtract);	
	
	//ESPAÇO DA LUZ
	with (obj_light)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * .8, image_yscale * .8, image_angle, c_white, 1);
	}
	
	//LUZ DO PLAYER
	with (obj_player)
	{
		//MOVIMENTO LUZ
		var _valor = random_range(-.1, .1);
		draw_sprite_ext(spr_lighting, 0, x, y - 20, 1.5 + _valor, 1.5 + _valor, 0, c_aqua, .7); 		
	}
	with (obj_latern)
	{
		if (image_index = 1)
		{
			var _valor = random_range(-.1, .1);
			draw_sprite_ext(spr_lighting, 0, x + 12, y - 30, 2 + _valor, 2 + _valor, 0, c_yellow, .7);
		}
	}
	
	//RESET
	gpu_set_blendmode(bm_normal);
	//RESETA O ALVO
	surface_reset_target();
	
	//DESENHANDO A MINHA SURFACE
	draw_surface(surf, 0, 0);
}