defmodule Imobiliaria.Model.Imovel do
  defstruct id: nil, ano: nil, area: nil, bairro: nil, preco: nil, tipo: nil

  def get_in_memory_data() do
    [
      %__MODULE__{ id: 1, area: 400,  ano: 2008, bairro: "ilhotas", preco: 50000, tipo: "CASA" }, # Vendida por Pedro
      %__MODULE__{ id: 2, area: 400, ano: 2009, bairro: "dirceu", preco: 50000, tipo: "APARTAMENTO" }, # Vendida por Luan
      %__MODULE__{ id: 3, area: 400, ano: 2021, bairro: "promorar", preco: 50000, tipo: "CASA" }, # < 2
      %__MODULE__{ id: 4, area: 400,  ano: 2020, bairro: "ilhotas", preco: 50000, tipo: "CASA" } # < 2
    ]
  end
end
