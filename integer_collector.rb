# frozen_string_literal: true

require_relative 'algorithm'

# A classe `IntegerCollector` é responsável por coletar números inteiros fornecidos pelo usuário até que o comando de finalização seja inserido.
# O usuário é solicitado a inserir números inteiros ou o comando "sair" para terminar a coleta. Caso um valor não numérico seja inserido,
# a classe gera uma mensagem de erro, sugerindo a correção ou o comando "sair".
#
class IntegerCollector
  LOADING = ['◐', '◓', '◑', '◒'].freeze

  # Inicializa uma nova instância de IntegerCollector com uma lista vazia
  # para armazenar os números inteiros fornecidos pelo usuário.
  def initialize
    @integer_numbers_array = []
  end

  # Inicia o processo de coleta de entradas do usuário.
  # O loop continua até que o comando de finalização seja inserido.
  def start
    loop do
      current_prompt = request_input
      current_prompt.match?(/^[0-9]+$/) ? handle_numeric_input(current_prompt.to_i) : handle_non_numeric_input(current_prompt)
    end
  end

  private

  # Solicita ao usuário que insira um número inteiro ou o comando "sair".
  # Limpa o terminal antes de exibir o prompt.
  #
  # @return [String] A entrada do usuário.
  def request_input
    clear
    print "Digite o #{@integer_numbers_array.length + 1}º \e[34;3mnúmero inteiro\e[0m"\
    " ou escreva \e[32;3msair\e[0m para finalizar: "
    gets.chomp
  end

  # Adiciona um número inteiro à lista de números coletados.
  #
  # @param number [Integer] O número inteiro a ser adicionado.
  def handle_numeric_input(number)
    @integer_numbers_array << number
  end

  # Trata a entrada não numérica do usuário. Se o usuário digitar "sair",
  # a aplicação será finalizada. Caso contrário, uma mensagem de erro será
  # gerada e exibida.
  #
  # @param prompt [String] A entrada não numérica do usuário.
  def handle_non_numeric_input(prompt)
    terminate_application if prompt.downcase.eql?('sair')
    print generate_error_message(prompt)
    sleep 3
  end

  # Gera uma mensagem de erro para entradas não válidas, sugerindo possíveis
  # correções com base na similaridade com o comando "sair".
  #
  # @param prompt [String] A entrada não válida do usuário.
  # @return [String] A mensagem de erro gerada.
  def generate_error_message(prompt)
    levenshtein = Algorithm::Levenshtein.new('sair', prompt)
    msg = "\rO comando \e[31;3m#{prompt}\e[0m não é válido. "
    msg += if levenshtein.distance <= 3
             "Talvez você esteja tentando usar o comando \e[32;3msair\e[0m."
           else
             "Por favor, insira um \e[34;3mnúmero inteiro\e[0m ou \e[32;3msair\e[0m."
           end
    msg
  end

  # Exibe os números coletados ao longo do tempo e finaliza a aplicação.
  # Os números são exibidos progressivamente.
  def terminate_application
    clear
    if @integer_numbers_array.empty?
      display_non_number_provider
    else
      display_collected_numbers
      display_sorted_collected_numbers
    end
    exit 1
  end

  # Exibe progressivamente os números coletados, um por um.
  # Cada número é exibido por um curto período de tempo antes de exibir o próximo.
  def display_collected_numbers
    (0...@integer_numbers_array.length).each do |index|
      print "\rOs números \e[36;3mescolhidos\e[0m foram: #{@integer_numbers_array[0..index].join(', ')}"
      $stdout.flush
      sleep 0.75
    end
    puts
  end

  # Exibe o progresso da ordenação dos números coletados.
  # A cada iteração, o estado do carregamento é atualizado e exibido.
  def display_sorted_collected_numbers
    state = 0
    sorted = Algorithm::Sorted.new(@integer_numbers_array)
    integer_numbers_array_sorted = sorted.sort do |array|
      print "\r#{LOADING[state]} \e[33;3mOrdenando\e[0m... #{array.inspect}"
      $stdout.flush

      state = (state + 1) % 4

      sleep 0.75
    end
    puts "\n\e[32;3mOrdenado\e[0m: #{integer_numbers_array_sorted.inspect}"
  end

  # Exibe uma mensagem informando que o usuário saiu sem fornecer nenhum número inteiro.
  def display_non_number_provider
    puts "Você \e[32;3msaiu\e[0m sem fornecer nenhum \e[34;3mnúmero inteiro\e[0m.\n"\
    'Para tentar novamente, por favor, inicie o aplicativo novamente. Até a próxima!'
  end

  # Limpa o terminal, usando o comando apropriado para o sistema operacional.
  def clear
    system('clear') || system('cls')
    puts "\e[38;2;255;255;255m   ______      __     __                    __        _       __       _
  / ____/___  / /__  / /_____  _____   ____/ /__     (_)___  / /____  (_)________  _____
 / /   / __ \\/ / _ \\/ __/ __ \\/ ___/  / __  / _ \\   / / __ \\/ __/ _ \\/ / ___/ __ \\/ ___/
/ /___/ /_/ / /  __/ /_/ /_/ / /     / /_/ /  __/  / / / / / /_/  __/ / /  / /_/ (__  )
\\____/\\____/_/\\___/\\__/\\____/_/      \\__,_/\\___/  /_/_/ /_/\\__/\\___/_/_/   \\____/____/\n\n"
  end
end
