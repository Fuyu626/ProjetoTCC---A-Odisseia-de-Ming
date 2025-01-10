/// @description Insert description here
// You can write your code in this editor

if (!variable_global_exists("mensagem_exibida")) {
    global.mensagem_exibida = false; 
}

if (global.mensagem_exibida) {
    instance_destroy(); 
}


mostra_texto = true;
index = 0;
index_letra = 1;
avanca_tecla = false;
texto = [
		 "Pressione A ou D para mover.", 
         "Pressione W para pular.", 
         "Pressione F para interagir.", 
		 "Pressione SHIFT para dar um dash.", 
		 "Pressione E para dar mudar o dialogo.", 
         "Pressione J para atacar."
		 ];

vel = 1; 
