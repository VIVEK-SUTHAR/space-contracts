import { ethers } from "hardhat";
import verifyContract from "./verify";

async function main() {
  const campaignfactory = await ethers.deployContract("CampaignFactory");

  const deployedContract = await campaignfactory.waitForDeployment();

  console.log(`Campaign Factory deployed to ${deployedContract.target}`);
  console.log(`Verifying Contract...`);
  console.log(`This can take approx ~2 to 5 mins as the contracts is deployed and being propagated for automatic verification`);

  await sleep(180000);

  await verifyContract(deployedContract.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

function sleep(ms: number) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}
