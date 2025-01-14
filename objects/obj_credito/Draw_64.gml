/// @description Rolagem de texto centralizada


var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();


draw_set_font(font);
draw_set_color(c_white);


//LINHA TEXTO
for (var i = 0; i < array_length(credits_text); i++) {
    var text_x = gui_width / 2; 
    var text_y = text_position_y + (i * text_spacing); 

 
    draw_set_halign(fa_center);
    draw_text(text_x, text_y, credits_text[i]);
}

text_position_y -= scroll_speed;


if (text_position_y + (array_length(credits_text) * text_spacing) < 0) {
    text_position_y = gui_height; 
}
