import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const CoolEventFactoryModule = buildModule("CoolEventFactoryModule", (m) => {
  const coolEventFactory = m.contract("CoolEventFactory", []);

  return { coolEventFactory };
});

export default CoolEventFactoryModule;
