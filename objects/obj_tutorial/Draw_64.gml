/// @description Insert description here
// You can write your code in this editor

//DEFININDO VARIAVEIS DO TAMANHO DA CAIXA DE DIALOGO
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();
var yy = 200;
var largura_ret = gui_largura / 2;
var altura_ret = gui_altura / 4;
var xx = largura_ret / 2;


//MUCHO TEXTO
draw_set_font(fnt_escritasdecifraveis);
draw_set_color(c_white);

var texto_atual = string_copy(texto[index], 1, index_letra);

if (index_letra < string_width(texto[index]))
{
	index_letra = index_letra + vel;	
}

//TEXTO CENTRALIZADO
draw_set_halign(fa_center);
var texto_x = xx;
var texto_y = yy + (altura_ret / 2) - (string_height(texto[index]));
draw_text(texto_x, texto_y, texto_atual);

draw_set_halign(-1);