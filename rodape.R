rodape <- div(class = "footer-referencias",
              fluidRow(
                column(8,
                       h5("Créditos e equipe"),
                       
                       p(style = "margin-bottom: 4px; line-height: 1.3;",
                         strong("Autora: "), 
                         a(href = "http://lattes.cnpq.br/3848824456283762", 
                           strong("Millena Miranda Franco"), 
                           style = "color: #2980b9; text-decoration: none;", 
                           target = "_blank"),
                         HTML(" | <a href='https://orcid.org/0000-0002-0292-0797' target='_blank'>ORCID</a> | <a href='https://bv.fapesp.br/pt/pesquisador/743339/millena-miranda-franco/' target='_blank'>BV FAPESP</a>")
                       ),
                       
                       p(style = "margin-bottom: 4px; line-height: 1.3;",
                         strong("Orientadora: "), 
                         a(href = "http://lattes.cnpq.br/0553760669855058", 
                           strong("Maíra Rocha Machado"), 
                           style = "color: #2980b9; text-decoration: none;", 
                           target = "_blank"),
                         HTML(" | <a href='https://orcid.org/0000-0003-1303-5790' target='_blank'>ORCID</a> | <a href='https://bv.fapesp.br/pt/pesquisador/90750/maira-rocha-machado/' target='_blank'>BV FAPESP</a>")
                       ),
                       
                       p(style = "margin-bottom: 4px; line-height: 1.3;", strong("Instituição-sede:"), " Escola de Direito de São Paulo. Fundação Getúlio Vargas (FGV). São Paulo, SP, Brasil"),
                       p(style = "margin-bottom: 4px; line-height: 1.3;", strong("Grupo de pesquisa:"), " Grupo de Pesquisa em Direito e Violência de Estado (GPDVE) "),
                       p(style = "margin-bottom: 4px; line-height: 1.3;", strong("Fomento:"), " Fundação de Amparo à Pesquisa do Estado de São Paulo (FAPESP)"),
                       p(style = "margin-bottom: 4px; line-height: 1.3;", strong("Projeto:"), " Organização e disponibilização pública de acervo documental envolvendo violência de Estado."),
                       p(style = "margin-bottom: 4px; line-height: 1.3;", strong("Processo:"), " 25/11544-9")
                ),
                
                column(4, align = "right",
                       div(style = "margin-top: 20px; display: flex; justify-content: flex-end; align-items: center;",
                           img(src = "https://upload.wikimedia.org/wikipedia/commons/c/cf/Logo_FGV_-_Funda%C3%A7%C3%A3o_Getulio_Vargas.png", height = "20", style = "margin-right: 20px;"),
                           img(src = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Logo_fapesp_em_preto.svg/1280px-Logo_fapesp_em_preto.svg.png", height = "24")
                       )
                )
              ),
              
              hr(style = "border-top: 1px solid #dcdde1; margin: 15px 0;"),
              
              h5("Como citar este aplicativo?"),
              div(class = "citacao-box",
                  HTML('<p style="margin: 0;">FRANCO, Millena Miranda. Mnema 1.0: Ferramenta educativa para organização e disponibilização de acervos históricos em Direito e violência de Estado. Versão 1.0. São Paulo: Fundação Getulio Vargas (FGV), 2026. Aplicativo web. Disponível em: https://projeto-memoria.shinyapps.io/mnema/. Acesso em: <span id="data_atualizacao"></span>.</p>'),
                  
                  # Script para gerar a data de acesso em tempo real no padrão ABNT
                  tags$script(HTML('
            const data = new Date();
            const meses = ["jan.", "fev.", "mar.", "abr.", "maio", "jun.", "jul.", "ago.", "set.", "out.", "nov.", "dez."];
            const dataFormatada = data.getDate() + " " + meses[data.getMonth()] + " " + data.getFullYear();
            document.getElementById("data_atualizacao").innerText = dataFormatada;
        '))
              ),
              
              hr(style = "border-top: 1px solid #dcdde1; margin: 15px 0;"),
              
              h5("Referências bibliográficas"),
              p(HTML("BRASIL. CONSELHO NACIONAL DE ARQUIVOS (CONARQ). NOBRADE: Norma Brasileira de Descrição Arquivística. Rio de Janeiro: Arquivo Nacional, 2006. (Base estrutural para hierarquia de fundos e coleções).")),
              p(HTML("BRASIL. CONSELHO NACIONAL DE ARQUIVOS (CONARQ). Resolução nº 28, de 17 de fevereiro de 2009. Dispõe sobre o Cadastro Nacional de Entidades Custodiadoras de Acervos Arquivísticos (CODEARQ).")),
              p(HTML("BRASIL. CONSELHO NACIONAL DE ARQUIVOS (CONARQ).Recomendações para digitalização de documentos arquivísticos permanentes. Brasília (DF): Conarq, abr. 2010.")),
              p(HTML("CONSELHO INTERNACIONAL DE ARQUIVOS (CIA).ISAD(G): Norma Geral Internacional de Descrição Arquivística. 2. ed. Rio de Janeiro: Arquivo Nacional, 2000.")),
              p(HTML("PLATAFORMA DE AUTOMAÇÃO DIGITAL PARA ACERVOS – PADÁ. Recomendações técnicas: nomeação de objetos digitais: PADA RT(OD):1 [recurso eletrônico]. São Paulo: PADÁ, 2025. 76 p. E-book. ISBN 978-65-01-32648-1."))
)