/// @description Insert description here
// You can write your code in this editor

text_position_y -= scroll_speed;

if (text_position_y + (text_spacing * array_length(credits_text)) < 0) {
    room_goto(rm_menu);
}

if (keyboard_check_pressed(vk_escape)) {
    game_end();
}

audio_play_sound(snd_musga, 1, false);