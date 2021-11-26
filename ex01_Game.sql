create database db_generation_game_online;

use db_generation_game_online;

create table tb_classe(

	id bigint unique auto_increment,
    nomeClasse varchar(20) not null,
    armaMaoDir varchar(50) not null,
    armaMaoEsq varchar(50) not null,
    
    primary key (id)
);

insert into tb_classe (nomeClasse,armaMaoDir,armaMaoEsq) values ("Cavaleiro", "Espada","Escudo");
insert into tb_classe (nomeClasse,armaMaoDir,armaMaoEsq) values ("Guerreiro", "Machado de mão","Escudo");
insert into tb_classe (nomeClasse,armaMaoDir,armaMaoEsq) values ("Feiticeiro", "Cajado","Livro de Magias");
insert into tb_classe (nomeClasse,armaMaoDir,armaMaoEsq) values ("Clérigo", "Maça","Sino");
insert into tb_classe (nomeClasse,armaMaoDir,armaMaoEsq) values ("Piromante", "Foice","Luva de Fogo");
insert into tb_classe (nomeClasse,armaMaoDir,armaMaoEsq) values ("Arauto", "Alabarda","Escudo de torre");
insert into tb_classe (nomeClasse,armaMaoDir,armaMaoEsq) values ("Ladrão", "Adaga","Shotel");

select*from tb_classe;


create table tb_personagem(
	
    id bigint unique auto_increment,
    nomePersonagem varchar(40) not null,
    armadura varchar(40) not null,
    itens varchar(40) not null,
    ataque int,
    defesa int,
    classe_id bigint,
    primary key (id),
    FOREIGN KEY (classe_id) REFERENCES tb_classe (id)
);

insert into tb_personagem (nomePersonagem,armadura,itens,ataque,defesa,classe_id) values ("Ximira","Armadura de couro","Poção de Cura",1500,1200,5);
insert into tb_personagem (nomePersonagem,armadura,itens,ataque,defesa,classe_id) values ("Solaire","Armadura do sol","Bomba Incendiária",3000,3000,1);
insert into tb_personagem (nomePersonagem,armadura,itens,ataque,defesa,classe_id) values ("Patolino - O Maga Implacável","Robe Negro","Poção de Mana",7000,1000,3);
insert into tb_personagem (nomePersonagem,armadura,itens,ataque,defesa,classe_id) values ("Cassius Clay","Armadura de Faaron","Poção Trovoada",4000,2000,2);
insert into tb_personagem (nomePersonagem,armadura,itens,ataque,defesa,classe_id) values ("Chícara de Ferro","Vestes da Igreaj","Sinal de Invocação",2000,3500,4);
insert into tb_personagem (nomePersonagem,armadura,itens,ataque,defesa,classe_id) values ("Patches","Armadura de couro","Pedra de Prisma",1000,3000,1);
insert into tb_personagem (nomePersonagem,armadura,itens,ataque,defesa,classe_id) values ("Veridiana","Armadura de correntes","Faca de aremesso",2500,1200,5);
insert into tb_personagem (nomePersonagem,armadura,itens,ataque) values ("Seu Jorge","Armadura de Draco","Benção Divina",1000);

-- Apresenta os dados do personagem que possui ataque maior que 2000
select nomePersonagem from tb_personagem
where ataque > 2000
order by nomePersonagem;

-- Apresentando os dados do personagem que possuem ataque igual a 2000
select nomePersonagem from tb_personagem
where ataque in (2000)
order by nomePersonagem;

-- Apresenta os personagens que possuem defesa entre 1000 e 2000
select nomePersonagem from tb_personagem
where defesa between 1000 and 2000
order by nomePersonagem;

-- Apresenta os personagens que possuem "c" em seu nome
select nomePersonagem from tb_personagem 
where nomePersonagem like "%c%";


-- INNER JOIN
select tb_classe.nomeClasse, tb_personagem.nomePersonagem, tb_personagem.armadura, tb_classe.armaMaoDir, tb_classe.armaMaoEsq
from tb_personagem inner join tb_classe
on tb_classe.id = tb_personagem.classe_id;

-- INNER JOIN para trazer os dados de uma classe específica
select tb_classe.nomeClasse, tb_personagem.nomePersonagem, tb_personagem.armadura, tb_classe.armaMaoDir, tb_classe.armaMaoEsq
from tb_personagem inner join tb_classe
on tb_classe.id = tb_personagem.classe_id
where tb_classe.nomeClasse = "Cavaleiro";