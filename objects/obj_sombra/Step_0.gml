/// @description Insert description here
// You can write your code in this editor

var chao = place_meeting(x, y + 1, obj_block);

if (point_distance(x, y, obj_player.x, obj_player.y) <= detection_range) 
{
	if (image_yscale<1)
	{
		visible = true;
		image_yscale += 0.1;
	    estado = "idle";
	}	
 }


if (!chao)
{
	velv += GRAVIDADE * massa * global.vel_mult;	
}

if (mouse_check_button_pressed(mb_right))
{
	estado = "attack";	
}

switch(estado)
{
	
	#region idle 
	case "idle":
	{
		mid_velh = 0;
		velh = 0;
		timer_estado++;
		if (sprite_index != spr_sombra_idle)
		{
			image_index = 0;	
		}
		sprite_index = spr_sombra_idle;
		
		//CONDIÇÃO DE TROCA DE ESTADO
		if (position_meeting(mouse_x, mouse_y, self))
		{	
			if (mouse_check_button_pressed(mb_right))
			{
				estado = "hit";	
			}
		}
		//INDO P ESTADO DE PATRULHA
		if (irandom(timer_estado) > 300)
		{
			estado = choose("moving", "idle", "moving");
			timer_estado = 0;
		}	
		scr_player_melee(obj_player, distancia, xscale);
		
		
		break;
	}
	#endregion
	
	#region movendo
	case "moving":
	{
	
		timer_estado++;
		if (sprite_index != spr_sombra_walk)
		{
			image_index = 0;
			velh = choose(1, -1);
		}
		sprite_index = spr_sombra_walk;
		
		if (place_meeting(x + velh, y, obj_collisionledge))
		{
		    velh *= -1;
		}
		
		//CONDIÇÃO DE SAIR DO ESTADO
		if (irandom(timer_estado) > 300)
		{
			estado = choose("idle", "idle", "moving");
			timer_estado = 0;
		}
		scr_player_melee(obj_player, distancia, xscale);
		
		break;
	}
	#endregion
	

	
	#region ataque
	case "attack":
	{
		velh = 0;
		if (sprite_index != spr_sombra_attack)
		{
			image_index = 0;
			posso = true;
			dano = noone;
		}
		sprite_index = spr_sombra_attack;
		
		//CRIANDO O OBJETO DE DANO
		if (image_index >= 6 && dano == noone && posso)
		{
		    dano = instance_create_layer(x, y, layer, obj_damage_s);
		    dano.dano = ataque;
		    dano.pai2 = id;	
			posso = false;
		}
		
		if (image_index > image_number - 1 && dano != noone)
	    {
	        instance_destroy(dano);
	        dano = noone;
	        estado = "idle";
			
	    }
		
		//REHABILITAR A POSSIBILIDADE DE CAUSAR DANO
	    if (image_index == 0)
	    {
	        posso = true;
	    }
		
		if (image_index > image_number-1)
		{
			estado = "idle";	
		}
		
		//SAIR DO ESTADO	 
		break;
		
	}
	#endregion
	
	
	#region hit
	case "hit":
	{
		velh = 0;
		if (sprite_index != spr_sombra_hit)
		{
			//INICIANDO O ESTADO
			image_index = 0;
		}
		sprite_index = spr_sombra_hit;
		
		//CONDIÇÃO PARA SAIR DO ESTADO
		if (vida_atual > 0)
		{
			if (image_index > image_number-1)
			{
				estado = "idle";
			}
		}
		else
		{
			if (image_index >= 3)
			{
				estado = "dead";	
			}
		}
		break;
	}
	#endregion
	
	
	#region morte
	case "dead":
	{
		if (sprite_index != spr_sombra_dead)
		{
			//INICIANDO O ESTADO
			image_index = 0;
		}
		sprite_index = spr_sombra_dead;
		
		//MORRENDO NA TRUE
		if (image_index > image_number-1)
		{
			image_speed = 0;
			image_alpha -= .05;
			
			if (image_alpha <= 0) instance_destroy();
		}
		
	}
	#endregion
}
	