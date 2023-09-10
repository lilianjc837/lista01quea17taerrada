use aula_db_exemplos;

-- 1
select titulo from livros;

--2
select nome from autores where nascimento < '1900-01-01';

--3
select livros.titulo, autores.nome
from livros 
inner join autores on livros.autor_id = autores.id
where autores.nome = 'J.K. Rowling';

--4
select alunos.nome, matriculas.curso
from alunos
inner join matriculas on alunos.id = matriculas.aluno_id
where matriculas.curso = 'Engenharia de Software';

--5
select produto, SUM(receita) as total_receita
from vendas
group by produto;

--6
select autores.nome as autor, COUNT(livros.id) as numero_de_livros
from autores
left join livros on autores.id = livros.autor_id
group by autores.id
order by autores.id;

--7
select curso, COUNT(aluno_id) as numero_de_alunos
from matriculas
group by curso
order by curso;

--8
select produto, AVG(receita) as media_de_receita
from vendas
group by produto
order by produto;

--9
select produto, SUM(receita) as receita_total
from vendas
group by produto
having SUM(receita) > '10.000'
order by produto;

-- 10
select autores.nome as autor, COUNT(livros.id) as numero_de_livros
from autores
left join livros on autores.id = livros.autor_id
group by autores.id
having COUNT(livros.id) > '2';

--11
select livros.titulo as livro, autores.nome as autor
from livros
join autores on livros.autor_id = autores.id
order by autor, livro;

--12
select alunos.nome as aluno, matriculas.curso
from alunos
join matriculas on alunos.id = matriculas.aluno_id
order by aluno, curso;

--13
select autores.nome as autor, livros.titulo as livro
from autores
left join livros on autores.id = livros.autor_id
order by autor, livro;

--14
select alunos.nome as aluno, matriculas.curso
from matriculas
right join alunos on matriculas.aluno_id = alunos.id
order by curso, aluno;

--12 mayck me perdoa, eu pulei o ex. 12, to fazendo commit de novo pra ficar certinho, aí vai ficar dois ex. 12, foi mal
select alunos.nome as aluno, matriculas.curso
from alunos
join matriculas on alunos.id = matriculas.aluno_id
order by aluno, curso;

--15
select alunos.nome as aluno, matriculas.curso
from matriculas
inner join alunos on matriculas.aluno_id = alunos.id
order by aluno, curso;

--16
select nome
from autores
where id = (
    select autor_id
    from livros
    group by autor_id
    order by COUNT(*) desc
    limit 1
);

--17
select produto, min(receita) as menor_receita
from vendas
group by produto
order by menor_receita
limit 1;

--19
select alunos.nome as aluno, COUNT(matriculas.id) as numero_de_matriculas
from alunos
left join matriculas on alunos.id = matriculas.aluno_id
group by alunos.id
order by aluno;

--20
select produto, COUNT(id) as quantidade_de_transacoes
from vendas
group by produto
order by quantidade_de_transacoes desc
limit 1;