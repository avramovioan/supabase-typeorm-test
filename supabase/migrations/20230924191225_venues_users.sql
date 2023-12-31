create type venues_users_role as enum (
  'owner',
  'manager',
  'employee'
);

-- Create a table for public users
create table public.venues_users (
	user_id uuid references public.users not null,
    venue_id int8 references public.venues not null,
    primary key (user_id, venue_id),
	id int8 generated by default as identity unique,
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now(),
    role venues_users_role not null
);

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table public.venues_users
  enable row level security;

create policy "venues_users are viewable by admin or owner" on public.venues_users
  for select using (true); -- TODO