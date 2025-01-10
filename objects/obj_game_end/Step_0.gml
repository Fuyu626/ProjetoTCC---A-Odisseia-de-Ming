/// @description Insert description here
// You can write your code in this editor

if (collision_rectangle(x-50, y-50, x+50, y+50, obj_player, false, true))
{
  
    if (obj_game_controller.aura == obj_game_controller.total_aura)
    {
     
        instance_create_layer(x, y, "Creditos", obj_game_end);
        room_goto(rm_credito);
    }
}
