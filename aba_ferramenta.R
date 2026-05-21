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
                                          h4("1. Identificação do repositório"),
                                          textInput("pais", "País (obrigatório)", value = "BR"),
                                          textInput("estado", "Estado (obrigatório)", value = "SP"),
                                          textInput("repo", "Sigla do repositório", value = "APESP"),
                                          hr(style="border-top: 1px solid #eceae4;"),
                                          
                                          h4("2. Conjunto documental"),
                                          helpText("Use as siglas e codificações da instituição detentora oficial. Se não houver, crie um código único e consistente, elucidando a hierarquia da coleção."),
                                          textInput("fundo", "Fundo (obrigatório)", value = "DASP"),
                                          textInput("subconj", "Subconjunto (opcional)", value = "PENITPRE-CSDTCARANDIRU"),
                                          hr(style="border-top: 1px solid #eceae4;"),
                                          
                                          h4("3. Caracterização da unidade"),
                                          helpText("Clique na caixa e apague para indicar 'Nenhum'."),
                                          
                                          selectInput("genero", "Gênero documental", 
                                                      choices = c("Nenhum" = "", 
                                                                  "Arquitetônico (ATT)" = "ATT", 
                                                                  "Audiovisual (AUD)" = "AUD", 
                                                                  "Bibliográfico (BIB)" = "BIB", 
                                                                  "Cartográfico (CAR)" = "CAR", 
                                                                  "Cinematográfico (CIN)" = "CIN", 
                                                                  "Eletrônico (ELE)" = "ELE", 
                                                                  "Filmográfico (FLG)" = "FLG", 
                                                                  "Fonográfico (FON)" = "FON", 
                                                                  "Gênero n/d (NDT)" = "NDT", 
                                                                  "Gênero varia (VAR)" = "VAR", 
                                                                  "Hemerográfico (HEM)" = "HEM", 
                                                                  "Iconográfico (ICO)" = "ICO", 
                                                                  "Sonoro (SOM)" = "SOM", 
                                                                  "Táctil (TCT)" = "TCT", 
                                                                  "Textual (TXT)" = "TXT", 
                                                                  "Tridimensional (3DM)" = "3DM"), 
                                                      selected = "ICO"),
                                          
                                          selectInput("especie", "Espécie/Tipo", 
                                                      choices = c("Nenhum" = "", 
                                                                  "Álbum (ALB)" = "ALB",
                                                                  "Ampliação fotográfica (AMP)" = "AMP", 
                                                                  "Bibliografia (BBL)" = "BBL", 
                                                                  "Bilhete (BLH)" = "BLH", 
                                                                  "Biografia (BIO)" = "BIO", 
                                                                  "Boletim (BOL)" = "BOL", 
                                                                  "Caderno (CDR)" = "CDR", 
                                                                  "Carta (CRT)" = "CRT", 
                                                                  "Cartão-postal (CPS)" = "CPS", 
                                                                  "Cartaz (CTZ)" = "CTZ", 
                                                                  "Cartilha (CLH)" = "CLH", 
                                                                  "Catálogo - geral (CAT)" = "CAT", 
                                                                  "Catálogo - instrumento de pesquisa (IPC)" = "IPC", 
                                                                  "Certidão (CTD)" = "CTD", 
                                                                  "Circular (CRL)" = "CRL", 
                                                                  "Comunicado (COM)" = "COM", 
                                                                  "Constituição (CNS)" = "CNS", 
                                                                  "Contrato (CTT)" = "CTT", 
                                                                  "Declaração (DCL)" = "DCL", 
                                                                  "Decreto (DCR)" = "DCR", 
                                                                  "Defesa (DEF)" = "DEF", 
                                                                  "Denúncia (DNN)" = "DNN", 
                                                                  "Depoimento (DPM)" = "DPM", 
                                                                  "Despacho (DCH)" = "DCH", 
                                                                  "Discurso (DSC)" = "DSC", 
                                                                  "Dissertação (DSR)" = "DSR", 
                                                                  "Dossiê (DSS)" = "DSS", 
                                                                  "Edital (EDT)" = "EDT", 
                                                                  "Entrevista (ENT)" = "ENT", 
                                                                  "Estatuto (ETT)" = "ETT", 
                                                                  "Expediente (EXD)" = "EXD", 
                                                                  "Exposição/instalação (EXP)" = "EXP", 
                                                                  "Ficha (FCH)" = "FCH", 
                                                                  "Filme (FME)" = "FME", 
                                                                  "Formulário (FRM)" = "FRM", 
                                                                  "Fotografia (FOT)" = "FOT", 
                                                                  "Guia - geral (GIA)" = "GIA", 
                                                                  "Guia - instrumento de pesquisa (IPG)" = "IPG", 
                                                                  "Informe (INF)" = "INF", 
                                                                  "Inquérito (INQ)" = "INQ", 
                                                                  "Instrução (INS)" = "INS", 
                                                                  "Intimação (ITM)" = "ITM", 
                                                                  "Inventário - geral (INV)" = "INV", 
                                                                  "Inventário - instrumento de pesquisa (IPI)" = "IPI", 
                                                                  "Jornal (JOR)" = "JOR", 
                                                                  "Justificativa (JUS)" = "JUS", 
                                                                  "Laudo (LAU)" = "LAU", 
                                                                  "Lei/Legislação (LEI)" = "LEI", 
                                                                  "Licença (LCN)" = "LCN", 
                                                                  "Livro (LVR)" = "LVR", 
                                                                  "Mandado (MND)" = "MND", 
                                                                  "Memorando (MEM)" = "MEM", 
                                                                  "Música (MUS)" = "MUS", 
                                                                  "Nomeação (NOM)" = "NOM", 
                                                                  "Notícia (NOT)" = "NOT", 
                                                                  "Ofício (OFC)" = "OFC", 
                                                                  "Orçamento (ORC)" = "ORC", 
                                                                  "Parecer (PAR)" = "PAR", 
                                                                  "Patente (PTT)" = "PTT", 
                                                                  "Pauta (PTA)" = "PTA", 
                                                                  "Pedido (PED)" = "PED", 
                                                                  "Periódico (PRD)" = "PRD", 
                                                                  "Petição (PET)" = "PET", 
                                                                  "Planilha (PNL)" = "PNL", 
                                                                  "Plano (PNO)" = "PNO",
                                                                  "Planta/cartografia (PLN)" = "PLN", 
                                                                  "Portaria (POR)" = "POR", 
                                                                  "Processo (PRC)" = "PRC", 
                                                                  "Proclamação (PCL)" = "PCL", 
                                                                  "Procuração (PCR)" = "PCR", 
                                                                  "Programa de rádio e TV (PGM)" = "PGM", 
                                                                  "Prontuário (PRT)" = "PRT", 
                                                                  "Pronunciamento (PNC)" = "PNC", 
                                                                  "Proposta (PPS)" = "PPS", 
                                                                  "Provisão (PRV)" = "PRV", 
                                                                  "Recibo (RCB)" = "RCB", 
                                                                  "Recurso (RCR)" = "RCR", 
                                                                  "Regimento (RGM)" = "RGM", 
                                                                  "Regulamento (RGL)" = "RGL", 
                                                                  "Relatório (REL)" = "REL", 
                                                                  "Requerimento (REQ)" = "REQ", 
                                                                  "Resolução (RES)" = "RES", 
                                                                  "Revista (VER)" = "VER", 
                                                                  "Sentença (SEN)" = "SEN", 
                                                                  "Salvo-conduto (SVC)" = "SVC", 
                                                                  "Suplemento (SUP)" = "SUP", 
                                                                  "Termo (TRM)" = "TRM", 
                                                                  "Tese (TSE)" = "TSE", 
                                                                  "Testamento (TES)" = "TES", 
                                                                  "Telegrama (TLG)" = "TLG", 
                                                                  "Transcrição (TRA)" = "TRA", 
                                                                  "Tratado (TRT)" = "TRT",
                                                                  "Videograma (VGR)" = "VGR",
                                                                  "Videofonograma (VFG)" = "VFG"), 
                                                      selected = "FOT"),
                                          
                                          selectInput("tecnica", "Técnica de registro", 
                                                      choices = c("Nenhum" = "", 
                                                                  "Ampliação fotográfica (AMP)" = "AMP", 
                                                                  "Apresentação digital (APR)" = "APR", 
                                                                  "Áudio digital (AUD)" = "AUD", 
                                                                  "Contato fotográfico (CON)" = "CON", 
                                                                  "Dados digital (DDS)" = "DDS", 
                                                                  "Datilografado (DAT)" = "DAT", 
                                                                  "Desenho à mão (DSN)" = "DSN", 
                                                                  "Digital (DGT)" = "DGT", 
                                                                  "Digitalizado (DGZ)" = "DGZ", 
                                                                  "Exposição fotográfica (EXF)" = "EXF", 
                                                                  "Filmagem analógica (FLA)" = "FLA", 
                                                                  "Filmagem convencional (FLC)" = "FLC", 
                                                                  "Filmagem geral (FLT)" = "FLT", 
                                                                  "Fotografia exposição fotográfica (FOT)" = "FOT", 
                                                                  "Gravação analógica (GRA)" = "GRA", 
                                                                  "Gravação convencional (GRC)" = "GRC", 
                                                                  "Gravação geral (GRV)" = "GRV", 
                                                                  "Imagem digital (IMG)" = "IMG", 
                                                                  "Imagem matricial digital (IMT)" = "IMT", 
                                                                  "Imagem vetorial digital (IVT)" = "IVT", 
                                                                  "Impresso (IMP)" = "IMP", 
                                                                  "Manuscrito (MAN)" = "MAN", 
                                                                  "Microfilme (MFM)" = "MFM", 
                                                                  "Nato digital (NDG)" = "NDG", 
                                                                  "Técnica não determinada (NDT)" = "NDT", 
                                                                  "Negativo fotográfico (NEG)" = "NEG", 
                                                                  "Técnica varia (VAR)" = "VAR", 
                                                                  "Texto digital (TXT)" = "TXT", 
                                                                  "Vídeo digital (VID)" = "VID"), 
                                                      selected = "DGZ"),
                                          
                                          selectInput("forma", "Forma do registro", 
                                                      choices = c("Nenhum" = "", 
                                                                  "Derivada bruta - produção automática (DB0)" = "DB0", 
                                                                  "Derivada bruta - produção manual (DT0)" = "DT0", 
                                                                  "Derivada tratada - tratamento conhecido (DT1)" = "DT1", 
                                                                  "Derivada tratada - tratamento desconhecido (DTX)" = "DTX", 
                                                                  "Matriz bruta - produção automática (MB0)" = "MB0", 
                                                                  "Matriz bruta - produção manual (MB1)" = "MB1", 
                                                                  "Matriz tratada - tratamento conhecido (MT1)" = "MT1", 
                                                                  "Matriz tratada - tratamento desconhecido (MTX)" = "MTX"), 
                                                      selected = "MB0"),
                                          
                                          hr(style="border-top: 1px solid #eceae4; margin: 20px 0;"),
                                          
                                          h4("4. Identificação da unidade"),
                                          helpText("Insira numerações de caixas, pastas ou itens específicos para fechar o prefixo (opcional)."),
                                          textInput("id_item", "Identificador complementar", value = "", placeholder = "Ex: 0001-001")
                                        ),
                                        
                                        mainPanel(
                                          
                                          # ---- NOVO AVISO DE REGRA DE OURO ADICIONADO AQUI ----
                                          div(class = "atencao-box",
                                              h4("Atenção: separe seus arquivos por formato!", style = "margin-top: 0; font-weight: bold;"),
                                              p("Como o prefixo gerado aqui descreve o tipo físico/digital daquele lote de documentos, você nunca deve renomear documentos com extensões diferentes juntos."),
                                              p("Por exemplo, se seu conjunto a ser descrito contém arquivos com extensões ", code(".pdf"), code(".jpeg"), code(".jpg"), code(".png"), code(".mov"), code(".mp4"), code(".bup"), code(".ifo"), code(".vob"), ", dentre outros, crie pastas diferentes para agrupá-las.")
                                          ),
                                          # -----------------------------------------------------
                                          
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
                                              
                                              # O botão agora só aparece se o usuário tiver colado algo na caixa C
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
                                                 tags$li(strong("Sigla do repositório: "), "abreviação da instituição detentora ou receptora permanente do material. Preferencialmente, deve corresponder ao CODEARQ (Conarq, resolução nº 28/2009). Exemplo de formatação correta: ", code("BR-SPAPESP"), ".")
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
