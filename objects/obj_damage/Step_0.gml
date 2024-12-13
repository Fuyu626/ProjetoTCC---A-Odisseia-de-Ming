/// @description Insert description here
// You can write your code in this editor

//FAZ ESSA MERDA DEPOIS ANTES QUE EU ME ESTRESSE :D
var outro;
var outro_lista = ds_list_create();
var quantidade = instance_place_list(x, y, obj_entity, outro_lista, 0);


//APLICANDO DANO NO PESSOAR DA LISTA	
for (var i = 0; i < quantidade; i++)
{
    // CHECAGEM DO ATUAL
    var atual = outro_lista[| i];
    
    // IGNORAR COLISÕES COM O PAI OU COM ENTIDADES DO MESMO TIPO QUE O PAI
    if (object_get_parent(atual.object_index) != object_get_parent(pai.object_index))
    {       
		//SÓ RODA SE DAR DANO
		
		//CHECAGEM SE É POSSÍVEL DAR DANO
		
		//CHECAR SE O ATUAL TA NA LISTA
		var pos = ds_list_find_index(aplicar_dano, atual);
		if (pos == -1)
		{
			//AINDA NÃO TA NA LISTA
			//ADICIONA NA LISTA
			ds_list_add(aplicar_dano, atual);
			
		}
	}
}
        
//APLICANDO O DANO
var tam = ds_list_size(aplicar_dano);
for (var i = 0; i < tam; i++)
{
	outro = aplicar_dano[| i].id;
	if (outro.vida_atual > 0)
	{
		outro.estado = "hit";
		outro.image_index = 0;
		outro.vida_atual -= dano;
		
		//CHECANDO SE ACERTA O INIMIGO
		//CHECANDO SE É O FILHO DO PAI INIMIGO
		if (object_get_parent(outro.object_index) == obj_inimigo_pai)
		{
			screenshake(2);
		}
	}
}
   
//LIMPEZA DA LISTA
ds_list_destroy(aplicar_dano);
ds_list_destroy(outro_lista);

instance_destroy();
