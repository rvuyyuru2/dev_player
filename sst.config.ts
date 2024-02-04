import { SSTConfig } from "sst";
import { NextjsSite } from "sst/constructs";

export default {
  config(_input) {
    return {
      name: "instaread-new-player",
      region: "us-east-1",
    };
  },
  stacks(app) {
    app.stack(function Site({ stack }) {
      const site = new NextjsSite(stack, "site", {
        environment: {
          DATABASE_URL: process.env.DATABASE_URL!,
          CACHE_URL: process.env.CACHE_URL!,
        },
        edge: true,
        runtime: "nodejs20.x",
        cdk: {
          server: {
            allowAllOutbound: true,
            vpc: {
              vpcId: "vpc-a77ee8c3",
            },
            securityGroups: [
              { securityGroupId: "sg-0074f3414aba5951c" },
              { securityGroupId: "sg-08ac9aeb3838f9120" },
            ],
          },
        },
      });

      stack.addOutputs({
        SiteUrl: site.url,
      });
    });
  },
} satisfies SSTConfig;
