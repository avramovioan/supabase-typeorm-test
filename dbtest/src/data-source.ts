import "reflect-metadata";
import { DataSource } from "typeorm";

export const AppDataSource = new DataSource({
  type: "postgres",
  host: "db.rnblvinssqhsuipotcsl.supabase.co",
  port: 5432,
  database: "postgres",
  username: "postgres",
  password: "",
  synchronize: false,
  logging: false,
  entities: ["src/entity/*.entity.ts"],
  migrations: ["src/migration/*.ts"],
  subscribers: [],
});
