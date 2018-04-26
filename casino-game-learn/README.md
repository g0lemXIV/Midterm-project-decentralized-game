## Welcome to the midterm project 

**Thanks [itnext.io](https://itnext.io/create-your-first-ethereum-dapp-with-web3-and-vue-js-c7221af1ed82) for series of article**
  
  
![](https://screenshotscdn.firefoxusercontent.com/images/8a1f4ea2-e665-4241-b5f9-d616bdcdfa38.png)
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

#### In order to work properly, you should have 
| Plugin | README |
| ------ | ------ |
| Node.js | [Node.js instalation guide](https://nodejs.org/en/download/package-manager/) |
| MetaMask | [Plugin](https://metamask.io/) |
| TestRPC | [Node package](https://www.npmjs.com/package/ethereumjs-testrpc) |
|Optional| [Ganache](http://truffleframework.com/docs/ganache/using)|


### Build env setup 
Clone or download repository and move to project main folder

**install dependencies**
> npm install

**serve with hot reload at localhost:8080**
>npm run dev

### Smart contract ABI and tests

Run testrpc in terminal or ganache gui.  
You should see Mnemonic phrase ( 12 words ). Click on Metamask plugin and restore from seen phrase. Now paste mnemonic, change password and login into ethereum wallet.  
Change MetaMask test network to PrivateNetwork at port 8545.
**You should see something like this :**
![](https://i.stack.imgur.com/GzZcI.png)

 Copy */casino-game-learn/contracts/Casino.sol* and paste in to **[remix.ethereum](http://remix.ethereum.org) compiler.**    
 Change Environment to InjectedWeb3, click okey. 
 
Create Your contract, you should have something like this : 
 ![](https://screenshotscdn.firefoxusercontent.com/images/50864fb5-ea91-4b3d-9bce-fce32767d40c.png)
 
 In *./util/constants/casinoContract.js* change **address** and **ABI** to Yours.  
 
 Now you can play with Your first dapp on [http://localhost:8080](localhost) 
 
 ![](https://screenshotscdn.firefoxusercontent.com/images/a509b890-d40a-48c8-a2a5-2d7feb0148ee.png)



**Free Software, Hell Yeah!**
