import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const NFT_ADDRESS = "0x3F684E473Fc5e9202aA642062B25d0002fFf5bAa";
const MAX_GUESTS = 100;

const CoolEventModule = buildModule("CoolEventModule", (m) => {
  const nftAddress = m.getParameter("_coolNFT", NFT_ADDRESS);
  const maxGuests = m.getParameter("_maxGuests", MAX_GUESTS);

  const coolEvent = m.contract("CoolEvent", [maxGuests, nftAddress]);

  return { coolEvent };
});

export default CoolEventModule;