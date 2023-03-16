create table if not exists public.users_to_repos_votes
(
  id bigint not null generated by default as identity ( increment 1 start 1 minvalue 1 maxvalue 9223372036854775807 cache 1 ),
  user_id bigint not null references public.users (id) on delete cascade on update cascade,
  repo_id bigint not null references public.repos (id) on delete cascade on update cascade,
  created_at timestamp without time zone not null default now(),
  updated_at timestamp without time zone not null default now(),
  deleted_at timestamp without time zone default null,

  constraint votes_pkey primary key (id),
  constraint votes_hash unique (user_id, repo_id)
)

tablespace pg_default;
