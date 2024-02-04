import { SSTConfig } from "sst";
import { NextjsSite } from "sst/constructs";
import { Service } from "sst/node/service";
import { RetentionDays } from "aws-cdk-lib/aws-logs";
import { Vpc, SubnetType } from "aws-cdk-lib/aws-ec2";
export default {
  config(_input) {
    return {
      name: "instaread-new-player",
      region: "us-east-1",
      cdk: {},
    };
  },
  stacks(app) {
    app.stack(function Site({ stack }) {
      const site = new NextjsSite(stack, "Site", {
        environment: {
          DATABASE_URL: process.env.DATABASE_URL!,
          CACHE_URL: process.env.CACHE_URL!,
        },
        edge: true,
        runtime: "nodejs20.x",
        assets: {
          nonVersionedFilesTTL: 86000000,
          versionedFilesTTL: 1000 * 60 * 60,
          fileOptions: [
            {
              files: "**/*.zip",
              cacheControl: "private,no-cache,no-store,must-revalidate",
              contentType: "application/zip",
            },
          ],
        },
        cdk: {
          server: {
            logRetention: RetentionDays.ONE_MONTH,
          },
        },
        logging: "combined",
      });

      stack.addOutputs({
        SiteUrl: site.url,
      });
    });
  },
} satisfies SSTConfig;
