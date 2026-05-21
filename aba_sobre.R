aba_sobre <- tabPanel("Sobre o projeto", icon = icon("info-sign", lib="glyphicon"),
                      br(),
                      
                      fluidRow(
                        # Coluna Principal - Descrição do Projeto
                        column(8,
                               div(style = "font-family: 'Roboto', sans-serif; font-size: 1.1em; line-height: 1.6; color: #34495e;",
                                   
                                   h3("Sobre o projeto", style = "color: #2c3e50; font-family: 'Merriweather', serif; margin-top: 0;"),
                                   p("O Mnema é um ambiente de apoio metodológico desenvolvido no âmbito do projeto \"Organização e disponibilização pública de acervo documental envolvendo violência de estado\". Integrando a pesquisa acadêmica ao desenvolvimento de software, a plataforma oferece suporte técnico avançado para pesquisadoras(es) que lidam com a estruturação, modelagem e catalogação de fontes documentais."),
                                   
                                   hr(style="border-top: 1px solid #eceae4; margin: 25px 0;"),
                                   
                                   h3("O que a plataforma faz?", style = "color: #2c3e50; font-family: 'Merriweather', serif;"),
                                   p("Programada em ambiente R (Shiny), a interface concentra três soluções práticas e independentes:"),
                                   tags$ul(
                                     tags$li(strong("Ferramenta de renomeação: "), "gera scripts de automação (.bat) para a renomeação em lote de arquivos digitais, aplicando normas arquivísticas padronizadas (ISAD-G e NOBRADE)."),
                                     tags$li(strong("Crie seu dataset: "), "permite que você selecione variáveis específicas e baixe bases de dados estruturadas (.xlsx), pré-formatadas, para iniciar o mapeamento ou a análise descritiva de suas fontes."),
                                     tags$li(strong("Complementos: "), "apresenta funcionalidades elaboradas com lógicas de programação em JavaScript e Python, com vistas à difusão do conhecimento e à preservação da memória.")
                                   ),
                                   
                                   hr(style="border-top: 1px solid #eceae4; margin: 25px 0;"),
                                   
                                   div(style = "background-color: #fdfdfc; border-left: 5px solid #10b3cf; padding: 15px; color: #2c3e50;",
                                       h4("Compromisso ético", style = "margin-top: 0; font-weight: bold;"),
                                       p("Todo o acervo documental e as bases de dados geradas devem observar estritamente a integridade das pessoas envolvidas, em conformidade com a Lei Geral de Proteção de Dados (LGPD - Lei nº 13.709/2018).")
                                   )
                               )
                        ),
                        
                        # Coluna Lateral - Ficha Técnica
                        column(4,
                               div(class = "well", style = "background-color: #f4f7f6; border: 1px solid #eceae4; border-radius: 4px;",
                                   h4("Ficha técnica", style = "margin-top: 0; font-family: 'Merriweather', serif; font-weight: bold;"),
                                   
                                   p(strong("Instituição sede:"), br(), "Escola de Direito de São Paulo", br(), "(FGV Direito SP)"),
                                   
                                   p(strong("Pesquisadora responsável:"), br(), "Profª. Drª. Maíra Rocha Machado"),
                                   
                                   p(strong("Desenvolvimento e estruturação de dados:"), br(), "Millena Miranda Franco"),
                                   
                                   hr(style="border-top: 1px solid #dcdde1; margin: 15px 0;"),
                                   
                                   p(style = "font-size: 0.95em; color: #7f8c8d;",
                                     strong("Apoio e financiamento:"), br(), 
                                     "Fundação de Amparo à Pesquisa do Estado de São Paulo (FAPESP)", br(),
                                     "Processo nº 25/11544-9")
                               )
                        )
                      )
)