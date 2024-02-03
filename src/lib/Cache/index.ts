const redis = require("redis");

const client = redis.createClient({
  host: process.env.CACHE_HOST,
  port: 6379,
});

const getValue = (key: string) => {
  return new Promise((resolve, reject) => {
    client.get(key, (error: any, response: any) => {
      if (error) reject(error);
      else resolve(response);
    });
  });
};

const storeValue = (key: string, value: any) => {
  return new Promise((resolve, reject) => {
    client.set(key, value, (error: any, response: any) => {
      if (error) reject(error);
      else resolve(response);
    });
  });
};

export { getValue, storeValue };
