import { createClient } from "redis";

const CacheClient = createClient({
  url: process.env.CACHE_URL!,
});
CacheClient.on("error", (err) => console.log("Redis Client Error", err));

(async () => {
  await CacheClient.connect();
})();

export default CacheClient;
