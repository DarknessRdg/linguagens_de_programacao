/*
 * BASE DE DADOS
 * terreno(Id, Zona, Area)
 * imovel(Id, Tipo, Ano, Area, Localização, Preço)
 * corretor(Id, Nome, Agência, Salário)
 * pessoa(Id, Nome, CPF)
 * venda(Id, Agencia, Data, Corretor, Imóvel, Proprietário, Cliente, Tipo)
 * aluguel(Id, Agencia, Data, Corretor, Imóvel, Proprietário, Cliente, Duração)
 * 
 * ROTINAS
 * Imóveis a venda por tipo
 * Terrenos a venda por tamanho
 * Imoveis para alugar no bairro
 * Imoveis para alugar com ano de construção < 2
 * Imoveis vendidos por determinado corretor
 */

data_atual(Key, Value) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(Key, DateTime, Value).

% terreno(Id, Zona, Area)
terreno(1, rural, 800).
terreno(2, rural, 700).
terreno(3, urbano, 400).
terreno(4, urbano, 550).

% imovel(Id, Tipo, Ano, Area, Localização, Preço)
imovel(1, casa, 2008, 400, ilhotas, 50000).
imovel(2, apartamento, 2009, 400, dirceu, 50000).
imovel(3, casa, 2018, 400, promorar, 50000).
imovel(4, casa, 2020, 400, promorar, 50000).
imovel(5, casa, 2008, 400, ilhotas, 50000).

% corretor(Id, Nome, Agência, Salário)
corretor(1, luan, suacasa, 500).

% pessoa(Id, Nome, CPF)
pessoa(1, antonio, 000.000.000-00).
pessoa(2, marcelo, 000.000.000-00).

% venda(Id, Agencia, Ano, Corretor, Imóvel, Proprietário, Cliente, Tipo)
venda(1, suacasa, 2009, 1, 1, 1, 2, terreno).
venda(2, suacasa, 2008, 1, 3, 1, 2, imovel).

% aluguel(Id, Agencia, Corretor, Imóvel, Proprietário, Cliente, Final)
aluguel(1, suacasa, 1, 1, 1, 2, date(2018, 9, 8, 0, 0, 0, _, _, _)).
aluguel(2, suacasa, 1, 3, 1, 2, date(2018, 8, 10, 0, 0, 0, _, _, _)).

% rotinas
imovel_a_venda_por_tipo(Id, Tipo) :- 
    imovel(Id, Tipo, _, _, _, _), 
    not(venda(_, _, _, _, Id, _, _, imovel)).

imovel_para_alugar_por_bairro(Id, Bairro) :- 
    imovel(Id, _, _, _, Bairro, _), 
    (
        % caso o aluguel exista, a data_final deve ser passado
        aluguel(_, _, _, Id, _, _, Final_aluguel),
        get_time(Data_atual),
        date_time_stamp(Final_aluguel, Data_final),
        Data_final < Data_atual; 
    
        % caso o aluguel não exista, retorna o imóvel
        not(aluguel(_, _, _, Id, _, _, Final_aluguel))
    ).

imovel_para_alugar_por_ano(Id) :- 
    imovel(Id, _, Construção, _, _, _),
    data_atual(year, Ano),
    (Ano - Construção) < 2,
    not(venda(_, _, _, _, Id, _, _, imovel)).

terreno_a_venda_por_tamanho(Id, Tamanho) :- 
    terreno(Id, _, Tamanho), 
    not(venda(_, _, _, _, Id, _, _, terreno)).

imoveis_vendidos_por_corretor(Id_imovel, Id_corretor) :- 
    corretor(Id_corretor, _, _, _),
    venda(_, _, _, _, Id_imovel, _, _, imovel).