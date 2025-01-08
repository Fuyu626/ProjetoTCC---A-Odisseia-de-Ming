/// @description Insert description here
// You can write your code in this editor

//VARIAVÉIS//
var right, left, jump, attack, dash;
var chao = place_meeting(x, y + 1, obj_block);

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(ord("W"));
attack = keyboard_check_pressed(ord("J"));
dash = keyboard_check_pressed(vk_shift);


if (ataque_buff > 0) ataque_buff -= 0.1;



//MOVIMENTAÇÃO//
velh = (right - left) * max_velh * global.vel_mult;


if (right && left)
{
	sprite_index = spr_player_idle01;
	estado = "idle";
}


//INICIANDO A MÁQUINA DE ESTADOS
switch(estado)
{
	#region idle
	case "idle":
	{
		//MID_VELH PARADO
		mid_velh = 0;
		//COMPORTAMENTO DO ESTADO
		sprite_index = spr_player_idle01;
		
		if (sprite_index == spr_player_idle01)
		{
			image_speed = 0.4;
			
			if (image_index >= image_number-1)
			{
				image_index = image_number-1; 
				image_speed = 0;
			}
		}
		
		//CONDIÇÃO DE TROCA DE ESTADO
		//up
		if (right || left)
		{
			estado = "up";	
		}
		else if (jump || !chao)
		{	
			estado = "jumping";
			velv = (-max_velv * jump);
			image_index = 0;

	 
		}
		else if (attack)
		{
			estado = "attack";
			velh = 0;
			image_index = 0;
		}
		else if (dash)
		{
			estado = "dash";
			image_index = 0;
		}
		
		break;	
	}	
	#endregion
	
	
	#region up
	case "up":
	{
		sprite_index = spr_player_up;
		image_speed = 5;
		
		//ANDANDO
		if (image_index >= image_number-1)
		{
			estado = "moving";
			image_index = 0;
		}
		
		break;
	}
	#endregion
	
	
	#region moving
	case "moving":
	{
		//COMPORTAMENTO DO ESTADO DE MOVIMENTO
		sprite_index = spr_player_run;
		

		//CONDIÇÃO DE TROCA DE ESTADO
		if (abs(velh) < .1)
		{
			estado = "idle";
			velh = 0;
		}
		else if (jump || !chao)
		{
			estado = "jumping";
			velv = (-max_velv * jump);
			image_index = 0;
		}	
		else if (attack)
		{
			estado = "attack";
			velh = 0;
		}
		else if (dash)
		{
			estado = "dash";
			image_index = 0;
		}
		break;	
	}
	#endregion
	
	
	#region jumping
	case "jumping":
	{
		//QUEDA
		if (velv > 0)
		{
			sprite_index = spr_player_fall;	
		}
		//PULO
		else
		{
			sprite_index = spr_player_jump;	
			//SEM REPETIÇÃO DE ANIMAÇÃO
			if (image_index >= image_number-1)
			{
				image_index = image_number-1;	
			}
		}
		
		//CONDIÇÃO DE TROCA DE ESTADO
		if (chao)
		{
			estado = "idle";
			velh = 0;
		}
		
		//WALL SLIDE
		var wall = place_meeting(x + sign(velh), y, obj_block);
		if (wall)
		{
			//WALL JUMP
			if (jump)
			{	
				//PRA CIMA
				velv = -max_velv;
				
				//DIREITA
				mid_velh = (max_velh * 2) * sign(velh) * -1;	
			}
			sprite_index = spr_player_wall;
			
			if (velv > 1)
			{
				velv = 1;
			}
			else
			{
				aplica_gravidade();	
			}
		}
		else
		{	
			aplica_gravidade();
			
			//DIMINUI O VALOR DE MID_VELH
			mid_velh = lerp(mid_velh, 0, 0.1);
		}
		break;
	}
	#endregion
	

	
	
	#region ataque
	case "attack":
	{
		velh = 0;
		
		if (combo == 0)
		{
			sprite_index = spr_player_atk01;
		}
		else if (combo == 1)
		{
			sprite_index = spr_player_atk02;
		}
		else if (combo == 2)
		{
			sprite_index = spr_player_atk03;
		}
		
		
		//CRIANDO O OBJETO DE DANO
		if (image_index >= 2 && dano == noone && posso)
		{
			dano = instance_create_layer(x + sprite_width/2, y - sprite_height/2, layer, obj_damage);
			dano.dano = ataque * ataque_mult;
			dano.pai = id;
			posso = false;
		}
		
		
		//CONFIGURADO COM BUFF
		if (attack && combo > 2)
		{
			ataque_buff = room_speed;	
		}
		
		//COMBO
		if (attack && combo < 2 && image_index >= image_number-1)
		{
			combo++;
			image_index = 0;
			posso = true;
			ataque_mult += .5;
			if (dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
			
			
			//ZERAR O BUFF
			ataque_buff = 0;
		}
		
		
		if (image_index > image_number-1)
		{
			estado = "postatk";	
			velh = 0;
			combo = 0;
			posso = true;
			ataque_mult = 1;
			if (dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
		}
		
		if (dash)
		{
			estado = "dash";
			image_index = 0;
			combo = 0;
			if (dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
		}
		if (jump || velv != 0)
		{
			estado = "jumping";
			image_index = 0;
		}
		if (velv > 0)
		{
			sprite_index = spr_player_fall;
		}
		break;	
	}
	#endregion
	
	
	#region postatk
	case "postatk":
	{
	    //DEFINE O ESTADO COMO POSTATK
	    sprite_index = spr_player_idle02;
    
	    //MANTEM O MING PARADO
	    velh = 0;
    
	    //CONDIÇÃO SAIDA DO ESTADO
	    if (image_index >= image_number-1)
	    {
	        estado = "idle";
	        image_index = 0;
	    }
    
	    break;
	}
	#endregion
	
	
	#region dash
	case "dash":
	{
		if (sprite_index != spr_player_dash)
		{
			sprite_index = spr_player_dash;
			image_index = 0;
		}
		
		//VELOCIDADE
		velh = image_xscale * dash_vel;
		
		//SAINDO DO ESTADO
		if (image_index > image_number-1)
		{
			estado = "idle";
		}
		break;
	}
	#endregion
	
	
	#region hit
	case "hit":
	{
		if (sprite_index != spr_player_hit)
		{
			sprite_index = spr_player_hit;
			image_index = 0;
			image_speed = 0.4;
			
			//SCREENSHAKE
			screenshake(5);	
		}
		
		//É PRA APANHAR E FICAR CALADO
		velh = 0;
		
		//PREPARO PRA MORRER OU SAIR DO ESTADO
		
		if (vida_atual >= 1)
		{
			if (image_index >= image_index-1)
			{
				estado = "idle";	
			}
		}
		else 
		{
			if (image_index >= image_number-1)
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
		//CHECANDO SE O CONTROLLER EXISTE
		if (instance_exists(obj_game_controller))
		{
			with(obj_game_controller)
			{
				game_over = true;
			}	
		}
		
		velh = 0;
		if (sprite_index != spr_player_dead)
		{
			image_index = 0;
			sprite_index =	spr_player_dead;
		}
		if (image_index >= image_number-1)
			{
				image_index = image_number-1; 
				image_speed = 0;
			}
		
		break;
	}
	#endregion


	//ESTADO PADRÃO
	default:
	{	
		estado = "idle";
	}
}
