import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity({ name: "address_book" })
export class AddressBook {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @Column()
  address: string;

  @Column()
  postcode: string;

  @Column()
  city: string;

  @Column()
  country: string;
}
