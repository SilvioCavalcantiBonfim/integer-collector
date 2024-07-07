module Algorithm
  # A classe `Levenshtein` calcula a distância de Levenshtein entre duas strings.
  # A distância de Levenshtein é uma medida de diferença entre duas sequências,
  # calculando o número mínimo de operações de edição (inserção, exclusão ou substituição)
  # necessárias para transformar uma string na outra.
  #
  # Exemplo de uso:
  # levenshtein = Algorithm::Levenshtein.new("kitten", "sitting")
  # puts levenshtein.distance # => 3
  class Levenshtein
    # Inicializa uma nova instância da classe Levenshtein com duas strings.
    # Cria a matriz de distâncias inicializada com os índices das linhas e colunas.
    #
    # @param str1 [String] A primeira string para comparação.
    # @param str2 [String] A segunda string para comparação.
    def initialize(str1, str2)
      @str1 = str1
      @str2 = str2

      @matrix_distance = create_matrix_distance
    end

    # Calcula a distância de Levenshtein entre as duas strings fornecidas na inicialização.
    # Preenche a matriz de distâncias e retorna o valor da distância entre as duas strings.
    #
    # @return [Integer] A distância de Levenshtein entre as duas strings.
    def distance
      fill_matrix_distance
      @matrix_distance[@str1.length][@str2.length]
    end

    private

    # Cria a matriz de distâncias inicializada com os índices das linhas e colunas.
    #
    # @return [Array<Array<Integer>>] A matriz de distâncias inicializada.
    def create_matrix_distance
      matrix_distance = Array.new(@str1.length + 1) { Array.new(@str2.length + 1) }

      (0..@str1.length).each { |i| matrix_distance[i][0] = i }
      (0..@str2.length).each { |j| matrix_distance[0][j] = j }

      matrix_distance
    end

    # Preenche a matriz de distâncias com base nas strings fornecidas.
    # Calcula os custos de inserção, exclusão e substituição para cada posição da matriz.
    def fill_matrix_distance
      (1..@str1.length).each do |i|
        (1..@str2.length).each do |j|
          @matrix_distance[i][j] = calculate_min_cost(i, j)
        end
      end
    end

    # Calcula o custo mínimo para uma posição específica da matriz.
    #
    # @param i [Integer] O índice da linha atual.
    # @param j [Integer] O índice da coluna atual.
    # @return [Integer] O custo mínimo para a posição dada.
    def calculate_min_cost(i, j)
      cost = @str1[i - 1] == @str2[j - 1] ? 0 : 1
      [
        @matrix_distance[i - 1][j] + 1,       # Custo da inserção.
        @matrix_distance[i][j - 1] + 1,       # Custo da exclusão.
        @matrix_distance[i - 1][j - 1] + cost # Custo da substituição.
      ].min
    end
  end
end
