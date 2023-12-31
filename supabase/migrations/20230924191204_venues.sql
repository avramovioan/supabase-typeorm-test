create table public.venues (
	id int8 generated by default as identity primary key,
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now(),
	name text not null,
	geolocation geography(POINT) not null, -- https://supabase.com/docs/guides/database/extensions/postgis
    latitude decimal not null,
    longitude decimal not null,
    address text not null,
    postcode text not null,
    city text not null,
    country text not null,
    description text,
    phones text[],
    emails text[]
);

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table public.venues
  enable row level security;

create policy "venues are viewable by everyone" on public.venues
  for select using (true);

create policy "venues are created by admins" on storage.venues
  for insert to authenticated with check (true); -- TODO:

create policy "venues are updated by admins" on public.venues
  for update using (true); -- TODO: