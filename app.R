library(shiny)
library(openxlsx) # Biblioteca para formatar o Excel

# =======================================================
# IMPORTAÇÃO DAS ABAS (Os arquivos devem estar na mesma pasta)
# =======================================================
source("aba_sobre.R", encoding = "UTF-8")
source("aba_ferramenta.R", encoding = "UTF-8")
source("aba_dataset.R", encoding = "UTF-8")
source("aba_complementos.R", encoding = "UTF-8")
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
      .atencao-box { background-color: #fff8e1; border-left: 5px solid #f1c40f; padding: 15px; margin-bottom: 20px; border-radius: 4px; color: #5c553c; }
      
      /* Estilo exclusivo para o botão de jogar (Aba Complementos) */
      .btn-jogar-grande { display: inline-block; padding: 12px 30px; background-color: #505c58; color: white !important; font-family: 'Merriweather', serif; font-weight: bold; font-size: 1.1em; border-radius: 50px; text-decoration: none; transition: all 0.3s ease; box-shadow: 0 4px 15px rgba(0,0,0,0.15); margin: 5px 0; }
      .btn-jogar-grande:hover { background-color: #2c3e50; transform: translateY(-3px); box-shadow: 0 8px 25px rgba(0,0,0,0.2); text-decoration: none; }
      
      /* Estilo para a Aba Complementos (Margens Reduzidas) */
      .game-section { text-align: left; margin-bottom: 15px; font-family: 'Roboto', sans-serif; line-height: 1.4; color: #34495e; }
      .game-section h3 { font-size: 1.3em; font-family: 'Merriweather', serif; color: #2c3e50; margin-top: 25px; margin-bottom: 8px; border-bottom: 1px solid #eceae4; padding-bottom: 5px; }
      .game-section p { font-family: 'Roboto', sans-serif; font-size: 1.1em; color: #34495e; margin-bottom: 12px; }
      
      /* Rodapé e Citação */
      .footer-referencias { font-size: 0.85em; color: #7f8c8d; margin-top: 40px; margin-bottom: 20px; padding: 20px; background-color: #f8f9fa; border-top: 1px solid #dcdde1; border-radius: 5px; font-family: 'Roboto', sans-serif; }
      .footer-referencias h5 { font-size: 1.05em; color: #34495e; font-weight: bold; margin-top: 15px; margin-bottom: 10px; font-family: 'Merriweather', serif; }
      .footer-referencias p { margin-bottom: 5px; line-height: 1.4; }
      .footer-referencias a { color: #7f8c8d; text-decoration: underline; }
      .footer-referencias a.nome-link { color: #2980b9; text-decoration: none; font-weight: bold; }
      .footer-referencias a.nome-link:hover { text-decoration: underline; }
      .footer-referencias a:hover { color: #2980b9; }
      .citacao-box { background-color: #eef2f5; padding: 10px; border-left: 3px solid #2980b9; font-family: 'IBM Plex Mono', monospace; font-size: 0.95em; color: #333; margin-bottom: 15px;}
      
      /* ==================== MODO ESCURO ==================== */
      body { transition: background-color 0.4s, color 0.4s; }
      body.dark-mode { background-color: #121212; color: #e0e0e0; }
      
      /* Textos Gerais */
      body.dark-mode h1, body.dark-mode h2, body.dark-mode h3, body.dark-mode h4, body.dark-mode h5, body.dark-mode p, body.dark-mode li, body.dark-mode span, body.dark-mode strong, body.dark-mode b { color: #e0e0e0 !important; }
      
      /* Caixas (wells e fundos brancos) */
      body.dark-mode .well { background-color: #1e1e1e !important; border-color: #333 !important; }
      body.dark-mode summary { background-color: #2a2a2a !important; color: #e0e0e0 !important; border-color: #444 !important; }
      body.dark-mode div[style*='border: 1px solid #eceae4'] { border-color: #444 !important; }
      body.dark-mode div[style*='background:#fdfdfc'], body.dark-mode div[style*='background-color: #fdfdfc'], body.dark-mode div[style*='background-color: #ffffff'] { background-color: #1e1e1e !important; color: #e0e0e0 !important; }
      
      /* Tratamento Noturno das Caixas Específicas */
      body.dark-mode .instrucao-box { background-color: #2a2a2a !important; border-left-color: #829a91 !important; color: #e0e0e0 !important; }
      body.dark-mode .alerta-box { background-color: #2a2a2a !important; border-left-color: #10b3cf !important; color: #e0e0e0 !important; }
      body.dark-mode .atencao-box { background-color: #2a2a2a !important; border-left-color: #f1c40f !important; color: #e0e0e0 !important; }
      body.dark-mode .citacao-box { background-color: #1e1e1e !important; border-left-color: #10b3cf !important; color: #dcdde1 !important;}
      
      /* ========== CORREÇÃO DROPDOWNS E INPUTS ========== */
      body.dark-mode .form-control { background-color: #2a2a2a !important; color: #e0e0e0 !important; border-color: #444 !important; }
      body.dark-mode .selectize-input, body.dark-mode .selectize-input.full { background-color: #2a2a2a !important; color: #e0e0e0 !important; border-color: #444 !important; }
      body.dark-mode .selectize-input > *, body.dark-mode .selectize-input input { color: #e0e0e0 !important; }
      body.dark-mode .selectize-dropdown { background-color: #2a2a2a !important; color: #e0e0e0 !important; border-color: #444 !important; }
      body.dark-mode .selectize-dropdown .active { background-color: #10b3cf !important; color: #ffffff !important; }
      body.dark-mode .selectize-dropdown .option { color: #e0e0e0 !important; }
      body.dark-mode .radio input[type='radio'], body.dark-mode .checkbox input[type='checkbox'] { filter: invert(1) hue-rotate(180deg) brightness(1.5); }
      
      /* Demais elementos noturnos */
      body.dark-mode .nav-tabs { border-bottom-color: #333; }
      body.dark-mode .nav-tabs > li > a { color: #888; }
      body.dark-mode .nav-tabs > li.active > a, body.dark-mode .nav-tabs > li.active > a:focus, body.dark-mode .nav-tabs > li.active > a:hover { background-color: #1e1e1e !important; color: #10b3cf !important; border-color: #333 !important; border-bottom-color: transparent !important; }
      body.dark-mode code { background-color: #333; color: #ffb86c; }
      body.dark-mode .footer-referencias { background-color: #1e1e1e !important; border-color: #333 !important; }
      body.dark-mode .footer-referencias h5, body.dark-mode .footer-referencias p, body.dark-mode .footer-referencias a { color: #a0a0a0 !important; }
    "))
  ),
  
  # Cabeçalho Principal Customizado
  div(style = "text-align: center; margin-top: 60px; margin-bottom: 40px; position: relative;",
      
      # Agrupador do Menu (Flexbox para manter o dropdown e o Dark Mode perfeitamente alinhados)
      div(style = "position: absolute; top: -45px; right: 10px; display: flex; align-items: center; gap: 10px; z-index: 1000;",
          
          # 1. Nosso Dropdown Customizado (Controla o Google escondido)
          HTML('
            <select id="custom_translate" onchange="translatePage(this.value)" style="background-color: #2c3e50; color: white; border: none; padding: 6px 12px; font-size: 0.85em; border-radius: 20px; cursor: pointer; font-family: \'Roboto\', sans-serif; font-weight: bold; box-shadow: 0 4px 6px rgba(0,0,0,0.1); outline: none;">
              <option value="" disabled selected>🌐 Select Language</option>
              <option value="pt">Português (Brasil)</option>
              <option value="en">English</option>
              <option value="es">Español</option>
            </select>
            
            <div id="google_translate_element" style="display:none;"></div>
            
            <script type="text/javascript">
              function googleTranslateElementInit() {
                new google.translate.TranslateElement({
                  pageLanguage: "pt",
                  includedLanguages: "en,es,pt",
                  autoDisplay: false
                }, "google_translate_element");
              }
              
              // A função que liga o nosso botão ao motor invisível do Google
              function translatePage(lang) {
                var googSelect = document.querySelector(".goog-te-combo");
                if (googSelect) {
                    googSelect.value = lang;
                    googSelect.dispatchEvent(new Event("change"));
                }
              }
            </script>
            <script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
            
            <style>
              /* Extermina absolutamente qualquer lixo visual que o Google tente injetar no topo do ecrã */
              body { top: 0px !important; position: static !important; } 
              .skiptranslate { display: none !important; }
              #goog-gt-tt { display: none !important; }
            </style>
          '),
          
          # 2. O botão mágico de inversão de cores
          HTML('<button onclick="document.body.classList.toggle(\'dark-mode\'); if(document.body.classList.contains(\'dark-mode\')){ this.innerHTML = \'☀️ Modo Claro\'; } else { this.innerHTML = \'🌙 Modo Escuro\'; }" style="background-color: #2c3e50; color: white; border: none; padding: 6px 12px; font-size: 0.85em; border-radius: 20px; cursor: pointer; font-family: \'Roboto\', sans-serif; font-weight: bold; box-shadow: 0 4px 6px rgba(0,0,0,0.1); transition: 0.3s;">🌙 Modo Escuro</button>')
      ),
      
      h1("Mnema 1.0", style = "font-size: 3.5em; margin-bottom: 0; letter-spacing: 1px;"),
      p("Ferramenta educativa para organização e disponibilização de acervos históricos em Direito e violência de Estado", style = "color: #8e8c84; font-size: 1.1em; margin-top: 5px; font-style: normal;")
  ),
  
  # Sistema Principal de Abas
  tabsetPanel(
    aba_sobre,
    aba_ferramenta,
    aba_dataset,
    aba_complementos
  ),
  
  # Rodapé
  rodape
)

# =======================================================
# 2. LÓGICA DO SERVIDOR (SERVER)
# =======================================================
server <- function(input, output, session) {
  
  # ---------- LÓGICA DO RENOMEADOR (COM MODO SEQUENCIAL E CAMPO 4 DINÂMICO) ----------
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
    
    prefixo_base <- prefixo_pada()
    prefixo_velho <- trimws(input$prefixo_antigo)
    campo4 <- trimws(input$id_item)
    
    codigo <- "chcp 65001\n"
    
    for(i in seq_along(linhas)) {
      arquivo <- linhas[i]
      nome_arquivo <- basename(arquivo)
      
      # Isola a extensão para não quebrar o arquivo ao adicionar sufixos
      extensao <- ""
      nome_sem_ext <- nome_arquivo
      if(grepl("\\.", nome_arquivo)) {
        partes_nome <- strsplit(nome_arquivo, "\\.")[[1]]
        extensao <- paste0(".", partes_nome[length(partes_nome)])
        # Remove a extensão do nome base
        nome_sem_ext <- sub(paste0(extensao, "$"), "", nome_arquivo)
      }
      
      # Remove o prefixo antigo, se houver
      if(prefixo_velho != "") {
        nome_sem_ext <- sub(prefixo_velho, "", nome_sem_ext, fixed = TRUE)
      }
      
      # -------------------------------------------------------------
      # APLICAÇÃO DAS REGRAS LOGICAS DO CAMPO 4 E MODO DE RENOMEAÇÃO
      # -------------------------------------------------------------
      if(!is.null(input$modo_renomear) && input$modo_renomear == "sequencial") {
        seq_num <- sprintf("%03d", i)
        
        if(campo4 != "") {
          # Regra: Sequencial com Campo 4
          nome_final <- paste0(prefixo_base, campo4, "-", seq_num, extensao)
        } else {
          # Regra: Apenas Sequencial
          nome_final <- paste0(prefixo_base, seq_num, extensao)
        }
        
      } else {
        # Modo: Manter Nome Original
        if(campo4 != "") {
          # Regra: Manter nome original e adicionar Campo 4 no final (antes da extensão)
          nome_final <- paste0(prefixo_base, nome_sem_ext, "-", campo4, extensao)
        } else {
          # Regra: Apenas manter nome original
          nome_final <- paste0(prefixo_base, nome_sem_ext, extensao)
        }
      }
      
      comando <- sprintf('ren "%s" "%s"', nome_arquivo, nome_final)
      codigo <- paste0(codigo, comando, "\n")
    }
    return(codigo)
  })
  
  # ---------- LÓGICA DO RELATÓRIO DE CORRESPONDÊNCIA ----------
  output$baixar_relatorio_renomeacao <- downloadHandler(
    filename = function() {
      paste0("relatorio_correspondencia_", Sys.Date(), ".txt")
    },
    content = function(file) {
      req(input$lista_arquivos)
      linhas <- unlist(strsplit(input$lista_arquivos, "\n"))
      linhas <- trimws(gsub("\"", "", linhas))
      linhas <- linhas[linhas != ""]
      if(length(linhas) == 0) {
        writeLines("Nenhum arquivo fornecido na interface.", file)
        return()
      }
      
      prefixo_base <- prefixo_pada()
      prefixo_velho <- trimws(input$prefixo_antigo)
      campo4 <- trimws(input$id_item)
      
      # Monta o cabeçalho do documento (Com fuso horário de Brasília forçado)
      texto <- c(
        "========================================================",
        "          RELATÓRIO DE CORRESPONDÊNCIA DE NOMES",
        "========================================================",
        paste("Data de geração:", format(Sys.time(), "%d/%m/%Y às %H:%M:%S", tz = "America/Sao_Paulo")),
        "Este documento registra o mapeamento entre os nomes",
        "originais dos arquivos e suas nomenclaturas padronizadas.",
        "========================================================",
        ""
      )
      
      # Faz o loop cruzando os nomes (De -> Para)
      for(i in seq_along(linhas)) {
        arquivo <- linhas[i]
        
        # Tesoura brutal: arranca qualquer endereço de pasta (C:\...) e deixa só o nome final
        nome_arquivo <- gsub(".*[\\\\/]", "", arquivo)
        
        # Isola a extensão para não quebrar o arquivo
        extensao <- ""
        nome_sem_ext <- nome_arquivo
        if(grepl("\\.", nome_arquivo)) {
          partes_nome <- strsplit(nome_arquivo, "\\.")[[1]]
          extensao <- paste0(".", partes_nome[length(partes_nome)])
          nome_sem_ext <- sub(paste0(extensao, "$"), "", nome_arquivo)
        }
        
        # Remove o prefixo antigo
        if(prefixo_velho != "") {
          nome_sem_ext <- sub(prefixo_velho, "", nome_sem_ext, fixed = TRUE)
        }
        
        # -------------------------------------------------------------
        # APLICAÇÃO DAS REGRAS LOGICAS DO CAMPO 4 E MODO DE RENOMEAÇÃO
        # -------------------------------------------------------------
        if(!is.null(input$modo_renomear) && input$modo_renomear == "sequencial") {
          seq_num <- sprintf("%03d", i)
          
          if(campo4 != "") {
            nome_final <- paste0(prefixo_base, campo4, "-", seq_num, extensao)
          } else {
            nome_final <- paste0(prefixo_base, seq_num, extensao)
          }
          
        } else {
          # Modo: Manter Nome Original
          if(campo4 != "") {
            nome_final <- paste0(prefixo_base, nome_sem_ext, "-", campo4, extensao)
          } else {
            nome_final <- paste0(prefixo_base, nome_sem_ext, extensao)
          }
        }
        
        # Monta a linha bonita, já sem a pasta no "De:"
        linha_log <- sprintf("[%03d] De: %s   -->   Para: %s", i, nome_arquivo, nome_final)
        texto <- c(texto, linha_log)
      }
      
      # Salva o arquivo em UTF-8
      writeLines(enc2utf8(texto), file, useBytes = TRUE)
    }
  )
  
  # ---------- LÓGICA DA ABA "CRIE SEU DATASET" ----------
  
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