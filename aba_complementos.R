aba_complementos <- tabPanel("Complementos", icon = icon("flash", lib="glyphicon"),
                             br(),
                             fluidRow(
                               column(10, offset = 1,
                                      div(class = "game-section",
                                          
                                          # === SEÇÃO 1: ARQUIVIVO ===
                                          # A classe 'notranslate' impede que o Google traduza o nome do jogo
                                          h3(span(class="notranslate", "Arquivivo")),
                                          p("O ", strong(span(class="notranslate", "Arquivivo")), " é um jogo educativo em que você protagoniza ações de proteção da história e da memória. Sua missão é acondicionar, restaurar e proteger documentos e acervos contra ameaças como intempéries, desastres e violência estatal."),
                                          
                                          # Botão de jogar destacado e centralizado
                                          div(style="text-align: center; margin-top: -10px; margin-bottom: 15px;",
                                              a(href="https://mmillenaa.github.io/arquivivo/", target="_blank", class="btn-jogar-grande", "Ir para o jogo")
                                          ),
                                          
                                          h3("Licença"),
                                          p("Este projeto está licenciado sob a licença Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International. ", a(href="https://creativecommons.org/licenses/by-nc-sa/4.0/", "https://creativecommons.org/licenses/by-nc-sa/4.0/", target="_blank")),
                                          
                                          h4("📱 Jogando no celular (recomendado para tela cheia)"),
                                          p("O ", strong(span(class="notranslate", "Arquivivo")), " foi otimizado para rodar diretamente no navegador, mas para a melhor experiência (sem barras cortando a tela), recomendamos adicioná-lo à tela inicial:"),
                                          tags$ul(
                                            tags$li(strong("No iOS (Safari): "), "Abra o link do jogo, toque no ícone de 'Compartilhar' (quadrado com seta para cima) na barra inferior e selecione 'Adicionar à tela de início'."),
                                            tags$li(strong("No Android (Chrome): "), "Abra o link, toque nos três pontos no canto superior direito e selecione 'Adicionar à tela de início'.")
                                          ),
                                          p("Depois disso, abra o jogo usando o novo ícone no seu celular e lembre-se de jogar no modo paisagem!"),
                                          p("Veja o código JavaScript completo aqui: ", a(href="https://github.com/mmillenaa/arquivivo", "https://github.com/mmillenaa/arquivivo", target="_blank")),
                                          
                                          hr(style="border-top: 2px solid #eceae4; margin: 40px 0;"),
                                          
                                          # === SEÇÃO 2: PAINEL STREAMLIT ===
                                          h3("Inventário e estatísticas (GPDVE)"),
                                          p("Uma programa de computador para explorar, unificar e analisar os metadados de coleções catalogadas do GPDVE. Este aplicativo transforma planilhas em painéis estatísticos interativos."),
                                          
                                          h4("O que você pode fazer com esta ferramenta?"),
                                          tags$ul(
                                            tags$li(strong("Unificação de dados: "), "junte várias planilhas de acervo (Excel) em uma única base de pesquisa integrada."),
                                            tags$li(strong("Busca e filtros: "), "pesquise termos específicos e aplique filtros categóricos para encontrar exatamente os documentos que você precisa analisar."),
                                            tags$li(strong("Visualização dinâmica: "), "gere linhas do tempo, gráficos temáticos e estatísticas automáticas que revelam o panorama da coleção."),
                                            tags$li(strong("Exportação: "), "exporte os resultados da sua busca diretamente para um documento de texto (.docx), criando um inventário estruturado pronto para uso."),
                                            tags$li(strong("Acesso global: "), "interface totalmente traduzida e consulta direta das produções do grupo publicadas no Dataverse da FGV.")
                                          ),
                                          
                                          div(class = "instrucao-box", style = "margin-top: 20px;",
                                              h4("💻 Informações Técnicas e Acesso"),
                                              p("Este é um projeto em desenvolvimento ativo. Ele roda localmente no seu computador através da linguagem Python (utilizando a biblioteca Streamlit)."),
                                              p("Para acessar o repositório, baixar o código-fonte e ver as instruções de instalação para o seu computador, visite a página oficial da aplicação no GitHub.")
                                              # Aqui você pode adicionar um botão ou link para o repositório do Streamlit no futuro!
                                          )
                                      )
                               )
                             )
)