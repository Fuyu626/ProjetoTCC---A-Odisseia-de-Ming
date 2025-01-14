/// @description Insert description here
// You can write your code in this editor

if ((room == Room2) && (!game_over) && aura)  
{
	draw_set_color(c_aqua);
    draw_set_font(fnt_castlevania_media);
    draw_text(42, 100, "Aura: " + string(aura));
    draw_set_font(-1);
    draw_set_color(-1);
}
