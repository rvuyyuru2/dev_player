import {
  pgTable,
  bigint,
  text,
  integer,
  char,
  timestamp,
  boolean,
  unique,
  varchar,
  index,
  json,
} from "drizzle-orm/pg-core";

export const article = pgTable("article", {
  // You can use { mode: "bigint" } if numbers are exceeding js number limitations
  blogaudioId: bigint("blogaudio_id", { mode: "number" }),
  objectId: char("object_id", { length: 10 }),
  articleTitle: text("article_title"),
  authorName: text("author_name"),
  url: text("url"),
  duration: integer("duration"),
  providerName: text("provider_name"),
  providerType: text("provider_type"),
  publishedAt: timestamp("published_at", {
    withTimezone: true,
    mode: "string",
  }),
  logoUrl: text("logo_url"),
  appsflyerUrl: text("appsflyer_url"),
  previewUrl: text("preview_url"),
  colorScheme: text("color_scheme"),
  // You can use { mode: "bigint" } if numbers are exceeding js number limitations
  narratorId: bigint("narrator_id", { mode: "number" }),
  sonobiPlacementId: varchar("sonobi_placement_id", { length: 100 }),
  providerDomain: varchar("provider_domain", { length: 100 }),
  adsEnabled: boolean("ads_enabled"),
  playerLayoutConfig: text("player_layout_config"),
  articleUrl: varchar("article_url", { length: 2048 }),
  articleTitleMeta: text("article_title_meta"),
  articleTitleTag: text("article_title_tag"),
  adsConfig: text("ads_config"),
  articleImgurl: text("article_imgurl"),
  updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
});

export const thirdparty = pgTable("thirdparty", {
  // You can use { mode: "bigint" } if numbers are exceeding js number limitations
  providerId: bigint("provider_id", { mode: "number" }).primaryKey().notNull(),
  provider: text("provider").notNull(),
  providerType: text("provider_type"),
  logoUrl: text("logo_url"),
  colorScheme: text("color_scheme"),
  canNarrate: boolean("can_narrate"),
  typeformUrl: text("typeform_url"),
  sonobiPlacementId: varchar("sonobi_placement_id", { length: 100 }),
  adsEnabled: boolean("ads_enabled").default(false),
  providerDomain: varchar("provider_domain", { length: 100 }),
  playerLayoutConfig: text("player_layout_config").default("{}"),
  adsConfig: text("ads_config").default("{}"),
  processorConfigs: json("processor_configs"),
});

export const blogaudio = pgTable(
  "blogaudio",
  {
    // You can use { mode: "bigint" } if numbers are exceeding js number limitations
    blogaudioId: bigint("blogaudio_id", { mode: "number" })
      .primaryKey()
      .notNull(),
    url: text("url").default("").notNull(),
    duration: integer("duration").notNull(),
    blogName: text("blog_name").notNull(),
    objectId: char("objectId", { length: 10 }).notNull(),
    createdAt: timestamp("createdAt", {
      withTimezone: true,
      mode: "string",
    }).notNull(),
    updatedAt: timestamp("updatedAt", {
      withTimezone: true,
      mode: "string",
    }).notNull(),
    articleTitle: text("article_title").notNull(),
    appsflyerUrl: text("appsflyer_url"),
    // You can use { mode: "bigint" } if numbers are exceeding js number limitations
    providerId: bigint("provider_id", { mode: "number" }).references(
      () => thirdparty.providerId
    ),
    // You can use { mode: "bigint" } if numbers are exceeding js number limitations
    bookId: bigint("book_id", { mode: "number" }),
    // You can use { mode: "bigint" } if numbers are exceeding js number limitations
    narratorId: bigint("narrator_id", { mode: "number" }),
    articleUrl: varchar("article_url", { length: 2048 }),
    articleTitleMeta: text("article_title_meta"),
    articleTitleTag: text("article_title_tag"),
    articleImgurl: text("article_imgurl"),
    audioMeta: json("audio_meta").default({}).notNull(),
    authorName: text("author_name"),
    isprocessed: boolean("isprocessed").default(false).notNull(),
    isreprocessed: boolean("isreprocessed").default(false).notNull(),
  },
  (table) => {
    return {
      idxArticleUrlTitleBlogname: index("idx_article_url_title_blogname").on(
        table.blogName,
        table.articleTitle,
        table.articleUrl
      ),
      idxArticleUrl: index("idx_article_url").on(table.articleUrl),
      idxArticleTitle: index("idx_article_title").on(table.articleTitle),
      idxBlogName: index("idx_blog_name").on(table.blogName),
      idxBookId: index("idx_book_id").on(table.bookId),
      idxProviderId: index("idx_provider_id").on(table.providerId),
      idxPublishedAt: index("idx_published_at").on(table.createdAt),
      idxUpdatedAt: index("idx_updated_at").on(table.updatedAt),
      blogaudioObjectIdKey: unique("blogaudio_objectId_key").on(table.objectId),
    };
  }
);
