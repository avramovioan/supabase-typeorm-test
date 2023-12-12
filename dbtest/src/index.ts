import { AppDataSource } from "./data-source";

AppDataSource.initialize()
  .then(async () => {
    console.log("Initialized data source...");
  })
  .catch((error) => console.log(error));
