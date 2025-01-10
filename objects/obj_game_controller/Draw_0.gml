/// @description Insert description here
// You can write your code in this editor

//TELA DE GAMEOVER

if (game_over)
{
	var x1 = camera_get_view_x(view_camera[0]);
	var w = camera_get_view_width(view_camera[0]);
	var x2 = x1 + w;
	var meio_w = x1 + w / 2;
	var y1 = camera_get_view_y(view_camera[0]);
	var h = camera_get_view_height(view_camera[0]);
	var y2 = y1 + h;
	var meio_h = y1 + h / 2;
	
	var qtd = h * .15;
	
	valor = lerp(valor, 1, .01);
	
	draw_set_color(c_black);
	//ESCURECENDO A TELA
	draw_set_alpha(valor - .1);
	draw_rectangle(x1, y1, x2, y2, false);
	
	//DESENHA A PARTE SUPERIOR
	draw_set_alpha(1);
	draw_rectangle(x1, y1, x2, y1 + qtd * valor, false);
	
	
	//PARTE INFERIOR
	draw_rectangle(x1, y2, x2, y2 - qtd * valor, false);
	
	draw_set_alpha(1);
	draw_set_color(-1);
	
	//VELOCIDADE DE APARIÇÃO NA TELA DO GATO
	if (valor >= .50)	
	{
		contador = lerp(contador, 1, .01);
		//TEXTO DE GAME OVER
		draw_set_alpha(contador);
		draw_set_font(fnt_gameover);
		draw_set_valign(1);
		draw_set_halign(1);
	
		//SOMBRA
		draw_set_color(make_color_rgb(0x157, 0x06, 0x186));
		draw_text(meio_w + 1, meio_h + 1, "G A M E - O V E R");
	
		//TEXTO NORMAR
		draw_set_color(c_white);
		draw_text(meio_w, meio_h, "G A M E - O V E R");	
		draw_set_font(-1);
		
		draw_text(meio_w, meio_h + 50, "Clique SPACE para reiniciar");
		draw_set_valign(-1);
		draw_set_halign(-1);
	
		draw_set_alpha(-1);
	}

}

if (room = rm_menu)
{
	draw_sprite(spr_tecla, floor(image_index), 1, 190)
	draw_sprite(spr_tecla2, 0, 52, 190)
}