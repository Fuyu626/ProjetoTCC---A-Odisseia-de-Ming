if (mostra_texto)
{
    if (index == 0)
    {
        if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D")))
        {
            avanca_tecla = true;
        }
    }
    if (index == 1)
    {
        if (keyboard_check_pressed(ord("W")))
        {
            avanca_tecla = true;
        }
    }
    if (index == 2)
    {
        if (keyboard_check_pressed(ord("F")))
        {
            avanca_tecla = true;
        }
    }
	if (index == 3)
    {
        if (keyboard_check_pressed(vk_shift))
        {
            avanca_tecla = true;
        }
    }
    if (index == 4)
    {
        if (keyboard_check_pressed(ord("J")))
        {
            mostra_texto = false;
            global.mensagem_exibida = true; 
            instance_destroy(); 
        }
    }
    
    if (avanca_tecla && index >= 0)
    {
        index++;
        index_letra = 1;
        avanca_tecla = false;
    }
}    

if (index_letra < string_length(texto[index]))
{
    index_letra += vel;    
}

texto_atual = string_copy(texto[index], 1, index_letra);
