aba_ferramenta <- tabPanel("Ferramenta de renomeação", icon = icon("wrench", lib="glyphicon"),
                           br(),
                           
                           # Texto de apresentação
                           div(style = "margin-bottom: 25px;",
                               p(HTML("Esta ferramenta é voltada ao trabalho de renomeação em lote e catalogação de acervos digitais. Sua arquitetura de metadados aplica as diretrizes de preservação digital do Conselho Nacional de Arquivos (CONARQ) e as normas de descrição arquivística nacionais (NOBRADE) e internacionais (ISAD-G), conforme sistematizado no manual PADÁ (2025)."), 
                                 style = "text-align: left; font-size: 1.05em; color: #505c58; font-family: 'Roboto', sans-serif;")
                           ),
                           
                           # Sub-abas aninhadas dentro da ferramenta
                           tabsetPanel(
                             
                             # Sub-aba: Aplicativo principal
                             tabPanel("Aplicativo",
                                      br(),
                                      sidebarLayout(
                                        sidebarPanel(
                                          # CSS injetado para forçar o itálico nos placeholders e nas opções vazias
                                          tags$head(tags$style(HTML("
                                            ::placeholder { font-style: italic; color: #95a5a6; }
                                            select option[value=''] { font-style: italic; color: #95a5a6; }
                                          "))),
                                          
                                          h4("1. Identificação do repositório"),
                                          helpText("Utilize as siglas oficiais para padronização internacional."),
                                          textInput("pais", "País (obrigatório)", value = "", placeholder = "Ex: BR"),
                                          textInput("estado", "Estado (obrigatório)", value = "", placeholder = "Ex: SP, RJ"),
                                          textInput("repo", "Sigla do fundo ou coleção (obrigatório)", value = "", placeholder = "Ex: APESP, BNM, GPDVE"),
                                          hr(style="border-top: 1px solid #eceae4;"),
                                          
                                          h4("2. Conjunto documental"),
                                          helpText("Use as siglas e codificações da instituição detentora oficial. Se não houver, crie um código único e consistente, elucidando a hierarquia da coleção."),
                                          textInput("fundo", "Série (obrigatório)", value = "", placeholder = "Insira aqui"),
                                          textInput("subconj", "Subsérie (opcional)", value = "", placeholder = "Insira aqui"),
                                          hr(style="border-top: 1px solid #eceae4;"),
                                          
                                          h4("3. Caracterização da unidade"),
                                          
                                          # --- GÊNERO ---
                                          tags$label("Gênero documental", class = "control-label"),
                                          helpText("Observe a linguagem do documento, isto é, o sistema de signos imediatamente acessível aos sentidos humanos; não confunda com suporte nem com assunto."),
                                          uiOutput("ajuda_genero"),
                                          selectInput("genero", label = NULL, 
                                                      choices = c("Insira aqui" = "", 
                                                                  "Arquitetônico (ATT)" = "ATT", "Audiovisual (AVS)" = "AVS", "Bibliográfico (BIB)" = "BIB", "Cartográfico (CAR)" = "CAR", "Cinematográfico (CIN)" = "CIN", "Eletrônico (ELE)" = "ELE", "Filmográfico (FLG)" = "FLG", "Fonográfico (FON)" = "FON", "Gênero não determinado (NDT)" = "NDT", "Gênero varia (VAR)" = "VAR", "Hemerográfico (HEM)" = "HEM", "Iconográfico (ICO)" = "ICO", "Sonoro (SOM)" = "SOM", "Táctil (TCT)" = "TCT", "Textual (TXT)" = "TXT", "Tridimensional (3DM)" = "3DM"), 
                                                      selected = ""),
                                          
                                          # --- ESPÉCIE ---
                                          tags$label("Espécie/Tipo", class = "control-label"),
                                          helpText("Observe qual é a função ou forma documental do objeto (ex.: relatório, apresentação, processo, fotografia), independentemente da extensão do arquivo."),
                                          uiOutput("ajuda_especie"),
                                          selectInput("especie", label = NULL, 
                                                      choices = c("Insira aqui" = "", 
                                                                  "Álbum (ALB)" = "ALB", "Ampliação fotográfica (AMP)" = "AMP", "Aplicativo (APP)" = "APP", "Arquivo-fonte (AFT)" = "AFT", "Balanço (BLN)" = "BLN", "Banco de dados (BDD)" = "BDD", "Bando (BND)" = "BND", "Bibliografia (BBL)" = "BBL", "Bilhete (BLH)" = "BLH", "Biografia (BIO)" = "BIO", "Boletim (BOL)" = "BOL", "Breve (BRV)" = "BRV", "Caderneta (CDN)" = "CDN", "Caderno (CDR)" = "CDR", "Cálculo (CAL)" = "CAL", "Caricatura (CRC)" = "CRC", "Carta (CRT)" = "CRT", "Carta [Cartográfica] (CTG)" = "CTG", "Cartão (CTO)" = "CTO", "Cartão-postal (CPS)" = "CPS", "Cartaz (CTZ)" = "CTZ", "Cartilha (CLH)" = "CLH", "Catálogo - geral (CAT)" = "CAT", "Catálogo - inst. de pesquisa (IPC)" = "IPC", "Cédula - dinheiro (CDI)" = "CDI", "Cédula - identificação (CID)" = "CID", "Censo (CEN)" = "CEN", "Certidão (CTD)" = "CTD", "Certificado (CTF)" = "CTF", "Circular (CRL)" = "CRL", "Códice (CDC)" = "CDC", "Código-fonte (CFT)" = "CFT", "Coletânea (COL)" = "COL", "Comprovante (CMP)" = "CMP", "Comunicado (COM)" = "COM", "Conhecimento (CNH)" = "CNH", "Constituição (CNS)" = "CNS", "Consulta (CSL)" = "CSL", "Conta (CNT)" = "CNT", "Contato fotográfico (CON)" = "CON", "Contrato (CTT)" = "CTT", "Correio eletrônico (EML)" = "EML", "Correspondência (CRS)" = "CRS", "Crachá (CRH)" = "CRH", "Crônica (CNC)" = "CNC", "Cronograma (CNG)" = "CNG", "Declaração (DCL)" = "DCL", "Decreto (DCR)" = "DCR", "Decupagem (DCU)" = "DCU", "Defesa (DEF)" = "DEF", "Demonstrativo (DMN)" = "DMN", "Denúncia (DNN)" = "DNN", "Depoimento (DPM)" = "DPM", "Desenho (DES)" = "DES", "Despacho (DCH)" = "DCH", "Diagrama (DGR)" = "DGR", "Diapositivo (DPS)" = "DPS", "Diário (DIA)" = "DIA", "Dicionário (DIC)" = "DIC", "Diploma (DPL)" = "DPL", "Discurso (DSC)" = "DSC", "Dissertação (DSR)" = "DSR", "Dossiê (DSS)" = "DSS", "Edital (EDT)" = "EDT", "Enciclopédia (ECL)" = "ECL", "Entrevista (ENT)" = "ENT", "Envelope (ENV)" = "ENV", "Espécie não determinada (NDT)" = "NDT", "Espécie varia (VAR)" = "VAR", "Esquema (ESQ)" = "ESQ", "Estatuto (ETT)" = "ETT", "Expediente (EXD)" = "EXD", "Exposição/instalação (EXP)" = "EXP", "Fascículo (FAS)" = "FAS", "Fé (FEE)" = "FEE", "Ficha (FCH)" = "FCH", "Figura (FIG)" = "FIG", "Filme (FME)" = "FME", "Filmografia (FGF)" = "FGF", "Folheto (FLH)" = "FLH", "Fonograma (FNG)" = "FNG", "Formulário (FRM)" = "FRM", "Fotografia (FOT)" = "FOT", "Gazeta (GZT)" = "GZT", "Globo (GLB)" = "GLB", "Gravura (GRR)" = "GRR", "Guia - geral (GIA)" = "GIA", "Guia - inst. de pesquisa (IPG)" = "IPG", "Habeas-corpus (HCR)" = "HCR", "Índice (IND)" = "IND", "Informe (INF)" = "INF", "Inquérito (INQ)" = "INQ", "Instrução (INS)" = "INS", "Intimação (ITM)" = "ITM", "Inventário - geral (INV)" = "INV", "Inventário - inst. de pesquisa (IPI)" = "IPI", "Jornal (JOR)" = "JOR", "Justificativa (JUS)" = "JUS", "Laudo (LAU)" = "LAU", "Lei/Legislação (LEI)" = "LEI", "Lembrete (LBR)" = "LBR", "Licença (LCN)" = "LCN", "Lista / Lista de arquivos (LST)" = "LST", "Livreto (LVT)" = "LVT", "Livro (LVR)" = "LVR", "Maço (MCO)" = "MCO", "Mandado (MND)" = "MND", "Manifesto - geral (MNF)" = "MNF", "Manifesto de carga digital (MCG)" = "MCG", "Manual (MNL)" = "MNL", "Mapa (MAP)" = "MAP", "Memorando (MEM)" = "MEM", "Memorial (MMR)" = "MMR", "Mensagem (MSG)" = "MSG", "Monografia (MNG)" = "MNG", "Música (MUS)" = "MUS", "Negativo fotográfico (NEG)" = "NEG", "Nomeação (NOM)" = "NOM", "Norma (NRM)" = "NRM", "Nota (NTA)" = "NTA", "Notícia (NOT)" = "NOT", "Notificação (NTF)" = "NTF", "Observações técnicas (OBS)" = "OBS", "Ofício (OFC)" = "OFC", "Opúsculo (OPS)" = "OPS", "Orçamento (ORC)" = "ORC", "Ordem (ORD)" = "ORD", "Organograma (ORG)" = "ORG", "Página eletrônica (WWW)" = "WWW", "Panfleto (PFL)" = "PFL", "Parâmetro de execução (PRM)" = "PRM", "Parecer (PAR)" = "PAR", "Passagem (PSG)" = "PSG", "Passaporte (PSP)" = "PSP", "Patente (PTT)" = "PTT", "Pauta (PTA)" = "PTA", "Pedido (PED)" = "PED", "Periódico (PRD)" = "PRD", "Petição (PET)" = "PET", "Pintura (PIN)" = "PIN", "Planilha / Planilha eletrônica (PNL)" = "PNL", "Plano (PNO)" = "PNO", "Planta (PLN)" = "PLN", "Poema (POM)" = "POM", "Portaria (POR)" = "POR", "Postagem eletrônica (POS)" = "POS", "Processo (PRC)" = "PRC", "Proclamação (PCL)" = "PCL", "Procuração (PCR)" = "PCR", "Programa de computador (PGR)" = "PGR", "Programa de rádio e TV (PGM)" = "PGM", "Pronunciamento (PNC)" = "PNC", "Prontuário (PRT)" = "PRT", "Propaganda (PPG)" = "PPG", "Proposta (PPS)" = "PPS", "Prospecto (PRO)" = "PRO", "Provisão (PRV)" = "PRV", "Quadro (QDR)" = "QDR", "Recibo (RCB)" = "RCB", "Recorte (REC)" = "REC", "Recurso (RCR)" = "RCR", "Regimento (RGM)" = "RGM", "Registro geral (REG)" = "REG", "Regulamento (RGL)" = "RGL", "Relação (RLC)" = "RLC", "Relato (RLT)" = "RLT", "Relatório (REL)" = "REL", "Relatório de diagn. pós-process. (DG2)" = "DG2", "Relatório de diagn. pré-process. (DGN)" = "DGN", "Relatório de execução / log (LOG)" = "LOG", "Relatório de extração de dados (EXT)" = "EXT", "Relatório de verificação de erro (ERR)" = "ERR", "Relatório técnico complementar (TEC)" = "TEC", "Representação (REP)" = "REP", "Requerimento (REQ)" = "REQ", "Resolução (RES)" = "RES", "Retrato (RTT)" = "RTT", "Revista (VER)" = "VER", "Roteiro (ROT)" = "ROT", "Salvo-conduto (SVC)" = "SVC", "Script (SCR)" = "SCR", "Sentença (SEN)" = "SEN", "Sistema - geral (SIS)" = "SIS", "Sistema de difusão e acesso (SDA)" = "SDA", "Sistema de Gerenc. de Banco de Dados (SGB)" = "SGB", "Sistema de Gestão Arquiv. de Docs (SIG)" = "SIG", "Sistema de preservação digital (SPD)" = "SPD", "Solicitação (SOL)" = "SOL", "Suplemento (SUP)" = "SUP", "Tabela / Tabela eletrônica (TBL)" = "TBL", "Tabela de importação AtoM (ATM)" = "ATM", "Telegrama (TLG)" = "TLG", "Termo (TRM)" = "TRM", "Tese (TSE)" = "TSE", "Testamento (TES)" = "TES", "Transcrição (TRA)" = "TRA", "Traslado (TSL)" = "TSL", "Tratado (TRT)" = "TRT", "Videofonograma (VFG)" = "VFG", "Videograma (VGR)" = "VGR", "Vinheta (VNH)" = "VNH"), 
                                                      selected = ""),
                                          
                                          # --- TÉCNICA ---
                                          tags$label("Técnica de registro", class = "control-label"),
                                          helpText("Observe como o documento foi produzido ou fixado (ex.: nato-digital, digitalizado, manuscrito, impresso). Não utilize a extensão do arquivo como critério."),
                                          uiOutput("ajuda_tecnica"),
                                          selectInput("tecnica", label = NULL, 
                                                      choices = c("Insira aqui" = "", 
                                                                  "Ampliação fotográfica (AMP)" = "AMP", "Aplicação de marca d'água (MDA)" = "MDA", "Apresentação digital (APR)" = "APR", "Áudio digital (AUD)" = "AUD", "Contato fotográfico (CON)" = "CON", "Conversão de formato de arquivo (COO)" = "COO", "Cópia de arquivo com renomeação (CCR)" = "CCR", "Cópia de arquivo sem renomeação (CSR)" = "CSR", "Dados digital (DDS)" = "DDS", "Datilografado (DAT)" = "DAT", "Desenho à mão (DSM)" = "DSM", "Digital (DGT)" = "DGT", "Digitalizado (DGZ)" = "DGZ", "Exclusão controlada de arquivos (DEL)" = "DEL", "Exportação de metadados embutidos (ME0)" = "ME0", "Exposição fotográfica (EXF)" = "EXF", "Filmagem analógica (FLA)" = "FLA", "Filmagem convencional (FLC)" = "FLC", "Filmagem geral (FLM)" = "FLM", "Fotografia / Exposição fotográfica (FOT)" = "FOT", "Geração de PDF simples (PDF)" = "PDF", "Geração de PDF/A (PDA)" = "PDA", "Gravação analógica (GRA)" = "GRA", "Gravação convencional (GRC)" = "GRC", "Gravação geral (GRV)" = "GRV", "Imagem digital (IMG)" = "IMG", "Imagem matricial digital (IMT)" = "IMT", "Imagem vetorial digital (IVT)" = "IVT", "Importação de metadados embutidos (MI0)" = "MI0", "Impresso (IMP)" = "IMP", "Listagem automática com metadados (LCM)" = "LCM", "Listagem automática sem metadados (LSM)" = "LSM", "Manuscrito (MAN)" = "MAN", "Microfilmagem (MFM)" = "MFM", "Movimentação de arquivo c/ renomeação (MCR)" = "MCR", "Movimentação de arquivo s/ renomeação (MSR)" = "MSR", "Nato-digital (NDG)" = "NDG", "Negativo fotográfico (NEG)" = "NEG", "Preparação de pacote de preserv. - checksum (PP1)" = "PP1", "Preparação de pacote de preserv. - descrição (PP2)" = "PP2", "Reconhecimento Óptico de Caracteres (OCR)" = "OCR", "Renomeação de arquivo s/ cópia ou mov. (RNM)" = "RNM", "Técnica / Processo não determinado (NDT)" = "NDT", "Técnica / Processo varia (VAR)" = "VAR", "Texto digital (TXT)" = "TXT", "Validação de formato de arquivo (V00)" = "V00", "Verificação de desempenho (VDP)" = "VDP", "Verificação de integridade - comparação (CKC)" = "CKC", "Verificação de integridade - extração (CKO)" = "CKO", "Vídeo digital (VID)" = "VID"), 
                                                      selected = ""),
                                          
                                          # --- FORMA ---
                                          tags$label("Forma do registro", class = "control-label"),
                                          helpText("Observe o estágio de elaboração do objeto digital (ex.: matriz, derivada, bruta, tratada)."),
                                          uiOutput("ajuda_forma"),
                                          selectInput("forma", label = NULL, 
                                                      choices = c("Insira aqui" = "", 
                                                                  "Ampliação fotográfica (AMP)" = "AMP", "Contato fotográfico (CON)" = "CON", "Derivada bruta - produção automática (DB0)" = "DB0", "Derivada bruta - produção manual (DT0)" = "DT0", "Derivada tratada - tratamento conhecido (DT1)" = "DT1", "Derivada tratada - tratamento desconhecido (DTX)" = "DTX", "Matriz bruta - produção automática (MB0)" = "MB0", "Matriz bruta - produção manual (MT0)" = "MT0", "Matriz tratada - tratamento conhecido (MT1)" = "MT1", "Matriz tratada - tratamento desconhecido (MTX)" = "MTX", "Negativo fotográfico (NEG)" = "NEG"), 
                                                      selected = ""),
                                          
                                          hr(style="border-top: 1px solid #eceae4; margin: 20px 0;"),
                                          
                                          h4("4. Identificação da unidade"),
                                          helpText("Insira numerações de caixas, pastas ou itens específicos para fechar o prefixo."),
                                          textInput("id_item", "Identificador complementar (obrigatório)", value = "", placeholder = "Ex: 0001-001")
                                        ),
                                        
                                        # -----------------------------------------------------
                                        mainPanel(
                                          
                                          div(class = "instrucao-box", 
                                              h4("Como usar de forma rápida:"),
                                              p("1. Vá na pasta do seu computador onde estão os arquivos ", strong("já separados por tipo"), "."),
                                              p("2. Selecione todos os arquivos que deseja renomear (aperte ", code("Ctrl + A"), ")."),
                                              p("3. Copie o caminho deles (no Windows 11, aperte ", code("Ctrl + Shift + C"), ")."),
                                              p("4. Cole na caixa 'C' abaixo.")
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
                                          
                                          h4("B. Modo de renomeação:"),
                                          radioButtons("modo_renomear", "",
                                                       choices = list("Manter nome original do arquivo (apenas adiciona o prefixo)" = "manter",
                                                                      "Forçar numeração sequencial (ex: 001, 002... apaga o nome antigo)" = "sequencial"),
                                                       selected = "manter"),
                                          hr(style="border-top: 1px solid #eceae4; margin: 25px 0;"),
                                          
                                          h4("C. Cole aqui os arquivos copiados:"),
                                          textAreaInput("lista_arquivos", "", rows = 6, placeholder = '"C:\\Pasta\\arquivo.jpg"'),
                                          hr(style="border-top: 1px solid #eceae4; margin: 25px 0;"),
                                          
                                          h4("D. Código final (script .bat):"),
                                          p("Siga as instruções na aba 'Tutorial passo a passo' para rodar este código no seu computador."),
                                          
                                          # Caixa com posição relativa para o botão flutuar
                                          div(style = "position: relative;",
                                              
                                              conditionalPanel(
                                                condition = "input.lista_arquivos && input.lista_arquivos.trim() !== ''",
                                                HTML('<button id="btnCopiar" onclick="var el = document.getElementById(\'codigo_bat\'); var range = document.createRange(); range.selectNodeContents(el); var sel = window.getSelection(); sel.removeAllRanges(); sel.addRange(range); document.execCommand(\'copy\'); sel.removeAllRanges(); var btn = document.getElementById(\'btnCopiar\'); btn.innerHTML = \'✅ Copiado!\'; setTimeout(function(){ btn.innerHTML = \'📋 Copiar\'; }, 2000);" style="position: absolute; top: 10px; right: 20px; background-color: #505c58; color: white; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer; font-family: \'Roboto\', sans-serif; font-size: 0.85em; font-weight: bold; z-index: 10; box-shadow: 0 2px 5px rgba(0,0,0,0.2);">📋 Copiar</button>')
                                              ),
                                              
                                              verbatimTextOutput("codigo_bat")
                                          ),
                                          
                                          hr(style="border-top: 1px solid #eceae4; margin: 25px 0;"),
                                          
                                          # Relatório de Correspondência
                                          h4("E. Relatório de correspondência (opcional):"),
                                          p("Baixe um registro em texto documentando o nome original e a nova nomenclatura de cada arquivo. Útil para manter a rastreabilidade do seu acervo."),
                                          downloadButton("baixar_relatorio_renomeacao", "Baixar relatório (TXT)", class = "btn-primary")
                                        ) 
                                      )
                             ),
                             
                             # Sub-aba: Tutorial restaurado com todos os avisos e detalhes
                             tabPanel("Tutorial passo a passo",
                                      br(),
                                      fluidRow(
                                        column(8, offset = 2, class = "well",
                                               h3("Como usar o código gerado para renomear os arquivos?"),
                                               p("Depois de preencher as informações na aba 'Aplicativo' e colar a lista dos seus arquivos originais, você receberá um código no quadro preto (Campo D). Siga estes passos para usá-lo:"),
                                               br(),
                                               tags$ol(
                                                 tags$li(strong("Copie o código gerado: "), "selecione todo o texto do quadro preto (Campo D) e aperte ", code("Ctrl + C"), "."),
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
                             
                             # Sub-aba: Dicionário
                             tabPanel("O que significa cada campo?",
                                      br(),
                                      fluidRow(
                                        column(10, offset = 1, class = "well", style = "background-color: #ffffff;",
                                               h3("Dicionário de preenchimento e metadados", style = "color: #2c3e50; font-family: 'Merriweather', serif;"),
                                               p("Diretrizes de padronização baseadas em normas arquivísticas para preservação digital de longo prazo."),
                                               br(),
                                               
                                               h4("1. Identificação do repositório", style = "color: #505c58; font-weight: bold;"),
                                               tags$ul(
                                                 tags$li(strong("País e estado: "), "a localização física de onde o acervo está guardado. O país deve seguir o padrão ISO 3166-1 (duas letras, ex: BR) e a Unidade da Federação (ex: SP)."),
                                                 tags$li(strong("Sigla do fundo ou coleção: "), "abreviação da instituição detentora, receptora permanente ou colecionadora do material. Preferencialmente, deve corresponder ao CODEARQ (Conarq, resolução nº 28/2009). Exemplo de formatação correta: ", code("BR-SPAPESP"), ".")
                                               ),
                                               
                                               h4("2. Conjunto documental", style = "color: #505c58; font-weight: bold;"),
                                               tags$ul(
                                                 tags$li(strong("Fundo: "), "o acervo maior ou a entidade produtora dos documentos para situar a origem orgânica do material (ex: Oposição Sindical Metalúrgica). Admite-se denominação consagrada para coleções específicas e jornais."),
                                                 tags$li(strong("Subconjunto: "), "subdivisões relevantes para identificação, como subfundo, grupo, série, dossiê, processo ou distinção entre lotes diversos (ex: ", code("L001"), "). O elemento é delimitado por hífen.")
                                               ),
                                               
                                               h4("3. Caracterização da unidade", style = "color: #505c58; font-weight: bold;"),
                                               p("Fornece dados essenciais para rápida identificação, quantificação e planejamento de processos de preservação digital."),
                                               tags$ul(
                                                 tags$li(strong("Gênero: "), "o sistema de sinais e símbolos acessíveis aos sentidos (ex: iconográfico, textual, hemerográfico). Inclui o gênero eletrônico, especificamente para linguagem de máquina ou notação técnica especializada (ex: HTML, SQL, CSV)."),
                                                 tags$li(strong("Espécie: "), "a tipologia ou formato específico do item (ex: fotografia, boletim, processo, relatório de execução, planilha eletrônica)."),
                                                 tags$li(strong("Técnica de registro: "), "como o documento digital ou seu suporte físico original foi gerado (ex: digitalizado, nato-digital, ampliação fotográfica, datilografado). Para itens nato-digitais em processos de automação, pode especificar o processo (ex: geração de PDF/A, OCR, verificação de integridade)."),
                                                 tags$li(strong("Forma de registro: "), "o estágio de elaboração e tratamento do arquivo digital em si. Essencial para controle de gerações. Pode ser ", strong("matriz bruta"), " (original sem tratamento automático ou manual), ", strong("matriz tratada"), ", ", strong("derivada bruta"), " ou ", strong("derivada tratada"), " (para acesso/difusão). O tratamento pode ser numerado (ex: ", code("DT1"), ", ", code("DT2"), ") para registrar edições sucessivas, como correção de imagem ou conversão de formato.")
                                               )
                                        )
                                      )
                             )
                           )
)