# Awesome Project Build with TypeORM

Steps to run this project:

1. Run `npm i` command
2. Setup database settings inside `data-source.ts` file
3. Run `npm start` command

To generate migration based on entity:

```
npm run typeorm migration:generate -- --dataSource src/data-source.ts src/migration/init
```

To apply pending migrations:

```
npm run typeorm migration:run -- --dataSource src/data-source.ts
```
