create type bookings_status as enum (
  'pending',
  'confirmed',
  'rejected',
  'cancelled'
);

create table public.bookings (
	id int8 generated by default as identity primary key,
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now(),
    venue_id int8 references public.venues not null,
    user_id uuid references public.users not null,
	description text,
    "from" timestamp with time zone not null,
    "to" timestamp with time zone not null,
    status bookings_status default 'pending',
    rejection_reason text
);

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table public.bookings
  enable row level security;

create policy "bookings are viewable by everyone" on public.bookings
  for select using (true); -- maybe move to edge function as we don't need to show all data to everyone