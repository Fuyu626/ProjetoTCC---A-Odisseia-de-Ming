/// @description Insert description here
// You can write your code in this editor

if (room == Room2) // Verifique se o jogador está na Room2
{
    // Defina a largura máxima da barra de aura (ajuste conforme necessário)
    var max_width = 200; // Largura máxima da barra
    // Calcule a largura atual da barra com base nas auras coletadas
    var current_width = (aura / total_aura) * max_width; // A largura aumenta conforme a aura coleta

    // Desenha a barra de aura (sprite esticado)
    draw_set_color(c_aqua); // Define a cor da barra
    draw_sprite_stretched(spr_bar_aura, 0, 50, 50, current_width, 20); // Desenha a barra esticada na posição (50, 50)
    
    // Exibe o número de auras coletadas (opcional)
    draw_set_font(fnt_castlevania_grande);
    draw_text(50, 50 + 30, "Aura: " + string(aura)); // Exibe abaixo da barra
    draw_set_font(-1);
    draw_set_color(-1);
}
