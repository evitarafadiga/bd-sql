USE Hospital
GO
SELECT * FROM PACIENTES
SELECT * FROM MEDICO
SELECT * FROM PRONTUARIO

SELECT p.nome, p.rua, p.n, p.bairro
FROM PACIENTES p INNER JOIN PRONTUARIO pr
ON pr.cpf_paciente = p.cpf
INNER JOIN MEDICO m
ON m.codigo = pr.codigo_medico
WHERE m.especialidade LIKE '%Geriatra%'

SELECT m.nome, m.especialidade
FROM MEDICO m
WHERE m.nome LIKE '%Carolina%'

SELECT pr.medicamento, pr.diagnostico
FROM PRONTUARIO pr
WHERE pr.diagnostico LIKE '%Reumatismo%'


SELECT p.nome, p.cpf
FROM PACIENTES AS p
WHERE p.cpf LIKE '%35%'

