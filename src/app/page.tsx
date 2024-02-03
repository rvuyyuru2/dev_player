import db from "@/lib/database";
import { thirdparty } from "../../drizzle/schema";
import { getValue, storeValue } from "@/lib/Cache";

// "use client";
async function getData() {
  const key = "thirdparty";
  const res: any = await getValue(key);
  if (!res) {
    const data: any = await db.select().from(thirdparty);
    await storeValue(key, data);
    return [...data];
  }

  return JSON.parse(res);
}
export default async function Home() {
  const data = await getData();
  return (
    <div className="">
      {data?.map((e: any) => <p key={e.providerId}>{e?.provider}</p>)}
    </div>
  );
}
