/// @description Insert description here
// You can write your code in this editor

//SELEÇÃO DO MENU
sel = 0;
marg_val = 32;
marg_total = 32;

//Controlando a página do menu
pag = 0;


#region GUIDE
//DESENHA MENU
draw_menu = function(_menu)
{
	//FONTE
	draw_set_font(fnt_castlevania);

	//ALINHANDO O TEXTO
	define_align(0, 0);



	var _qtd = array_length(_menu);

	//ALTURA DA TELA
	var _alt = display_get_gui_height()
	
	//VARIAVEL LARGURA
	var _larg = display_get_gui_width()

	//ESPAÇAMENTO ENTRE LINHAS
	var _espaco_y = string_height("I") + 16;
	var _alt_menu = _espaco_y * _qtd;


	//DESENHANDO O MENU	
	for (var i = 0; i < _qtd; i++)
	{
		var _cor = c_white, _marg_x = 0;
		var _texto = _menu[i][0];	
	
		//CHECK DA SELAÇÃO
		if (menus_sel[pag] == i)
		{
			_cor = c_purple;	
			_marg_x = marg_val;
		}
		draw_text_color(600 + _marg_x, (_alt / 2) - _alt_menu / 2 + (i * _espaco_y), _texto, _cor, _cor, _cor, _cor, 1);
	}
	
	//OUTRO LADO DO MENU
	//RODANDO PELO MEU VETOR
	for (var i = 0; i < _qtd; i++)
	{
		//CHECANDO SE PRECISAR DESENHAR AS OPÇÕES 
		switch(_menu[i][1])
		{
			case menu_acoes.ajustes_menu:
			{
				//DESENHANDO OPÇÕES DO LADO DIREITO
				//SALVANDO OPÇÃO
				var _indice = _menu[i][3];
				var _txt = _menu[i][4][_indice];
				
				//INDO PRA ESQUERDA SÓ SE INDICE -/- 0
				var _esq = _indice > 0 ? "< " : "";
				
				//INDO PRA DIREITA SÓ SE NAO TA NO FIM DO VETOR
				var _dir = _indice < array_length(_menu[i][4]) - 1 ? " >" : "";
				
				var _cor = c_white;
				
				//SE ESTOU NESSA OPÇÃO, TROCA COR
				if (alterando && menus_sel[pag] == i) _cor = c_red;		
				draw_text_color(_larg/1.4, (_alt / 2) - _alt_menu / 2 + (i * _espaco_y), _esq + _txt + _dir, _cor, _cor, _cor, _cor, 1)
				
				break;
			}
				
		}
	}

	//RESET DO DRAW_SET
	draw_set_font(-1);
	define_align(-1, -1);	
}

//CONTROLE DO MENU
control_menu = function(_menu)
{
	//TROCANDO A SELAÇÃO
	var _up, _down, _avanca, _recua, _left, _right;
	
	var _sel = menus_sel[pag];
	
	static _animar = false;

	_up = keyboard_check_pressed(vk_up);
	_down = keyboard_check_pressed(vk_down);
	_avanca = keyboard_check_released(vk_enter);
	_recua = keyboard_check_released(vk_escape);
	_left = keyboard_check_pressed(vk_left);
	_right = keyboard_check_pressed(vk_right);

	if (!alterando)
	{	
	
	
		if (_up or _down)
		{
			menus_sel[pag] += _down - _up;	
	
			//LIMITANDO O VETOR DE SEL
			var _tam = array_length(_menu) - 1;
			menus_sel[pag] = clamp(menus_sel[pag], 0, _tam);
		
			_animar = true;
		}
	}
	else 
	{	
		//ALTERANDO AS OPÇÕES
		_animar = false; 
		
		//TROCANDO OPÇÃO DIREITA ESQUERDA
		if (_right or _left)
		{
			//LIMITE
			var _limite = array_length(_menu[_sel][4]) - 1;
			//MUDANDO INDICE
			menus[pag][_sel][3] += _right - _left;
			//GARANTINDO NAO SAIR DO LIMITE
			menus[pag][_sel][3] = clamp(menus[pag][_sel][3], 0, _limite);
		}
		
	}
	
	
		
	//FUNÇÕES AO APERTAR ENTER
	if (_avanca)
	{
		switch(_menu[_sel][1])
		{
			case menu_acoes.roda_metodo: _menu[_sel][2](); break;	
			case menu_acoes.carrega_menu: pag = _menu[_sel][2]; break;
			case menu_acoes.ajustes_menu: 
				alterando = !alterando;
				
				
				//EXECUTANDO O MÉTODO
				if (!alterando)
				{
					//ARGUMENTO DO MÉTODO
					var _arg = _menu[_sel][3];	
					_menu[_sel][2](_arg);	
				}
				break; 
		}
	}
	
	//AUMENTA SEMPRE O MARG_VAL
	if (_animar)
	{
		marg_val = marg_total * valor_ac(ac_marg, _up ^^ _down, 0); 
	}
}

inicia_jogo = function()
{
	room_goto(Room1);
}

fecha_jogo = function()
{
	game_end();
}
teste = function()
{
	show_message("Teste");	
}
carregar_jogo = function()
{
	ini_open("save.sav");
	
}

ajuste_tela = function(_valor)
{
	//CHECA SE TELA TA CHEIA
	switch(_valor)
	{
		//TELA CHEIA
		case 0: window_set_fullscreen(true); break;
		//JANELA
		case 1: window_set_fullscreen(false); break;
	}
	
}

#endregion

//ENTER INICIAR RODA METODO
//ENTER OPÇÕES RODA METODO
//ENTER SAIR FECHA JOGO

menu_principal = [
					["Iniciar", menu_acoes.roda_metodo, inicia_jogo],
					["Carregar", menu_acoes.roda_metodo, carregar_jogo],
					["Opções", menu_acoes.carrega_menu, menus_lista.opcoes],
					["Sair", menu_acoes.roda_metodo, fecha_jogo]	
				 ];

menu_opcoes = [
				["Tipo de janela", menu_acoes.carrega_menu, menus_lista.tela],
				["Dificuldade", menu_acoes.carrega_menu, menus_lista.dificuldade],
				["Volta", menu_acoes.carrega_menu, menus_lista.principal]
			  ];
			  
menu_dificuldade = [
						["Dificuldade", menu_acoes.ajustes_menu, teste, 1, ["Fácil", "Normal", "Dificil", "Impossivel"]],
						["Voltar", menu_acoes.carrega_menu, menus_lista.opcoes]
				   ];

menu_tela = [	
				["Tipos de tela", menu_acoes.ajustes_menu, ajuste_tela, 1, ["Tela cheia", "Janela"]],
				["Voltar", menu_acoes.carrega_menu, menus_lista.opcoes]
			];
//SALVANDO MENUS
menus = [menu_principal, menu_opcoes, menu_tela, menu_dificuldade];

alterando = false;

//SALVANDO A SELEÇÃO DE CADA MENU
menus_sel = array_create(array_length(menus), 0);

