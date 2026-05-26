aba_complementos <- tabPanel("Complementos", icon = icon("flash", lib="glyphicon"),
                             br(),
                             fluidRow(
                               column(10, offset = 1,
                                      div(class = "game-section",
                                          
                                          # === SEÇÃO 1: ARQUIVIVO ===
                                          h3(span(class="notranslate", "Arquivivo")),
                                          p("O ", strong(span(class="notranslate", "Arquivivo")), " é um jogo educativo em que você protagoniza ações de proteção da história e da memória. Sua missão é acondicionar, restaurar e proteger documentos e acervos contra ameaças como intempéries, desastres e violência estatal."),
                                          
                                          # Botão de jogar destacado e centralizado
                                          div(style="text-align: center; margin-top: 15px; margin-bottom: 25px;",
                                              a(href="https://mmillenaa.github.io/arquivivo/", target="_blank", class="btn-jogar-grande", "Ir para o jogo")
                                          ),
                                          
                                          # Informações complementares discretas
                                          div(style="font-size: 0.9em; color: #666;",
                                              p(strong("Nota:"), " O jogo foi otimizado para desktop. Caso jogue no celular, adicione o link à tela de início e use o modo paisagem para evitar cortes na tela."),
                                              p("Licença CC BY-NC-SA 4.0 | ", 
                                                a(href="https://creativecommons.org/licenses/by-nc-sa/4.0/", "Ver licença", target="_blank"), " | ",
                                                a(href="https://github.com/mmillenaa/arquivivo", "Ver código-fonte", target="_blank"))
                                          ),
                                          
                                          hr(style="border-top: 2px solid #eceae4; margin: 40px 0;"),
                                          
                                          # === SEÇÃO 2: PAINEL STREAMLIT ===
                                          h3("Inventário e Estatísticas (GPDVE)"),
                                          p("Uma aplicação web para explorar, unificar e analisar os metadados de coleções catalogadas do GPDVE. A ferramenta transforma planilhas em painéis interativos, permitindo a busca estruturada, geração de linhas do tempo, gráficos temáticos e a exportação automática de inventários."),
                                          
                                          # Botão de acesso ao programa
                                          div(style="text-align: center; margin-top: 15px; margin-bottom: 25px;",
                                              # Utilizei a mesma classe 'btn-jogar-grande' para manter o padrão visual, mas você pode alterar se tiver criado outra classe no CSS
                                              a(href="https://inventory-and-statistics.streamlit.app/", target="_blank", class="btn-jogar-grande", "Acessar o programa")
                                          )
                                          
                                      )
                               )
                             )
)