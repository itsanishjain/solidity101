const { utils, pro } = require('ethers')
const { ethers } = require('hardhat');


const addresses = ['anishjain.eth',
    '0x1B689089a0ef9a814903E8def331151ADf7F2E73', '0xc77327F1851255b9f4DA527CEDB91C54499123ef', '0x0038e447fC90E50290E41fDC18fB0900fedFfF27']

const main = async () => {
    var address = await provider.resolveName(addresses[0]);

    console.log(address)

}



console.log(utils.parseEther("10"))

