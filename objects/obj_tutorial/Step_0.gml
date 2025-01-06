/// @description Insert description here
// You can write your code in this editor

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
			mostra_texto = false;
			instance_destroy();
		}
	}
	
	if (avanca_tecla && index == 0)
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