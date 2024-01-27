import "./globals.css";
import type { Metadata } from "next";

import localFont from "next/font/local";

const spaceMono = localFont({
  src: [
    {
      path: "../public/fonts/space-mono/SpaceMono-Regular.ttf",
      weight: "400",
      style: "normal",
    },
    {
      path: "../public/fonts/space-mono/SpaceMono-Italic.ttf",
      weight: "400",
      style: "italic",
    },
  ],
});

export const metadata: Metadata = {
  title: "Instaread",
  generator: "Instaread",
  applicationName: "Instaread",
  referrer: "origin-when-cross-origin",
  alternates: {},
  formatDetection: {
    email: false,
    address: false,
    telephone: false,
  },
  robots: {
    index: true,
  },
};

export default function RootLayout(
  { children }: { children: React.ReactNode }
) {
  return (
    <html lang="en">
      <body className={`${spaceMono.className}`}>
        <main
          className={`text-zinc-700 bg-white dark:text-zinc-400 dark:bg-black`}
        >
          {children}
        </main>
      </body>
    </html>
  );
}
