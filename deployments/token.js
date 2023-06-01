const hre = require('hardhat')
const ethers = hre.ethers
const ContractArtifact = require('../artifacts/contracts/Token.sol/Token.json')

async function main() {
    const [signer] = await ethers.getSigners()
    const contractAddr = '0xc3e53F4d16Ae77Db1c982e75a937B9f60FE63690'

    const contractInstance = new ethers.Contract(
        contractAddr,
        ContractArtifact.abi,
        signer
    )

    const number = ethers.utils.parseEther("10")
    await contractInstance.addStructure(number, "test", false, {gasLimit: 100})
    console.log("add structure")
    await contractInstance.deleteStructure({gasLimit: 100})
    console.log("delete structure")

    console.log("start filter")
    const filter = {
        gasLimit: 10,
        address: '0xc3e53F4d16Ae77Db1c982e75a937B9f60FE63690',
        topics: ['0x584d5f20f540ffb3bd3fe29955568b7e1f429a7a4652ab2763ed5bccfc7054ca']
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