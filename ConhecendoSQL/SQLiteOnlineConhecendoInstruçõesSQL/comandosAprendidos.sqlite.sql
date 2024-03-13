-- Selecionar os ids dos produtos vendidos
SELECT DISTINCT id_produto FROM tabelavendas;

-- Nome e data de cadastro dos clientes que se cadastraram antes de 2020
SELECT nome_do_cliente, data_de_cadastro from tabelaclientes 
WHERE data_de_cadastro < '2020-01-01';

-- Adiciona nova coluna de endereços
ALTER TABLE tabelaclientes ADD endereço_cliente VARCHAR (250); 

-- Cria nova tabela, com uma chave primária
CREATE TABLE tabelacategorias (
  id_categoria INT PRIMARY KEY,
  nome_categoria VARCHAR (250),
  descricao_categoria TEXT
 );
 
-- Criando uma nova tabela, com chaves estrangeiras
CREATE TABLE tabelaprodutosnovo (
  id_produto_novo INT PRIMARY KEY,
  nome_do_produto_novo VARCHAR (250),
  descricao TEXT,
  categoria INT,
  preco_de_compra DECIMAL (10,2),
  unidade VARCHAR (50),
  fornecedor INT,
  data_de_inclusao DATE,
  FOREIGN Key (categoria) REFERENCES tabelacategorias (id_categoria),
  FOREIGN KEY (fornecedor) REFERENCES tabelafornecedores (id)
);

CREATE TABLE tabelaclientesnovo (
  id_cliente_novo INT PRIMARY key,
  nome_do_cliente_novo TEXT,
  informacoes_de_contato TEXT,
  endereço_cliente VARCHAR (250)
);

-- Inserindo dados na nova tabela de clientes
INSERT INTO tabelaclientesnovo (
  id_cliente_novo,
  nome_do_cliente_novo,
  informacoes_de_contato,
  endereço_cliente
) VALUES ('1', 'Joana Souza', 'joanasouza@gmail.com', 'Rua das Palmeiras - 287');

-- Inserindo múltiplos dados
INSERT INTO tabelaclientesnovo (
  id_cliente_novo,
  nome_do_cliente_novo,
  informacoes_de_contato,
  endereço_cliente
) VALUES ('2', 'Laura Rodrigues', 'laurarodrigues@hotmail.com', 'Rua do Bosque - 234'),
('3', 'Juliana Martins', 'jumartins@gmail.com', 'Travessa da Esperança - 890'),
('4', 'Camila Almeida', 'camialmeida@outlook.com', 'Praça da Liberdade - 101');

-- Criando uma tabela para pedidos de clientes gold, ou seja, aqueles clientes com pedidos
-- maiores ou iguais à 400 reais

CREATE TABLE tabelapedidosgold (
  id_gold INT PRIMARY KEY,
  data_do_pedido_gold TEXT,
  status_gold TEXT,
  total_do_pedido_gold REAL,
  cliente_gold INT,
  data_de_envio_estimada_gold TEXT,
  FOREIGN KEY (cliente_gold) REFERENCES tabelaclientesnovo(id_cliente_novo)
);

-- Inserindo na tabela gold os dados de outra tabela, a de pedidos, com a condicional citadata

INSERT INTO tabelapedidosgold (id_gold, data_do_pedido_gold, status_gold, 
                               total_do_pedido_gold, cliente_gold, 
                               data_de_envio_estimada_gold) SELECT ID, data_do_pedido,
                                                                    status, total_do_pedido,
                                                                    cliente, 
                                                                    data_de_envio_estimada
FROM tabelapedidos WHERE total_do_pedido >= 400;

-- Criando tabela de funcionários e inserindo um funcionário

CREATE TABLE tabelafuncionarios (
  id_funcionario INT PRIMARY KEY,
  nome_funcionario TEXT,
  cargo_funcionario TEXT,
  departamento TEXT,
  data_de_contratacao DATE,
  salario_funcionario DECIMAL (10,2)
);

INSERT INTO tabelafuncionarios (id_funcionario, nome_funcionario, cargo_funcionario,
                                departamento, data_de_contratacao, salario_funcionario)
VALUES ('32', 'João Silva', 'Desenvolvedor de Software', 'TI', '2023-10-24', '6000.00');

-- Ações de seleção com filtros diversos

SELECT * FROM tabelapedidos WHERE total_do_pedido >= 200;

SELECT * FROM tabelapedidos WHERE total_do_pedido >= 200 AND Status = 'Pendente';

SELECT * FROM tabelapedidos WHERE status = 'Pendente' OR status = 'Processando';

SELECT * FROM tabelaprodutosnovo WHERE preco_de_compra BETWEEN 200 AND 600 
ORDER BY nome_do_produto_novo;

SELECT informacoes_de_contato AS email_cliente FROM tabelaclientesnovo;

-- Atualizando dados de uma tabela

UPDATE tabelapedidos SET status = 'Enviado' WHERE status = 'Processando';

UPDATE tabelaclientesnovo SET informacoes_de_contato = 'joanasouza@hotmail.com'
WHERE id_cliente_novo = '1'; -- o email anterior era @gmail.com

-- Deletando dados de uma tabela

DELETE from tabelafornecedores WHERE país_de_origem = 'França';

DELETE FROM tabelaclientesnovo WHERE id_cliente_novo > 28; -- haviam 30 clientes

SELECT * from tabelaclientesnovo;