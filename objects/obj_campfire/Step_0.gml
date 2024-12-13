/// @description Insert description here
// You can write your code in this editor

var player_proximo = false; // Para verificar se o jogador está próximo
var interagir = keyboard_check_pressed(ord("F")); // Tecla para interagir

player_proximo = place_meeting(x, y, obj_player);

switch (estado)
{
    #region apagado
    case "apagado":
    {
        sprite_index = spr_campfire_off; 
  
        
        if (player_proximo && interagir)
        {
            estado = "acendendo";
            image_index = 0; 
        }
        
        break;
    }
    #endregion

    #region acendendo
    case "acendendo":
    {
        sprite_index = spr_campfire_on; 

  
        if (image_index >= image_number - 1)
        {
            estado = "aceso";
            image_index = 0;
			
			//SALVANDO O JOGO
            if (file_exists("save.sav")) file_delete("save.sav");
            ini_open("save.sav");
			ini_write_real("Player", "x_atual", obj_player.x);
			ini_write_real("Player", "y_atual", obj_player.y);
			ini_write_real("Player", "vida_atual", obj_player.vida_atual);
			ini_write_real("Player", "sala_atual", room);
            ini_close();
            show_message("Jogo salvo");
        }
		
        break;
    }
    #endregion

    #region aceso
    case "aceso":
    {
       
        sprite_index = spr_campfire_idle; 
		
        break;
    }
    #endregion
	
    default:
    {
        estado = "apagado"; 
    }
}

/* if (file_exists("save.sav"))
{
ini_open("save.sav");

obj_player.x = ini_read_real("Player", "x_atual", 0);
obj_player.y = ini_read_real("Player", "y_atual", 0);
obj_player.vida_atual = ini_read_real("Player", "vida_atual", obj_player.vida_max);
room_goto(ini_read_real("Player", "sala_atual", 0));

ini_close();
}