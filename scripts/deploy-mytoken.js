
// Hardhat Runtime Environment
const hre = require("hardhat");

async function main() {
    const mytoken = await hre.ethers.getContractFactory("MyToken");
    
    const deployed_mytoken = await mytoken.deploy();

    await deployed_mytoken.deployed();

    console.log("Mytoken contract address:", deployed_mytoken.address);
}

main().then(() => process.exit(0))
      .catch((error) => {
        console.log("error",error);
        process.exit(1);
})