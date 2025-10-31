-- ===============================================================
-- MÃO NA MASSA: GERENCIAMENTO ESCOLAR
-- ===============================================================
-- Contexto:
-- Este exercício continua o desenvolvimento do banco de dados escolar,
-- utilizando consultas complexas, subconsultas, JOINs e VIEWs.
-- ===============================================================


-- ===============================================================
-- Consulta 1: Buscar o nome do professor e a turma que ele é orientador
-- ===============================================================
SELECT 
    P.Nome_Professor, 
    T.Nome_Turma
FROM Professores P
JOIN Turmas T ON P.ID_Professor = T.ID_Professor_Orientador;


-- ===============================================================
-- Consulta 2: Retornar o nome e a nota do aluno que possui a melhor nota na disciplina de Matemática
-- ===============================================================
SELECT 
    A.Nome_Aluno, 
    MAX(N.Nota) AS Maior_Nota
FROM Alunos A
JOIN Notas N ON A.ID_Aluno = N.ID_Aluno
JOIN Disciplinas D ON D.ID_Disciplina = N.ID_Disciplina
WHERE D.Nome_Disciplina = 'Matemática';


-- ===============================================================
-- Consulta 3: Identificar o total de alunos por turma
-- ===============================================================
SELECT 
    T.Nome_Turma, 
    COUNT(TA.ID_Aluno) AS Total_Alunos_Turma
FROM Turmas T
JOIN Turma_Alunos TA ON T.ID_Turma = TA.ID_Turma
GROUP BY T.Nome_Turma;


-- ===============================================================
-- Consulta 4: Listar os alunos e as disciplinas em que estão matriculados
-- ===============================================================
SELECT 
    A.Nome_Aluno, 
    D.Nome_Disciplina
FROM Alunos A
JOIN Turma_Alunos TA ON A.ID_Aluno = TA.ID_Aluno
JOIN Turma_Disciplinas TD ON TA.ID_Turma = TD.ID_Turma
JOIN Disciplinas D ON D.ID_Disciplina = TD.ID_Disciplina;


-- ===============================================================
-- Consulta 5: Criar uma VIEW que apresenta o nome, a disciplina e a nota dos alunos
-- ===============================================================
CREATE VIEW AlunosDisciplinaNota AS
SELECT 
    A.Nome_Aluno, 
    D.Nome_Disciplina, 
    N.Nota
FROM Alunos A
JOIN Notas N ON A.ID_Aluno = N.ID_Aluno
JOIN Disciplinas D ON N.ID_Disciplina = D.ID_Disciplina;
