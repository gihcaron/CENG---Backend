--  cd automobilismo_db

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


CREATE TABLE profissionais (
   id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INTEGER,
    area_atuacao VARCHAR(100),
    biografia TEXT,
    redes_sociais VARCHAR(500),
    foto VARCHAR(500),
    pais VARCHAR(100),
    categoria_id INTEGER REFERENCES categorias(id) ON DELETE SET NULL
);

INSERT INTO profissionais (id, nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id) VALUES
(1, 'Amanda Davies', NULL, 'Engenheira de pista', 'Engenheira de fluidos de pista. Primeira mulher negra a subir no podio da Formula 1 em 2020.', NULL, NULL, 'Estados Unidos', 1),
(2, 'Maria Nienkotter', 19, 'Piloto', 'Pilota catarinense que se consolidou no TCR South America Banco BRB ao volante de um Toyota Corolla.', '@marianienkotter', NULL, 'Brasil', 2),
(3, 'Renata Camargo', NULL, 'Piloto', 'Pilota brasileira em destaque no Campeonato Brasileiro de Turismo Nacional, com podio inedito no Autodromo do Velocitta.', '@renatacamargooficial', NULL, 'Brasil', 2),
(4, 'Bruna Tomaselli', 27, 'Piloto', 'Pilota catarinense, passou por Formula Junior Brasil, F4 Sul-Americana, U.S. F2000 e W Series. Estreou na Stock Series em 2023.', '@brunatomaselli', NULL, 'Brasil', 3),
(5, 'Debora Rodrigues', 57, 'Piloto', 'Pilota de caminhões, empresaria e ex-apresentadora de TV, pioneira em competicoes de caminhões no Brasil.', 'deborarodriguesoficial',NULL, 'Brasil', 4),
(6, 'Abbi Pulling', 21, 'Piloto', 'Britanica, iniciou no kart aos 9 anos. Conquistou titulo da F1 Academy em 2024 e atualmente e piloto de testes da Nissan Formula E.', '@abbipulling', NULL, 'Reino Unido', 5),
(7, 'Janaina Thais', NULL, 'Engenheira de pista', 'Race Engineer na Porsche Cup Brasil desde 2017, especialista em telemetria, setup de carros e gestao de pneus.', '@jana_thais', NULL, 'Brasil', 6),
(8, 'Antonella Bassani', 19, 'Piloto', 'Pilota catarinense, comecou no kart aos 4 anos, primeira mulher a conquistar pole na Porsche Cup Brasil aos 16 anos.', '@antonella_bassani', NULL, 'Brasil', 6);