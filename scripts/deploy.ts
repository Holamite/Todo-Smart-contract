import { ethers } from "hardhat";

async function main() {
  const lockedAmount = ethers.parseEther("0.001");

  const Todo = await ethers.deployContract("Todo");

  await Todo.waitForDeployment();

  console.log(`Todo successfully deployed to ${Todo.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
