import Redis from "ioredis";
console.log(process.env.CACHE_URL!);

// Create a Redis instance.
// By default, it will connect to localhost:6379.
// We are going to cover how to specify connection options soon.
const CacheClient = new Redis(process.env.CACHE_URL!);

export default CacheClient;
