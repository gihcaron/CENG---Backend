--  \c automobilismo_db

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    descricao VARCHAR(1000),
    ano_inicio INTEGER
    );


INSERT INTO categorias (id, nome, descricao, ano_inicio) VALUES
(1, 'Formula 1', 'Principal categoria de automobilismo internacional', 1950),
(2, 'TCR South America', 'Categoria de turismo na América do Sul', 2021),
(3, 'Stock Car', 'Principal categoria de turismo nacional do Brasil', 1979),
(4, 'Copa Truck', 'Competição de caminhões no Brasil', 1985),
(5, 'F1 Academy', 'Categoria de formação para jovens pilotos femininas', 2023),
(6, 'Porsche Cup', 'Categoria de carros esportivos Porsche', 2003);
(7, 'Turismo Nacional', 'Campeonato brasileiro de carros de turismo', 2000),
(8, 'Porsche Cup Brasil', 'Categoria brasileira de carros esportivos Porsche', 2003);
(9,'AMG Cup', 'Categoria brasileira de carros esportivos Mercedes-AMG', 2020);



CREATE TABLE profissionais (
   id SERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    idade INTEGER,
    area_atuacao VARCHAR(100),
    biografia TEXT,
    redes_sociais VARCHAR(500),
    foto VARCHAR(500),
    pais VARCHAR(100),
    categoria_id INTEGER REFERENCES categorias(id) ON DELETE SET NULL
);

INSERT INTO profissionais (nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id) VALUES
( 'Amanda Davies', NULL, 'Engenheira de pista', 'Engenheira de fluidos de pista. Primeira mulher negra a subir no podio da Formula 1 em 2020.', NULL, NULL, 'Estados Unidos', 1),
( 'Maria Nienkotter', 19, 'Piloto', 'Pilota catarinense que se consolidou no TCR South America Banco BRB ao volante de um Toyota Corolla.', '@marianienkotter', NULL, 'Brasil', 2),
( 'Renata Camargo', NULL, 'Piloto', 'Pilota brasileira em destaque no Campeonato Brasileiro de Turismo Nacional, com podio inedito no Autodromo do Velocitta.', '@renatacamargooficial', NULL, 'Brasil', 2),
( 'Bruna Tomaselli', 27, 'Piloto', 'Pilota catarinense, passou por Formula Junior Brasil, F4 Sul-Americana, U.S. F2000 e W Series. Estreou na Stock Series em 2023.', '@brunatomaselli', NULL, 'Brasil', 3),
( 'Debora Rodrigues', 57, 'Piloto', 'Pilota de caminhões, empresaria e ex-apresentadora de TV, pioneira em competicoes de caminhões no Brasil.', 'deborarodriguesoficial',NULL, 'Brasil', 4),
( 'Abbi Pulling', 21, 'Piloto', 'Britanica, iniciou no kart aos 9 anos. Conquistou titulo da F1 Academy em 2024 e atualmente e piloto de testes da Nissan Formula E.', '@abbipulling', NULL, 'Reino Unido', 5),
( 'Janaina Thais', NULL, 'Engenheira de pista', 'Race Engineer na Porsche Cup Brasil desde 2017, especialista em telemetria, setup de carros e gestao de pneus.', '@jana_thais', NULL, 'Brasil', 6),
('Antonella Bassani', 19, 'Piloto', 'Pilota catarinense, comecou no kart aos 4 anos, primeira mulher a conquistar pole na Porsche Cup Brasil aos 16 anos.', '@antonella_bassani', NULL, 'Brasil', 6);
('Cecília Rabelo', 17, 'Piloto', 'Pilota mineira que estreou no BRB Fórmula 4 Brasil em 2023, conquistando uma pole position histórica em Interlagos pela TMG Racing. Atualmente compete pela Oakberry Bassani F4 em sua segunda temporada e também participa da Porsche Cup Brasil.', '@cecilia_rabelo', NULL, 'Brasil', 5);
('Aurelia Nobels', 18, 'Piloto', 'Pilota belga-brasileira, membro da Ferrari Driver Academy, atualmente na F1 Academy pela ART Grand Prix. Começou no kart aos 10 anos, competiu em diversas Fórmulas 4 internacionais e conquistou pódios na F4 Saudita.', '@aurelianobels', NULL, 'Brasil', 5);
('Thaline Chicoski', 30, 'Piloto', 'Thaline Chicoski, pilota paranaense de Campo Mourão, descobriu sua paixão pelo automobilismo em 2010, quando decidiu experimentar o kart de seu irmão. Aos 14 anos iniciou sua trajetória, conquistando o bicampeonato paranaense de kart e se tornando a única mulher a vencer na Copa HB20, onde competiu por quatro temporadas. Atualmente, com 30 anos, representa a equipe DMais Motorsport na AMG Cup Brasil e na Copa Truck.', '@thalinechicoski', NULL, 'Brasil', 4);
('Erika Prado', NULL, 'Engenharia de Performance e Dados', 'Engenheira com experiência na Fórmula Vee, Copa HB20, Stock Light, GP do Galeão e Fórmula 4 Brasil. Atuou como Performance Engineer na Cavaleiro Sports e hoje é destaque na F4 Brasil. Fundadora do projeto Girls Like Racing, que aproxima e incentiva mulheres no automobilismo, impactando milhares de mulheres de todo o Brasil.', NULL, NULL, 'Brasil', 3);
('Carol Nunes', 30, 'Pilota', 'Paulista e primeira pilota trans do Brasil, Carol Nunes iniciou no automobilismo com um ousado projeto: transformar sozinha um Ford Fusion em carro de corrida, o que lhe rendeu notoriedade e vitórias na Subida de Montanha e na Super Liga Desportiva de Velocidade. Conquistou título na categoria feminina da liga e chegou a competir na Copa HB20, sempre enfrentando barreiras de patrocínio e preconceito, mas se consolidando como símbolo de diversidade e resistência no esporte a motor.', NULL, NULL, 'Brasil', 4);
('Nome da Jornalista', NULL, 'Jornalista', 'Jornalista formada pela Universidade Presbiteriana Mackenzie, com experiência em veículos como Destak, eduK, Tazio, Grande Prêmio e na organização da Stock Car. Atualmente é editora no site F1 Mania, onde cobre Fórmula 1, Stock Car e Porsche Cup, além de já ter atuado em eventos internacionais como F1, Fórmula E, WEC e Indy. Criadora da página Elas na Pista, soma mais de 10 mil seguidores no YouTube, destacando-se na produção de conteúdo e na representatividade feminina no automobilismo.', '@elasnapista', NULL, 'Brasil', 7);
('Bia Martins', 25, 'Piloto', 'Natural de João Pessoa (PB), Bia Martins começou no kart aos 9 anos e se destacou como a única mulher na F-400 do Nordeste. Em 2023 estreou nos carros pela HB20 Racing Cup, encerrando duas temporadas entre os sete primeiros colocados. Em 2025 estreia na Turismo Nacional pela equipe GS Sports, ao lado de Maria Luiza Bedin, acelerando o Chevrolet New Onix #55.', NULL, NULL, 'Brasil', 4);
