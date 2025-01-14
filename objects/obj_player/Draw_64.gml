/// @description healthbar

if (!obj_game_controller.game_over && room != rm_credito && room != rm_menu)
{
    draw_sprite(spr_health_bar_black, 0, health_x, health_y);
    draw_sprite_stretched(spr_health_bar_full, 0, health_x, health_y, (vida_atual / vida_max) * healthbar_width, healthbar_height);
    draw_sprite(spr_health_bar_empty, 0, health_x, health_y);
    draw_sprite(spr_perfil_photo, 0, 30, 13);
}

