/// @description Insert description here
// You can write your code in this editor

texto = [
			"Pressione A e S para caminhar.",
			"Pressione W para pular",
			"Pressione F para interagir",
			"Pressione J para atacar",
		];

index = 0;
index_letra = 1;
vel = 0.2;
texto_atual = string_copy(texto[index], 1, index_letra);

mostra_texto = true;
avanca_tecla = false;