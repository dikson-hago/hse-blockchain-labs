const hre = require('hardhat')
const ethers = hre.ethers
const ContractArtifact = require('../artifacts/contracts/Token.sol/Token.json')

async function main() {
    const [signer] = await ethers.getSigners()
    const contractAddr = '0x5fbdb2315678afecb367f032d93f642f64180aa3'

    const contractInstance = new ethers.Contract(
        contractAddr,
        ContractArtifact.abi,
        signer
    )

    const number = ethers.utils.parseEther("100")
    await contractInstance.addStructure(number, "test", false)
    console.log("add structure")
    await contractInstance.deleteStructure()
    console.log("delete structure")
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });