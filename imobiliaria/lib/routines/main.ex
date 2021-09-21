defmodule Imobiliaria.Routines.Main do
  alias Imobiliaria
  alias Imobiliaria.Model.Imovel

  def imoveis_a_venda_por_tipo(tipo, imoveis, vendas) do
    filtro = fn imovel ->
      imovel.tipo == tipo and esta_a_venda?(imovel, vendas)
    end

    imoveis
    |> Enum.filter(filtro)
  end

  def terrenos_a_venda_por_tamanho(terrenos, vendas, tamanho) do
    filtro = fn terreno ->
      terreno.tamanho == tamanho and esta_a_venda?(terreno, vendas)
    end

    terrenos
    |> Enum.filter(filtro)
  end

  def imoveis_para_alugar_por_bairro(bairro, imoveis, alugueis) do
    filtro = fn imovel ->
      imovel.bairro == bairro and esta_para_alugar?(imovel, alugueis)
    end

    imoveis
    |> Enum.filter(filtro)
  end

  def imoveis_para_alugar_construcao_menor_que_2(imoveis, alugueis) do
    filtro = fn imovel ->
      esta_para_alugar?(imovel, alugueis) and Date.utc_today.year - imovel.ano < 2
    end

    imoveis
    |> Enum.filter(filtro)
  end

  def imoveis_vendidos_por_corretor(imoveis, corretor, vendas) do
    vendas_do_corretor = fn venda ->
      venda.corretor.nome == corretor
    end

    pegue_o_produto = fn venda ->
      venda.produto
    end

    filtre_por_imoveis = fn produto ->
      produto.__struct__ == Imovel
    end

    vendas
    |> Enum.filter(vendas_do_corretor)
    |> Enum.map(pegue_o_produto)
    |> Enum.filter(filtre_por_imoveis)
  end

  def esta_a_venda?(produto, vendas) do
    produto_em_venda = fn venda ->
      venda.produto == produto
    end

    esta_vendido = vendas
    |> Enum.any?(produto_em_venda)

    !esta_vendido
  end

  def esta_para_alugar?(imovel, alugueis) do
    imovel_para_alugar = fn aluguel ->
      imovel == aluguel.imovel and aluguel.data_final < NaiveDateTime.utc_now
    end

    esta_alugado = alugueis
    |> Enum.any?(imovel_para_alugar)

    !esta_alugado
  end
end
