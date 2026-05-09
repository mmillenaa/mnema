library(shiny)

# =======================================================
# 1. INTERFACE DO USUÁRIO (UI)
# =======================================================
ui <- fluidPage(
  tags$head(
    tags$title("Mnema 1.0 | GPDVE FGV Direito SP"),
    # Importando as fontes do Google Fonts
    tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=IBM+Plex+Mono&family=Merriweather:wght@400;700&family=Roboto:ital,wght@0,400;0,700;1,400&display=swap"),
    tags$style(HTML("
      /* Códigos, atalhos e caixas de preenchimento: IBM Plex Mono */
      code { background-color: #e8e6df; color: #d35400; font-family: 'IBM Plex Mono', monospace; padding: 2px 5px; border-radius: 4px; font-size: 0.95em; }
      pre { background-color: #2b302e; color: #f9f8f6; border-radius: 8px; font-family: 'IBM Plex Mono', monospace; border: none; }
      .form-control, .selectize-input, .selectize-dropdown { font-family: 'IBM Plex Mono', monospace; font-size: 0.95em; color: #333 !important; }
      .control-label { font-family: 'Roboto', sans-serif; font-weight: bold; }
      
      /* Títulos: Merriweather para os principais */
      h1, h2, h3, h4, h5 { color: #2c3e50; font-family: 'Merriweather', serif; font-weight: bold; }
      
      /* Estilo das Abas */
      .nav-tabs { border-bottom: 2px solid #eceae4; margin-bottom: 20px; }
      .nav-tabs > li > a { color: #8e8c84; font-weight: bold; border-radius: 8px 8px 0 0; font-family: 'Roboto', sans-serif; }
      .nav-tabs > li.active > a { color: #505c58; background-color: #ffffff; border: 1px solid #eceae4; border-bottom-color: transparent; }
      
      /* Botões */
      .btn-primary { background-color: #505c58; border: none; font-family: 'Roboto', sans-serif; border-radius: 6px; }
      .btn-primary:hover { background-color: #6a7a75; }
      .help-block { color: #8e8c84; font-size: 0.9em; font-style: italic; font-family: 'Roboto', sans-serif; }
      
      /* Caixas de destaque */
      .instrucao-box { background-color: #f4f7f6; border-left: 5px solid #829a91; padding: 15px; margin-bottom: 20px; border-radius: 4px; }
      .alerta-box { background-color: #fcf5f5; border-left: 5px solid #d49a9a; padding: 15px; margin-bottom: 20px; border-radius: 4px; color: #5c3c3c; }
      
      /* Rodapé */
      .footer-referencias { font-size: 0.85em; color: #7f8c8d; margin-top: 40px; margin-bottom: 20px; padding: 20px; background-color: #f8f9fa; border-top: 1px solid #dcdde1; border-radius: 5px; font-family: 'Roboto', sans-serif; }
      .footer-referencias h5 { font-size: 1.05em; color: #34495e; font-weight: bold; margin-top: 15px; margin-bottom: 10px; font-family: 'Merriweather', serif; }
      .footer-referencias p { margin-bottom: 5px; line-height: 1.4; }
      .footer-referencias a { color: #7f8c8d; text-decoration: underline; }
      .footer-referencias a.nome-link { color: #2980b9; text-decoration: none; font-weight: bold; }
      .footer-referencias a.nome-link:hover { text-decoration: underline; }
      .footer-referencias a:hover { color: #2980b9; }
      .citacao-box { background-color: #eef2f5; padding: 10px; border-left: 3px solid #2980b9; font-family: 'IBM Plex Mono', monospace; font-size: 0.95em; color: #333; margin-bottom: 15px;}
    "))
  ),
  
  # Cabeçalho Principal Customizado
  div(style = "text-align: center; margin-top: 50px; margin-bottom: 40px;",
      h1("Mnema 1.0", style = "font-size: 3.5em; margin-bottom: 0; letter-spacing: 1px;"),
      p("Aplicativo para renomear arquivos digitais em Direito e violência de Estado do GPDVE FGV Direito SP", style = "color: #8e8c84; font-size: 1.1em; margin-top: 5px; font-style: italic;")
  ),
  
  # Sistema de Abas
  tabsetPanel(
    
    # ================= ABA 1: A FERRAMENTA =================
    tabPanel("Ferramenta de Renomeação", icon = icon("wrench", lib="glyphicon"),
             br(),
             sidebarLayout(
               sidebarPanel(
                 h4("1. Identificação do repositório"),
                 textInput("pais", "País (obrigatório)", value = "BR"),
                 textInput("estado", "Estado (obrigatório)", value = "SP"),
                 textInput("repo", "Sigla do repositório", value = "APESP"),
                 hr(style="border-top: 1px solid #eceae4;"),
                 
                 h4("2. Conjunto documental"),
                 textInput("fundo", "Fundo (obrigatório)", value = "DASP"),
                 textInput("subconj", "Subconjunto (opcional)", value = "PENITPRE-CSDTCARANDIRU"),
                 hr(style="border-top: 1px solid #eceae4;"),
                 
                 h4("3. Caracterização da unidade"),
                 helpText("Deixe em 'Nenhum' se não se aplicar."),
                 selectInput("genero", "Gênero documental", choices = c("Nenhum" = "", "Iconográfico (ICO)" = "ICO", "Textual (TXT)" = "TXT", "Audiovisual (AVS)" = "AVS", "Eletrônico (ELE)" = "ELE", "Bibliográfico (BIB)" = "BIB"), selected = "ICO"),
                 selectInput("especie", "Espécie/Tipo", choices = c("Nenhum" = "", "Fotografia (FOT)" = "FOT", "Relatório (REL)" = "REL", "Processo (PRC)" = "PRC", "Dossiê (DSS)" = "DSS", "Prontuário (PRT)" = "PRT", "Diapositivo (DPS)" = "DPS"), selected = "FOT"),
                 selectInput("tecnica", "Técnica de registro", choices = c("Nenhum" = "", "Digitalizado (DGZ)" = "DGZ", "Nato-digital (NDG)" = "NDG", "Exposição fotográfica (EXF)" = "EXF", "Impresso (IMP)" = "IMP", "Manuscrito (MAN)" = "MAN"), selected = "DGZ"),
                 selectInput("forma", "Forma do registro", choices = c("Nenhum" = "", "Matriz bruta (manual) (MT0)" = "MT0", "Matriz tratada (MT1)" = "MT1", "Derivada bruta (DT0)" = "DT0", "Derivada tratada (DT1)" = "DT1"), selected = "MT0")
               ),
               
               mainPanel(
                 div(class = "instrucao-box", 
                     h4("Como usar de forma rápida:"),
                     p("1. Vá na pasta do seu computador onde estão os arquivos."),
                     p("2. Selecione todos os arquivos que deseja renomear (aperte ", code("Ctrl + A"), ")."),
                     p("3. Copie o caminho deles (no Windows 11, aperte ", code("Ctrl + Shift + C"), " ou segure Shift, clique com o botão direito e vá em 'Copiar como caminho')."),
                     p("4. Cole na caixa 'B' abaixo.")
                 ),
                 
                 h4("A. Seu prefixo ficou assim:"),
                 verbatimTextOutput("prefixo_preview"),
                 hr(style="border-top: 1px solid #eceae4; margin: 25px 0;"),
                 
                 div(class = "alerta-box",
                     h4("Evite duplicatas (opcional):"),
                     p("Seus arquivos já possuem um prefixo antigo e você quer apenas atualizá-lo? Cole o prefixo antigo abaixo. O sistema vai apagá-lo antes de aplicar o novo."),
                     p("Exemplo: ", code("BR-SPAPESP_DASP-PENITPRE-CSDTCARANDIRU_ICO-FOT-DGZ-MT0_")),
                     textInput("prefixo_antigo", "", placeholder = "Cole o prefixo antigo aqui...")
                 ),
                 
                 h4("B. Cole aqui os arquivos copiados:"),
                 textAreaInput("lista_arquivos", "", rows = 6, placeholder = '"C:\\Pasta\\3055-005-001F.jpg"\n"C:\\Pasta\\2767-001.jpg"'),
                 hr(style="border-top: 1px solid #eceae4; margin: 25px 0;"),
                 
                 h4("C. Código final (script .bat):"),
                 p("Siga as instruções na aba 'Tutorial Passo a Passo' para rodar este código no seu computador."),
                 verbatimTextOutput("codigo_bat")
               )
             )
    ),
    
    # ================= ABA 2: TUTORIAL =================
    tabPanel("Tutorial Passo a Passo", icon = icon("list-alt", lib="glyphicon"),
             br(),
             fluidRow(
               column(8, offset = 2, class = "well",
                      h3("Como usar o código gerado para renomear os arquivos?"),
                      p("Depois de preencher as informações na aba 'Ferramenta de Renomeação' e colar a lista dos seus arquivos originais, você receberá um código no quadro preto (Campo C). Siga estes passos para usá-lo:"),
                      br(),
                      tags$ol(
                        tags$li(strong("Copie o código gerado: "), "selecione todo o texto do quadro preto (Campo C) da primeira aba e aperte ", code("Ctrl + C"), "."),
                        tags$li(strong("Vá para a pasta original: "), "abra no seu computador a pasta exata onde estão os arquivos que você quer renomear."),
                        tags$li(strong("Crie um arquivo de texto: "), "dentro dessa pasta, clique com o botão direito em um espaço vazio, vá em ", code("Novo"), " > ", code("Documento de Texto"), "."),
                        tags$li(strong("Cole o código: "), "abra esse novo arquivo de texto vazio, aperte ", code("Ctrl + V"), " para colar o código e salve o arquivo (", code("Ctrl + S"), "). Feche o arquivo."),
                        tags$li(strong("Transforme em um arquivo rodável: "), "clique com o botão direito no arquivo de texto que você acabou de criar e vá em ", code("Renomear"), ". Apague tudo (incluindo o final ", code(".txt"), ") e digite ", code("renomear.bat"), ". Dê 'Enter' e confirme a alteração clicando em 'Sim'."),
                        tags$li(strong("Rode o script: "), "dê um clique duplo rápido (como se fosse abrir um programa) no arquivo ", code("renomear.bat"), " que você acabou de criar. Em 1 segundo, todos os arquivos da pasta serão renomeados com o padrão oficial!"),
                        tags$li(strong("Limpeza: "), "pode deletar o arquivo ", code("renomear.bat"), " depois que tudo der certo.")
                      ),
                      hr(style="border-top: 1px solid #eceae4; margin: 20px 0;"),
                      h4(style="color: #a86c6c;", "⚠️ Atenção! Importante:"),
                      p("Para conseguir mudar o final do arquivo de ", code(".txt"), " para ", code(".bat"), strong(" no Passo 5"), ", o seu Windows precisa estar configurado para mostrar as extensões dos arquivos. Se você não estiver vendo o ", code(".txt"), " no final do nome, abra qualquer pasta, vá na aba ", strong("Exibir"), " (no topo) e marque a caixinha ", strong("Extensões de nomes de arquivos"), ".")
               )
             )
    ),
    
    # ================= ABA 3: DICIONÁRIO =================
    tabPanel("O que significa cada campo?", icon = icon("question-sign", lib="glyphicon"),
             br(),
             fluidRow(
               column(8, offset = 2, class = "well",
                      h3("Dicionário de preenchimento"),
                      p("Esta ferramenta gera um nome de arquivo estruturado para preservação digital de longo prazo, de acordo com as diretrizes e normas arquivísticas. Aqui está a explicação de cada campo para facilitar seu trabalho:"),
                      br(),
                      h4("1. Identificação do repositório"),
                      tags$ul(
                        tags$li(strong("País e Estado: "), "a localização física de onde o acervo está guardado (ex.: ", code("BR"), " para Brasil, ", code("SP"), " para São Paulo)."),
                        tags$li(strong("Sigla do Repositório: "), "a abreviação da instituição que guarda os documentos (ex.: ", code("APESP"), " para Arquivo Público do Estado de SP).")
                      ),
                      h4("2. Conjunto documental"),
                      tags$ul(
                        tags$li(strong("Fundo: "), "o acervo maior ou a entidade produtora dos documentos (ex.: ", code("DASP"), " - Diários Associados de São Paulo)."),
                        tags$li(strong("Subconjunto: "), "uma subdivisão do Fundo (ex.: ", code("PENITPRE-CSDTCARANDIRU"), " para documentos específicos do Carandiru).")
                      ),
                      h4("3. Caracterização"),
                      tags$ul(
                        tags$li(strong("Gênero: "), "a linguagem primária do documento (ex.: Iconográfico para imagens estáticas)."),
                        tags$li(strong("Espécie: "), "o formato específico do item (ex.: Fotografia, Relatório)."),
                        tags$li(strong("Técnica: "), "como aquele documento digital foi gerado (ex.: Digitalizado a partir do papel ou Nato-digital, se já nasceu no computador)."),
                        tags$li(strong("Forma: "), "o estágio do documento (ex.: Matriz bruta para o arquivo original digitalizado sem tratamento, ou Derivada tratada para versões reduzidas ou limpas).")
                      )
               )
             )
    )
  ),
  
  # ================= RODAPÉ DISCRETO =================
  div(class = "footer-referencias",
      fluidRow(
        column(8,
               h5("Créditos e equipe"),
               
               p(style = "display: flex; align-items: center;",
                 strong("Autora: "), HTML("&nbsp;"),
                 a(href="http://lattes.cnpq.br/3848824456283762", "Millena Miranda Franco", class="nome-link", target="_blank"),
                 HTML("&nbsp;| <a href='https://orcid.org/0000-0002-0292-0797' target='_blank'>ORCID</a> | <a href='https://bv.fapesp.br/pt/pesquisador/743339/millena-miranda-franco/' target='_blank'>BV FAPESP</a>")
               ),
               
               p(style = "display: flex; align-items: center;",
                 strong("Orientadora: "), HTML("&nbsp;"),
                 a(href="http://lattes.cnpq.br/0553760669855058", "Maira Rocha Machado", class="nome-link", target="_blank"),
                 HTML("&nbsp;| <a href='https://orcid.org/0000-0003-1303-5790' target='_blank'>ORCID</a> | <a href='https://bv.fapesp.br/pt/pesquisador/90750/maira-rocha-machado/' target='_blank'>BV FAPESP</a>")
               ),
               
               p(strong("Instituição-sede:"), " Escola de Direito de São Paulo. Fundação Getúlio Vargas (FGV). São Paulo, SP, Brasil"),
               p(strong("Fomento:"), " Fundação de Amparo à Pesquisa do Estado de São Paulo (FAPESP)"),
               p(strong("Projeto:"), " Organização e disponibilização pública de acervo documental envolvendo violência de estado."),
               p(strong("Processo:"), " 25/11544-9")
        ),
        
        column(4, align="right",
               div(style="margin-top: 20px; display: flex; justify-content: flex-end; align-items: center;",
                   img(src="https://upload.wikimedia.org/wikipedia/commons/c/cf/Logo_FGV_-_Funda%C3%A7%C3%A3o_Getulio_Vargas.png", height="20", style="margin-right: 20px;"),
                   img(src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Logo_fapesp_em_preto.svg/1280px-Logo_fapesp_em_preto.svg.png", height="24")
               )
        )
      ),
      
      hr(style="border-top: 1px solid #dcdde1; margin: 15px 0;"),
      
      h5("Como citar este aplicativo?"),
      div(class = "citacao-box",
          HTML('<p style="margin: 0;">FRANCO, Millena Miranda. Mnema 1.0: Aplicativo para renomear arquivos digitais em Direito e violência de Estado do GPDVE FGV Direito SP. Versão 1.0. São Paulo: Fundação Getulio Vargas (FGV), 2026. Aplicativo web. Disponível em: https://projeto-memoria.shinyapps.io/mnema/. Acesso em: <span id="data_atualizacao"></span>.</p>'),
          # Script para gerar a data de acesso em tempo real no padrão ABNT
          tags$script(HTML('
            const data = new Date();
            const meses = ["jan.", "fev.", "mar.", "abr.", "maio", "jun.", "jul.", "ago.", "set.", "out.", "nov.", "dez."];
            const dataFormatada = data.getDate() + " " + meses[data.getMonth()] + " " + data.getFullYear();
            document.getElementById("data_atualizacao").innerText = dataFormatada;
          '))
      ),
      
      hr(style="border-top: 1px solid #dcdde1; margin: 15px 0;"),
      
      h5("Referências bibliográficas"),
      p("BRASIL. CONSELHO NACIONAL DE ARQUIVOS (CONARQ). Recomendações para digitalização de documentos arquivísticos permanentes. Brasília (DF): Conarq, abr. 2010."),
      p("PLATAFORMA DE AUTOMAÇÃO DIGITAL PARA ACERVOS – PADÁ. Recomendações técnicas: nomeação de objetos digitais: PADA RT(OD):1 [recurso eletrônico]. São Paulo: PADÁ, 2025. 76 p. (1.402 KB): il. color.; 21 × 29,7 cm. E-book. ISBN 978-65-01-32648-1. (Recomendações técnicas; 1).")
      
  )
)

# =======================================================
# 2. LÓGICA DO SERVIDOR (SERVER)
# =======================================================
server <- function(input, output, session) {
  
  # Monta o prefixo oficial PADÁ
  prefixo_pada <- reactive({
    # Área 1: Repositório
    area1 <- paste0(input$pais, "-", input$estado, input$repo)
    
    # Área 2: Conjunto
    area2 <- input$fundo
    if(trimws(input$subconj) != "") area2 <- paste0(area2, "-", input$subconj)
    
    # Área 3: Caracterização
    caract <- c(input$genero, input$especie, input$tecnica, input$forma)
    caract <- caract[caract != ""]
    area3 <- paste(caract, collapse = "-")
    
    # Junta as grandes áreas com subtraço
    partes <- c(area1, area2)
    if(area3 != "") partes <- c(partes, area3)
    
    prefixo <- paste(partes, collapse = "_")
    return(paste0(prefixo, "_")) 
  })
  
  output$prefixo_preview <- renderText({
    prefixo_pada()
  })
  
  output$codigo_bat <- renderText({
    req(input$lista_arquivos)
    
    # Lê as linhas coladas, removendo aspas duplas caso tenham sido copiadas como caminho
    linhas <- unlist(strsplit(input$lista_arquivos, "\n"))
    linhas <- trimws(gsub("\"", "", linhas))
    linhas <- linhas[linhas != ""]
    
    if(length(linhas) == 0) return("Cole os nomes dos arquivos na caixa B acima.")
    
    prefixo_novo <- prefixo_pada()
    prefixo_velho <- trimws(input$prefixo_antigo)
    
    codigo <- "chcp 65001\n" # Garante codificação UTF-8 correta no CMD
    
    for(arquivo in linhas) {
      # Extrai apenas o nome do arquivo, isolando o caminho completo da pasta
      nome_arquivo <- basename(arquivo)
      
      # Lógica de remoção de duplicata
      nome_limpo <- nome_arquivo
      if(prefixo_velho != "") {
        # Se o usuário informou um prefixo antigo, apagamos ele do nome_limpo
        nome_limpo <- sub(prefixo_velho, "", nome_limpo, fixed = TRUE)
      }
      
      # Monta o comando de renomeação no padrão Windows
      comando <- sprintf('ren "%s" "%s%s"', nome_arquivo, prefixo_novo, nome_limpo)
      codigo <- paste0(codigo, comando, "\n")
    }
    
    return(codigo)
  })
}

# =======================================================
# 3. COMANDO DE EXECUÇÃO (GERA O APP)
# =======================================================
shinyApp(ui = ui, server = server)