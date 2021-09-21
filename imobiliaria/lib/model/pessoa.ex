defmodule Imobiliaria.Model.Pessoa do
  defstruct id: nil, nome: nil, cpf: nil

  def get_in_memory_data() do
    [
      %__MODULE__{ id: 1, nome: "Antonio", cpf: "123.123.123-44" },
      %__MODULE__{ id: 2, nome: "Marcelo", cpf: "321.321.321-11" }
    ]
  end
end
