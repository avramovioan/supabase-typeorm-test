import { MigrationInterface, QueryRunner } from "typeorm";

export class Init1702419705567 implements MigrationInterface {
    name = 'Init1702419705567'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "address_book" ("id" uuid NOT NULL DEFAULT uuid_generate_v4(), "address" character varying NOT NULL, "postcode" character varying NOT NULL, "city" character varying NOT NULL, "country" character varying NOT NULL, CONSTRAINT "PK_188a02dee277dd0f9e488fdf06f" PRIMARY KEY ("id"))`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP TABLE "address_book"`);
    }

}
