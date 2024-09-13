import { PinataSDK } from "pinata";
import fs from "fs";
// const { Blob } = require("buffer");

export async function uploadToPinata() {
  const pinata = new PinataSDK({
    pinataJwt: process.env.PINATA_API_JWT!,
    pinataGateway: "example-gateway.mypinata.cloud",
  });

  const imageLocation = "./assets/nft-image.svg";

  const blob = new Blob([fs.readFileSync(imageLocation)]);
  const file = new File([blob], "nft-image.svg", { type: "image/svg+xml" });
  const upload = await pinata.upload.file(file);
  const imageCid = upload.cid;

  const metadata = {
    title: "Asset Metadata",
    type: "object",
    properties: {
      name: {
        type: "string",
        description: "Identifies the asset to which this NFT represents",
      },
      description: {
        type: "string",
        description: "Describes the asset to which this NFT represents",
      },
      image: {
        type: "string",
        description:
          "A URI pointing to a resource with mime type image/* representing the asset to which this NFT represents. Consider making any images at a width between 320 and 1080 pixels and aspect ratio between 1.91:1 and 4:5 inclusive.",
      },
    },
  };
}
