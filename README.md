## Scripts

### create migration
- ```npx supabase migration new [migration name]```

### push migration
- ```npx supabase db push``` - push all migration to remote

### create functions
- ```npx supabase functions new [function name]``` - create new edge function

### deploy functions
- ```npx supabase functions deploy``` - deploy all
- ```npx supabase functions deploy [function name]``` - deploy specific
- ```npx supabase functions deploy [function name] --project-ref rnblvinssqhsuipotcsl``` - deploy to specifix project
