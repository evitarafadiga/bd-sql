CREATE DATABASE dbtimes;
GO
USE dbtimes

CREATE TABLE times (
codigo_time		INT				NOT NULL,
nome_time		VARCHAR(200)	NOT NULL,
cidade			VARCHAR(200)	NOT NULL,
estadio			VARCHAR(200)	NOT NULL,
PRIMARY KEY (codigo_time));

CREATE TABLE grupos (
id					INT					NOT NULL,
letra				VARCHAR(1)			NOT NULL,
codigo_time_grupo	INT					NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (codigo_time_grupo) REFERENCES times(codigo_time)
);

CREATE TABLE jogos (
data_hora			DATE		NOT NULL,
codigo_timea		INT			NOT NULL,
codigo_timeb		INT			NOT NULL,
gols_timea			INT			NOT NULL,
gols_timeb			INT			NOT NULL,
PRIMARY KEY (data_hora, codigo_timea, codigo_timeb),
FOREIGN KEY (codigo_timea) REFERENCES times(codigo_time),
FOREIGN KEy (codigo_timeb) REFERENCES times(codigo_time)
);

