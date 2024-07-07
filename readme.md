# Projeto de Coleta e Ordenação de Números Inteiros

![Ruby](https://img.shields.io/badge/-Ruby-white?style=for-the-badge&logo=ruby&color=CC342D&logoColor=white)

Este projeto é uma solução para os desafios do curso de Desenvolvimento Backend em Ruby da FAP/Softex. Os desafios consistiam em:

1. Receber números inteiros e armazená-los em um vetor.
2. Ordenar o vetor utilizando o algoritmo Bubble Sort.

Como uma implementação adicional, foi incluída a classe `Levenshtein`, que calcula a distância de Levenshtein entre duas strings.

## Funcionalidades

O projeto implementa as seguintes funcionalidades:

- **Coleta de Números Inteiros**: Permite ao usuário inserir números inteiros.
- **Comando de Saída**: Permite ao usuário encerrar a coleta digitando o comando "sair".
- **Validação de Entrada**: Identifica entradas não numéricas e sugere correções.
- **Ordenação**: Ordena os números coletados utilizando o algoritmo Bubble Sort.
- **Exibição de Resultados**: Exibe progressivamente os números coletados e o resultado final da ordenação.
- **Distância de Levenshtein** (Implementação Adicional): Calcula a distância de Levenshtein entre strings para ajudar na validação de entrada.

## Checklist de Implementações

- [x] **Classe `IntegerCollector`**
  - [x] Solicita a entrada do usuário para números inteiros ou comando "sair".
  - [x] Valida se a entrada é um número inteiro ou um comando.
  - [x] Armazena números inteiros em uma lista.
  - [x] Encerra a coleta e exibe os números ao digitar "sair".
  - [x] Exibe uma mensagem de erro para entradas inválidas.
  - [x] Ordena os números utilizando a classe `Algorithm::Sorted`.
  - [x] Mostra a ordenação de forma progressiva.
  - [x] Limpa o terminal para uma visualização mais clara.

- [x] **Classe `Algorithm::Sorted`**
  - [x] Implementa o algoritmo de ordenação por bolha (Bubble Sort).
  - [x] Permite a execução de um bloco de código durante a ordenação para feedback visual.

- [x] **Classe `Algorithm::Levenshtein`** (Implementação Adicional)
  - [x] Calcula a distância de Levenshtein entre duas strings.
  - [x] Utiliza a matriz de distâncias para calcular o número mínimo de operações de edição necessárias para transformar uma string na outra.

## Como Usar

1. **Clone o Repositório**
   ```bash
   git clone https://github.com/SilvioCavalcantiBonfim/integer-collector
   ```

2. **Navegue até o Diretório do Projeto**
   ```bash
   cd integer-collector
   ```

3. **Execute o Programa**
   ```bash
   ruby main.rb
   ```

4. **Insira Números Inteiros**
   - Digite números inteiros e pressione Enter para adicionar.
   - Continue inserindo números conforme desejado.

5. **Finalize a Coleta**
   - Digite `sair` e pressione Enter para encerrar o programa.

6. **Visualize os Resultados**
   - O programa exibirá os números coletados e a lista ordenada.

## Exemplo de Execução

```plaintext
Digite o 1º número inteiro ou escreva sair para finalizar: 5
Digite o 2º número inteiro ou escreva sair para finalizar: 3
Digite o 3º número inteiro ou escreva sair para finalizar: 8
Digite o 4º número inteiro ou escreva sair para finalizar: sair

Os números escolhidos foram: 5, 3, 8
◐ Ordenando... [5, 3, 8]
◓ Ordenando... [3, 5, 8]
Ordenado: [3, 5, 8]
```

## Documentação das Classes

### Classe `Algorithm::Levenshtein`

A classe `Levenshtein` calcula a distância de Levenshtein entre duas strings. A distância de Levenshtein é uma medida de diferença entre duas sequências, calculando o número mínimo de operações de edição (inserção, exclusão ou substituição) necessárias para transformar uma string na outra.

**Exemplo de uso:**
```ruby
levenshtein = Algorithm::Levenshtein.new("kitten", "sitting")
puts levenshtein.distance # => 3
```

### Classe `Algorithm::Sorted`

A classe `Sorted` implementa o algoritmo de ordenação por bolha (Bubble Sort). Permite a execução de um bloco de código durante a ordenação para feedback visual.

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

---

Projeto desenvolvido como parte do curso de Desenvolvimento Backend em Ruby da FAP/Softex.