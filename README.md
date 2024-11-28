https://docs.google.com/document/d/1OgnnDmyLNG7FQ9gr-XBLzAGjcnD0WsJRTyWWHm-5I_I/edit?usp=sharing

## RESUMO DAS ALTERAÇÕES DO CREATE 1 PARA O 2:

### 1. **Validação de Campos**
   - **Sugerido**: 
     - **Email**: 
       ```sql
       CHECK (email LIKE '%_@__%.__%' AND email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$')
       ```
     - **Telefone**: 
       ```sql
       CHECK (length(telefone) = 9 AND telefone REGEXP '^(9[1236][0-9]{7})$')
       ```
   - **PROBLEMA**: Está errado porque o SQLite não aceita o REGEXP.
   - **O que fizemos**:
     ```sql
     CHECK (LENGTH(nif) = 9 AND nif GLOB '[0-9]*')
     CHECK (LENGTH(telefone) = 9 AND telefone GLOB '[0-9]*')
     ```
     (meti o GLOB que significa só aceitar dígitos, mas posso tirar)

### 2. **Otimizações de Consulta**
   - **Sugerido**: Evitar `SELECT *`: Em vez de selecionar todas as colunas, foi sugerido selecionar apenas as necessárias:
     ```sql
     SELECT idItem, nome, precoVenda FROM Item;
     ```
   - **MAS ONDE É QUE EU USEI O RAIO DO SELECT * ??????** Não sei... mas acho estranho a IA ter sugerido uma cena que não existia...

### 3. **Campos Opcionais/Nulos**
   3.1 **SUGERIDO**: 
   - Definir valores padrão:
     ```sql
     ALTER TABLE Item
     MODIFY categoria TEXT DEFAULT 'outro';
     ```
   - **PROBLEMA**: Não existe o método `Modify` no SQLite.
   - **O que fizemos**:
     ```sql
     ALTER TABLE Item
     ALTER COLUMN categoria SET DEFAULT 'Não Especificado';
     ALTER COLUMN material SET DEFAULT 'Não Especificado';
     ```

   3.2 **SUGERIDO**:
   - Validação de valores para `categoria`:
     ```sql
     CREATE TABLE Item (
         categoria TEXT CHECK (
             categoria IN ('eletrónica', 'joia', 'arte', 'outro') OR
             categoria IS NULL
         )
     );
     ```
   - **O que fizemos**:
     ```sql
     categoria TEXT NOT NULL CHECK (
         categoria IN ('Joias e Acessórios', 'Arte', 'Instrumentos Musicais',
         'Colecionáveis e Antiguidades',
         'Louça e Cerâmica',
         'Tecnologia e Informática',
         'Desportos e Lazer', 'Outros')
     ),
     ```
