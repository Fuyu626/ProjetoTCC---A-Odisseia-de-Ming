/// @description Insert description here
// You can write your code in this editor

randomize();


//CAMERA
var cam = instance_create_layer(x, y, layer, obj_camera);
cam.alvo = id;


// Inherit the parent event
event_inherited();

vida_max = 2;
vida_atual = vida_max;

healthbar_width = 500;
healthbar_height = 48;

health_x = (730/2) - (healthbar_width/2);
health_y = ystart - 571;

dash_vel = 4;

max_velh = 4;
max_velv = 4.7;

mostra_estado = true;

combo = 0;
dano = noone;
ataque = 1;
posso = true;
ataque_mult = 1;
ataque_buff = room_speed;

jump_max = 2;
jump_present = jump_max;
double_jump_timer = 0; 
double_jump_delay = 15;

