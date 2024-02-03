import db from "@/lib/database";
import { thirdparty } from "../../drizzle/schema";
import CacheClient from "@/lib/Cache";

// "use client";
async function getData() {
  const key = "thirdparty";
  const res = await CacheClient.get(key);
  if (!res) {
    const data: any = await db.select().from(thirdparty);
    await CacheClient.set(key, data);
    return [...data];
  }

  return res;
}
export default async function Home() {
  const data = await getData();

  return (
    <div className="">
      {data.map((e) => (
        <p key={e.providerId}>{e?.provider}</p>
      ))}
    </div>
  );
}
