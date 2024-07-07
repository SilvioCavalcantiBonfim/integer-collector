# frozen_string_literal: true

module Algorithm
  # A classe `Sorted` é responsável por ordenar um array de números inteiros
  # utilizando o algoritmo de ordenação por bolha (Bubble Sort). A classe
  # permite que a ordenação seja realizada de forma incremental e fornece
  # a opção de executar um bloco de código a cada iteração do processo de
  # ordenação.
  #
  class Sorted
    # Inicializa uma nova instância da classe `Sorted` com uma cópia do array
    # fornecido.
    #
    # @param array [Array<Integer>] O array de números inteiros a ser ordenado.
    def initialize(array)
      @array = array.clone
    end

    # Ordena o array utilizando o algoritmo de ordenação por bolha (Bubble Sort).
    # O método continua a ordenar o array até que não haja mais trocas a serem feitas.
    # Se um bloco for fornecido, ele será executado a cada iteração do processo de ordenação.
    #
    # @yield [Array<Integer>] O bloco de código a ser executado a cada iteração de ordenação.
    # @return [Array<Integer>] O array ordenado.
    def sort
      loop do
        swapped = false
        (0..(@array.length - 2)).each do |index|
          next unless @array[index] > @array[index + 1]

          swap(index, index + 1)
          swapped = true
          yield(@array) if block_given?
        end

        break unless swapped
      end

      @array
    end

    private

    # Troca os elementos de posição no array.
    #
    # @param cell_i [Integer] O índice do primeiro elemento a ser trocado.
    # @param cell_j [Integer] O índice do segundo elemento a ser trocado.
    def swap(cell_i, cell_j)
      aux = @array[cell_i]
      @array[cell_i] = @array[cell_j]
      @array[cell_j] = aux
    end
  end
end
