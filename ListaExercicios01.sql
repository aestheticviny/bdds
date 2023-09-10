SELECT titulo FROM livros;

SELECT nome FROM autores WHERE YEAR(nascimento) < 1900;

SELECT livros.titulo
FROM livros
INNER JOIN autores ON livros.autor_id = autores.id
WHERE autores.nome = 'J.K. Rowling';

SELECT alunos.nome
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id
WHERE matriculas.curso = 'Engenharia de Software';

SELECT produto, SUM(receita) AS receita_total
FROM vendas
GROUP BY produto;

SELECT autores.nome, COUNT(*) AS total_livros
FROM autores
INNER JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome;

SELECT curso, COUNT(*) AS total_alunos
FROM matriculas
GROUP BY curso;

SELECT produto, AVG(receita) AS media_receita
FROM vendas
GROUP BY produto;

SELECT produto
FROM vendas
GROUP BY produto
HAVING SUM(receita) > 10000;

SELECT autores.nome
FROM autores
INNER JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome
HAVING COUNT(*) > 2;

SELECT livros.titulo, autores.nome AS autor
FROM livros
INNER JOIN autores ON livros.autor_id = autores.id;

SELECT alunos.nome, matriculas.curso
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id;

SELECT autores.nome, IFNULL(livros.titulo, 'Nenhum livro publicado') AS livro
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id;

SELECT alunos.nome, IFNULL(matriculas.curso, 'Nenhum aluno matriculado') AS curso
FROM matriculas
RIGHT JOIN alunos ON matriculas.aluno_id = alunos.id;

SELECT alunos.nome, matriculas.curso
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id;

SELECT autores.nome
FROM autores
INNER JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT produto
FROM vendas
GROUP BY produto
ORDER BY SUM(receita)
LIMIT 1;

SELECT autores.nome, SUM(20 * COUNT(livros.id)) AS receita_total
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome;

SELECT alunos.nome, COUNT(matriculas.id) AS total_matriculas
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.nome;

SELECT produto
FROM vendas
GROUP BY produto
ORDER BY COUNT(*) DESC
LIMIT 1;
