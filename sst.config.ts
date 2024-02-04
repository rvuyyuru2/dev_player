import { SSTConfig } from "sst";
import { NextjsSite } from "sst/constructs";
import { RetentionDays } from "aws-cdk-lib/aws-logs";
import { Vpc, SubnetType } from "aws-cdk-lib/aws-ec2";
export default {
  config(_input) {
    return {
      name: "instaread-new-player",
      region: "us-east-1",
    };
  },
  stacks(app) {
    app.stack(function Site({ stack }) {
      // Create a VPC
      const vpc = new Vpc(stack, "vpc-a77ee8c3");

      // Alternatively use an existing VPC

      const vpcSubnets = {
        subnetType: SubnetType.PRIVATE_WITH_EGRESS,
      };

      const site = new NextjsSite(stack, "Site", {
        environment: {
          DATABASE_URL: process.env.DATABASE_URL!,
          CACHE_URL: process.env.CACHE_URL!,
        },
        edge: true,
        runtime: "nodejs20.x",
        cdk: {
          server: {
            vpc,
            vpcSubnets,
            logRetention: RetentionDays.ONE_MONTH,
          },
        },
      });

      stack.addOutputs({
        SiteUrl: site.url,
      });
    });
  },
} satisfies SSTConfig;
