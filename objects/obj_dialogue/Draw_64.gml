/// @description Insert description here
// You can write your code in this editor

//DEFININDO VARIAVEIS DO TAMANHO DA CAIXA DE DIALOGO
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();
var xx = gui_largura / 2;
var yy = 0;
var largura_ret = gui_largura / 2;
var altura_ret = gui_altura / 4;
var esp_borda = 0;

//BORDA DO RETANGULO
draw_set_color(c_white);
draw_rectangle(xx - largura_ret / 2 - esp_borda, yy - esp_borda, xx + largura_ret / 2 + esp_borda, yy + altura_ret + esp_borda, true);

//RETANGULO DO DIALOGO
draw_set_color(c_black);
draw_rectangle(xx - largura_ret / 2, yy, xx + largura_ret / 2, yy + altura_ret, false);

//SPRITES
if (index < array_length(sprite) && sprite[index] != noone) {
    var sprite_x = xx - largura_ret / 3 - sprite_get_width(sprite[index]) - 10; 
    var sprite_y = yy + altura_ret / 3 - sprite_get_height(sprite[index]) / 2;  
    draw_sprite(sprite[index], 0, sprite_x, sprite_y);
}

//MUCHO TEXTO
draw_set_font(fnt_castlevania_pequena);
draw_set_color(c_white);

var texto_atual = string_copy(texto[index], 1, index_letra);

if (index_letra < string_width(texto[index]))
{
	index_letra = index_letra + vel;	
}

//TEXTO CENTRALIZADO
draw_set_halign(fa_center);
var texto_x = xx;
var texto_y = (altura_ret / 4) - (string_height(texto[index]));
draw_text(texto_x, texto_y, texto_atual);
draw_set_halign(-1);
