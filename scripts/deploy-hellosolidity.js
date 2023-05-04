
// Hardhat Runtime Environment
const hre = require("hardhat");

async function main() {
    const greeter = await hre.ethers.getContractFactory("HelloSolidity");
    
    const deployed_greeter = await greeter.deploy("Hello,Hardhat!");

    await deployed_greeter.deployed();

    console.log("Hello solidity contract address:",deployed_greeter.address);
}

main().then(() => process.exit(0))
      .catch((error) => {
        console.log("error",error);
        process.exit(1);
})