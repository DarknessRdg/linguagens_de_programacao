defmodule Imobiliaria.Model.Venda do
  alias Imobiliaria.Model.{Corretor, Pessoa, Imovel, Terreno}

  defstruct agencia: nil, data: nil, corretor: nil, proprietario: nil, cliente: nil, produto: nil

  def get_in_memory_data() do
    terrenos = Terreno.get_in_memory_data()
    corretores = Corretor.get_in_memory_data()
    pessoas = Pessoa.get_in_memory_data()
    imoveis = Imovel.get_in_memory_data()
    [
      %__MODULE__{ agencia: "suacasa", data: Date.utc_today(), corretor: Enum.at(corretores, 0), cliente: Enum.at(pessoas, 0), proprietario: Enum.at(pessoas, 1), produto: Enum.at(terrenos, 0) },
      %__MODULE__{ agencia: "suacasa", data: Date.utc_today(), corretor: Enum.at(corretores, 1), cliente: Enum.at(pessoas, 0), proprietario: Enum.at(pessoas, 1), produto: Enum.at(imoveis, 0) },
      %__MODULE__{ agencia: "suacasa", data: Date.utc_today(), corretor: Enum.at(corretores, 0), cliente: Enum.at(pessoas, 0), proprietario: Enum.at(pessoas, 1), produto: Enum.at(imoveis, 1) }
    ]
  end
end
