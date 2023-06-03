const hre = require('hardhat')
const ethers = hre.ethers
const ContractArtifact = require('../artifacts/contracts/Token.sol/Token.json')

async function main() {
    const [signer] = await ethers.getSigners()
    const contractAddr = '0x85B78cF24C0D540AF9a87931C939D2586Ccaa172'

    const contractInstance = new ethers.Contract(
        contractAddr,
        ContractArtifact.abi,
        signer
    )

    const number = ethers.utils.parseEther("10")
    await contractInstance.addStructure(number, "test", false, {gasLimit: 900000})
    console.log("add structure")
    await contractInstance.deleteStructure({gasLimit: 900000})
    console.log("delete structure")

    console.log("start filter")
    const filter = {
        gasLimit: 900000,
        address: '0x85B78cF24C0D540AF9a87931C939D2586Ccaa172',
    }

    await contractInstance.queryFilter(filter).then((events) => {
        console.log(events)
    });
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });