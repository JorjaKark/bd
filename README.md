https://docs.google.com/document/d/1OgnnDmyLNG7FQ9gr-XBLzAGjcnD0WsJRTyWWHm-5I_I/edit?usp=sharing

RESUMO DAS ALTERAÇÔES DO CRREATE ! PRA O 2:
1. Validação de Campos
   Sugerido: Email: ACHECK (email LIKE '%_@__%.__%' AND email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$')
            Telefone: CHECK (length(telefone) = 9 AND telefone REGEXP '^(9[1236][0-9]{7})$')
  PROBLEMA : Está errado porque o Sqlite nao aceita o REGEXP.
   Por isso fizemos:
   CHECK (LENGTH(nif) = 9 AND nif GLOB '[0-9]*')
  CHECK (LENGTH(telefone) = 9 AND telefone GLOB '[0-9]*')
  (meti o glob que signfica so aceitar digitos, mas posso tirar)

3. Otimizações de Consulta
   Sugerido : Evitar SELECT *: Em vez de selecionar todas as colunas, foi sugerido selecionar apenas as necessárias: SELECT idItem, nome, precoVenda FROM Item;
  MAS ONDE È QUE EU USEI O RAIO DO SELECT * ?????? nao sei... mas acho estranho a AI ter sugerido uma cena que nao existia...

4. Campos Opcionais/Nulos
   4.1 SUGERIDO : -- Definir valores padrão
ALTER TABLE Item
MODIFY categoria TEXT DEFAULT 'outro';
 
  PROBLEMA : Não existe o metodo Modify no Sqlite
  O que fizemos:
  ALTER TABLE Item
ALTER COLUMN categoria SET DEFAULT 'Não Especificado';
ALTER COLUMN material SET DEFAULT 'Não Especificado';

  4.2 SUGERIDO: CREATE TABLE Item (
     categoria TEXT CHECK (
          categoria IN ('eletrónica', 'joia', 'arte', 'outro') OR
          categoria IS NULL
     )
);
O que fizemos:
    categoria TEXT NOT NULL CHECK (
        categoria IN ('Joias e Acessórios', 'Arte', 'Instrumentos Musicais',
        'Colecionáveis e Antiguidades',
        'Louça e Cerâmica',
        'Tecnologia e Informática',
        'Desportos e Lazer', 'Outros')
    ),
    
