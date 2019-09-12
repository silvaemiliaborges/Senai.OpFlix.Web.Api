create database T_OpFlix

use T_OpFlix

--DDL--

create table Tipos
(
	IdTipo	int primary key identity
	,Nome	varchar (255) not null unique
);

create table Plataformas
(
	IdPlataforma	int primary key identity
	,Nome			varchar (255) not null 
);

create table Generos
(
	IdGenero	int primary key identity 
	,Nome		varchar (255) not null unique
);

create table TipoUsuarios
(
	IdTipoUsuario	int primary key identity
	,Nome			varchar (255) not null unique
);

create table Usuarios
(
	IdUsuario			int primary key identity
	,Nome				varchar (255) not null 
	,Email				varchar (255) not null unique
	,Senha				varchar (255) not null
	,IdTipoUsuario		int foreign key references TipoUsuarios(IdTipoUsuario)
);

create table Lancamentos
(
	IdLancamento		int primary key identity
	,Nome				varchar (255) not null unique
	,Duracao_min		int not null
	,Classificacao		varchar (255) not null
	,DataLancamento		date not null
	,Sinopse			varchar (1000) not null
	,IdPlataforma		int foreign key references Plataformas(IdPlataforma)
	,IdGenero			int foreign key references Generos(IdGenero)
	,IdTipo				int foreign key references Tipos(IdTipo)
);

---DMl
insert into Tipos(Nome) 
values ('Filme'), ('S�rie');

select * from Tipos

insert into Plataformas(Nome)
values ('Cinema') , ('Prime Video') , ('Netflix');

select * from Plataformas

Insert into Generos(Nome)
values ('Filme musical') , ('Suspense') , ('Drama') , ('Anima��o');

select * from Generos

insert into TipoUsuarios(Nome)
values ('Administrador') , ('Cliente');

select * from TipoUsuarios

insert into Usuarios(Nome, Email, Senha, IdTipoUsuario)
values ('Erick' , 'erick@gmail.com' , '123456' , 1) 
		,('Cassiana' , 'cassiana@email.com' , '123456' , 1)
		,('Helena' , 'helena@email.com' , '123456' , 2)
		,('Roberto' , 'rob@email.com' , '3110' , 2);

select * from Usuarios

insert into Lancamentos(Nome, Duracao_min, Classificacao, DataLancamento, Sinopse, IdPlataforma, IdGenero, IdTipo)
values ('O Rei Le�o' , '118' , 'L' , '2019-07-18' , 'O Rei Le�o, da Disney, dirigido por Jon Favreau, retrata uma jornada pela savana africana, onde nasce o futuro rei da Pedra do Reino, Simba. O pequeno le�o que idolatra seu pai, o rei Mufasa, � fiel ao seu destino de assumir o reinado. Mas nem todos no reino pensam da mesma maneira. Scar, irm�o de Mufasa e ex-herdeiro do trono, tem seus pr�prios planos. A batalha pela Pedra do Reino � repleta de trai��o, eventos tr�gicos e drama, o que acaba resultando no ex�lio de Simba. Com a ajuda de dois novos e inusitados amigos, Simba ter� que crescer e voltar para recuperar o que � seu por direito' , 1 , 1 , 1)
		,('La Casa De Papel 3 temp' , '650' , '16' , '2019-07-19' , 'Oito habilidosos ladr�es se trancam na Casa da Moeda da Espanha com o ambicioso plano de realizar o maior roubo da hist�ria e levar com eles mais de 2 bilh�es de euros. Para isso, a gangue precisa lidar com as dezenas de pessoas que manteve como ref�m, al�m dos agentes da for�a de elite da pol�cia, que far�o de tudo para que a investida dos criminosos fracasse.' , 3 , 2 , 2)
		,('Deuses Americanos' , '620' , '18+' , '2017-04-30' , 'Shadow Moon � um ex-vigarista que serve como seguran�a e companheiro de viagem para o Sr. Wednesday, um homem fraudulento que �, na verdade, um dos velhos deuses, e est� na Terra em uma miss�o: reunir for�as para lutar contra as novas entidades.' , 2 , 3 , 2)
		,('Toy Story 4' , '100' , 'L' , '2019-06-20' , 'Woody sempre teve certeza sobre o seu lugar no mundo e que sua prioridade � cuidar de sua crian�a, seja Andy ou Bonnie. Mas quando Bonnie adiciona um relutante novo brinquedo chamado Garfinho ao seu quarto, uma aventura na estrada ao lado de velhos e novos amigos mostrar� a Woody qu�o grande o mundo pode ser para um brinquedo.' , 1 , 4 , 1);

select * from Lancamentos


---Dql

select Usuarios.Nome, TipoUsuarios.Nome
from Usuarios
join TipoUsuarios
on Usuarios.IdTipoUsuario = TipoUsuarios.IdTipoUsuario

select Lancamentos.Nome, Plataformas.Nome
from Lancamentos
join Plataformas
on Lancamentos.IdPlataforma = Plataformas.IdPlataforma

select Lancamentos.Nome, Generos.Nome
from Lancamentos
join Generos
on Lancamentos.IdGenero = Generos.IdGenero

select Lancamentos.Nome, Tipos.Nome
from Lancamentos
join Tipos
on Lancamentos.IdTipo = Tipos.IdTipo

create procedure FilmeData
as
select Nome, DataLancamento from Lancamentos
go

exec FilmeData