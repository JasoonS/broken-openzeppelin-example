// Load zos scripts and truffle wrapper function
const { scripts, ConfigManager } = require('@openzeppelin/cli');
const { add, push, create } = scripts;

async function deploy(options, accounts) {
  add({
    contractsData: [
      { name: 'ERC721Extended', alias: 'ERC721Patronage' },
    ]
  });

  await push(options);

  const patronageToken = await create({
    ...options,
    contractAlias: 'ERC721Patronage',
    methodName: 'setup',
    methodArgs: [
      "TestToken", "TT", accounts[0]
    ]
  });

  console.log('this should be TRUE:', await patronageToken.methods.isMinter(accounts[0]).call(options.txParams))
  console.log(await patronageToken.methods.mintWithTokenURI(accounts[0], 2346, "some message").send(options.txParams))
  console.log(await patronageToken.methods.mintWithTokenURI(steward.address, 1, "2").send(options.txParams))
}

module.exports = function (deployer, networkName, accounts) {
  // console.log('network', networkName)
  deployer.then(async () => {
    const { network, txParams } = await ConfigManager.initNetworkConfiguration({ network: networkName, from: accounts[0] })
    await deploy({ network, txParams }, accounts)
  })
}
