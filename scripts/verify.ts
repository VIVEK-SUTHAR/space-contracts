import { exec } from "child_process";
import { Addressable } from "ethers";

async function verifyContract(address: string | Addressable) {
  const command = `npx hardhat verify --network mumbai ${address}`;

  exec(command, (error, stdout, stderr) => {
    if (error) {
      console.error(`Error: ${error}`);
      return;
    }
    console.log("Contract Verfied...");
  });
}
export default verifyContract;
