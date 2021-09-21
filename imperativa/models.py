import datetime
import enum
from dataclasses import dataclass
from typing import Union


@dataclass
class Imovel(object):
    class Tipo(enum.Enum):
        APARTAMENTO = 1
        CASA = 2

        def __repr__(self):
            return f'Imovel.Tipo.{self.name}'

    id: int
    ano: int
    area: float
    localizacao: str
    preco: float
    tipo: Tipo

    def __eq__(self, other):
        return isinstance(other, Imovel) and other.id == self.id


@dataclass
class Terreno(object):
    class Zona(enum.Enum):
        URBANA = 1
        RURAL = 2

        def __repr__(self):
            return f'Terreno.Zona.{self.name}'

    id: int
    area: float
    zona: Zona

    def __eq__(self, other):
        return isinstance(other, Terreno) and other.id == self.id


@dataclass
class Corretor(object):
    codigo: int
    nome: str
    agencia: str
    salario: float

    def __eq__(self, other):
        return isinstance(other, Corretor) and other.codigo == self.codigo


@dataclass
class Pessoa:
    id: int
    nome: str
    cpf: str

    def __eq__(self, other):
        return isinstance(other, Pessoa) and other.cpf == self.cpf


@dataclass
class Venda:
    agencia: str
    data: datetime.datetime
    corretor: Corretor
    produto: Union[Imovel, Terreno]
    propietario: Pessoa
    cliente: Pessoa


@dataclass
class Aluguel:
    agencia: str
    final: datetime.datetime
    vendedor: Corretor
    imovel: Imovel
    propietario: Pessoa
    cliente: Pessoa
