aba_dataset <- tabPanel("Seu dataset", icon = icon("list", lib="glyphicon"),
                        br(),
                        tabsetPanel(
                          
                          # ================= SUB-ABA 1: CRIE =================
                          tabPanel("Crie",
                                   br(),
                                   
                                   # Texto de apresentação (Padronizado com a aba de ferramentas)
                                   div(style = "margin-bottom: 25px;",
                                       p(HTML("Aqui, você pode começar a montar a estrutura da base de dados, conforme o <b>foco de trabalho</b> desejado."), 
                                         style = "text-align: left; font-size: 1.15em; color: #505c58; font-family: 'Roboto', sans-serif;")
                                   ),
                                   
                                   # Pergunta principal e opções
                                   fluidRow(
                                     column(12,
                                            div(class = "well", style = "background-color: #ffffff; border: 1px solid #eceae4;",
                                                h4("Qual dos caminhos, a seguir, mais se alinha ao perfil da sua base?", style="margin-top: 0; margin-bottom: 20px;"),
                                                radioButtons("perfil_base", label = NULL, width = "100%",
                                                             choiceNames = list(
                                                               HTML("1. Minha base terá como foco o <b>mapeamento/levantamento</b> e lidará primordialmente com fontes nato-digitais (ex. blogs, portais de notícia)."),
                                                               HTML("2. Minha base terá como foco o <b>mapeamento</b> e lidará primordialmente com fontes digitalizadas em domínio público, cedidas ou doadas pela autora ou instituição de guarda oficial."),
                                                               HTML("3. Minha base terá como foco a <b>organização/catalogação</b> de fontes digitalizadas ou digitais provindas de outra instituição detentora, bem como doadas para o nosso grupo."),
                                                               HTML("4. Minha base terá como foco a <b>análise documental sistemática</b> de fontes digitais e digitalizadas."),
                                                               HTML("5. Minha base será <b>híbrida</b> e lidará com uma combinação múltipla das abordagens acima.")
                                                             ),
                                                             choiceValues = list("opt1", "opt2", "opt3", "opt4", "opt5"),
                                                             selected = character(0) # Inicia sem nada selecionado
                                                )
                                            )
                                     )
                                   ),
                                   
                                   # ==========================================
                                   # PAINEIS CONDICIONAIS (ACORDEÕES)
                                   # ==========================================
                                   
                                   # OPÇÃO 1: Mapeamento de fontes nato-digitais
                                   conditionalPanel(
                                     condition = "input.perfil_base == 'opt1'",
                                     div(class = "instrucao-box",
                                         h4("Mapeamento de fontes nato-digitais"),
                                         p("Foco: rastreamento da circulação de informações, páginas web, portais e publicações nativas da internet.")
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Identificação da fonte"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt1_b1", NULL, choices = c("Título da publicação/página", "Veículo/plataforma (ex: nome do blog, portal de notícias, fórum)", "Autoria/proponente (pessoa física, institucional ou pseudônimo)", "Gênero documental (ex: artigo de opinião, postagem de rede social, edital web)", "Idioma")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Rastreabilidade e coleta"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt1_b2", NULL, choices = c("Link (URL)", "Data de publicação (da fonte)", "Data de acesso/coleta", "Chave de busca utilizada (qual termo levou a este documento?)", "Status de disponibilidade do link (disponível, acesso restrito ou indisponível)")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Métrica e repercussão"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt1_b3", NULL, choices = c("Engajamento (nº de comentários, compartilhamentos - se aplicável)", "Trecho de destaque/citação direta", "Citação padrão (referência formatada para difusão)")))
                                     )
                                   ),
                                   
                                   # OPÇÃO 2: Mapeamento de fontes digitalizadas
                                   conditionalPanel(
                                     condition = "input.perfil_base == 'opt2'",
                                     div(class = "instrucao-box",
                                         h4("Mapeamento de fontes digitalizadas (institucionais/públicas)"),
                                         p("Foco: levantamento de documentos oficiais, jurisprudência, ofícios, normativas, em que a estrutura da instituição produtora é relevante. Exemplo: mapeamento jurisprudencial.")
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Identificação institucional e arquivística"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt2_b1", NULL, choices = c("Título ou número de identificação (ex: número do processo, portaria, ofício)", "Instituição de guarda (onde o documento físico, digitalizado ou digital reside?)", "Instituição produtora/emissora (quem criou o documento?)", "Fundo ou coleção (para situar a origem orgânica do material)")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Autoria e responsabilidade"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt2_b2", NULL, choices = c("Autoridade/responsável (ex: relator, ministro, diretor do presídio, secretário de estado)", "Destinatário (se for correspondência ou ofício)")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Temporalidade e conteúdo"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt2_b3", NULL, choices = c("Data de produção/assinatura", "Data de tramitação/publicação", "Ementa / resumo do assunto", "Decisão / encaminhamento (qual foi o desfecho documentado?)", "Trecho relevante (transcrição para análise futura)")))
                                     )
                                   ),
                                   
                                   # OPÇÃO 3: Organização/catalogação de fontes digitalizadas
                                   conditionalPanel(
                                     condition = "input.perfil_base == 'opt3'",
                                     div(class = "instrucao-box",
                                         h4("Organização/catalogação de fontes digitalizadas"),
                                         p("Foco: você precisa efetuar o tratamento arquivístico, criando um instrumento de pesquisa para um acervo fotográfico, audiovisual, textual ou sonoro recém-chegado.")
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Área de identificação"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt3_b1", NULL, choices = c("Código de referência (ID único)", "Título descritivo atribuído por você ou título original (se houver)", "Nível de descrição (ex: fundo, coleção, dossiê, item)", "Datas (produção e/ou difusão)")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Área de materialidade"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt3_b2", NULL, choices = c("Gênero (ex.: audiovisual, sonoro, iconográfico, filmográfico, cinematográfico, cartográfico, textual)", "Espécie (ex.: laudo pericial, depoimento, denúncia)", "Técnica de registro (ex.: ampliação, imagem, nato-digital, gravação, filmagem, fotografia, digital, digitalizado)", "Forma de registro (detalhamento voltado para material nato-digital ou digitalizado; ex.: derivada bruta, derivada tratada, matriz bruta, matriz tratada)")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Área de contexto e conteúdo"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt3_b3", NULL, choices = c("Autor(a)/fotógrafo(a)/responsável", "Local de produção", "Âmbito e conteúdo (descrição visual ou sumário temático)", "História arquivística / trajetória de custódia (de onde veio até chegar ao grupo?)", "Notas e transcrições (ex: informações contidas no verso de fotos)")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Área de acesso e indexação"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt3_b4", NULL, choices = c("Palavras-chave (descritores)", "Condições de acesso e direitos autorais")))
                                     )
                                   ),
                                   
                                   # OPÇÃO 4: Análise descritiva
                                   conditionalPanel(
                                     condition = "input.perfil_base == 'opt4'",
                                     div(class = "instrucao-box",
                                         h4("Análise descritiva (microdados e extração de variáveis)"),
                                         p("Foco: você precisa minuciosamente analisar o documento, de modo a extrair variáveis específicas e realizar análises qualitativas ou quantitativas.")
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Módulo central"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt4_b1", NULL, choices = c("ID do documento", "Data do documento", "Espécie documental (laudo pericial, depoimento, denúncia)")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Módulo sociodemográfico/biográfico"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt4_b2", NULL, choices = c("Idade", "Gênero", "Raça/cor (conforme categoria da fonte)", "Estado civil", "Naturalidade", "Profissão")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Módulo espacial/geográfico"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt4_b3", NULL, choices = c("Local da ocorrência", "Município", "Estado", "Bairro")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Módulo jurídico/penal"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt4_b4", NULL, choices = c("Tipificação", "Instrumento da infração", "Gravidade", "Decisão", "Necessidade de exames")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Módulo de transcrições qualitativas"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt4_b5", NULL, choices = c("Transcrição do histórico", "Justificativas", "Anotações do(a) pesquisador(a)")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Módulo de atores históricos/sujeitos"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      p(em("Ideal para mapear a trajetória de quem assina projetos.")),
                                                      checkboxGroupInput("opt4_b6", NULL, choices = c("Nome", "Período de vida", "Ocupação", "Estado de atuação")))
                                     ),
                                     tags$details(style = "margin-bottom: 10px;",
                                                  tags$summary(strong("Módulo institucional"), style="cursor:pointer; font-size:1.1em; padding:10px; background:#f4f7f6; border: 1px solid #eceae4; border-radius:4px;"),
                                                  div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;",
                                                      checkboxGroupInput("opt4_b7", NULL, choices = c("Nome da instituição (ex: presídio, escola, ministério)", "Localização", "Período de funcionamento", "Condição operacional")))
                                     )
                                   ),
                                   
                                   # OPÇÃO 5: Base Híbrida (TODOS OS MÓDULOS)
                                   conditionalPanel(
                                     condition = "input.perfil_base == 'opt5'",
                                     div(class = "instrucao-box",
                                         h4("Base híbrida"),
                                         p("Selecione livremente entre todas as categorias metodológicas disponíveis.")
                                     ),
                                     
                                     h5("Fontes nato-digitais", style="color: #829a91; font-weight: bold; margin-top: 20px;"),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Identificação da fonte"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b1", NULL, choices = c("Título da publicação/página", "Veículo/plataforma (ex: nome do blog, portal de notícias, fórum)", "Autoria/proponente (pessoa física, institucional ou pseudônimo)", "Gênero documental (ex: artigo de opinião, postagem de rede social, edital web)", "Idioma")))),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Rastreabilidade e coleta"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b2", NULL, choices = c("Link (URL)", "Data de publicação (da fonte)", "Data de acesso/coleta", "Chave de busca utilizada (qual termo levou a este documento?)", "Status de disponibilidade do link (disponível, acesso restrito ou indisponível)")))),
                                     tags$details(style = "margin-bottom: 15px;", tags$summary(strong("Métrica e repercussão"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b3", NULL, choices = c("Engajamento (nº de comentários, compartilhamentos - se aplicável)", "Trecho de destaque/citação direta", "Citação padrão (referência formatada para difusão)")))),
                                     
                                     h5("Fontes digitalizadas (Institucionais)", style="color: #829a91; font-weight: bold;"),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Identificação institucional e arquivística"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b4", NULL, choices = c("Título ou número de identificação (ex: número do processo, portaria, ofício)", "Instituição de guarda (onde o documento físico, digitalizado ou digital reside?)", "Instituição produtora/emissora (quem criou o documento?)", "Fundo ou coleção (para situar a origem orgânica do material)")))),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Autoria e responsabilidade"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b5", NULL, choices = c("Autoridade/responsável (ex: relator, ministro, diretor do presídio, secretário de estado)", "Destinatário (se for correspondência ou ofício)")))),
                                     tags$details(style = "margin-bottom: 15px;", tags$summary(strong("Temporalidade e conteúdo"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b6", NULL, choices = c("Data de produção/assinatura", "Data de tramitação/publicação", "Ementa / resumo do assunto", "Decisão / encaminhamento (qual foi o desfecho documentado?)", "Trecho relevante (transcrição para análise futura)")))),
                                     
                                     h5("Catalogação arquivística", style="color: #829a91; font-weight: bold;"),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Área de identificação"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b7", NULL, choices = c("Código de referência (ID único)", "Título descritivo atribuído por você ou título original (se houver)", "Nível de descrição (ex: fundo, coleção, dossiê, item)", "Datas (produção e/ou difusão)")))),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Área de materialidade"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b8", NULL, choices = c("Gênero (ex.: audiovisual, sonoro, iconográfico, filmográfico, cinematográfico, cartográfico, textual)", "Espécie (ex.: laudo pericial, depoimento, denúncia)", "Técnica de registro (ex.: ampliação, imagem, nato-digital, gravação, filmagem, fotografia, digital, digitalizado)", "Forma de registro (detalhamento voltado para material nato-digital ou digitalizado; ex.: derivada bruta, derivada tratada, matriz bruta, matriz tratada)")))),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Área de contexto e conteúdo"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b9", NULL, choices = c("Autor(a)/fotógrafo(a)/responsável", "Local de produção", "Âmbito e conteúdo (descrição visual ou sumário temático)", "História arquivística / trajetória de custódia (de onde veio até chegar ao grupo?)", "Notas e transcrições (ex: informações contidas no verso de fotos)")))),
                                     tags$details(style = "margin-bottom: 15px;", tags$summary(strong("Área de acesso e indexação"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b10", NULL, choices = c("Palavras-chave (descritores)", "Condições de acesso e direitos autorais")))),
                                     
                                     h5("Análise descritiva", style="color: #829a91; font-weight: bold;"),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Módulo central"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b11", NULL, choices = c("ID do documento", "Data do documento", "Espécie documental (laudo pericial, depoimento, denúncia)")))),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Módulo sociodemográfico/biográfico"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b12", NULL, choices = c("Idade", "Gênero", "Raça/cor (conforme categoria da fonte)", "Estado civil", "Naturalidade", "Profissão")))),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Módulo espacial/geográfico"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b13", NULL, choices = c("Local da ocorrência", "Município", "Estado", "Bairro")))),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Módulo jurídico/penal"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b14", NULL, choices = c("Tipificação", "Instrumento da infração", "Gravidade", "Decisão", "Necessidade de exames")))),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Módulo de transcrições qualitativas"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b15", NULL, choices = c("Transcrição do histórico", "Justificativas", "Anotações do pesquisador")))),
                                     tags$details(style = "margin-bottom: 5px;", tags$summary(strong("Módulo de atores históricos/sujeitos"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b16", NULL, choices = c("Nome", "Período de vida", "Ocupação", "Estado de atuação")))),
                                     tags$details(style = "margin-bottom: 15px;", tags$summary(strong("Módulo institucional"), style="cursor:pointer; padding:8px; background:#fdfdfc; border: 1px solid #eceae4;"), div(style="padding: 15px; border: 1px solid #eceae4; border-top: none;", checkboxGroupInput("opt5_b17", NULL, choices = c("Nome da instituição (ex: presídio, escola, ministério)", "Localização", "Período de funcionamento", "Condição operacional"))))
                                   ),
                                   
                                   # ==========================================
                                   # ÁREA FINAL: CAMPOS CUSTOMIZADOS E DOWNLOAD
                                   # Aparece apenas se alguma opção for selecionada
                                   # ==========================================
                                   conditionalPanel(
                                     condition = "input.perfil_base == 'opt1' || input.perfil_base == 'opt2' || input.perfil_base == 'opt3' || input.perfil_base == 'opt4' || input.perfil_base == 'opt5'",
                                     hr(style="border-top: 1px solid #eceae4; margin: 30px 0;"),
                                     
                                     div(class = "well", style = "background-color: #fdfdfc;",
                                         h4("Adicionar colunas personalizadas"),
                                         p("Se você quiser adicionar colunas personalizadas, indique um sistema de preenchimento separando-as com ponto e vírgula.", style="color: #505c58;"),
                                         p("Exemplo: ", code("Escolaridade; Número de filhos; Advogados(as) do caso; Pessoas citadas no depoimento")),
                                         textInput("colunas_custom", NULL, width = "100%", placeholder = "Digite aqui suas variáveis separadas por ;")
                                     ),
                                     
                                     br(),
                                     fluidRow(
                                       column(6, downloadButton("baixar_xlsx", "1. Baixar base (XLSX)", class="btn-primary", style="width: 100%; font-size: 1.1em; padding: 15px;")),
                                       column(6, downloadButton("baixar_glossario", "2. Baixar glossário (TXT)", class="btn-primary", style="width: 100%; font-size: 1.1em; padding: 15px;"))
                                     ),
                                     br(), br()
                                   )
                          ),
                          
                          # ================= SUB-ABA 2: ORGANIZE =================
                          tabPanel("Organize",
                                   br(),
                                   fluidRow(
                                     # Caixa 1: Fase 1 (Formulário Preliminar)
                                     column(6, 
                                            div(class = "well", style = "height: 100%; display: flex; flex-direction: column; justify-content: space-between;",
                                                div(
                                                  h4("Fase 1", style = "color: #829a91; margin-top: 0; font-weight: bold;"),
                                                  h4("Cadastrando sua base de dados no Dataverse da FGV", style = "margin-bottom: 15px;"),
                                                  p("Para cadastrar sua base de dados no Dataverse da FGV, prepare suas respostas preliminares no documento word/docx.")
                                                ),
                                                div(style = "margin-top: 20px;",
                                                    downloadButton("downloadDataverse1", "Baixar formulário preliminar (DOCX) - 1.926 KB", class = "btn-primary", style = "width: 100%; white-space: normal;")
                                                )
                                            )
                                     ),
                                     
                                     # Caixa 2: Fase 2 (Formulário Avançado)
                                     column(6, 
                                            div(class = "well", style = "height: 100%; display: flex; flex-direction: column; justify-content: space-between;",
                                                div(
                                                  h4("Fase 2", style = "color: #829a91; margin-top: 0; font-weight: bold;"),
                                                  h4("Curadoria avançada de metadados no Dataverse", style = "margin-bottom: 15px;"),
                                                  p("Após a aprovação do cadastro, prepare os metadados técnicos e arquivísticos finais neste documento complementar.")
                                                ),
                                                div(style = "margin-top: 20px;",
                                                    downloadButton("downloadDataverse2", "Baixar formulário avançado (DOCX) - 2.788 KB", class = "btn-primary", style = "width: 100%; white-space: normal;")
                                                )
                                            )
                                     )
                                   ),
                                   
                                   # Ajuste para manter as caixas com a mesma altura independentemente do texto
                                   tags$head(tags$style(HTML("
                                     .row-eq-height { display: -webkit-box; display: -webkit-flex; display: -ms-flexbox; display: flex; flex-wrap: wrap; }
                                     .row-eq-height > [class*='col-'] { display: flex; flex-direction: column; }
                                   "))),
                                   br()
                          ),
                          
                          # ================= SUB-ABA 3: PUBLIQUE =================
                          tabPanel("Publique",
                                   br(),
                                   fluidRow(
                                     column(10, offset = 1, class = "well", style = "background-color: #ffffff;",
                                            h4("Checklist de publicação do repositório no Dataverse", style = "color: #2c3e50; font-family: 'Merriweather', serif; margin-bottom: 15px;"),
                                            
                                            div(style = "display: flex; align-items: stretch; min-height:400px;",
                                                div(style = "width: 70px; flex-shrink: 0; padding-top: 5px; padding-bottom: 15px; display: flex; flex-direction: column;",
                                                    uiOutput("barra_vertical")
                                                ),
                                                div(style = "flex-grow: 1; padding-left: 20px;",
                                                    tags$style(HTML("
                                                      .custom-checklist .checkbox { margin-bottom: 22px; font-size: 1.05em; color: #505c58; }
                                                      .custom-checklist input[type='checkbox'] { margin-top: 4px; transform: scale(1.2); }
                                                    ")),
                                                    div(class = "custom-checklist",
                                                        checkboxGroupInput("checklist_pub", label = NULL, width = "100%",
                                                                           choices = c(
                                                                             "Estrutura da base definida — Já tenho definida a estrutura do dataset (ver aba Seu dataset > Crie." = "c1",
                                                                             "Base concluída e organizada — Todos os arquivos estão organizados e documentados (metadados básicos, nomes padronizados)." = "c2",
                                                                             "Formulário de requisição (Fase 1) preenchido — O formulário inicial de cadastro no Dataverse (aba Organize, Fase 1) foi completado." = "c3",
                                                                             "Requisição aceita e formulário avançado (Fase 2) preparado — A requisição foi aceita e a lista do formulário avançado foi preenchida e verificada." = "c4",
                                                                             "README elaborado — Existe um README com escopo, instruções de navegação, notas metodológicas, política de citação e contato." = "c5",
                                                                             "Revisão final da estrutura — Revisei nomes de arquivos, pastas, textos, formatação e tudo está aparentemente pronto." = "c6",
                                                                             "Revisão com orientador/a — Conversei com meu/minha orientador/a; o repositório está em condições de ser submetido para revisão (Submit for review)." = "c7",
                                                                             "Submetido para revisão — O repositório foi submetido para revisão no Dataverse por mim ou pelo/a orientador/a. 🎉" = "c8"
                                                                           )
                                                        )
                                                    )
                                                )
                                            ),
                                            uiOutput("mensagem_vitoria")
                                     )
                                   ),
                                   tags$head(tags$script(src = "https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js")),
                                   tags$script(HTML("
                                     Shiny.addCustomMessageHandler('efeito_conquista', function(message) {
                                        var pct = document.getElementById('texto-porcentagem');
                                        if(pct) {
                                            pct.classList.remove('pulso-ativo');
                                            void pct.offsetWidth;
                                            pct.classList.add('pulso-ativo');
                                        }
                                        if (navigator.vibrate) { navigator.vibrate(50); }
                                     });
                                     Shiny.addCustomMessageHandler('disparar_confetes', function(message) {
                                       var duration = 5 * 1000;
                                       var animationEnd = Date.now() + duration;
                                       var defaults = { startVelocity: 30, spread: 360, ticks: 60, zIndex: 0 };
                                       function randomInRange(min, max) { return Math.random() * (max - min) + min; }
                                       var interval = setInterval(function() {
                                         var timeLeft = animationEnd - Date.now();
                                         if (timeLeft <= 0) { return clearInterval(interval); }
                                         var particleCount = 50 * (timeLeft / duration);
                                         confetti(Object.assign({}, defaults, { particleCount, origin: { x: randomInRange(0.1, 0.3), y: Math.random() - 0.2 } }));
                                         confetti(Object.assign({}, defaults, { particleCount, origin: { x: randomInRange(0.7, 0.9), y: Math.random() - 0.2 } }));
                                       }, 250);
                                     });
                                   "))
                          ) # FIM da tabPanel "Publique"
                        ) # FIM do tabsetPanel
) # FIM do aba_dataset principal