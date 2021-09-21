import datetime
from typing import List, Union

from models import Imovel, Venda, Terreno, Aluguel, Corretor


def imoveis_a_venda_por_tipo(
        imoveis: List[Imovel],
        vendas: List[Venda],
        tipo: Imovel.Tipo
) -> List[Imovel]:
    result = []
    for imovel in imoveis:
        if imovel.tipo == tipo and not _esta_vendido(vendas, imovel):
            result.append(imovel)
    return result


def terrenos_a_venda_por_tamanho(
        terrons: List[Terreno],
        vendas: List[Venda],
        tamanho: int
) -> List[Terreno]:
    result = []
    for terreno in terrons:
        if terreno.area == tamanho and not _esta_vendido(vendas, terreno):
            result.append(terreno)
    return result


def imoveis_para_alugar_por_bairro(
        imoveis: List[Imovel],
        alugueis: List[Aluguel],
        bairro: str
) -> List[Imovel]:
    result = []
    for imovel in imoveis:
        if imovel.localizacao == bairro and not _esta_alugado(alugueis, imovel):
            result.append(imovel)

    return result


def imoveis_para_alugar_com_menos_de_2_anos_de_construcao(
        imoveis: List[Imovel],
        alugueis: List[Aluguel]
) -> List[Imovel]:
    result = []
    ano_atual = datetime.date.today().year

    for imovel in imoveis:
        if ano_atual - imovel.ano < 2 and not _esta_alugado(alugueis, imovel):
            result.append(imovel)

    return result


def imoveis_vendidos_por_corretor(
        imoveis: List[Imovel],
        vendas: List[Venda],
        corretor: Corretor
):
    vendas_do_corretor = []
    for venda in vendas:
        if venda.corretor == corretor:
            vendas_do_corretor.append(venda)

    result = []
    for imovel in imoveis:
        if _esta_vendido(vendas_do_corretor, imovel):
            result.append(imovel)
    return result


def _esta_alugado(
        alugueis: List[Aluguel],
        imovel: Imovel
) -> bool:
    now = datetime.datetime.now()

    for alugel in alugueis:
        if alugel.imovel == imovel and alugel.final > now:
            return True
    return False


def _esta_vendido(
        vendas: List[Venda],
        imovel: Union[Imovel, Terreno]
) -> bool:
    for venda in vendas:
        if venda.produto == imovel:
            return True
    return False
