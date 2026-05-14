aba_jogos <- tabPanel("Jogos", icon = icon("play", lib="glyphicon"),
                      br(),
                      fluidRow(
                        column(10, offset = 1,
                               div(class = "game-section",
                                   h3("Arquivivo"),
                                   p("O ", strong("Arquivivo"), " é um jogo educativo em que você protagoniza ações de proteção da história e da memória. Sua missão é acondicionar, restaurar e proteger documentos e acervos contra ameaças como intempéries, desastres e violência estatal."),
                                   
                                   # Botão de jogar destacado e centralizado
                                   div(style="text-align: center; margin-top: -10px; margin-bottom: 15px;",
                                       a(href="https://mmillenaa.github.io/arquivivo/", target="_blank", class="btn-jogar-grande", "Ir para o jogo")
                                   ),
                                   
                                   h3("Licença"),
                                   p("Este projeto está licenciado sob a licença Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International. ", a(href="https://creativecommons.org/licenses/by-nc-sa/4.0/", "https://creativecommons.org/licenses/by-nc-sa/4.0/", target="_blank")),
                                   
                                   hr(),
                                   
                                   h3("📱 Jogando no celular (recomendado para tela cheia)"),
                                   p("O ", strong("Arquivivo"), " foi otimizado para rodar diretamente no navegador, mas para a melhor experiência (sem barras cortando a tela), recomendamos adicioná-lo à tela inicial:"),
                                   tags$ul(
                                     tags$li(strong("No iOS (Safari): "), "Abra o link do jogo, toque no ícone de “Compartilhar” (quadrado com seta para cima) na barra inferior e selecione “Adicionar à tela de início”."),
                                     tags$li(strong("No Android (Chrome): "), "Abra o link, toque nos três pontos no canto superior direito e selecione “Adicionar à tela de início”.")
                                   ),
                                   p("Depois disso, abra o jogo usando o novo ícone no seu celular e lembre-se de jogar no modo paisagem!"),
                                   p("Veja o código JavaScript completo aqui: ", a(href="https://github.com/mmillenaa/arquivivo", "https://github.com/mmillenaa/arquivivo", target="_blank"))
                               )
                        )
                      )
)