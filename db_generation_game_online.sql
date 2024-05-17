CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

-- Cria tabela CLASSE com id (primary key), nome da classe e descrição da classe.
CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT,
    nome_classe VARCHAR(255) NOT NULL,
    descricao_classe VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

-- Cria tabela PERSONAGENS com id (primary key), nome do personagem, vida, mana e dano.
CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT,
    nome_personagem VARCHAR(255) NOT NULL,
    vida INT NOT NULL,
    mana INT NOT NULL,
    dano DECIMAL (6, 2) NOT NULL,
PRIMARY KEY (id)
);

-- Adiciona a FK e faz a relação entre as duas tabelas
ALTER TABLE tb_personagens ADD classesid BIGINT;
ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes
FOREIGN KEY (classesid) REFERENCES tb_classes (id);

-- Insere na tabela CLASSE os dados nome e descrição
INSERT INTO tb_classes(nome_classe, descricao_classe)
VALUES ("Fighters", "Mestres de combate corpo a corpo, combinam resistência e dano. "),
("Tanks","Extremamente resistentes, absorvem grandes quantidades de dano para proteger aliados."),
("Mages","Infligem dano mágico à distância com habilidades poderosas."),
("Marksmen","Especialistas em ataques à distância, causam dano físico consistente ao longo do tempo."),
("Assassins","Focados em eliminar rapidamente alvos prioritários com alta mobilidade e burst damage."),
("Supports", "Personagens focados em proteger e ajudar aliados. "); 


-- Insere na tabela PERSONAGENS os dados nome, vida, mana, dano e nº da classe segundo a tabela CLASSE
INSERT INTO tb_personagens(nome_personagem, vida, mana, dano, classesid)
VALUES ("Darius", 652, 263, 64.00, 1),
("Malphite", 644, 280, 62.50, 2),
("Lux", 560, 480, 54.50, 3),
("Ashe", 640, 280, 59.96, 4),
("Zed", 654, 0, 63.00, 5),
("Pantheon", 650, 317, 64.00, 1),
("Shaco", 630, 297, 63.20, 5),
("Jinx", 630, 245, 57.00, 4);

-- Mostra os personagens cujo o dano é maior que 60
SELECT * FROM tb_personagens WHERE dano > 60;

-- Mostra os personagens cuja a vida está entre o intervalo 630 e 650
SELECT * FROM tb_personagens WHERE vida > 630 AND vida < 650;

-- Mostra os personagens cujo o nome contém a letra C, em qualquer posição
SELECT * FROM tb_personagens WHERE nome_personagem LIKE "%c%";

-- Mostra os dados nome, vida, mana, dano, classe e descrição da classe do personagem
SELECT nome_personagem, vida, mana, dano, tb_classes.nome_classe, tb_classes.descricao_classe
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classesid = tb_classes.id;

-- Mostra os dados nome, vida, mana, dano, classe e descrição da classe do personagem, filtrando para apenas Fighters
SELECT nome_personagem, vida, mana, dano, tb_classes.nome_classe, tb_classes.descricao_classe
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classesid = tb_classes.id
WHERE tb_personagens.classesid = 1;