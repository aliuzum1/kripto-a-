const hre = require("hardhat");

async function main() {
  // Çıkartmak istediğimiz 5 farklı coin'in bilgileri
  const tokensToDeploy = [
    { name: "Askol Gold", symbol: "AGOLD", supply: 500000 },
    { name: "Askol Silver", symbol: "ASILV", supply: 1000000 },
    { name: "Askol USD", symbol: "AUSD", supply: 10000000 },
    { name: "Askol Euro", symbol: "AEUR", supply: 5000000 },
    { name: "Askol Utility", symbol: "AUT", supply: 2500000 }
  ];

  const [deployer] = await hre.ethers.getSigners();
  console.log("Coinler bu cüzdan adresi ile üretiliyor:", deployer.address);
  
  // Komisyonların aktarılacağı ana cüzdan (deployer adresi)
  const taxWallet = deployer.address;

  for (let i = 0; i < tokensToDeploy.length; i++) {
    const t = tokensToDeploy[i];
    console.log(`\n[${i + 1}/5] ${t.name} (${t.symbol}) ağına yükleniyor...`);

    const AskolToken = await hre.ethers.getContractFactory("AskolToken");
    const token = await AskolToken.deploy(t.name, t.symbol, t.supply, taxWallet);
    
    await token.waitForDeployment();
    const address = await token.getAddress();
    
    console.log(`BAŞARILI! ${t.symbol} Kontrat Adresi: ${address}`);
  }
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
