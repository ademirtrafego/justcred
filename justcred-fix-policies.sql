-- Cole no SQL Editor do Supabase e clique RUN
-- Isso corrige as políticas que podem estar bloqueando o insert

-- Desabilita RLS temporariamente para testar (opcional)
-- ALTER TABLE solicitacoes DISABLE ROW LEVEL SECURITY;

-- Recria as políticas corretamente
DROP POLICY IF EXISTS "pub_insert_solicitacoes" ON solicitacoes;
DROP POLICY IF EXISTS "pub_select_solicitacoes" ON solicitacoes;
DROP POLICY IF EXISTS "pub_update_solicitacoes" ON solicitacoes;

-- Permite tudo sem restrição (site público)
CREATE POLICY "allow_all_insert" ON solicitacoes FOR INSERT WITH CHECK (true);
CREATE POLICY "allow_all_select" ON solicitacoes FOR SELECT USING (true);
CREATE POLICY "allow_all_update" ON solicitacoes FOR UPDATE USING (true);

-- Mesma coisa para usuários
DROP POLICY IF EXISTS "pub_insert_usuarios" ON usuarios;
DROP POLICY IF EXISTS "pub_select_usuarios" ON usuarios;
DROP POLICY IF EXISTS "pub_update_usuarios" ON usuarios;

CREATE POLICY "allow_all_insert_usr" ON usuarios FOR INSERT WITH CHECK (true);
CREATE POLICY "allow_all_select_usr" ON usuarios FOR SELECT USING (true);
CREATE POLICY "allow_all_update_usr" ON usuarios FOR UPDATE USING (true);
