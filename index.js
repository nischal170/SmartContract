require("dotenv").config();
const { ethers,InfuraProvider,Contract,Wallet }=require("ethers")
const provider = new InfuraProvider("goerli");
const abi = require("./contract/nftContract.json");
//creating new wallet signer
const signer = Wallet.fromPhrase(process.env.SEED_PHRASE, provider);

//creating new contract instance
const contract = new Contract("0x4A4DDfa4D5bFe0CB54F038C5E6d1E91C54c09488",
    abi,
    signer
  );

const queryBlockchain = async()=>{
    const num=await contract.randomNumber();
    console.log("This is the output===>",num)

}
queryBlockchain();
const queryBlockchain2 = async()=>{
 
    const id=await contract.getTokenIdForUser('0x58b3c79302bfFcBb4eEb063aCf3fDA03d30067B7');
   
    console.log("this id token id==>",id)
}
queryBlockchain2();
