-- ══════════════════════════════════════
-- JUSTCRED — Tabelas Supabase
-- Cole no SQL Editor do Supabase e clique em RUN
-- ══════════════════════════════════════

-- 1. Tabela de usuários
CREATE TABLE IF NOT EXISTS usuarios (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  nome TEXT NOT NULL,
  cpf TEXT UNIQUE NOT NULL,
  email TEXT UNIQUE NOT NULL,
  whatsapp TEXT,
  senha TEXT NOT NULL,
  chave_pix TEXT,
  criado_em TIMESTAMPTZ DEFAULT now()
);

-- 2. Tabela de solicitações de crédito
CREATE TABLE IF NOT EXISTS solicitacoes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  usuario_id UUID REFERENCES usuarios(id),
  nome TEXT,
  cpf TEXT,
  email TEXT,
  whatsapp TEXT,
  valor_solicitado NUMERIC(10,2),
  chave_pix_recebimento TEXT,
  parcelas TEXT,
  vencimento DATE,
  status TEXT DEFAULT 'pendente',
  criado_em TIMESTAMPTZ DEFAULT now()
);

-- 3. Política de acesso público (necessário para o site estático)
ALTER TABLE usuarios    ENABLE ROW LEVEL SECURITY;
ALTER TABLE solicitacoes ENABLE ROW LEVEL SECURITY;

-- Permite inserir (cadastro)
CREATE POLICY "permitir_insert_usuarios" ON usuarios
  FOR INSERT WITH CHECK (true);

-- Permite ler o próprio usuário (login por CPF/email)
CREATE POLICY "permitir_select_usuarios" ON usuarios
  FOR SELECT USING (true);

-- Permite inserir solicitação
CREATE POLICY "permitir_insert_solicitacoes" ON solicitacoes
  FOR INSERT WITH CHECK (true);

-- Permite ler solicitações
CREATE POLICY "permitir_select_solicitacoes" ON solicitacoes
  FOR SELECT USING (true);
