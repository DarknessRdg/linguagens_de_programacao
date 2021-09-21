defmodule Imobiliaria.Model.Aluguel do
  alias Imobiliaria.Model.{Corretor, Pessoa, Imovel}

  defstruct id: nil, agencia: nil, data_final: nil, corretor: nil, cliente: nil, imovel: nil, proprietario: nil

  def get_in_memory_data() do
    data_final =  NaiveDateTime.new(2021, 9, 21, 12, 30, 12)

    corretores = Corretor.get_in_memory_data()
    pessoas = Pessoa.get_in_memory_data()
    imoveis = Imovel.get_in_memory_data()

    [
      %__MODULE__{
        id: 1,
        agencia: "suacasa",
        data_final: data_final,
        corretor: Enum.at(corretores, 0),
        cliente: Enum.at(pessoas, 1),
        imovel: Enum.at(imoveis, 0) ,
        proprietario: Enum.at(pessoas, 0)
      }
    ]
  end
end
