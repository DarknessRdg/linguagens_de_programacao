defmodule Imobiliaria.Model.Corretor do
  defstruct codigo: nil, nome: nil, agencia: nil, salario: nil

  def get_in_memory_data() do
    [
      %__MODULE__{ codigo: 1, nome: "Luan", agencia: "suacasa", salario: 10000 },
      %__MODULE__{ codigo: 2, nome: "Pedro", agencia: "suacasa", salario: 10000 },
    ]
  end
end
