-- Cole tudo isso no SQL Editor do Supabase e clique RUN

create table if not exists usuarios (
  id uuid default gen_random_uuid() primary key,
  nome text not null,
  cpf text unique not null,
  email text unique not null,
  whatsapp text,
  senha text not null,
  chave_pix text,
  criado_em timestamptz default now()
);

create table if not exists solicitacoes (
  id uuid default gen_random_uuid() primary key,
  usuario_id uuid,
  nome text,
  cpf text,
  email text,
  whatsapp text,
  valor_solicitado numeric(10,2),
  chave_pix_recebimento text,
  parcelas text,
  vencimento date,
  status text default 'pendente',
  criado_em timestamptz default now()
);

alter table usuarios enable row level security;
alter table solicitacoes enable row level security;

drop policy if exists "pub_insert_usuarios" on usuarios;
drop policy if exists "pub_select_usuarios" on usuarios;
drop policy if exists "pub_update_usuarios" on usuarios;
drop policy if exists "pub_insert_solicitacoes" on solicitacoes;
drop policy if exists "pub_select_solicitacoes" on solicitacoes;

create policy "pub_insert_usuarios"     on usuarios     for insert with check (true);
create policy "pub_select_usuarios"     on usuarios     for select using (true);
create policy "pub_update_usuarios"     on usuarios     for update using (true);
create policy "pub_insert_solicitacoes" on solicitacoes for insert with check (true);
create policy "pub_select_solicitacoes" on solicitacoes for select using (true);
