import datetime

from models import Terreno, Imovel, Venda, Pessoa, Corretor, Alugel
from consultas import (
    imoveis_a_venda_por_tipo,
    terrenos_a_venda_por_tamanho,
    imoveis_para_alugar_por_bairro,
    imoveis_para_alugar_com_menos_de_2_anos_de_construcao,
    imoveis_vendidos_por_corretor
)

NOW = datetime.datetime.now()

TERRENOS = [
    Terreno(id=1, area=800, zona=Terreno.Zona.RURAL),
    Terreno(id=2, area=700, zona=Terreno.Zona.RURAL),
    Terreno(id=3, area=400, zona=Terreno.Zona.URBANA),
    Terreno(id=4, area=550, zona=Terreno.Zona.URBANA),
]

IMOVEIS = [
    Imovel(id=1, area=400,  ano=2008, localizacao='ilhotas',
           preco=50000, tipo=Imovel.Tipo.CASA),
    Imovel(id=2, area=400, ano=2009, localizacao='dirceu',
           preco=50000, tipo=Imovel.Tipo.APARTAMENTO),
    Imovel(id=3, area=400, ano=2021, localizacao='promorar',
           preco=50000, tipo=Imovel.Tipo.CASA),
    Imovel(id=4, area=400,  ano=2020, localizacao='ilhotas',
           preco=50000, tipo=Imovel.Tipo.CASA),
]

PESSOAS = [
    Pessoa(id=1, nome='Antonio', cpf='123.123.123-44'),
    Pessoa(id=2, nome='Marcelo', cpf='321.321.321-11'),
]

CORRETOR = [
    Corretor(codigo=1, nome='Luan', agencia='suacasa', salario=10000),
    Corretor(codigo=2, nome='Luan', agencia='suacasa', salario=10000),
]

VENDAS = [
    Venda(agencia='suacasa', data=NOW, corretor=CORRETOR[0], cliente=PESSOAS[0], propietario=PESSOAS[1], produto=TERRENOS[0]),
    Venda(agencia='suacasa', data=NOW, corretor=CORRETOR[1], cliente=PESSOAS[0], propietario=PESSOAS[1], produto=IMOVEIS[0]),
    Venda(agencia='suacasa', data=NOW, corretor=CORRETOR[0], cliente=PESSOAS[0], propietario=PESSOAS[1], produto=IMOVEIS[1])
]

ALUGUEIS = [
    Alugel(agencia='suacasa', final=NOW + datetime.timedelta(days=2), vendedor=CORRETOR[0], cliente=PESSOAS[0], propietario=PESSOAS[1], imovel=IMOVEIS[0])
]

if __name__ == '__main__':
    print(
        imoveis_a_venda_por_tipo(
            IMOVEIS,
            VENDAS,
            tipo=Imovel.Tipo.CASA
        )
    )

    print(
        terrenos_a_venda_por_tamanho(
            TERRENOS,
            VENDAS,
            tamanho=700
        )
    )

    print(
        imoveis_para_alugar_por_bairro(
            IMOVEIS,
            ALUGUEIS,
            bairro='ilhotas'
        )
    )

    print(
        imoveis_para_alugar_com_menos_de_2_anos_de_construcao(
            IMOVEIS,
            ALUGUEIS
        )
    )

    print(
        imoveis_vendidos_por_corretor(
            IMOVEIS,
            VENDAS,
            corretor=CORRETOR[0]
        )
    )
