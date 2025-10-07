# CENG---Backend

Este projeto é o backend do sistema CENG. Siga os passos abaixo para clonar e executar o projeto localmente.

## Pré-requisitos

- [Git](https://git-scm.com/downloads)
- [Node.js](https://nodejs.org/) (versão recomendada: 18.x ou superior)
- [npm](https://www.npmjs.com/) ou [yarn](https://yarnpkg.com/)

## Passo a Passo
### 1. Obter o link do repositório

Acesse a página do projeto no GitHub. Clique no botão verde **Code** e copie o link HTTPS do repositório, por exemplo:
```
https://github.com/gihcaron/CENG---Backend.git
```

### 2. Clonar o repositório

Abra o terminal (Prompt de Comando, PowerShell ou Terminal do VS Code). Navegue até o diretório onde deseja salvar o projeto e execute:
```bash
git clone https://github.com/gihcaron/CENG---Backend.git
```
Entre na pasta do projeto recém-clonada:
```bash
cd CENG---Backend
```
Entre no arquivo
```bash
code .
```

### 3. Verificar a versão do Node.js

Confira se o Node.js está instalado e na versão recomendada (18.x ou superior):
```bash
node -v
```
Se o comando não funcionar ou a versão for inferior, baixe e instale o Node.js pelo [site oficial](https://nodejs.org/).

### 4. Instalar as dependências do projeto

No diretório do projeto, execute:
```bash
npm install
```
Esse comando irá instalar todas as dependências listadas no arquivo `package.json`. Se preferir usar o Yarn:
```bash
yarn install
```

### 5. Configurar variáveis de ambiente

Crie um arquivo chamado `.env` na raiz do projeto. Copie e cole o conteúdo abaixo, ajustando os valores conforme necessário:
```
PORT=3000
DB_USER=postgres
DB_HOST=localhost
DB_NAME=automobilismo_db
DB_PORT= Sua_Porta 
DB_PASSWORD= Sua_Senha
```
> **Dica:** Nunca compartilhe seu arquivo `.env` publicamente, pois ele contém informações sensíveis.

### 6. Preparar o banco de dados PostgreSQL

1. Certifique-se de que o PostgreSQL está instalado. Baixe em [postgresql.org/download](https://www.postgresql.org/download/).
2. Inicie o serviço do PostgreSQL ou SQL Shell.
3. Acesse o terminal do PostgreSQL (psql) ou use uma ferramenta gráfica como [pgAdmin](https://www.pgadmin.org/) ou o terminal do SQL Shell. Preencha as informações condizentes com o seu .env, caso esteja diferente a conexão pode falhar.
4. Crie o banco de dados:
    ```sql
    CREATE DATABASE automobilismo_db;
    ```
5. Entre na pasta
      ```sql
    \c automobilismo_db
    ```
6. Crie as tabelas
      ```sql
   CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    descricao VARCHAR(1000),
    ano_inicio INTEGER
    );
  ```sql
INSERT INTO categorias (id, nome, descricao, ano_inicio) VALUES
(1, 'Formula 1', 'Principal categoria de automobilismo internacional', 1950),
(2, 'TCR South America', 'Categoria de turismo na America do Sul', 2021),
(3, 'Stock Car', 'Principal categoria de turismo nacional do Brasil', 1979),
(4, 'Copa Truck', 'Competição de caminhões no Brasil', 1985),
(5, 'F1 Academy', 'Categoria de formação para jovens pilotos femininas', 2023),
(6, 'Porsche Cup', 'Categoria de carros esportivos Porsche', 2003),
(7, 'Turismo Nacional', 'Campeonato brasileiro de carros de turismo', 2000),
(8, 'Porsche Cup Brasil', 'Categoria brasileira de carros esportivos Porsche', 2003),
(9,'AMG Cup', 'Categoria brasileira de carros esportivos Mercedes-AMG', 2020),
(10, 'IndyCar Series', 'Principal categoria de monopostos nos EUA conhecida pela Indy 500', 1996),
(11, 'Formula E', 'Categoria internacional de carros eletricos monopostos', 2014),
(12, 'W Series', 'Categoria exclusivamente feminina de monopostos', 2019),
(13, 'Extreme E', 'Campeonato off-road com carros eletricos obrigatorio ter dupla mista homem-mulher', 2021),
(14, 'IMSA WeatherTech SportsCar Championship', 'Campeonato de endurance norte-americano inclui as 24h de Daytona', 1999),
(15, 'World Endurance Championship (WEC)', 'Campeonato Mundial de Endurance inclui as 24h de Le Mans', 2012),
(16, 'NASCAR Cup Series', 'Categoria de turismo mais popular dos EUA disputada em ovais e circuitos mistos', 1949),
(17, 'Formula Regional European Championship (FRECA)', 'Categoria de monopostos na Europa etapa de formacao para a F1', 2019),
(18, 'Formula 2', 'Categoria de acesso direta a Formula 1 nivel internacional', 2017),
(19, 'Formula 3', 'Categoria de formacao de jovens pilotos parte da piramide da FIA', 2019),
(20, 'Endurance', 'Categoria de corridas de longa duração envolvendo resistência de carros e pilotos', 2018);

 ```
 ```sql
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
 ```
 ```sql
INSERT INTO profissionais (nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id) VALUES

( 'Stephanie Travers', NULL, 'Trackside Fluid Engineer', 'Engenheira de fluidos de pista. Primeira mulher negra a subir no podio da Formula 1 em 2020.', 'stephanietravers', 'uploads/1757722453750-stephanie-travers.jpg', 'Estados Unidos', 1),
( 'Maria Nienkotter', 19, 'Piloto', 'Pilota catarinense que se consolidou no TCR South America Banco BRB ao volante de um Toyota Corolla.', 'marianienkotter', 'uploads/1757724147327-WhatsApp Image 2025-09-07 at 21.27.04.jpeg', 'Brasil', 2),
( 'Renata Camargo', NULL, 'Piloto', 'Pilota catarinense que se consolidou no TCR South America Banco BRB ao volante de um Toyota Corolla.', 'renatacamargooficial', 'uploads/1757724300376-renataCamargo.jpg', 'Brasil', 7),
( 'Bruna Tomaselli', 27, 'Piloto', 'Pilota catarinense, passou por Formula Junior Brasil, F4 Sul-Americana, US F2000 e W Series. Estreou na Stock Series em 2023.', 'brunatomaselli', 'uploads/1757724524807-brunaT.jpg', 'Brasil', 3),
( 'Debora Rodrigues', 57, 'Piloto', 'Pilota de caminhoes, empresaria e ex-apresentadora de TV, pioneira em competicoes de caminhoes no Brasil.', 'deborarodriguesoficial', 'uploads/1757724779608-debora.jpg', 'Brasil', 4),
( 'Abbi Pulling', 21, 'Piloto', 'Britanica, iniciou no kart aos 9 anos. Conquistou titulo da F1 Academy em 2024 e atualmente e piloto de testes da Nissan Formula E.', 'abbipulling', 'uploads/1757784337473-abbi.jpg', 'Reino Unido', 5),
( 'Janaina Thais', NULL, 'Engenheira de pista', 'Race Engineer na Porsche Cup Brasil desde 2017, especialista em telemetria, setup de carros e gestao de pneus.', 'jana_thais', 'uploads/1757784469289-janaina.jpg', 'Brasil', 6),
('Antonella Bassani', 19, 'Piloto', 'Pilota catarinense, comecou no kart aos 4 anos, primeira mulher a conquistar pole na Porsche Cup Brasil aos 16 anos.', 'antonella_bassani', 'uploads/1757784573967-antonellaB.jpg', 'Brasil', 6),
('Cecilia Rabelo', 17, 'Piloto', 'Pilota mineira que estreou no BRB Formula 4 Brasil em 2023, conquistando uma pole position historica em Interlagos pela TMG Racing. Atualmente compete pela Oakberry Bassani F4 em sua segunda temporada e tambem participa da Porsche Cup Brasil.', 'cecilia_rabelo', 'uploads/1757784687268-ceciliaR.jpg', 'Brasil', 5),
('Aurelia Nobels', 18, 'Piloto', 'Pilota belga-brasileira, membro da Ferrari Driver Academy, atualmente na F1 Academy pela ART Grand Prix. Comecou no kart aos 10 anos, competiu em diversas Formulas 4 internacionais e conquistou podios na F4 Saudita.', 'aurelianobels', 'uploads/1757784785549-AureliaN.jpg', 'Brasil', 5),
('Thaline Chicoski', 30, 'Piloto', 'Thaline Chicoski, pilota paranaense de Campo Mourao, descobriu sua paixao pelo automobilismo em 2010, quando decidiu experimentar o kart de seu irmao. Aos 14 anos iniciou sua trajetoria, conquistando o bicampeonato paranaense de kart e se tornando a unica mulher a vencer na Copa HB20, onde competiu por quatro temporadas. Atualmente, com 30 anos, representa a equipe DMais Motorsport na AMG Cup Brasil e na Copa Truck.', 'thalinechicoski', 'uploads/1757784899496-Thaline.jpg', 'Brasil', 4),
('Erika Prado', NULL, 'Engenharia de Performance e Dados', 'Engenheira com experiencia na Formula Vee, Copa HB20, Stock Light, GP do Galeao e Formula 4 Brasil. Atuou como Performance Engineer na Cavaleiro Sports e hoje e destaque na F4 Brasil. Fundadora do projeto Girls Like Racing, que aproxima e incentiva mulheres no automobilismo, impactando milhares de mulheres de todo o Brasil.', 'engblogueira', 'uploads/1757785035430-ErikaP.jpg', 'Brasil', 3),
('Carol Nunes', 30, 'Pilota', 'Paulista e primeira pilota trans do Brasil, Carol Nunes iniciou no automobilismo com um ousado projeto: transformar sozinha um Ford Fusion em carro de corrida, o que lhe rendeu notoriedade e vitorias na Subida de Montanha e na Super Liga Desportiva de Velocidade. Conquistou titulo na categoria feminina da liga e chegou a competir na Copa HB20, sempre enfrentando barreiras de patrocinio e preconceito, mas se consolidando como simbolo de diversidade e resistencia no esporte a motor.', 'carol.nunes42', 'uploads/1757785259142-carolNunes.jpg', 'Brasil', NULL),
('Bia Martins', 25, 'Piloto', 'Natural de Joao Pessoa PB, Bia Martins comecou no kart aos 9 anos e se destacou como a unica mulher na F-400 do Nordeste. Em 2023 estreou nos carros pela HB20 Racing Cup, encerrando duas temporadas entre os sete primeiros colocados. Em 2025 estreia na Turismo Nacional pela equipe GS Sports, ao lado de Maria Luiza Bedin, acelerando o Chevrolet New Onix 55.', 'biafmartins_', 'uploads/1757785439396-BiaMartins.jpg', 'Brasil', 7),
('Rafaela Ferreira', 20, 'Piloto', 'Pilota brasileira de Criciuma, primeira mulher a conquistar a pole position na Copa Brasil de Kart em 2022. Estreou na Formula 4 Brasil em 2023, onde fez historia como a primeira mulher a subir ao podio e, em 2024, conquistou tres vitorias e terminou o campeonato em 4 lugar. Em 2025, passou a competir na F1 Academy pela Campos Racing, representando a Racing Bulls.', 'rafaelaferreiraf1', 'uploads/1757785747015-RafaelaF.jpg', 'Brasil', 5),
('Patricia Alencar', 20, 'Engenheira Mecanica', 'Paulistana apaixonada por automobilismo desde a infancia, Patricia comecou como mecanica aos 15 anos e fez historia ao se tornar a primeira mulher a atuar como mecanica oficial na Porsche Cup Brasil e na Stock Car. Atualmente estuda Engenharia Mecanica na Anhembi Morumbi, trabalha como engenheira de dados na Copa Hyundai HB20 e Formula Delta, chefia a EMS Rally Team no Sertoes e no Brasileiro de Rally Baja, alem de integrar projetos como o FIA Girls on Track Brasil na Mitsubishi Cup.', 'patriciafelixalencar', 'uploads/1757786057578-PatriciaA.jpg', 'Brasil', 3),
('Rachel Loh', NULL, 'Engenheira de Pista', 'Rachel Loh e pioneira no automobilismo brasileiro, sendo a primeira engenheira de pista da Stock Car em 2016. Atualmente integra a Ipiranga Racing e tambem atua como comissaria tecnica da CBA, tendo fiscalizado provas de Formula 1 em Sao Paulo e Singapura. Formada em Engenharia Mecanica, acumula mais de 17 anos de experiencia e participa de iniciativas como a Comissao Feminina de Automobilismo e o projeto FIA Girls on Track. Defensora da inclusao e da igualdade de genero, inspira novas geracoes de mulheres a seguirem carreira no esporte a motor.', 'kuanzein', 'uploads/1757786235317-RachelL.jpg', 'Brasil', 3),
('Nathalia De Vivo', 34, 'Jornalista', 'Nathalia De Vivo e jornalista formada pela Universidade Presbiteriana Mackenzie em 2013, com experiencia em midias sociais e reportagem em veiculos como Jornal Destak, eduK, Tazio, Grande Premio e a Stock Car. Atualmente e editora do site F1 Mania, onde lidera coberturas da Stock Car e Porsche Cup, alem de atuar em pautas da Formula 1. Criadora da pagina Elas na Pista, soma passagens por eventos internacionais como F1, Formula E, WEC e Indy, com entrevistas em ingles e reportagens in loco.', 'itsmenathi', 'uploads/1757786503647-NathaliaV.jpg', 'Brasil', 1),
('Kaka Magno', 36, 'Piloto', 'Kaka Magno e piloto brasileira de Curitiba, Parana, com mais de 17 anos de experiencia no automobilismo. Sua trajetoria inclui passagens por categorias como Formula 4 Sul-Americana, Formula Inter, Mercedes-Benz Challenge e o Campeonato Italiano de Prototipos, alem de participacoes em testes da EuroNASCAR. Vice-campea do Sul-Brasileiro de Kart em 2019 e embaixadora do Trofeu Ayrton Senna de Kart, estreou na Stock Light em 2023, evoluindo para se consolidar entre as principais competidoras da categoria. Em 2025, disputa sua terceira temporada na Stock Light a bordo do carro 25 pela equipe Infinity Competicoes.', 'kakamagno', 'uploads/1759022962517-KakaM.jpg', 'Brasil', 3),
('Livia Maria', 22, 'Social Media e Jornalista Esportiva', 'Livia Vieira e estudante de Publicidade e Propaganda na Universidade Positivo, em Curitiba, e idealizadora da pagina Paddock News, voltada para a cobertura do automobilismo. Apaixonada por esportes, decidiu migrar do curso de Direito para a comunicacao, com o objetivo de unir criatividade e paixao pelas corridas. Atuando como social media e criadora de conteudo, busca se consolidar como futura publicitaria esportiva, trazendo informacao de forma autentica e engajadora.', 'liviavm', 'uploads/1759023316909-LiviaM.jpg', 'Brasil', 1),
('Julianne Cerasoli', NULL, 'Jornalista Multimidia', 'Julianne Cerasoli e jornalista especializada em automobilismo, com mais de 20 anos de experiencia como correspondente, criadora de conteudo e editora em esportes e corridas. Desde 2010, e uma das principais blogueiras de Formula 1, produzindo textos, podcasts, videos e transmissoes ao vivo. Criadora do projeto No Paddock da F1 com a Ju, oferece conteudo exclusivo sobre a categoria, consolidando-se como referencia no jornalismo esportivo digital.', 'myf1life', 'uploads/1759023598247-JulianeC.jpg', 'Brasil', 1),
('Katy Fairman', 29, 'Jornalista', 'Katy Fairman e jornalista freelancer especializada em automobilismo, com mais de uma decada de experiencia escrevendo sobre carros de corrida e seus protagonistas. Iniciou sua carreira atraves de um blog pessoal que lhe abriu portas para veiculos como The Independent, BBC e Autosport, alem de coberturas em GPs de Formula 1 e na Formula E. Foi editora do site WTF1 em 2020 e, desde 2023, atua como freelancer, tendo colaborado com marcas e campeonatos como Sports Illustrated, Scuderia Ferrari, LEGO e Formula E, onde tambem trabalha como reporter oficial. Criadora do Small Torque Podcast, combina entrevistas, reportagens e comentarios com uma abordagem divertida e proxima ao publico.', 'katyfairman', 'uploads/1759023813733-KatyF.jpg', 'Reino Unido', 1),
('Milena Muraro', 22, 'Criadora de Conteudo', 'Milena Muraro e criadora de conteudo digital e estudante de jornalismo, apaixonada por automobilismo e lifestyle. Catarinense, compartilha sua rotina entre o paddock e o cotidiano em suas redes sociais, mesclando analises, curiosidades e experiencias pessoais. Gearhead assumida, tem como equipe favorita a Scuderia Ferrari e pilotos como Charles Leclerc, Carlos Sainz e Max Verstappen entre suas maiores referencias. Com mais de 19 mil seguidores, busca aproximar fas do esporte por meio de uma linguagem autentica e acessivel.', 'f1withmii', 'uploads/1759024036693-Milena.jpg', 'Brasil', 1),
('Laura Muller', 33, 'Engenheira de Corrida', 'Laura Muller e engenheira alema formada em Engenharia Automotiva pela Universidade Tecnica de Munique e a primeira mulher a atuar como engenheira de corrida em tempo integral na Formula 1. Ingressou na Haas F1 Team em 2022, inicialmente como engenheira de performance e especialista em simuladores, e em 2025 assumiu o cargo de engenheira de corrida de Esteban Ocon. Com passagens por categorias como WEC, LMP2 e DTM, construiu uma carreira solida em equipes de ponta e e reconhecida por sua dedicacao e competencia tecnica.', NULL, 'uploads/1759024234731-LauraM.jpg', 'Alemanha', 1),
('Lena Buhler', NULL, 'Pilota de Corrida', 'Laura Muller e engenheira alema formada em Engenharia Automotiva pela Universidade Tecnica de Munique e a primeira mulher a atuar como engenheira de corrida em tempo integral na Formula 1. Ingressou na Haas F1 Team em 2022, inicialmente como engenheira de performance e especialista em simuladores, e em 2025 assumiu o cargo de engenheira de corrida de Esteban Ocon. Com passagens por categorias como WEC, LMP2 e DTM, construiu uma carreira solida em equipes de ponta e e reconhecida por sua dedicacao e competencia tecnica.', 'lena_buhler', 'uploads/1759024555503-lena.jpg', 'Suica', 1),
('Bianca Bustamante', 18, 'Pilota de Corrida', 'Piloto filipina-americana. Primeira mulher a integrar o Programa de Desenvolvimento de Pilotos da McLaren. Competiu na F1 Academy em 2024 e passara para GB3 em 2025.', '@racerbia', 'uploads\\1759367745221-BiaR.jpg', 'Filipinas', 5),
('Paula Mascari', NULL, 'Pilota de Corrida', 'Ex-advogada que se tornou mecanica profissional. Influenciadora digital e especialista em carros turbo e performance.', '@paulamascari', 'uploads\\1759529251588-PaulaM.jpeg', 'Brasil', 7),
('Ana Julia Pirozzi', NULL, 'Marketing e producao de eventos', 'Profissional de automobilismo com formacao em Relacoes Internacionais. Atua em marketing, producao de conteudo e eventos, ja trabalhou em Stock Car, F4 Brasileira, Porsche Cup Brasil e International GT Open. Participa de iniciativas de diversidade e inclusao no esporte a motor.', '@najupirozzi', 'uploads\\1759529569042-AnaP.jpg', 'Brasil', 7),
('Simona de Silvestro', NULL, 'Piloto profissional', 'Piloto profissional suica. Competiu em Formula BMW USA, F-Atlantic, IndyCar, Formula E e V8 Supercars. Primeira mulher a conquistar pódio no Indianapolis Motor Speedway e destaque em campeonatos internacionais.', '@simonadesilvestro', 'uploads\\1759529872058-SimonaS.jpg', 'Brasil', NULL),
('Doriane Pin', NULL, 'Piloto profissional', 'Piloto profissional de automobilismo. Participa do Campeonato Europeu de Formula Regional e Ferrari Challenge. Integrante da equipe Iron Dames desde 2024.', '@dorianepin', 'uploads\\1759532040545-DorianeP.jpg', 'Franca', 20),
('Marta Garcia', NULL, 'Piloto profissional', 'Piloto profissional espanhola. Compete no Campeonato Europeu de Formula Regional desde 2024 pela equipe Iron Dames.', '@martagarcia', 'uploads\\1759532145857-MartaG.jpg', 'Espanha', 20),
('Sarah Rumeau', NULL, 'Piloto profissional', 'Piloto francesa de rally e automobilismo. Participa do Campeonato Francês de Rali classe Rally4 e WRC2 em 2025. Integrante da equipe Iron Dames.', '@sarahrumeau', 'uploads\\1759532268446-SaraR.jpg', 'Franca', 20);
 ```

### 8. Rodar o backend

No terminal, execute:
```bash
npm run dev
```
ou, se estiver usando Yarn:
```bash
yarn start
```
O servidor deve iniciar e exibir uma mensagem indicando que está rodando na porta definida no `.env` (por padrão, 3000).

### 9. Testar a aplicação

- Abra o navegador e acesse: [http://localhost:3000/api/profissionais](http://localhost:3000/api/profissionais) ou [http://localhost:3000/api/categorias](http://localhost:3000/api/categorias)

---

**Dicas adicionais:**
- Se ocorrerem erros, verifique o terminal para mensagens detalhadas.
- Certifique-se de que o banco de dados está rodando e que as credenciais do `.env` estão corretas.
- Para dúvidas sobre comandos, consulte os arquivos `README.md`, `package.json` ou a documentação oficial das dependências utilizadas.


