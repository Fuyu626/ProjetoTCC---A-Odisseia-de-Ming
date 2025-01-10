/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_escritasdecifraveis);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

for (var i = 0; i < array_length(credits_text); i++) {
    draw_text(room_width / 2, text_position_y + (i * text_spacing), credits_text[i]);
}
