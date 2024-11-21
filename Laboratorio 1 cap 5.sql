

-- **** Laborat�rio 1 **** 

--A � Utilizando o banco PEDIDOS responda:

--1. Retornar os dois �ltimos d�gitos do CNPJ do fornecedor. lembrando que a coluna 

--CPNJ est� com 20 caracteres logo, � necess�rio tirar os espa�os em branco � 
--direita
 SELECT NOME
      ,CNPJ
      ,RIGHT(RTRIM(CNPJ),2) AS CNPJ_DIGITO
 FROM TB_FORNECEDOR

--2. Retornar os n�meros da Matriz ou Filial da coluna CNPJ(0001) do fornecedor. 
SELECT NOME
      ,CNPJ
      ,SUBSTRING(CNPJ,9,4) AS MATRIZ_FILIAL_CNPJ
 FROM TB_FORNECEDOR

--3. Fazer uma query para retornar as colunas NOME e SALARIO da tabela TB_EMPREGADO, sendo que a coluna

--SALARIO deve ser exibida com ZERO quando NULL. 
SELECT NOME
     , ISNULL(SALARIO,0) AS SALARIO
 FROM TB_EMPREGADO
 ORDER BY SALARIO

--4. Retornar as colunas NUM_PEDIDO, NOME DO VENDEDOR,VLR_ TOTAL e SITUA��O DO PEDIDO
--SITUACAO deve ser apresentada: Quando E ent�o Encerrado, Quando C ent�o Cancelado
--Quando P ent�o Pendente
 SELECT NUM_PEDIDO
      ,NOME AS NOME_VENDEDOR
      ,VLR_TOTAL 
      ,IIF(SITUACAO=�E�,�ENCERRADO�
      ,IIF(SITUACAO=�C�, �CANCELADO�,�PENDENTE�)) AS SITUACAO 
	  FROM TB_PEDIDO AS PED
 INNER JOIN TB_VENDEDOR AS VEND
 ON PED.CODVEN=VEND.CODVEN

--OU 
SELECT NUM_PEDIDO
      ,NOME AS NOME_VENDEDOR
   ,VLR_TOTAL 
   ,CASE SITUACAO
       WHEN �E� THEN �ENCERRADO�
    WHEN �C� THEN �CANCELADO�
    WHEN �P� THEN �PENDENTE�
    END AS SITUACAO
 FROM TB_PEDIDO AS PED
 INNER JOIN TB_VENDEDOR AS VEND
 ON PED.CODVEN=VEND.CODVEN

--5. Fazer uma query para retornar o valor do item (QUANTIDADE*PR_UNITARIO) da 
--tabela TB_ITENSPEDIDO. O valor do item deve ser arredondado com 2 casas decimais 
--e apresentado somente com 2 casas decimais. A query deve retornar tamb�m as
--colunas NUM_PEDIDO, NUM_ITEM, ID_PRODUTO e DESCRICAO da tabela TB_PRODUTO.
 SELECT ITEM.NUM_PEDIDO
      ,ITEM.NUM_ITEM
      ,ITEM.ID_PRODUTO
      ,PROD.DESCRICAO
      ,FORMAT(ROUND(ITEM.QUANTIDADE*ITEM.PR_
 UNITARIO,2),�#########0.00�) AS PRECO
 FROM TB_ITENSPEDIDO AS ITEM
 INNER JOIN TB_PRODUTO AS PROD
 ON ITEM.ID_PRODUTO=PROD.ID_PRODUTO

--6. Na tabela TB_EMPREGADO, retornar somente o primeiro nome da coluna NOME.
 SELECT NOME
      ,SUBSTRING(NOME,1,CHARINDEX(� �,NOME)) AS PRIMEIRO_NOME
 FROM TB_EMPREGADO

 
--7. Retornar as colunas NOME e ESTADO da tabela TB_FORNECEDOR

--ESTADO deve ser apresentado por extenso como exibido a seguir

--ES-ESPIRITO_SANTO

--MG-MINAS GERAIS

--PE-PERNAMBUCO

--PR-PARAN�

--RJ-RIO DE JANEIRO

--RS-RIO GRANDE DO SUL

--SC-SANTA CATARINA

--SP-S�O PAULO
 SELECT NOME
      ,CASE ESTADO
         WHEN �ES� THEN �ESPIRITO_SANTO�
   WHEN �MG� THEN �MINAS GERAIS�
   WHEN �PE� THEN �PERNAMBUCO�
   WHEN �PR� THEN �PARAN��
   WHEN �RJ� THEN �RIO DE JANEIRO�
   WHEN �RS� THEN �RIO GRANDE DO SUL�
   WHEN �SC� THEN �SANTA CATARINA�
   WHEN �SP� THEN �S�O PAULO�
   ELSE �NAO SE APLICA�
       END AS ESTADO
 FROM TB_FORNECEDOR
 ORDER BY ESTADO
