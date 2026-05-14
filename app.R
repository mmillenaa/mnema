library(shiny)
library(openxlsx) # Biblioteca para formatar o Excel

# =======================================================
# IMPORTAÇÃO DAS ABAS (Os arquivos devem estar na mesma pasta)
# =======================================================
source("aba_sobre.R", encoding = "UTF-8")
source("aba_ferramenta.R", encoding = "UTF-8")
source("aba_dataset.R", encoding = "UTF-8")
source("aba_jogos.R", encoding = "UTF-8")
source("rodape.R", encoding = "UTF-8")

# =======================================================
# 1. INTERFACE DO USUÁRIO (UI)
# =======================================================
ui <- fluidPage(
  tags$head(
    tags$title("Mnema 1.0 | GPDVE FGV Direito SP"),
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
      
      /* Estilo exclusivo para o botão de jogar (Aba Jogos) */
      .btn-jogar-grande {
        display: inline-block;
        padding: 12px 30px; 
        background-color: #505c58;
        color: white !important;
        font-family: 'Merriweather', serif;
        font-weight: bold;
        font-size: 1.1em; 
        border-radius: 50px;
        text-decoration: none;
        transition: all 0.3s ease;
        box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        margin: 5px 0;
      }
      .btn-jogar-grande:hover {
        background-color: #2c3e50;
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        text-decoration: none;
      }
      
      /* Estilo para a Aba Jogos (Margens Reduzidas) */
      .game-section { text-align: left; margin-bottom: 15px; font-family: 'Roboto', sans-serif; line-height: 1.4; color: #34495e; }
      .game-section h3 { font-size: 1.3em; font-family: 'Merriweather', serif; color: #2c3e50; margin-top: 25px; margin-bottom: 8px; border-bottom: 1px solid #eceae4; padding-bottom: 5px; }
      .game-section p { font-family: 'Roboto', sans-serif; font-size: 1.1em; color: #34495e; margin-bottom: 12px; }
      
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
      p("Ferramenta educativa para organização e disponibilização de acervos históricos em Direito e violência de Estado", style = "color: #8e8c84; font-size: 1.1em; margin-top: 5px; font-style: italic;")
  ),
  
  # Sistema Principal de Abas
  tabsetPanel(
    aba_sobre,
    aba_ferramenta,
    aba_dataset,
    aba_jogos
  ),
  
  # Rodapé
  rodape
)

# =======================================================
# 2. LÓGICA DO SERVIDOR (SERVER)
# =======================================================
server <- function(input, output, session) {
  
  # ---------- LÓGICA DO RENOMEADOR (COM MODO SEQUENCIAL) ----------
  prefixo_pada <- reactive({
    area1 <- paste0(input$pais, "-", input$estado, input$repo)
    area2 <- input$fundo
    if(trimws(input$subconj) != "") area2 <- paste0(area2, "-", input$subconj)
    caract <- c(input$genero, input$especie, input$tecnica, input$forma)
    caract <- caract[caract != ""]
    area3 <- paste(caract, collapse = "-")
    partes <- c(area1, area2)
    if(area3 != "") partes <- c(partes, area3)
    prefixo <- paste(partes, collapse = "_")
    return(paste0(prefixo, "_")) 
  })
  
  output$prefixo_preview <- renderText({ prefixo_pada() })
  
  output$codigo_bat <- renderText({
    req(input$lista_arquivos)
    linhas <- unlist(strsplit(input$lista_arquivos, "\n"))
    linhas <- trimws(gsub("\"", "", linhas))
    linhas <- linhas[linhas != ""]
    if(length(linhas) == 0) return("Cole os nomes dos arquivos na caixa C acima.")
    
    prefixo_novo <- prefixo_pada()
    prefixo_velho <- trimws(input$prefixo_antigo)
    codigo <- "chcp 65001\n"
    
    for(i in seq_along(linhas)) {
      arquivo <- linhas[i]
      nome_arquivo <- basename(arquivo)
      
      if(!is.null(input$modo_renomear) && input$modo_renomear == "sequencial") {
        extensao <- ""
        if(grepl("\\.", nome_arquivo)) {
          partes <- strsplit(nome_arquivo, "\\.")[[1]]
          extensao <- paste0(".", partes[length(partes)])
        }
        nome_limpo <- sprintf("%03d%s", i, extensao)
        
      } else {
        nome_limpo <- nome_arquivo
        if(prefixo_velho != "") {
          nome_limpo <- sub(prefixo_velho, "", nome_limpo, fixed = TRUE)
        }
      }
      
      comando <- sprintf('ren "%s" "%s%s"', nome_arquivo, prefixo_novo, nome_limpo)
      codigo <- paste0(codigo, comando, "\n")
    }
    return(codigo)
  })
  
  # ---------- LÓGICA DA ABA "CRIE SEU DATASET" ----------
  
  colunas_selecionadas <- reactive({
    cols <- character(0)
    
    if(!is.null(input$perfil_base)) {
      if(input$perfil_base == "opt1") {
        cols <- c(input$opt1_b1, input$opt1_b2, input$opt1_b3)
      } else if (input$perfil_base == "opt2") {
        cols <- c(input$opt2_b1, input$opt2_b2, input$opt2_b3)
      } else if (input$perfil_base == "opt3") {
        cols <- c(input$opt3_b1, input$opt3_b2, input$opt3_b3, input$opt3_b4)
      } else if (input$perfil_base == "opt4") {
        cols <- c(input$opt4_b1, input$opt4_b2, input$opt4_b3, input$opt4_b4, input$opt4_b5, input$opt4_b6, input$opt4_b7)
      } else if (input$perfil_base == "opt5") {
        cols <- c(input$opt5_b1, input$opt5_b2, input$opt5_b3, input$opt5_b4, 
                  input$opt5_b5, input$opt5_b6, input$opt5_b7, input$opt5_b8,
                  input$opt5_b9, input$opt5_b10, input$opt5_b11, input$opt5_b12,
                  input$opt5_b13, input$opt5_b14, input$opt5_b15, input$opt5_b16, 
                  input$opt5_b17)
      }
    }
    
    if(!is.null(input$colunas_custom) && trimws(input$colunas_custom) != "") {
      custom_split <- unlist(strsplit(input$colunas_custom, ";"))
      custom_split <- trimws(custom_split)
      custom_split <- custom_split[custom_split != ""] 
      cols <- c(cols, custom_split)
    }
    
    return(cols)
  })
  
  # Ação do Botão 1: Baixar XLSX Formatado
  output$baixar_xlsx <- downloadHandler(
    filename = function() {
      paste0("meu_dataset_estrutura_", Sys.Date(), ".xlsx")
    },
    content = function(file) {
      cols <- colunas_selecionadas()
      if(length(cols) == 0) cols <- c("Nenhuma_coluna_selecionada")
      
      # Cria 5 linhas vazias para a gente aplicar o zebrado nelas
      df_vazio <- data.frame(matrix(ncol = length(cols), nrow = 5))
      colnames(df_vazio) <- cols
      
      wb <- createWorkbook()
      addWorksheet(wb, "Dataset")
      
      # 1. Joga os dados puros na planilha (sem usar Tabela Automática do Excel)
      writeData(wb, "Dataset", x = df_vazio)
      
      # 2. Cria o estilo do seu cabeçalho (AZUL VIBRANTE + LETRA BRANCA)
      estilo_cabecalho <- createStyle(
        wrapText = TRUE, 
        halign = "center", 
        valign = "center", 
        textDecoration = "bold", 
        fontName = "Merriweather", 
        fontSize = 11,
        fgFill = "#10b3cf",        
        fontColour = "#ffffff"     
      )
      
      # Pinta apenas a Linha 1 de Azul
      addStyle(wb, "Dataset", style = estilo_cabecalho, rows = 1, cols = 1:length(cols), gridExpand = TRUE)
      
      # 3. Cria o estilo do corpo (Fonte e Quebra de Linha) e aplica nas linhas de 2 a 6
      estilo_corpo <- createStyle(wrapText = TRUE, valign = "top", fontName = "Merriweather", fontSize = 11)
      addStyle(wb, "Dataset", style = estilo_corpo, rows = 2:6, cols = 1:length(cols), gridExpand = TRUE)
      
      # 4. Cria o estilo Zebrado manualmente (Fundo cinza claro)
      estilo_zebrado <- createStyle(fgFill = "#f4f7f6")
      
      # Pinta apenas as linhas pares (3 e 5 no nosso caso) preservando a fonte.
      addStyle(wb, "Dataset", style = estilo_zebrado, rows = c(3, 5), cols = 1:length(cols), gridExpand = TRUE, stack = TRUE)
      
      # 5. Congela a primeira linha
      freezePane(wb, "Dataset", firstActiveRow = 2)
      
      # 6. Define a largura das colunas em 35 para garantir que a quebra de texto funcione bonito
      setColWidths(wb, "Dataset", cols = 1:length(cols), widths = 35)
      
      # Salva o arquivo final
      saveWorkbook(wb, file, overwrite = TRUE)
    }
  )
  
  # Ação do Botão 2: Baixar Glossário TXT
  output$baixar_glossario <- downloadHandler(
    filename = function() {
      "Glossario_dos_campos_da_base_de_dados.txt"
    },
    content = function(file) {
      cols <- colunas_selecionadas()
      
      texto <- "========================================================\n"
      texto <- paste0(texto, "         GLOSSÁRIO DOS CAMPOS DA BASE DE DADOS\n")
      texto <- paste0(texto, "========================================================\n\n")
      texto <- paste0(texto, "Instrução: Preencha os campos abaixo, segundo sua metodologia.\n\n")
      
      if(length(cols) > 0) {
        for(coluna in cols) {
          texto <- paste0(texto, "► ", coluna, "\n")
          texto <- paste0(texto, "Defina este campo para seu público leitor. O que você quer dizer aqui?\n")
          texto <- paste0(texto, "[Digite sua definição metodológica aqui]\n\n")
          texto <- paste0(texto, "--------------------------------------------------------\n")
        }
      } else {
        texto <- paste0(texto, "Nenhuma coluna foi selecionada no aplicativo.")
      }
      
      writeLines(enc2utf8(texto), file, useBytes = TRUE)
    }
  )
}

# =======================================================
# 3. COMANDO DE EXECUÇÃO (GERA O APP)
# =======================================================
shinyApp(ui = ui, server = server)