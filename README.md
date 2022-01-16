# Bittern
Shell script to install a Bittern on a Linux server running Ubuntu 18.04. Use it on your own risk.

***
## Installation (latest wallet version):
```
git clone https://github.com/Miner113/node-installer.git
cd node-installer
bash btr_mn_installer.sh

```
***
## Desktop wallet setup

After the MN is up and running, you need to configure the desktop wallet accordingly. Here are the steps for Windows Wallet
1. Open the Bittern Coin Desktop Wallet.
2. Go to RECEIVE and create a New Address: **MN1**
3. Send **2500** **Bittern** to **MN1**.
4. Wait for 30 confirmations.
5. Go to **Tools -> "Debug console - Console"**
6. Type the following command: **masternode outputs**
7. Go to  ** Tools -> "Open Masternode Configuration File"
8. Add the following entry:
```
Alias Address Privkey TxHash Output_index
```
* Alias: **MN1**
* Address: **VPS_IP:PORT**
* Privkey: **Masternode Private Key**
* TxHash: **First value from Step 6**
* Output index:  **Second value from Step 6**
9. Save and close the file.
10. Go to **Masternode Tab**. If you tab is not shown, please enable it from: **Settings - Options - Wallet - Show Masternodes Tab**
11. Click **Update status** to see your node. If it is not shown, close the wallet and start it again. Make sure the wallet is unlocked.
12. Open **Debug Console** and type:
```
startmasternode "alias" "0" "MN1"
```
***

## Usage:
```
bittern-cli getinfo
bittern-cli mnsync status
bittern-cli masternode status
```
Also, if you want to check/start/stop **Bittern** , run one of the following commands as **root**:

***

