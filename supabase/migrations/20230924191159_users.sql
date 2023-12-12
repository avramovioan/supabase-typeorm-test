create type users_role as enum (
  'admin',
  'partner',
  'user'
);

-- Create a table for public users
create table public.users (
  id uuid references auth.users not null primary key,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now(),
  first_name text,
  last_name text,
  role users_role
--   constraint username_length check (char_length(username) >= 3)
);

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table public.users
  enable row level security;

create policy "users are viewable by everyone" on public.users
  for select using (true); -- TODO: maybe should be only self and admin 

create policy "users can insert their own profile" on public.users
  for insert with check (auth.uid() = id);

create policy "users can update own profile" on public.users
  for update using (auth.uid() = id);

-- This trigger automatically creates a profile entry when a new user signs up via Supabase Auth.
-- See https://supabase.com/docs/guides/auth/managing-user-data#using-triggers for more details.
create function public.handle_new_user()
returns trigger as $$
begin
  insert into public.users (id)
  values (new.id);
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- Set up Storage!
insert into storage.buckets (id, name)
  values ('avatars', 'avatars');

-- Set up access controls for storage.
-- See https://supabase.com/docs/guides/storage#policy-examples for more details.
create policy "Avatar images are publicly accessible." on storage.objects
  for select using (bucket_id = 'avatars');

create policy "Anyone can upload an avatar." on storage.objects
  for insert with check (bucket_id = 'avatars');

create policy "Anyone can update their own avatar." on storage.objects
  for update using (auth.uid() = owner) with check (bucket_id = 'avatars');

