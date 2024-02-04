import Redis from "ioredis";

// Create a Redis instance.
// By default, it will connect to localhost:6379.
// We are going to cover how to specify connection options soon.
const CacheClient = new Redis(process.env.CACHE_URL!);
console.log(process.env.CACHE_URL!, CacheClient.status);
export default CacheClient;
