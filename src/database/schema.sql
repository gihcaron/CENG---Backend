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
(6, 'Porsche Cup', 'Categoria de carros esportivos Porsche', 2003),
(7, 'Turismo Nacional', 'Campeonato brasileiro de carros de turismo', 2000),
(8, 'Porsche Cup Brasil', 'Categoria brasileira de carros esportivos Porsche', 2003),
(9,'AMG Cup', 'Categoria brasileira de carros esportivos Mercedes-AMG', 2020);



CREATE TABLE profissionais (
   id SERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    idade INTEGER,
    area_atuacao VARCHAR(100),
    biografia TEXT,
    redes_sociais VARCHAR(500),
    foto TEXT,
    pais VARCHAR(100),
    categoria_id INTEGER REFERENCES categorias(id) ON DELETE SET NULL
);
INSERT INTO profissionais (nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id) VALUES
( 'Stephanie Travers', NULL, 'Trackside Fluid Engineer', 'Engenheira de fluidos de pista. Primeira mulher negra a subir no podio da Formula 1 em 2020.', '@stephanietravers', 'uploads\\1757722453750-stephanie-travers.jpg', 'Estados Unidos', 1),
( 'Maria Nienkotter', 19, 'Piloto', 'Pilota catarinense que se consolidou no TCR South America Banco BRB ao volante de um Toyota Corolla.', '@marianienkotter', 'uploads\\1757724147327-WhatsApp Image 2025-09-07 at 21.27.04.jpeg', 'Brasil', 2),
( 'Renata Camargo', NULL, 'Piloto', 'Pilota catarinense que se consolidou no TCR South America Banco BRB ao volante de um Toyota Corolla.', '@renatacamargooficial', 'uploads\\1757724300376-renataCamargo.jpg', 'Brasil', 7),
( 'Bruna Tomaselli', 27, 'Piloto', 'Pilota catarinense, passou por Formula Junior Brasil, F4 Sul-Americana, U.S. F2000 e W Series. Estreou na Stock Series em 2023.', '@brunatomaselli', 'uploads\\1757724524807-brunaT.jpg', 'Brasil', 3),
( 'Debora Rodrigues', 57, 'Piloto', 'Pilota de caminhoes, empresaria e ex-apresentadora de TV, pioneira em competicoes de caminhoes no Brasil.', '@deborarodriguesoficial', 'uploads\\1757724779608-debora.jpg', 'Brasil', 4),
( 'Abbi Pulling', 21, 'Piloto', 'Britanica, iniciou no kart aos 9 anos. Conquistou titulo da F1 Academy em 2024 e atualmente e piloto de testes da Nissan Formula E.', '@abbipulling', 'uploads\\1757784337473-abbi.jpg', 'Reino Unido', 5),
( 'Janaina Thais', NULL, 'Engenheira de pista', 'Race Engineer na Porsche Cup Brasil desde 2017, especialista em telemetria, setup de carros e gestao de pneus.', '@jana_thais', 'uploads\\1757784469289-janaina.jpg', 'Brasil', 6),
('Antonella Bassani', 19, 'Piloto', 'Pilota catarinense, comecou no kart aos 4 anos, primeira mulher a conquistar pole na Porsche Cup Brasil aos 16 anos.', '@antonella_bassani', 'uploads\\1757784573967-antonellaB.jpg', 'Brasil', 6),
('Cecilia Rabelo', 17, 'Piloto', 'Pilota mineira que estreou no BRB Formula 4 Brasil em 2023, conquistando uma pole position historica em Interlagos pela TMG Racing. Atualmente compete pela Oakberry Bassani F4 em sua segunda temporada e tambem participa da Porsche Cup Brasil.', '@cecilia_rabelo', 'uploads\\1757784687268-ceciliaR.jpg', 'Brasil', 5),
('Aurelia Nobels', 18, 'Piloto', 'Pilota belga-brasileira, membro da Ferrari Driver Academy, atualmente na F1 Academy pela ART Grand Prix. Comecou no kart aos 10 anos, competiu em diversas Formulas 4 internacionais e conquistou podios na F4 Saudita.', '@aurelianobels', 'uploads\\1757784785549-AureliaN.jpg', 'Brasil', 5),
('Thaline Chicoski', 30, 'Piloto', 'Thaline Chicoski, pilota paranaense de Campo Mourao, descobriu sua paixao pelo automobilismo em 2010, quando decidiu experimentar o kart de seu irmao. Aos 14 anos iniciou sua trajetoria, conquistando o bicampeonato paranaense de kart e se tornando a unica mulher a vencer na Copa HB20, onde competiu por quatro temporadas. Atualmente, com 30 anos, representa a equipe DMais Motorsport na AMG Cup Brasil e na Copa Truck.', '@thalinechicoski', 'uploads\\1757784899496-Thaline.jpg', 'Brasil', 4),
('Erika Prado', NULL, 'Engenharia de Performance e Dados', 'Engenheira com experiencia na Formula Vee, Copa HB20, Stock Light, GP do Galeao e Formula 4 Brasil. Atuou como Performance Engineer na Cavaleiro Sports e hoje e destaque na F4 Brasil. Fundadora do projeto Girls Like Racing, que aproxima e incentiva mulheres no automobilismo, impactando milhares de mulheres de todo o Brasil.', '@engblogueira', 'uploads\\1757785035430-ErikaP.jpg', 'Brasil', 3),
('Carol Nunes', 30, 'Pilota', 'Paulista e primeira pilota trans do Brasil, Carol Nunes iniciou no automobilismo com um ousado projeto: transformar sozinha um Ford Fusion em carro de corrida, o que lhe rendeu notoriedade e vitorias na Subida de Montanha e na Super Liga Desportiva de Velocidade. Conquistou titulo na categoria feminina da liga e chegou a competir na Copa HB20, sempre enfrentando barreiras de patrocinio e preconceito, mas se consolidando como simbolo de diversidade e resistencia no esporte a motor.', '@carol.nunes42', 'uploads\\1757785259142-carolNunes.jpg', 'Brasil', NULL),
('Bia Martins', 25, 'Piloto', 'Natural de Joao Pessoa (PB), Bia Martins comecou no kart aos 9 anos e se destacou como a unica mulher na F-400 do Nordeste. Em 2023 estreou nos carros pela HB20 Racing Cup, encerrando duas temporadas entre os sete primeiros colocados. Em 2025 estreia na Turismo Nacional pela equipe GS Sports, ao lado de Maria Luiza Bedin, acelerando o Chevrolet New Onix #55.', '@biafmartins_', 'uploads\\1757785439396-BiaMartins.jpg', 'Brasil', 7),
('Rafaela Ferreira', 20, 'Piloto', 'Pilota brasileira de Criciuma, primeira mulher a conquistar a pole position na Copa Brasil de Kart em 2022. Estreou na Formula 4 Brasil em 2023, onde fez historia como a primeira mulher a subir ao podio e, em 2024, conquistou tres vitorias e terminou o campeonato em 4 lugar. Em 2025, passou a competir na F1 Academy pela Campos Racing, representando a Racing Bulls.', '@rafaelaferreiraf1', 'uploads\\1757785747015-RafaelaF.jpg', 'Brasil', 5),
('Patricia Alencar', 20, 'Engenheira Mecanica', 'Paulistana apaixonada por automobilismo desde a infancia, Patricia comecou como mecanica aos 15 anos e fez historia ao se tornar a primeira mulher a atuar como mecanica oficial na Porsche Cup Brasil e na Stock Car. Atualmente estuda Engenharia Mecanica na Anhembi Morumbi, trabalha como engenheira de dados na Copa Hyundai HB20 e Formula Delta, chefia a EMS Rally Team no Sertoes e no Brasileiro de Rally Baja, alem de integrar projetos como o FIA Girls on Track Brasil na Mitsubishi Cup.', '@patriciafelixalencar', 'uploads\\1757786057578-PatriciaA.jpg', 'Brasil', 3),
('Rachel Loh', NULL, 'Engenheira de Pista', 'Rachel Loh e pioneira no automobilismo brasileiro, sendo a primeira engenheira de pista da Stock Car em 2016. Atualmente integra a Ipiranga Racing e tambem atua como comissaria tecnica da CBA, tendo fiscalizado provas de Formula 1 em Sao Paulo e Singapura. Formada em Engenharia Mecanica, acumula mais de 17 anos de experiencia e participa de iniciativas como a Comissao Feminina de Automobilismo e o projeto FIA Girls on Track. Defensora da inclusao e da igualdade de genero, inspira novas geracoes de mulheres a seguirem carreira no esporte a motor.', '@kuanzein', 'uploads\\1757786235317-RachelL.jpg', 'Brasil', 3),
('Nathalia De Vivo', 34, 'Jornalista', 'Nathalia De Vivo e jornalista formada pela Universidade Presbiteriana Mackenzie em 2013, com experiencia em midias sociais e reportagem em veiculos como Jornal Destak, eduK, Tazio, Grande Premio e a Stock Car. Atualmente e editora do site F1 Mania, onde lidera coberturas da Stock Car e Porsche Cup, alem de atuar em pautas da Formula 1. Criadora da pagina Elas na Pista, soma passagens por eventos internacionais como F1, Formula E, WEC e Indy, com entrevistas em ingles e reportagens in loco.', '@itsmenathi', 'uploads\\1757786503647-NathaliaV.jpg', 'Brasil', 1);
