/// @description Insert description here
// You can write your code in this editor

image_xscale = pai2.xscale;

var outro = instance_place(x, y, obj_entity);

//COLISÃO COM ALGUÉM
if (outro)
{
    //SEM COLISÃO 
    if (outro.id != pai2 && outro.object_index != pai2.object_index)
    {
		if (outro.vida_atual > 0)
		{
			outro.estado = "hit";
			outro.image_index = 0;
			outro.vida_atual -= dano;
			instance_destroy();    
		}
	
    }
}



