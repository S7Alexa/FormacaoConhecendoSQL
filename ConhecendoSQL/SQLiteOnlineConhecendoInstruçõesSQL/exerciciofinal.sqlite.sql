-- TABLE
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE tabelacategorias (
  id_categoria INT PRIMARY KEY,
  nome_categoria VARCHAR (250),
  descricao_categoria TEXT
 );
CREATE TABLE 'tabelaclientes' ('id_cliente' INTEGER,'nome_do_cliente' TEXT,'data_de_cadastro' TEXT, endereço_cliente VARCHAR (250));
CREATE TABLE tabelaclientesnovo (
  id_cliente_novo INT PRIMARY key,
  nome_do_cliente_novo TEXT,
  informacoes_de_contato TEXT,
  endereço_cliente VARCHAR (250)
);
CREATE TABLE 'tabelafornecedores' ('ID' INTEGER,'Nome_do_Fornecedor' TEXT,'País_de_Origem' TEXT,'Informações_de_Contato' TEXT,'Data_de_Início' TEXT);
CREATE TABLE tabelafuncionarios (
  id_funcionario INT PRIMARY KEY,
  nome_funcionario TEXT,
  cargo_funcionario TEXT,
  departamento TEXT,
  data_de_contratacao DATE,
  salario_funcionario DECIMAL (10,2)
);
CREATE TABLE tabelaFuncionariosExercicio (
  id_funcionario INT PRIMARY KEY,
  nome_funcionario VARCHAR (100),
  departamento VARCHAR (100),
  salario FLOAT
);
CREATE TABLE 'tabelapedidos' ('ID' INTEGER,'Data_do_Pedido' TEXT,'Status' TEXT,'Total_do_Pedido' REAL,'Cliente' INTEGER,'Data_de_Envio_Estimada' TEXT);
CREATE TABLE tabelapedidosgold (
  id_gold INT PRIMARY KEY,
  data_do_pedido_gold TEXT,
  status_gold TEXT,
  total_do_pedido_gold REAL,
  cliente_gold INT,
  data_de_envio_estimada_gold TEXT,
  FOREIGN KEY (cliente_gold) REFERENCES tabelaclientesnovo(id_cliente_novo)
);
CREATE TABLE 'tabelaprodutos' ('id_produto' INTEGER,'nome_do_produto' TEXT,'preco_unitario' REAL);
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
CREATE TABLE tabelaProjetos (
  id_projeto INT PRIMARY KEY,
  nome_projeto VARCHAR(100),
  id_gerente INT,
  FOREIGN KEY (id_gerente) REFERENCES tabelaFuncionariosExercicio(id) ON DELETE CASCADE
);
CREATE TABLE 'tabelavendas' ('id_venda' INTEGER,'id_cliente' INTEGER,'id_produto' INTEGER,'quantidade_comprada' INTEGER,'data_da_venda' TEXT);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
