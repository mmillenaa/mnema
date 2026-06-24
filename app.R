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
  
  # ---------- DICIONÁRIOS E TEXTOS DE AJUDA DINÂMICOS ----------
  
  dict_genero <- c(
    "ATT" = "Desenho técnico arquitetônico, de engenharia ou de construção (plantas, cortes, elevações).",
    "AVS" = "Documento audiovisual: integra imagem em movimento e som (ex.: filme com trilha sonora).",
    "BIB" = "Material bibliográfico: publicação impressa e editada, com tiragem e distribuição.",
    "CAR" = "Documento cartográfico: representação geográfica de superfície terrestre ou celeste (mapas, cartas).",
    "CIN" = "Cinematográfico: imagem em movimento registrada em película fotográfica (suporte fílmico).",
    "ELE" = "Documento eletrônico: linguagem de programação, marcação ou código legível por computador.",
    "FLG" = "Videográfico: imagem em movimento registrada em suporte magnético (fita de vídeo).",
    "FON" = "Fonográfico: registro exclusivamente sonoro fixado em suporte físico (disco, fita, cilindro).",
    "NDT" = "Gênero não determinado: informações insuficientes para classificação (suporte ou forma irreconhecíveis).",
    "VAR" = "Gênero variado: usado para agrupamentos que contêm múltiplos gêneros documentais mistos.",
    "HEM" = "Hemerográfico: publicações periódicas (jornais, revistas) ou recortes destas.",
    "ICO" = "Iconográfico: imagem estática bidimensional (fotografia, desenho, gravura, pintura).",
    "SOM" = "Sonoro: abrangente para qualquer registro de áudio, independentemente do suporte.",
    "TCT" = "Tátil: documento percebido pelo toque (Braille, mapas em relevo, maquetes táteis).",
    "TXT" = "Textual: informação principal baseada em linguagem escrita (manuscrito, impresso, digital).",
    "3DM" = "Tridimensional: objeto físico com altura, largura e profundidade (escultura, maquete, artefato)."
  )
  
  dict_especie <- c(
    "ALB" = "Álbum: volume ou pasta que reúne itens como fotografias, selos ou recortes.",
    "AMP" = "Ampliação fotográfica: cópia positiva opaca ou translúcida, em tamanho superior ao original.",
    "APP" = "Aplicativo: software com função específica para dispositivo móvel ou desktop.",
    "AFT" = "Arquivo-fonte: arquivo original não compilado de desenvolvimento (código-fonte, design).",
    "BLN" = "Balanço: demonstrativo contábil da situação financeira em determinada data.",
    "BDD" = "Banco de dados: coleção estruturada de dados eletrônicos gerenciada por sistema.",
    "BND" = "Bando: edital ou ordem pública proclamada por autoridade (pregoeiro, oficial).",
    "BBL" = "Bibliografia: lista sistemática de obras, artigos ou fontes referenciadas.",
    "BLH" = "Bilhete: comunicação escrita breve, geralmente informal.",
    "BIO" = "Biografia: relato da vida e trajetória de uma pessoa.",
    "BOL" = "Boletim: publicação periódica informativa de caráter oficial ou institucional.",
    "BRV" = "Breve: documento eclesiástico (resumo, nota, alvará) expedido por autoridade religiosa.",
    "CDN" = "Caderno: pequeno livro ou conjunto de folhas para anotações sequenciais.",
    "CDR" = "Caderno de registro: conjunto de folhas pautadas ou não para uso de registro manuscrito contínuo.",
    "CAL" = "Cálculo: demonstrativo numérico de operações matemáticas, financeiras ou métricas.",
    "CRC" = "Charge: desenho ou representação satírica e humorística.",
    "CRT" = "Carta: correspondência escrita entre partes, com formalidade variável.",
    "CTG" = "Carta geográfica: representação plana (mapa) de área geográfica específica.",
    "CTO" = "Cartão: pequeno pedaço de papel retangular para registros breves ou identificação.",
    "CPS" = "Cartão-postal: impresso retangular com imagem de um lado e espaço para mensagem e endereço no outro.",
    "CTZ" = "Cartaz: impresso afixado em local público para divulgação de avisos ou ideias.",
    "CLH" = "Cartilha: publicação com fins didáticos, instrutivos ou de alfabetização.",
    "CAT" = "Catálogo: lista ordenada e descritiva de objetos, exposições, livros ou documentos.",
    "IPC" = "Catálogo de peças: instrumento de pesquisa que descreve itens ou peças de um acervo.",
    "CDI" = "Cédula: papel-moeda representativo de valor financeiro oficial.",
    "CID" = "Cédula de identidade: documento oficial comprobatório de identidade civil ou institucional.",
    "CEN" = "Censo: levantamento demográfico, estatístico ou patrimonial em determinada região.",
    "CTD" = "Certidão: cópia ou atestado legal extraído de registro oficial público.",
    "CTF" = "Certificado: documento solene que atesta um fato ou conclusão de curso.",
    "CRL" = "Circular: comunicação oficial administrativa reproduzida para vários destinatários.",
    "CDC" = "Códice: manuscrito antigo encadernado em forma de livro.",
    "CFT" = "Código-fonte: conjunto de instruções lógicas estruturadas em linguagem de programação.",
    "COL" = "Coletânea: reunião de obras, textos ou leis agrupadas em um só volume.",
    "CMP" = "Comprovante: documento ou recibo que evidencia execução ou quitação de ato.",
    "COM" = "Comunicado: nota oficial transmitida ao público para conhecimento geral.",
    "CNH" = "Conhecimento: documento formal (ex.: de transporte) que prova recebimento de carga.",
    "CNS" = "Constituição: lei fundamental que organiza estrutural e politicamente uma nação.",
    "CSL" = "Consulta: pedido formal de parecer ou orientação técnica/jurídica.",
    "CNT" = "Conta: registro de débitos, créditos ou faturas.",
    "CON" = "Contato: cópia fotográfica obtida por contato direto do negativo com o papel, em tamanho real.",
    "CTT" = "Contrato: acordo legal vinculante que gera obrigações entre as partes.",
    "EML" = "E-mail: mensagem textual transmitida via rede computacional, com cabeçalho padrão.",
    "CRS" = "Correspondência: qualquer tipo de troca de comunicação escrita (cartas, ofícios, memorandos).",
    "CRH" = "Crachá: cartão de identificação funcional, geralmente atado à vestimenta.",
    "CNC" = "Crônica: texto narrativo focado na observação de eventos cotidianos ou temporais.",
    "CNG" = "Cronograma: representação gráfica do tempo de execução planejado para atividades.",
    "DCL" = "Declaração: manifestação formal atestando condição, direito ou fato jurídico.",
    "DCR" = "Decreto: ordem normativa com força de lei emanada do Poder Executivo.",
    "DCU" = "Decupagem: relatório de marcação minuciosa de cenas e falas em produção audiovisual.",
    "DEF" = "Defesa: documento judicial que refuta acusações ou resguarda direitos.",
    "DMN" = "Demonstrativo: peça técnica com explanação minuciosa de dados financeiros ou estatísticos.",
    "DNN" = "Denúncia: peça inicial de acusação em processos penais e investigativos.",
    "DPM" = "Depoimento: declaração de fatos feita oralmente e reduzida a termo em inquérito.",
    "DES" = "Desenho: representação visual de formas mediante linhas e traços manuais ou digitais.",
    "DCH" = "Despacho: resolução administrativa ou judicial proferida no andamento de autos.",
    "DGR" = "Diagrama: esquema gráfico demonstrativo de relações lógicas ou estatísticas.",
    "DPS" = "Diapositivo: imagem positiva translúcida projetável (slide fotográfico).",
    "DIA" = "Diário: registro sequencial de eventos organizado dia a dia.",
    "DIC" = "Dicionário: obra lexicográfica que lista e define vocábulos de um idioma ou área.",
    "DPL" = "Diploma: documento formal certificador de grau acadêmico ou láurea.",
    "DSC" = "Discurso: texto redigido para leitura e locução pública.",
    "DSR" = "Dissertação: trabalho acadêmico de investigação rigorosa em nível de mestrado.",
    "DSS" = "Dossiê: conjunto de peças processuais ou documentos reunidos em torno de uma pessoa ou caso.",
    "EDT" = "Edital: publicação oficial afixada publicamente contendo convocações ou regras.",
    "ECL" = "Enciclopédia: obra de referência de caráter universal e explicativa.",
    "ENT" = "Entrevista: registro estruturado em perguntas e respostas.",
    "ENV" = "Envelope: invólucro para guarda e expedição de correspondências.",
    "NDT" = "Espécie não determinada: impossibilidade de identificação por perda de suporte ou estrutura.",
    "VAR" = "Espécie variada: usado para conjuntos que congregam múltiplos formatos documentais.",
    "ESQ" = "Esquema: desenho simplificado focado nos traços principais de um projeto ou conceito.",
    "ETT" = "Estatuto: corpo de normas jurídicas que rege a estrutura de uma associação ou entidade.",
    "EXD" = "Expediente: peças documentais produzidas para tramitação interna de serviço.",
    "EXP" = "Exposição: registro visual descritivo da organização espacial de uma mostra cultural.",
    "FAS" = "Fascículo: publicação dividida em entregas parciais seriadas.",
    "FEE" = "Fé de ofício: documento expedido atestando formalmente a veracidade de situação.",
    "FCH" = "Ficha: formulário impresso ou cartão para controle ou registro cadastral.",
    "FIG" = "Figura: ilustração ou esquema que acompanha e elucida um texto principal.",
    "FME" = "Filme: materialidade fílmica em rolo ou peça audiovisual acabada.",
    "FGF" = "Filmografia: catálogo sistemático ou listagem de obras cinematográficas.",
    "FLH" = "Folheto: impresso de poucas páginas sem encadernação para difusão de ideias.",
    "FNG" = "Fonograma: suporte contendo registro mecânico ou digital de vibração sonora.",
    "FRM" = "Formulário: papel ou tela pré-estruturada com espaços para inserção de dados específicos.",
    "FOT" = "Fotografia: imagem fixada pela ação da luz sobre superfície fotossensível (química ou digital).",
    "GZT" = "Gazeta: publicação periódica (jornal) ou boletim oficial governamental.",
    "GLB" = "Globo: representação cartográfica esférica do planeta ou de abóbada celeste.",
    "GRR" = "Gravura: imagem transferida por pressão de uma matriz entalhada para um suporte.",
    "GIA" = "Guia: obra de orientação, roteiro prático ou instrumento que indica caminhos.",
    "IPG" = "Guia de fundos: instrumento arquivístico que descreve os fundos ou coleções de um repositório.",
    "HCR" = "Habeas corpus: ordem judicial em prol do direito de locomoção e liberdade.",
    "IND" = "Índice: lista remissiva e ordenada dos tópicos ou nomes contidos num documento.",
    "INF" = "Informação: aviso sintético, circular ou documento com dados em resposta técnica.",
    "INQ" = "Inquérito: conjunto procedimental focado na investigação ou apuração policial e civil.",
    "INS" = "Instrução: ato administrativo com normas diretivas para execução padronizada de tarefas.",
    "ITM" = "Intimação: ordem imperativa e legal para comparecimento a ato judiciário.",
    "INV" = "Inventário: arrolamento pormenorizado de bens patrimoniais ou documentais.",
    "IPI" = "Inventário de séries: instrumento que descreve detalhadamente as séries que compõem um fundo.",
    "JOR" = "Jornal: folha impressa ou digital, de publicação contínua, com noticiário de amplo interesse.",
    "JUS" = "Justificativa: peça documental que expõe as motivações lícitas de uma escolha ou ato.",
    "LAU" = "Laudo: peça escrita, fundamentada em conhecimento técnico, emitindo juízo de valor especializado.",
    "LEI" = "Lei: preceito jurídico com força normativa elaborado pelo Poder Legislativo.",
    "LBR" = "Lembrança: pequena anotação ou aviso que serve à memória imediata.",
    "LCN" = "Licença: ato formal que defere o direito de uso ou de execução de algo.",
    "LST" = "Lista: rol ou enumeração sistematizada de arquivos, indivíduos ou itens.",
    "LVT" = "Livreto: publicação em formato de bolso, geralmente encadernada ou grampeada.",
    "LVR" = "Livro: conjunto de folhas consolidadas em volume, para registro contábil, oficial ou literário.",
    "MCO" = "Maço: feixe de papéis ou conjunto documental agrupado fisicamente (ex.: processos atados).",
    "MND" = "Mandado: ordem processual emanada de juízo com determinação executória cogente.",
    "MNF" = "Manifesto: declaração pública expressando posições teóricas, políticas ou intenções coletivas.",
    "MCG" = "Manifesto de conteúdo: lista gerada por sistemas detalhando pacotes, metadados ou lotes para submissão digital.",
    "MNL" = "Manual: livro ou livreto focado em prover passos, regras e instruções operativas.",
    "MAP" = "Mapa: representação visual em plano das convenções da superfície terrestre.",
    "MEM" = "Memorando: documento oficial para comunicações internas horizontais entre setores de uma organização.",
    "MMR" = "Memorial: anotação, muitas vezes processual ou acadêmica, em defesa e registro histórico da parte.",
    "MSG" = "Mensagem: exposição textual de comunicação direta, comum em ambiente telegráfico ou executivo.",
    "MNG" = "Monografia: trabalho exaustivo pormenorizando investigação pontual (ex.: TCC, dissertação).",
    "MUS" = "Música: material contendo registro de linguagem e simbologia rítmica/melódica (partitura).",
    "NEG" = "Negativo: original fotográfico em suporte translúcido com tons invertidos (complementares).",
    "NOM" = "Nomeação: expediente administrativo que provê sujeito para assunção de cargo estatal.",
    "NRM" = "Norma: regra vinculativa de procedimento, técnica ou medida disciplinadora aprovada (ex.: ABNT).",
    "NTA" = "Nota: peça de apontamentos, conta comercial simples ou comentário marginal ao texto.",
    "NOT" = "Notícia: formato de cunho puramente difusor, relatando um fato específico de impacto mediato.",
    "NTF" = "Notificação: peça comunicativa alertando parte sobre fato administrativo gerador de obrigação.",
    "OBS" = "Observação: pareceres curtos baseados em inspeção ou laudos parciais sem força de laudo técnico.",
    "OFC" = "Ofício: correspondência entre chefias públicas, direcionada a repartições externas.",
    "OPS" = "Opúsculo: pequeno volume ou impresso menor que o livro, mas não periódico (brochura).",
    "ORC" = "Orçamento: peça de planificação estimativa contendo cotação de despesas, receitas e avaliações mercantis.",
    "ORD" = "Ordem: comunicação com preceito afirmativo que determina imediata execução de diretriz.",
    "ORG" = "Organograma: diagrama descritivo da estrutura de setores, áreas e hierarquia institucional.",
    "WWW" = "Página web: conjunto de hipertextos e dados abrigado sob uma mesma URL.",
    "PFL" = "Panfleto: folheto ou volante de poucas vias, frequentemente para uso político ou propagandístico.",
    "PRM" = "Parâmetro: conjunto de valores lógicos definidos para scripts, configurações ou análises computacionais.",
    "PAR" = "Parecer: declaração de jurista, técnico ou conselho orientador analisando material à luz do direito ou técnica.",
    "PSG" = "Passagem: cupom, bilhete ou título comprovador de tarifa para transporte geográfico.",
    "PSP" = "Passaporte: livrete ou cédula emitida pela soberania nacional, habilitando trânsito em território estrangeiro.",
    "PTT" = "Patente: concessão do poder público certificando privilégios a autor de invenção ou projeto útil.",
    "PTA" = "Pauta: sumário dos pontos propostos ou valores que instruirão votações e reuniões.",
    "PED" = "Pedido: petição não formal, pleito mercadológico ou requerimento para suprimento perante órgão.",
    "PRD" = "Periódico: revista, folhetim, caderno ou qualquer publicação serial com calendário pré-definido.",
    "PET" = "Petição: expediente em que se postula resguardo jurisdicional da causa junto a foro adequado.",
    "PIN" = "Pintura: obra fixada pela oposição de tintas colorantes sobre suporte como tela ou papel.",
    "PNL" = "Planilha: grade matricial, quadro analítico ou software para tabular valores escalares.",
    "PNO" = "Plano: projeto, delineamento ou intenção preestabelecendo cronogramas ou traçados urbanísticos.",
    "PLN" = "Planta: configuração ortográfica que expõe modelagem do espaço e cortes de pavimento arquitetônico.",
    "POM" = "Poema: gênero textual estruturado por métrica, estrofes e intencionalidade poética.",
    "POR" = "Portaria: estatuto ou ato expedido por dirigentes contendo provimentos disciplinares de funcionamento.",
    "POS" = "Postagem: inserção de blocos curtos em mídia social ou fórum, integrando fluxos comunicativos virtuais.",
    "PRC" = "Processo: reunião de autos devidamente sequenciais com rito para instrução civil, penal ou administrativa.",
    "PCL" = "Proclamação: declaração verbal promulgada com alta reverência em esferas governamentais e castrenses.",
    "PCR" = "Procuração: instrumento de direito com delegação oficial permitindo a mandatário agir em nome de outorgante.",
    "PGR" = "Programa: série de rotinas, códigos ou matrizes computacionais para operação de hardware ou software.",
    "PGM" = "Programa (radiofônico/TV): emissão continuada de som e/ou vídeo integrando grade de radiodifusão.",
    "PNC" = "Pronunciamento: enunciação formal e solene manifestando posicionamento em debates no parlamento.",
    "PRT" = "Prontuário: histórico de paciente, sentenciado ou funcionário, englobando interações de saúde e sistema.",
    "PPG" = "Propaganda: impresso, pôster ou anúncio para difundir ou persuadir comercialmente.",
    "PPS" = "Proposta: plano comercial, oferta de concorrência ou prospecção sugerida a outrem para aceitação.",
    "PRO" = "Prospecto: pequena e concisa exibição impressa visando atrair aderentes por meio de informe resumido.",
    "PRV" = "Provisão: rescrito mandamental de poder contendo determinações para prover necessidades interinas.",
    "QDR" = "Quadro: tábua expográfica em síntese de tabelas analíticas visuais com ou sem hierarquia.",
    "RCB" = "Quitação: declaração e termo onde se confessa e atesta liberação e adimplemento monetário.",
    "REC" = "Recorte: parte desmembrada de impresso ou hemeroteca contendo fragmento colecionado do original.",
    "RCR" = "Recurso: instrumento interpelativo protocolar que pugna pela anulação ou modificação de decisão anterior.",
    "RGM" = "Regimento: norma pormenorizadora que disciplina o modus operandi de repartição ou instância.",
    "REG" = "Registro: assentamento legal anotando e arquivando em tomos fatos como nascimentos, patentes e imóveis.",
    "RGL" = "Regulamento: preceito que normatiza e estabelece a prática regimental das garantias previstas em lei.",
    "RLC" = "Relação: lista detalhada apontando itens enumerados (despesas, processos, nomes).",
    "RLT" = "Relato: anotação rápida e não dogmática, de memória de evento em forma discorrida.",
    "REL" = "Relatório: relato metódico prestando conta, diagnosticando andamentos a instâncias comissárias.",
    "DG2" = "Relatório pós-processamento: documento com logísticas ou parecer avaliando saídas de processos digitais.",
    "DGN" = "Relatório pré-processamento: diagnóstico situacional que autoriza critérios a serem aplicados.",
    "LOG" = "Relatório de sistema: resumo cronológico de eventos reportando sucesso/falha de software.",
    "EXT" = "Relatório de extração: tábua com amostragens metadadas extraídas de banco via consulta (query).",
    "ERR" = "Relatório de erros: sumário de conflitos e incompatibilidades detectadas por ferramentas de verificação.",
    "TEC" = "Relatório técnico: subsídio complementar de informática englobando laudo especializado.",
    "REP" = "Representação: modelo esquemático reduzindo objetos ou manifestação/denúncia dirigida a autoridade.",
    "REQ" = "Requerimento: formulação suplicante com rogos embasados administrativamente por direito de pleito lícito.",
    "RES" = "Resolução: disposição ratificada e exarada a rigor da norma deliberativa de órgão diretivo.",
    "RTT" = "Retrato: imagem figurativa fixada com ênfase na expressividade facial.",
    "VER" = "Revista: fascículo impresso e seriado de perfil ilustrativo/especializado.",
    "ROT" = "Roteiro: textualização guia pormenorizando trajetos, trilhas documentais ou passos operacionais.",
    "SVC" = "Salvo-conduto: resguardo diplomático que isenta de penalidade fiscal ou prisional.",
    "SCR" = "Script: instrução rotineira e comando imperativo programado para repetições autônomas.",
    "SEN" = "Sentença: proclamação conclusiva decisória prolatada pelo crivo dos julgados, definindo fim condenatório ou extintivo.",
    "SIS" = "Sistema: conjunto de múltiplas operações e engrenagens computacionais articuladas.",
    "SDA" = "Sistema de arquivos: estrutura dedicada a abrigar, indexar e recuperar documentos (ex.: DSpace, AtoM).",
    "SGB" = "Sistema gerenciador de banco de dados: arquitetura baseada no manejo de massas de dados transacionais.",
    "SIG" = "Sistema informatizado de gestão arquivística: voltado à produção, trâmite, custódia e ciclo orgânico (SIGAD).",
    "SPD" = "Sistema preservador digital: arquitetura alinhada à ISO 14721 (OAIS) e ISO 16363, incluindo repositórios confiáveis.",
    "SOL" = "Solicitação: mensagem que roga deferimento intersetorial para aquisição de objeto ou bem.",
    "SUP" = "Suplemento: obra anexa a publicação central, contendo conteúdos analíticos avulsos.",
    "TBL" = "Tabela: organograma tabular relacional focado na cruzagem de quantitativos ordenados nos eixos X e Y.",
    "ATM" = "Tabela AtoM: folha tabular metadada específica para injeção em lote no repositório AtoM (CSV).",
    "TLG" = "Telegrama: despacho telegráfico transmitido por sinais breves a distância.",
    "TRM" = "Termo: finalização autêntica de concordância, assinada, documentando prática transacional ou judicial.",
    "TSE" = "Tese: opúsculo inédito e minucioso de aprofundamento investigativo (nível de doutorado).",
    "TES" = "Testamento: delegação volitiva para partilha pós-morte, determinando sucessão patrimonial.",
    "TRA" = "Transcrição: transferência da oralidade para sinais gráficos, mantendo autenticidade de depoimentos.",
    "TSL" = "Transladado: traslado oficial fidedigno extraindo fé e certidões notariais de matrizes cartorárias.",
    "TRT" = "Tratado: acordo diplomático com alianças pactuadas entre nações, aprovado por governo.",
    "VFG" = "Vídeo fonográfico: filme com elementos visuais amalgamados ao espectro auditivo simultâneo.",
    "VGR" = "Vídeo gráfico: filme ou gravação de visualidade contínua sem trilha sonora (mudo).",
    "VNH" = "Vinheta: curto intervalo introdutório ou transicional com apelo ilustrativo (jingle / marca sonora)."
  )
  
  dict_tecnica <- c(
    "AMP" = "Ampliação fotográfica: processo de aumento da imagem latente do negativo para cópia positiva opaca.",
    "MDA" = "Marca d'água digital: técnica de sobreposição de assinatura translúcida para proteção de direitos.",
    "APR" = "Apresentação digital: criação de slides eletrônicos e projeções sequenciais (ex.: PowerPoint).",
    "AUD" = "Digitalização de áudio: conversão de sinais sonoros analógicos em códigos binários audíveis.",
    "CON" = "Contato fotográfico: obtenção de cópia no mesmo tamanho do negativo, por contato direto.",
    "COO" = "Conversão em lote: extração e recodificação automatizada de formatos digitais (ex.: TIF para JPEG).",
    "CCR" = "Cópia com renomeação: duplicação de arquivos com alteração de nomes lógicos para controle logístico.",
    "CSR" = "Cópia simples espelhada: clonagem integral de disco ou diretório preservando todas as instâncias.",
    "DDS" = "Desenho sistêmico: concepção não documental focada em relacionamentos SQL e dados matriciais.",
    "DAT" = "Datilografia: registro de sinais linguísticos por choque de tipos em máquina de escrever.",
    "DSM" = "Desenho manual: representação linear esboçada a pulso com instrumentos de escrita.",
    "DGT" = "Digital (sem especificação): código generalista para material codificado em pulsos sem detalhamento técnico.",
    "DGZ" = "Digitalização por scanner: conversão de imagens analógicas em matrizes digitais por refletância ótica.",
    "DEL" = "Eliminação programada: ato sistêmico de remoção de resíduos temporários em repositórios (higienização).",
    "ME0" = "Extração de metadados: cópia em lote de valores EXIF e descritivos de arquivos originais.",
    "EXF" = "Exposição fotográfica analógica: abertura mecânica do obturador, expondo química de prata.",
    "FLA" = "Filmagem analógica: captação de quadros sucessivos em equipamentos cinematográficos ou magnéticos (VHS).",
    "FLC" = "Filmagem cinematográfica clássica: processo restrito a película de cinema (8/16 mm).",
    "FLM" = "Filmagem (indiscriminada): captura de movimento sem identificação da técnica ou suporte original.",
    "FOT" = "Fotografia (abrangente): captura bidimensional por lente, seja química ou digital.",
    "PDF" = "Geração de PDF: encapsulamento de texto/impressos em formato portátil sem garantia arquivística.",
    "PDA" = "PDF/A: geração conforme ISO 19005, incorporando fontes e sem dependências externas para preservação.",
    "GRA" = "Gravação analógica de áudio: registro por ondas elétricas, agulhas ou cabeças magnéticas (vinil, fita K7).",
    "GRC" = "Gravação de estúdio (masterização): aquisição fonográfica original sem processamento digital.",
    "GRV" = "Gravação de áudio (genérica): registro sonoro contínuo sem especificação do meio (analógico ou digital).",
    "IMG" = "Imagem computação gráfica: criação artística digital sem captura por lente (design, ilustração vetorial).",
    "IMT" = "Imagem matricial (raster): pixels fotossensíveis com perda de nitidez na ampliação (JPG, PNG).",
    "IVT" = "Imagem vetorial: composições matemáticas de nós elásticos sem degradação em escalas (AI, SVG).",
    "MI0" = "Inserção de metadados: enxerto de campos IPTC ou XML no corpo do arquivo digital.",
    "IMP" = "Impressão: gravação de tinta por choque, prensa ou plotter (offset, toner, jato de tinta).",
    "LCM" = "Levantamento computacional de metadados: geração de listas com propriedades e tamanhos para inventário.",
    "LSM" = "Levantamento simples de nomes: script que lista apenas os nomes de arquivos sem metadados adicionais.",
    "MAN" = "Manuscrito: escrita manual direta sobre suporte analógico com tinta/carvão.",
    "MFM" = "Microfilmagem: redução ótica de imagens para filme de alta segurança e resolução miniaturizada.",
    "MCR" = "Movimentação com renomeação: alteração de nome e diretório simultaneamente.",
    "MSR" = "Movimentação simples: transferência de arquivos sem alteração de nomenclatura.",
    "NDG" = "Nato-digital: documento nascido em ambiente informático, sem original físico.",
    "NEG" = "Negativo fotográfico: imagem com tons invertidos, em suporte translúcido, para revelação posterior.",
    "PP1" = "Checksum de integridade: criptografia alfanumérica (hash) para monitoramento de corrupção.",
    "PP2" = "Empacotamento OAIS: criação de DIP/SIP para envio de longo prazo (ex.: RDC-Arq).",
    "OCR" = "Reconhecimento ótico de caracteres: extração de strings textuais de imagens, gerando camada editável.",
    "RNM" = "Renomeação pura: reescritura do nome do arquivo sem mover, copiar ou modificar conteúdo.",
    "NDT" = "Técnica não determinada: impossibilidade de identificação do processo técnico original.",
    "VAR" = "Técnica variada: mistura de processos em um mesmo agrupamento documental.",
    "TXT" = "Texto digital: codificação de letras e linguagens em formatos computacionais legíveis.",
    "V00" = "Validação de formatos: varredura para conferir se perfis PRONOM correspondem à estrutura lógica.",
    "VDP" = "Teste de desempenho: medição de velocidade e resistência de sistemas com carga de trabalho.",
    "CKC" = "Verificação de integridade: comparação de hash/checksum contra base gerada para auditoria.",
    "CKO" = "Cálculo de checksum: geração da assinatura criptográfica de um arquivo para atestar integridade.",
    "VID" = "Captura de vídeo digital: codificação de quadros por sensor ou exportação de editores nativos."
  )
  
  dict_forma <- c(
    "AMP" = "Cópia ampliada: impressão fotográfica com tamanho superior ao negativo original.",
    "CON" = "Cópia por contato: impressão do mesmo tamanho do negativo, obtida por contato direto.",
    "DB0" = "Cópia digital de baixa resolução: thumbnail ou proxy gerado automaticamente para acesso rápido.",
    "DT0" = "Cópia digital de acesso direto: extraída manualmente da matriz, sem edição.",
    "DT1" = "Cópia digital de difusão: processada intencionalmente (compressão, recorte) com método documentado.",
    "DTX" = "Cópia digital de acesso com perda: contém tratamento ou compressão cujo histórico de edição é desconhecido.",
    "MB0" = "Master bruto: original matricial capturado ou nascido digital, sem intervenção humana posterior.",
    "MT0" = "Matriz primária inalterada: arquivo de mais alta resolução gerado diretamente pelo scanner ou captura, sem retoques.",
    "MT1" = "Matriz de preservação com intervenção documentada: recebeu correções arquivísticas (balanço, gama) com registro completo.",
    "MTX" = "Matriz com manipulação opaca: alta resolução, mas com alterações cujo histórico se perdeu.",
    "NEG" = "Negativo original: imagem primária em suporte translúcido, com inversão de luminosidade."
  )
  
  # Estilo unificado para os textos de ajuda
  estilo_ajuda <- "color: #505c58; font-size: 0.85em; font-style: italic; margin-top: -3px; margin-bottom: 5px; display: block; border-left: 2px solid #8e8c84; padding-left: 5px;"
  
  output$ajuda_genero <- renderUI({
    req(input$genero)
    if(input$genero != "") HTML(paste0("<span style='", estilo_ajuda, "'>", dict_genero[[input$genero]], "</span>"))
  })
  
  output$ajuda_especie <- renderUI({
    req(input$especie)
    if(input$especie != "") HTML(paste0("<span style='", estilo_ajuda, "'>", dict_especie[[input$especie]], "</span>"))
  })
  
  output$ajuda_tecnica <- renderUI({
    req(input$tecnica)
    if(input$tecnica != "") HTML(paste0("<span style='", estilo_ajuda, "'>", dict_tecnica[[input$tecnica]], "</span>"))
  })
  
  output$ajuda_forma <- renderUI({
    req(input$forma)
    if(input$forma != "") HTML(paste0("<span style='", estilo_ajuda, "'>", dict_forma[[input$forma]], "</span>"))
  })
  
  
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
  
  # ---------- LÓGICA DE DOWNLOAD DO FORMULÁRIO DATAVERSE ----------
  output$downloadDataverse <- downloadHandler(
    filename = function() {
      "preparacao_dataverse.docx"
    },
    content = function(file) {
      file.copy("preparacao_dataverse.docx", file)
    }
  )
} # <--- A CHAVE QUE FECHA O SERVIDOR AGORA FICA AQUI, NO FINAL DE TUDO!

# =======================================================
# 3. COMANDO DE EXECUÇÃO (GERA O APP)
# =======================================================
shinyApp(ui = ui, server = server)