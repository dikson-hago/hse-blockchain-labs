const main = async () => {
    const [deployer] = await ethers.getSigners();
    console.log(`Address deploying the contract --> ${deployer.address}`);

    const tokenFactory = await ethers.getContractFactory("ComRev");
    const contract = await tokenFactory.deploy();
    await contract.deployed();

    console.log(`Token contract address --> ${contract.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });