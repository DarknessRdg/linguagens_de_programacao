defmodule Imobiliaria do
  alias Imobiliaria.Routines.Main
  alias Imobiliaria.Model.{Imovel, Venda, Terreno, Aluguel, Corretor}

  def main() do
    # Main.imoveis_a_venda_por_tipo("APARTAMENTO", Imovel.get_in_memory_data(), Venda.get_in_memory_data())
    # Main.terrenos_a_venda_por_tamanho(Terreno.get_in_memory_data(), Venda.get_in_memory_data(), 800)
    # Main.imoveis_para_alugar_por_bairro("promorar", Imovel.get_in_memory_data(), Aluguel.get_in_memory_data())
    # Main.imoveis_para_alugar_construcao_menor_que_2(Imovel.get_in_memory_data(), Aluguel.get_in_memory_data())
    # Main.imoveis_vendidos_por_corretor(Imovel.get_in_memory_data(), "Pedro", Venda.get_in_memory_data())
  end
end
