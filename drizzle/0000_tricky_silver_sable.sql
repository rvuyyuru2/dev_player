-- Current sql file was generated after introspecting the database
-- If you want to run this migration please uncomment this code before executing migrations
/*
DO $$ BEGIN
 CREATE TYPE "book_create_source" AS ENUM('GBOOK', 'GOOGLE', 'INSTAREAD');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "card_creator" AS ENUM('USER', 'INSTAREAD');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "listtypestatus" AS ENUM('public', 'private', 'review');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "login_role" AS ENUM('experiment_editor', 'feedback_receiver', 'report_viewer', 'user_editor', 'book_editor');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "notif_type" AS ENUM('COMMENT_LIKE', 'COMMENT_NEW', 'LIKE', 'FOLLOW');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "product_interval" AS ENUM('lifetime', 'year', 'month');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "status" AS ENUM('PENDING', 'REJECTED', 'DELETED', 'PUBLISHED', 'ARCHIVED', 'DRAFT');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "targetting_type" AS ENUM('BLACKLIST', 'WHITELIST');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "signupchannel" AS ENUM('WEB', 'ANDROID', 'IOS');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "comment_status" AS ENUM('SPAM', 'IN_REVIEW', 'REJECTED', 'DELETED', 'PUBLISHED');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "attempt_state" AS ENUM('MAPPED', 'MAP_FAILURE', 'MAP_SUCCESS', 'NO_MATCH', 'ATTEMPTED');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "verify_status" AS ENUM('PENDING', 'VERIFIED');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "pg_stat_statements" (
	"userid" "oid",
	"dbid" "oid",
	"queryid" bigint,
	"query" text,
	"calls" bigint,
	"total_time" double precision,
	"min_time" double precision,
	"max_time" double precision,
	"mean_time" double precision,
	"stddev_time" double precision,
	"rows" bigint,
	"shared_blks_hit" bigint,
	"shared_blks_read" bigint,
	"shared_blks_dirtied" bigint,
	"shared_blks_written" bigint,
	"local_blks_hit" bigint,
	"local_blks_read" bigint,
	"local_blks_dirtied" bigint,
	"local_blks_written" bigint,
	"temp_blks_read" bigint,
	"temp_blks_written" bigint,
	"blk_read_time" double precision,
	"blk_write_time" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverdailypickwithgracetime" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint,
	"book_read" boolean,
	"book_listen" boolean,
	"book_visualize" boolean,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"is_active" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "promoted_users" (
	"login_id" bigint PRIMARY KEY NOT NULL,
	"updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_verification" (
	"verification_id" bigserial PRIMARY KEY NOT NULL,
	"subject_id" bigint NOT NULL,
	"email" text NOT NULL,
	"token" text NOT NULL,
	"used" boolean DEFAULT false,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "user_verification_token_key" UNIQUE("token")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "getlasttwofreedailybooks" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint,
	"book_read" boolean,
	"book_listen" boolean,
	"book_visualize" boolean,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"is_active" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "book_mapping_attempt" (
	"attempt_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigint NOT NULL,
	"title" text,
	"state" "attempt_state" DEFAULT 'ATTEMPTED',
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "comment_likes" (
	"like_id" bigserial PRIMARY KEY NOT NULL,
	"comment_id" uuid NOT NULL,
	"login_id" bigint NOT NULL,
	"like_status" boolean NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "comment_likes_comment_id_login_id_key" UNIQUE("comment_id","login_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "notifications_sent" (
	"notificationuser_login_id" bigint NOT NULL,
	"fcm_id" text,
	"data" jsonb,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "failed_email_delivery" (
	"id" bigserial PRIMARY KEY NOT NULL,
	"to_address" text,
	"subject" text,
	"reason" text,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "cards_comment" (
	"id" bigserial PRIMARY KEY NOT NULL,
	"comment_id" uuid DEFAULT uuid_generate_v4(),
	"content" varchar(600) NOT NULL,
	"card_id" bigint NOT NULL,
	"parent_id" bigint,
	"status" "comment_status" DEFAULT 'PUBLISHED',
	"created_by" bigint NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"grammar_error_score" numeric,
	"profanity_score" numeric,
	CONSTRAINT "cards_comment_comment_id_key" UNIQUE("comment_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "notifications_failed" (
	"notificationuser_login_id" bigint NOT NULL,
	"fcm_id" text NOT NULL,
	"data" jsonb,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"reason" text,
	"notificationuser_email" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_setupintent" (
	"id" bigserial PRIMARY KEY NOT NULL,
	"login_id" bigint NOT NULL,
	"client_secret" varchar(128) NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "user_setupintent_login_id_client_secret_key" UNIQUE("login_id","client_secret")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "populararticles" (
	"blogaudio_id" bigint,
	"object_id" char(10),
	"article_title" text,
	"author_name" text,
	"url" text,
	"duration" integer,
	"provider_name" text,
	"provider_type" text,
	"published_at" timestamp with time zone,
	"logo_url" text,
	"appsflyer_url" text,
	"preview_url" text,
	"color_scheme" text,
	"narrator_id" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "_prisma_migrations" (
	"id" varchar(36) PRIMARY KEY NOT NULL,
	"checksum" varchar(64) NOT NULL,
	"finished_at" timestamp with time zone,
	"migration_name" varchar(255) NOT NULL,
	"logs" text,
	"rolled_back_at" timestamp with time zone,
	"started_at" timestamp with time zone DEFAULT now() NOT NULL,
	"applied_steps_count" integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "article" (
	"blogaudio_id" bigint,
	"object_id" char(10),
	"article_title" text,
	"author_name" text,
	"url" text,
	"duration" integer,
	"provider_name" text,
	"provider_type" text,
	"published_at" timestamp with time zone,
	"logo_url" text,
	"appsflyer_url" text,
	"preview_url" text,
	"color_scheme" text,
	"narrator_id" bigint,
	"sonobi_placement_id" varchar(100),
	"provider_domain" varchar(100),
	"ads_enabled" boolean,
	"player_layout_config" text,
	"article_url" varchar(2048),
	"article_title_meta" text,
	"article_title_tag" text,
	"ads_config" text,
	"article_imgurl" text,
	"updated_at" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "thirdparty_content_users" (
	"user_id" text PRIMARY KEY NOT NULL,
	"created_at" timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
	"updated_at" timestamp(6) with time zone,
	"email" varchar(100) NOT NULL,
	"password" text NOT NULL,
	"is_live" boolean DEFAULT true NOT NULL,
	"is_admin" boolean DEFAULT true NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ProcessorAuditLogs" (
	"id" serial PRIMARY KEY NOT NULL,
	"timeStamp" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"user_id" text NOT NULL,
	"EventName" varchar(255) NOT NULL,
	"Details" text NOT NULL,
	"ipAddress" text NOT NULL,
	"userAgent" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "processor_audit_logs" (
	"id" serial PRIMARY KEY NOT NULL,
	"time_stamp" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"user_id" text,
	"event_name" varchar(255) NOT NULL,
	"details" text NOT NULL,
	"ip_address" text NOT NULL,
	"user_agent" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "processor_traffic" (
	"id" serial PRIMARY KEY NOT NULL,
	"created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"url" text NOT NULL,
	"provider" text NOT NULL,
	"provider_id" bigint NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "_SCHEMA" (
	"className" varchar(120) PRIMARY KEY NOT NULL,
	"schema" jsonb,
	"isParseClass" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "_GlobalConfig" (
	"objectId" text PRIMARY KEY NOT NULL,
	"params" jsonb
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "_Hooks" (
	"functionName" text,
	"className" text,
	"triggerName" text,
	"url" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "androidsubscription_invalid" (
	"subscription_id" text,
	"expiration" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "_JobStatus" (
	"objectId" text PRIMARY KEY NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"jobName" text,
	"source" text,
	"status" text,
	"message" text,
	"params" jsonb,
	"finishedAt" timestamp with time zone,
	"_rperm" text[],
	"_wperm" text[]
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "_User" (
	"objectId" text PRIMARY KEY NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"username" text,
	"email" text,
	"emailVerified" boolean,
	"authData" jsonb,
	"_rperm" text[],
	"_wperm" text[],
	"_hashed_password" text,
	"_email_verify_token_expires_at" timestamp with time zone,
	"_email_verify_token" text,
	"_account_lockout_expires_at" timestamp with time zone,
	"_failed_login_count" double precision,
	"_perishable_token" text,
	"_perishable_token_expires_at" timestamp with time zone,
	"_password_changed_at" timestamp with time zone,
	CONSTRAINT "unique_username" UNIQUE("username"),
	CONSTRAINT "unique_email" UNIQUE("email")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "_PushStatus" (
	"objectId" text PRIMARY KEY NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"pushTime" text,
	"source" text,
	"query" text,
	"payload" text,
	"title" text,
	"expiry" double precision,
	"status" text,
	"numSent" double precision,
	"numFailed" double precision,
	"pushHash" text,
	"errorMessage" jsonb,
	"sentPerType" jsonb,
	"failedPerType" jsonb,
	"_rperm" text[],
	"_wperm" text[]
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "androidsubscriptionmixpanel" (
	"subscriptionmixpanel_id" bigserial PRIMARY KEY NOT NULL,
	"subscription_id" text NOT NULL,
	"subject_id" bigint NOT NULL,
	CONSTRAINT "androidsubscriptionmixpanel_subscription_id_key" UNIQUE("subscription_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "androidregistration" (
	"email" text PRIMARY KEY NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "androidsubscriptionnotifications" (
	"id" serial PRIMARY KEY NOT NULL,
	"notification_type" integer,
	"body" text,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"subscription_id" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subscription" (
	"subscription_id" bigint PRIMARY KEY NOT NULL,
	"encoded_receipt" text NOT NULL,
	"sandbox" boolean DEFAULT false NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "androidsubscription" (
	"subscription_id" text PRIMARY KEY NOT NULL,
	"purchase_token" text NOT NULL,
	"sandbox" integer,
	"created_at" timestamp with time zone DEFAULT now(),
	"updated_at" timestamp with time zone DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "androidsubscriptiondetail" (
	"subscriptiondetail_id" bigserial PRIMARY KEY NOT NULL,
	"subscription_id" text NOT NULL,
	"subscription_price" bigint,
	"payment_status" integer NOT NULL,
	"renew" boolean NOT NULL,
	"cancel_reason" integer,
	"cancel_survey" integer,
	"cancel_reason_user_input" text,
	"linked_token" text,
	"start" timestamp with time zone NOT NULL,
	"expire" timestamp with time zone NOT NULL,
	"subscriptionproduct_id" bigint NOT NULL,
	"cs_date" timestamp with time zone,
	"price_currency_code" text,
	"country_code" text,
	"price_amount_micros" bigint,
	"purchase_obj" jsonb DEFAULT '{}'::jsonb NOT NULL,
	"purchase_state" integer,
	"purchase_type" integer,
	"acknowledgement_state" integer,
	"region" text,
	CONSTRAINT "androidsubscriptiondetail_subscription_id_key" UNIQUE("subscription_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subscriptionproduct" (
	"subscriptionproduct_id" bigserial PRIMARY KEY NOT NULL,
	"code" text NOT NULL,
	"amount" numeric(10, 2) NOT NULL,
	"product_interval" "product_interval" DEFAULT enum_first(NULL::product_interval) NOT NULL,
	"intervals" integer DEFAULT 1 NOT NULL,
	"subscriptiongroup" text DEFAULT 'Undefined Subscription Group' NOT NULL,
	CONSTRAINT "subscriptionproduct_code_key" UNIQUE("code")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "blogaudio" (
	"blogaudio_id" bigint PRIMARY KEY DEFAULT nextval('blogaudio_blogaudio_id_seq'::regclass) NOT NULL,
	"url" text DEFAULT '' NOT NULL,
	"duration" integer NOT NULL,
	"blog_name" text NOT NULL,
	"objectId" char(10) NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone NOT NULL,
	"article_title" text NOT NULL,
	"appsflyer_url" text,
	"provider_id" bigint,
	"book_id" bigint,
	"narrator_id" bigint,
	"article_url" varchar(2048),
	"article_title_meta" text,
	"article_title_tag" text,
	"article_imgurl" text,
	"audio_meta" json DEFAULT '{}'::json NOT NULL,
	"author_name" text,
	"isprocessed" boolean DEFAULT false NOT NULL,
	"isreprocessed" boolean DEFAULT false NOT NULL,
	CONSTRAINT "blogaudio_objectId_key" UNIQUE("objectId")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "appleannualrenewalrate" (
	"period" text,
	"code" text,
	"year1" bigint,
	"year2" bigint,
	"year2percent" numeric,
	"year3" bigint,
	"year3percent" numeric
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "author" (
	"author_id" bigserial PRIMARY KEY NOT NULL,
	"name" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subscriptiondetail" (
	"subscriptiondetail_id" bigint PRIMARY KEY NOT NULL,
	"subscription_id" bigint NOT NULL,
	"subscriptionproduct_id" bigint NOT NULL,
	"start" timestamp with time zone NOT NULL,
	"expire" timestamp with time zone NOT NULL,
	"cs" timestamp with time zone,
	"trial" boolean NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "appsflyerserverevents" (
	"id" serial PRIMARY KEY NOT NULL,
	"event_name" text,
	"app" text,
	"req_body" text,
	"is_resp_success" boolean,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"fail_reason" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "appsflyersubscriptiontrack" (
	"id" serial PRIMARY KEY NOT NULL,
	"subscription_id" text NOT NULL,
	"app" text NOT NULL,
	"retry_count" integer DEFAULT 0,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "appsflyersubscriptiontrack_subscription_id_key" UNIQUE("subscription_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "book" (
	"book_id" bigserial PRIMARY KEY NOT NULL,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10) DEFAULT random_string(10) NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"title" text NOT NULL,
	"subtitle" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean DEFAULT false NOT NULL,
	"live" boolean DEFAULT false NOT NULL,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"summary_type" text,
	"search_document" "tsvector",
	"discover_url" text,
	"content_id" bigint,
	"provider_id" bigint,
	"created_source" "book_create_source" DEFAULT 'INSTAREAD',
	"parent_book_id" bigint,
	"ratingvalue" numeric(10, 5) DEFAULT 0,
	"ratingcount" integer DEFAULT 0,
	"bestrating" numeric(10, 2) DEFAULT 0,
	"worstrating" numeric(10, 2) DEFAULT 0,
	"description" varchar,
	"default_rating_random" boolean DEFAULT false,
	CONSTRAINT "book_object_id_key" UNIQUE("object_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "book_urls" (
	"book_id" bigint,
	"preview_url" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "book_targetting" (
	"book_targetting_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigint NOT NULL,
	"client_target" boolean,
	"server_target" boolean,
	"location_country" text,
	"location_state" text,
	"location_city" text,
	"target_type" "targetting_type",
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "book_dailypick" (
	"book_dailypick_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigint NOT NULL,
	"book_read" boolean,
	"book_listen" boolean,
	"start_date" timestamp with time zone NOT NULL,
	"end_date" timestamp with time zone NOT NULL,
	"is_active" boolean,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"book_visualize" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subcategory" (
	"subcategory_id" bigint PRIMARY KEY DEFAULT nextval('subcategory_subcategory_id_seq'::regclass) NOT NULL,
	"name" text NOT NULL,
	CONSTRAINT "subcategory_name_key" UNIQUE("name")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "thirdparty" (
	"provider_id" bigint PRIMARY KEY DEFAULT nextval('thirdparty_provider_id_seq'::regclass) NOT NULL,
	"provider" text NOT NULL,
	"provider_type" text,
	"logo_url" text,
	"color_scheme" text,
	"can_narrate" boolean,
	"typeform_url" text,
	"sonobi_placement_id" varchar(100),
	"ads_enabled" boolean DEFAULT false,
	"provider_domain" varchar(100),
	"player_layout_config" text DEFAULT '{}',
	"ads_config" text DEFAULT '{}',
	"processor_configs" json
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "article_provider_key" (
	"article_provider_key_id" bigserial PRIMARY KEY NOT NULL,
	"api_key" text,
	"provider_name" text,
	"is_active" boolean DEFAULT true NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "constraint_name" UNIQUE("api_key","provider_name"),
	CONSTRAINT "provider_name" UNIQUE("provider_name")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "articlepopularity" (
	"object_id" text,
	"book_count" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "authorsearchable" (
	"author_id" bigint,
	"author_document" "tsvector",
	"author_text" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "book_categories" (
	"book_category_id" serial PRIMARY KEY NOT NULL,
	"book_id" bigint NOT NULL,
	"primary_category" text,
	"secondary_category" text,
	"books_extra_info" jsonb,
	"category_icon" text,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "book_category_unique" UNIQUE("book_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "book_subcategories" (
	"book_id" bigint,
	"subcategory_ids" bigint[],
	"subcategory_names" text[]
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "category" (
	"category_id" bigserial PRIMARY KEY NOT NULL,
	"name" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "booksubcategory" (
	"booksubcategory_id" bigint PRIMARY KEY DEFAULT nextval('booksubcategory_booksubcategory_id_seq'::regclass) NOT NULL,
	"book_id" bigint DEFAULT nextval('booksubcategory_book_id_seq'::regclass) NOT NULL,
	"subcategory_id" bigint DEFAULT nextval('booksubcategory_subcategory_id_seq'::regclass) NOT NULL,
	"object_id" char(10),
	"created_at" timestamp with time zone,
	"updated_at" timestamp with time zone,
	CONSTRAINT "booksubcategory_book_id_subcategory_id_key" UNIQUE("book_id","subcategory_id"),
	CONSTRAINT "booksubcategory_object_id_key" UNIQUE("object_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "book_thirdparty_data" (
	"book_thirdparty_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigint NOT NULL,
	"data" jsonb,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "book_thirdparty_data_unique" UNIQUE("book_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "fullbook" (
	"fullbook_id" text PRIMARY KEY NOT NULL,
	"object_id" char(10) DEFAULT random_string(10) NOT NULL,
	"book_id" bigint,
	"book_rank" real,
	"authors" text[],
	"narrators" text[],
	"title" text NOT NULL,
	"subtitle" text,
	"html_preview" text,
	"language" text,
	"cover_url" text,
	"sample_url" text,
	"abridgement" text,
	"published" timestamp with time zone,
	"modified" timestamp with time zone NOT NULL,
	"publisher" text,
	"runtime" text,
	"filesize" bigint,
	"copyright" text,
	"search_document" "tsvector",
	CONSTRAINT "fullbook_object_id_key" UNIQUE("object_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "bookpopularity" (
	"object_id" text,
	"book_count" integer,
	"last_refresh" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "cards_book" (
	"card_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigint NOT NULL,
	"content" text,
	"title" text,
	"card_meta" jsonb,
	"card_type" varchar(20),
	"author_name" text,
	"card_status" "status",
	"created_by" bigint NOT NULL,
	"updated_by" bigint NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"share_image" text,
	"duplicate_of" bigint,
	"created_type" "card_creator",
	"profanity_score" numeric,
	"grammar_error_score" numeric,
	CONSTRAINT "cards_content_uniq" UNIQUE("book_id","content")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "bookprimarycategory" (
	"book_primary_category_id" bigserial PRIMARY KEY NOT NULL,
	"name" text,
	CONSTRAINT "book_primary_category_unique" UNIQUE("name")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "bookvisualization" (
	"bookvisualization_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigint NOT NULL,
	"url" text NOT NULL,
	"title" text NOT NULL,
	"display_order" integer DEFAULT 0 NOT NULL,
	"object_id" char(10) DEFAULT random_string(10) NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "bookvisualization_object_id_key" UNIQUE("object_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "bookstat" (
	"book_id" bigint,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"fullbook_ids" text[],
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "bookaudio" (
	"bookaudio_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigint NOT NULL,
	"url" text DEFAULT '' NOT NULL,
	"duration" integer NOT NULL,
	"title" text NOT NULL,
	"display_order" integer DEFAULT 0 NOT NULL,
	"object_id" char(10) DEFAULT random_string(10) NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"objectId" char(10),
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	CONSTRAINT "bookaudio_object_id_key" UNIQUE("object_id"),
	CONSTRAINT "bookaudio_objectId_key" UNIQUE("objectId")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "booktext" (
	"booktext_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigint NOT NULL,
	"markdown" text NOT NULL,
	"title" text NOT NULL,
	"display_order" integer DEFAULT 0 NOT NULL,
	"object_id" char(10) DEFAULT random_string(10) NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "booktext_object_id_key" UNIQUE("object_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "books_list" (
	"list_id" bigint NOT NULL,
	"book_id" bigint NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "lists_book_book_id_list_id_key" UNIQUE("list_id","book_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "bookkeyword" (
	"bookkeyword_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigserial NOT NULL,
	"keyword_id" bigserial NOT NULL,
	"object_id" char(10),
	"created_at" timestamp with time zone,
	"updated_at" timestamp with time zone,
	CONSTRAINT "bookkeyword_book_id_keyword_id_key" UNIQUE("book_id","keyword_id"),
	CONSTRAINT "bookkeyword_objectId_key" UNIQUE("object_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "cards_activity" (
	"cards_activity_id" bigserial PRIMARY KEY NOT NULL,
	"card_id" bigint NOT NULL,
	"action" varchar(10),
	"model" varchar(20),
	"slot_id" varchar(10),
	"action_timestamp" timestamp with time zone,
	"meta" text,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"platform" text,
	"platform_version" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "cards_book_tmp" (
	"card_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigint NOT NULL,
	"content" text,
	"title" text,
	"card_meta" jsonb,
	"card_type" varchar(20),
	"author_name" text,
	"card_status" "status",
	"created_by" bigint NOT NULL,
	"updated_by" bigint NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "cards_book_tmp_key" UNIQUE("content")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "cards_action" (
	"cards_action_id" bigserial PRIMARY KEY NOT NULL,
	"card_id" bigint NOT NULL,
	"shares_count" bigint,
	CONSTRAINT "cards_actions_card_id_key" UNIQUE("card_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "booksummary" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint,
	"created_source" "book_create_source",
	"parent_book_id" bigint,
	"ratingvalue" numeric(10, 5),
	"ratingcount" integer,
	"bestrating" numeric(10, 2),
	"worstrating" numeric(10, 2),
	"description" varchar
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "cards_review" (
	"card_id" bigint,
	"duplicacy_type" text,
	"duplicate_of" bigint,
	"score" numeric,
	"review_status" boolean,
	"profanity" numeric,
	CONSTRAINT "cards_review_card_id_type_duplicate_of_key" UNIQUE("card_id","duplicacy_type","duplicate_of")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "cards_suggestions" (
	"suggestion_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigint NOT NULL,
	"chapter_name" text,
	"chapter_order" bigint,
	"recommended_order" bigint NOT NULL,
	"title" text NOT NULL,
	"content" text NOT NULL,
	"used" boolean DEFAULT false,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"card_type" varchar(20),
	CONSTRAINT "cards_suggestions_book_id_content_key" UNIQUE("book_id","content")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverdailypick" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint,
	"book_read" boolean,
	"book_listen" boolean,
	"book_visualize" boolean,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"is_active" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "copy" (
	"code" text PRIMARY KEY NOT NULL,
	"text" text,
	"experiment_id" bigint,
	"variant" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "categoryfilters" (
	"category_id" bigint,
	"name" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "categorysearchable" (
	"category_id" bigint,
	"category_document" "tsvector",
	"category_text" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "cards_user" (
	"cards_user_id" bigserial PRIMARY KEY NOT NULL,
	"card_id" bigint NOT NULL,
	"login_id" bigint NOT NULL,
	"share_status" boolean DEFAULT false NOT NULL,
	"like_status" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "cards_user_login_id_card_id_key" UNIQUE("card_id","login_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverhome" (
	"id" integer,
	"discover_response" jsonb,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "discoverhome_id_key" UNIQUE("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discovercommunity" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverbestsummaries" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverfiction" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverbm" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverbooksincards" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverbottom7" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverdanenberg" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverhealth" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discovereh" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverem" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverhomenewresponse" (
	"discover_response" jsonb
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverhomenew" (
	"id" integer,
	"discover_response" jsonb,
	"created_at" timestamp with time zone,
	"updated_at" timestamp with time zone,
	CONSTRAINT "discoverhomenew_id_key" UNIQUE("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverhomeresponse" (
	"discover_response" jsonb
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverhometest" (
	"id" integer,
	"discover_response" jsonb,
	"created_at" timestamp with time zone,
	"updated_at" timestamp with time zone,
	CONSTRAINT "discoverhometest_id_key" UNIQUE("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "contenttype" (
	"content_id" bigint PRIMARY KEY DEFAULT nextval('contenttype_content_id_seq'::regclass) NOT NULL,
	"content_name" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverhometestresponse" (
	"discover_response" jsonb
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverkellogg" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "topsharedbooks" (
	"book_id" bigint,
	"shares_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discovernew" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discovernonfiction" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discovernytm" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "topuniqueshardbooks" (
	"book_id" bigint,
	"total" numeric
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoveroriginals" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverpopular" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint,
	"last_refresh" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverqm" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discovertrendingbooks" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoversubcategories" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoversuggestion" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discoverteams" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discovertop3" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "discovertop5" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "experimentsubject" (
	"experimentsubject_id" bigserial PRIMARY KEY NOT NULL,
	"experiment_id" bigint NOT NULL,
	"subject_id" bigint NOT NULL,
	"status" boolean NOT NULL,
	"variant" integer NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "experimentsubject_experiment_id_subject_id_key" UNIQUE("experiment_id","subject_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "login" (
	"login_id" bigserial PRIMARY KEY NOT NULL,
	"object_id" char(10) DEFAULT random_string(10) NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"username" text NOT NULL,
	"email" text,
	"firstname" text,
	"lastname" text,
	"facebook_id" text,
	"password" text,
	"stripe_id" text,
	"subject_id" bigint NOT NULL,
	"settings" jsonb,
	"apple_user_id" text,
	"google_user_id" text,
	"verification_status" "verify_status" DEFAULT 'PENDING',
	"email_verification_status" "verify_status" DEFAULT 'PENDING',
	"signup_channel" "signupchannel",
	CONSTRAINT "login_object_id_key" UNIQUE("object_id"),
	CONSTRAINT "login_username_key" UNIQUE("username"),
	CONSTRAINT "login_email_key" UNIQUE("email"),
	CONSTRAINT "login_facebook_id_key" UNIQUE("facebook_id"),
	CONSTRAINT "login_stripe_id_key" UNIQUE("stripe_id"),
	CONSTRAINT "unique_subject_id" UNIQUE("subject_id"),
	CONSTRAINT "login_apple_user_id_key" UNIQUE("apple_user_id"),
	CONSTRAINT "login_google_user_id_key" UNIQUE("google_user_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "email" (
	"email" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "experimentarchive" (
	"experimentarchive_id" bigserial PRIMARY KEY NOT NULL,
	"name" text,
	"hypothesis" text,
	"results" text,
	"copy_code" text,
	"live" boolean NOT NULL,
	"variant_count" integer NOT NULL,
	"variant_result" integer NOT NULL,
	"audience" integer NOT NULL,
	"created_at" timestamp with time zone NOT NULL,
	"started_at" timestamp with time zone,
	"completed_at" timestamp with time zone NOT NULL,
	"archived_at" timestamp with time zone DEFAULT now() NOT NULL,
	"impression_count" bigint NOT NULL,
	"subject_count" bigint NOT NULL,
	"pdf_data" "bytea" NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "fullbookproduct" (
	"fullbookproduct_id" text PRIMARY KEY NOT NULL,
	"fullbook_id" text NOT NULL,
	"purchaseproduct_code" text,
	"active" timestamp with time zone NOT NULL,
	"inactive" timestamp with time zone,
	"modified" timestamp with time zone DEFAULT now() NOT NULL,
	"territories" text[],
	"isbn" text,
	"content_cost" numeric(10, 2) NOT NULL,
	"list_price" numeric(10, 2) NOT NULL,
	"list_price_currency" text NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"is_active" boolean DEFAULT true NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "fbs_view_v0" (
	"fullbook_id" text,
	"book_id" bigint,
	"authors" text[],
	"narrators" text[],
	"title" text,
	"subtitle" text,
	"html_preview" text,
	"language" text,
	"cover_url" text,
	"sample_url" text,
	"abridgement" text,
	"published" timestamp with time zone,
	"modified" timestamp with time zone,
	"publisher" text,
	"runtime" text,
	"filesize" bigint,
	"copyright" text,
	"author_name" text,
	"narrator_name" text,
	"isbn" text,
	"fullbookproduct_id" text,
	"active" timestamp with time zone,
	"inactive" timestamp with time zone,
	"territories" text[],
	"content_cost" numeric,
	"list_price" numeric,
	"list_price_currency" text,
	"sale_price" numeric,
	"sale_price_product" text,
	"object_id" char(10),
	"book_rank" real,
	"book_object_id" char(10)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "fbp_a" (
	"fullbookproduct_id" text,
	"fullbook_id" text,
	"purchaseproduct_code" text,
	"active" timestamp with time zone,
	"inactive" timestamp with time zone,
	"modified" timestamp with time zone,
	"territories" text[],
	"isbn" text,
	"content_cost" numeric(10, 2),
	"list_price" numeric(10, 2),
	"list_price_currency" text,
	"created_at" timestamp with time zone,
	"updated_at" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "fbp_b" (
	"fullbookproduct_id" text,
	"fullbook_id" text,
	"purchaseproduct_code" text,
	"active" timestamp with time zone,
	"inactive" timestamp with time zone,
	"modified" timestamp with time zone,
	"territories" text[],
	"isbn" text,
	"content_cost" numeric(10, 2),
	"list_price" numeric(10, 2),
	"list_price_currency" text,
	"created_at" timestamp with time zone,
	"updated_at" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "experiment" (
	"experiment_id" bigserial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"hypothesis" text,
	"variant_count" integer DEFAULT 2 NOT NULL,
	"live" boolean DEFAULT false NOT NULL,
	"audience" integer DEFAULT 100 NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"completed_at" timestamp with time zone,
	"variant_result" integer,
	"results" text,
	CONSTRAINT "experiment_name_key" UNIQUE("name")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "fullbookproduct_active" (
	"fullbookproduct_id" text,
	"fullbook_id" text,
	"purchaseproduct_code" text,
	"active" timestamp with time zone,
	"inactive" timestamp with time zone,
	"modified" timestamp with time zone,
	"territories" text[],
	"isbn" text,
	"content_cost" numeric(10, 2),
	"list_price" numeric(10, 2),
	"list_price_currency" text,
	"created_at" timestamp with time zone,
	"updated_at" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "keyword" (
	"keyword_id" bigserial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	CONSTRAINT "keyword_name_key" UNIQUE("name")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "gbook" (
	"book_id" bigint PRIMARY KEY NOT NULL,
	"gbook_id" text NOT NULL,
	"updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT "gbook_gbook_id_key" UNIQUE("gbook_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "loginbook" (
	"loginbook_id" bigserial PRIMARY KEY NOT NULL,
	"login_id" bigint NOT NULL,
	"book_id" bigint NOT NULL,
	"display_order" integer DEFAULT 0 NOT NULL,
	"is_active" boolean DEFAULT true NOT NULL,
	"created_at" timestamp with time zone DEFAULT now(),
	"updated_at" timestamp with time zone DEFAULT now(),
	CONSTRAINT "loginbook_login_id_book_id_key" UNIQUE("login_id","book_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "fullbookproduct_best" (
	"fullbookproduct_id" text,
	"fullbook_id" text,
	"purchaseproduct_code" text,
	"active" timestamp with time zone,
	"inactive" timestamp with time zone,
	"modified" timestamp with time zone,
	"territories" text[],
	"isbn" text,
	"content_cost" numeric(10, 2),
	"list_price" numeric(10, 2),
	"list_price_currency" text,
	"sale_price" numeric(10, 2)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "fullbookproduct_best_merged" (
	"fullbookproduct_id" text,
	"fullbook_id" text,
	"purchaseproduct_code" text,
	"active" timestamp with time zone,
	"inactive" timestamp with time zone,
	"modified" timestamp with time zone,
	"territories" text[],
	"isbn" text,
	"content_cost" numeric(10, 2),
	"list_price" numeric(10, 2),
	"list_price_currency" text,
	"created_at" timestamp with time zone,
	"updated_at" timestamp with time zone,
	"sale_price" numeric(10, 2)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "fullbooksummary" (
	"fullbook_id" text,
	"book_id" bigint,
	"authors" text[],
	"narrators" text[],
	"title" text,
	"subtitle" text,
	"html_preview" text,
	"language" text,
	"cover_url" text,
	"sample_url" text,
	"abridgement" text,
	"published" timestamp with time zone,
	"modified" timestamp with time zone,
	"publisher" text,
	"runtime" text,
	"filesize" bigint,
	"copyright" text,
	"author_name" text,
	"narrator_name" text,
	"isbn" text,
	"fullbookproduct_id" text,
	"active" timestamp with time zone,
	"inactive" timestamp with time zone,
	"territories" text[],
	"content_cost" numeric(10, 2),
	"list_price" numeric(10, 2),
	"list_price_currency" text,
	"sale_price" numeric(10, 2),
	"sale_price_product" text,
	"object_id" char(10),
	"book_rank" real,
	"book_object_id" char(10)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "invoice" (
	"invoice_id" text PRIMARY KEY NOT NULL,
	"stripe_id" text NOT NULL,
	"subtotal" numeric(10, 2) NOT NULL,
	"tax" numeric(10, 2) NOT NULL,
	"total" numeric(10, 2) NOT NULL,
	"coupon" text,
	"closed" boolean DEFAULT false NOT NULL,
	"paid" boolean DEFAULT false NOT NULL,
	"live" boolean DEFAULT false NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "purchaseproduct" (
	"purchaseproduct_code" text PRIMARY KEY NOT NULL,
	"amount" numeric(10, 2) NOT NULL,
	CONSTRAINT "purchaseproduct_amount_key" UNIQUE("amount")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "librarylists" (
	"list_id" bigint,
	"login_id" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "loginresettoken" (
	"token" char(10) PRIMARY KEY DEFAULT random_string(10) NOT NULL,
	"expiration" timestamp with time zone DEFAULT (now() + '1 day'::interval) NOT NULL,
	"login_id" bigint NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "likedlistcount" (
	"list_like_count" bigint,
	"list_id" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "listbooksinfo" (
	"listcoverimages" text[],
	"list_id" bigint,
	"listaudiotime" bigint[],
	"listbooks" bigint[],
	"listobjects" bpchar[],
	"bcount" integer
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "loginid" (
	"login_id" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "loginsession" (
	"loginsession_id" text PRIMARY KEY DEFAULT random_string(32) NOT NULL,
	"login_id" bigint NOT NULL,
	"expiration" timestamp with time zone DEFAULT loginsession_expiration() NOT NULL,
	CONSTRAINT "loginsession_login_id_key" UNIQUE("login_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "loginduplicate" (
	"object_id" char(10) PRIMARY KEY NOT NULL,
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"username" text,
	"email" text,
	"firstname" text,
	"lastname" text,
	"facebook_id" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_lists" (
	"list_id" bigserial PRIMARY KEY NOT NULL,
	"list_name" text,
	"login_id" bigint NOT NULL,
	"cover_image" text,
	"list_rank" serial NOT NULL,
	"list_active" boolean DEFAULT true,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"is_admin_created" boolean DEFAULT false,
	"list_type_status" text DEFAULT 'public',
	CONSTRAINT "user_lists_login_id_listname_key" UNIQUE("list_id","login_id","list_active")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "list_actions" (
	"list_id" bigint NOT NULL,
	"login_id" bigint NOT NULL,
	"like_status" boolean DEFAULT false,
	"share_status" boolean DEFAULT false,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "user_lists_login_id_list_id_key" UNIQUE("list_id","login_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv" (
	"period" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" bigint,
	"month2" bigint,
	"month3" bigint,
	"month4" bigint,
	"month5" bigint,
	"month6" bigint,
	"month7" bigint,
	"month8" bigint,
	"month9" bigint,
	"month10" bigint,
	"month11" bigint,
	"month12" bigint,
	"month13" bigint,
	"month14" bigint,
	"month15" bigint,
	"month16" bigint,
	"month17" bigint,
	"month18" bigint,
	"month19" bigint,
	"month20" bigint,
	"month21" bigint,
	"month22" bigint,
	"month23" bigint,
	"month24" bigint,
	"month25" bigint,
	"month26" bigint,
	"month27" bigint,
	"month28" bigint,
	"month29" bigint,
	"month30" bigint,
	"month31" bigint,
	"month32" bigint,
	"month33" bigint,
	"month34" bigint,
	"month35" bigint,
	"month36" bigint,
	"month37" bigint,
	"month38" bigint,
	"month39" bigint,
	"month40" bigint,
	"month41" bigint,
	"month42" bigint,
	"month43" bigint,
	"month44" bigint,
	"month45" bigint,
	"month46" bigint,
	"month47" bigint,
	"month48" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvdetail_android" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"months" integer,
	"subscription_id" text,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_%" (
	"period" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" double precision,
	"month2" double precision,
	"month3" double precision,
	"month4" double precision,
	"month5" double precision,
	"month6" double precision,
	"month7" double precision,
	"month8" double precision,
	"month9" double precision,
	"month10" double precision,
	"month11" double precision,
	"month12" double precision,
	"month13" double precision,
	"month14" double precision,
	"month15" double precision,
	"month16" double precision,
	"month17" double precision,
	"month18" double precision,
	"month19" double precision,
	"month20" double precision,
	"month21" double precision,
	"month22" double precision,
	"month23" double precision,
	"month24" double precision,
	"month25" double precision,
	"month26" double precision,
	"month27" double precision,
	"month28" double precision,
	"month29" double precision,
	"month30" double precision,
	"month31" double precision,
	"month32" double precision,
	"month33" double precision,
	"month34" double precision,
	"month35" double precision,
	"month36" double precision,
	"month37" double precision,
	"month38" double precision,
	"month39" double precision,
	"month40" double precision,
	"month41" double precision,
	"month42" double precision,
	"month43" double precision,
	"month44" double precision,
	"month45" double precision,
	"month46" double precision,
	"month47" double precision,
	"month48" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subscriptionmixpanel" (
	"subscriptionmixpanel_id" bigserial PRIMARY KEY NOT NULL,
	"subscription_id" bigint NOT NULL,
	"subject_id" bigint NOT NULL,
	CONSTRAINT "unique_subscription_subject_id" UNIQUE("subscription_id","subject_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_adset_trialsandsubs" (
	"period" text,
	"utm_campaign" text,
	"revenue" numeric,
	"trials" bigint,
	"subscribers" bigint,
	"month1" bigint,
	"month2" bigint,
	"month3" bigint,
	"month4" bigint,
	"month5" bigint,
	"month6" bigint,
	"month7" bigint,
	"month8" bigint,
	"month9" bigint,
	"month10" bigint,
	"month11" bigint,
	"month12" bigint,
	"month13" bigint,
	"month14" bigint,
	"month15" bigint,
	"month16" bigint,
	"month17" bigint,
	"month18" bigint,
	"month19" bigint,
	"month20" bigint,
	"month21" bigint,
	"month22" bigint,
	"month23" bigint,
	"month24" bigint,
	"month25" bigint,
	"month26" bigint,
	"month27" bigint,
	"month28" bigint,
	"month29" bigint,
	"month30" bigint,
	"month31" bigint,
	"month32" bigint,
	"month33" bigint,
	"month34" bigint,
	"month35" bigint,
	"month36" bigint,
	"month37" bigint,
	"month38" bigint,
	"month39" bigint,
	"month40" bigint,
	"month41" bigint,
	"month42" bigint,
	"month43" bigint,
	"month44" bigint,
	"month45" bigint,
	"month46" bigint,
	"month47" bigint,
	"month48" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_adset" (
	"period" text,
	"utm_campaign" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" bigint,
	"month2" bigint,
	"month3" bigint,
	"month4" bigint,
	"month5" bigint,
	"month6" bigint,
	"month7" bigint,
	"month8" bigint,
	"month9" bigint,
	"month10" bigint,
	"month11" bigint,
	"month12" bigint,
	"month13" bigint,
	"month14" bigint,
	"month15" bigint,
	"month16" bigint,
	"month17" bigint,
	"month18" bigint,
	"month19" bigint,
	"month20" bigint,
	"month21" bigint,
	"month22" bigint,
	"month23" bigint,
	"month24" bigint,
	"month25" bigint,
	"month26" bigint,
	"month27" bigint,
	"month28" bigint,
	"month29" bigint,
	"month30" bigint,
	"month31" bigint,
	"month32" bigint,
	"month33" bigint,
	"month34" bigint,
	"month35" bigint,
	"month36" bigint,
	"month37" bigint,
	"month38" bigint,
	"month39" bigint,
	"month40" bigint,
	"month41" bigint,
	"month42" bigint,
	"month43" bigint,
	"month44" bigint,
	"month45" bigint,
	"month46" bigint,
	"month47" bigint,
	"month48" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvdetail_apple" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"months" integer,
	"subscription_id" bigint,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"utm_source" text,
	"utm_campaign" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvdetail_invoice" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"months" integer,
	"login_stripe_id" text,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"utm_source" text,
	"utm_campaign" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_adset_%" (
	"period" text,
	"utm_campaign" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" double precision,
	"month2" double precision,
	"month3" double precision,
	"month4" double precision,
	"month5" double precision,
	"month6" double precision,
	"month7" double precision,
	"month8" double precision,
	"month9" double precision,
	"month10" double precision,
	"month11" double precision,
	"month12" double precision,
	"month13" double precision,
	"month14" double precision,
	"month15" double precision,
	"month16" double precision,
	"month17" double precision,
	"month18" double precision,
	"month19" double precision,
	"month20" double precision,
	"month21" double precision,
	"month22" double precision,
	"month23" double precision,
	"month24" double precision,
	"month25" double precision,
	"month26" double precision,
	"month27" double precision,
	"month28" double precision,
	"month29" double precision,
	"month30" double precision,
	"month31" double precision,
	"month32" double precision,
	"month33" double precision,
	"month34" double precision,
	"month35" double precision,
	"month36" double precision,
	"month37" double precision,
	"month38" double precision,
	"month39" double precision,
	"month40" double precision,
	"month41" double precision,
	"month42" double precision,
	"month43" double precision,
	"month44" double precision,
	"month45" double precision,
	"month46" double precision,
	"month47" double precision,
	"month48" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvperiod_android" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"month1" integer,
	"month2" integer,
	"month3" integer,
	"month4" integer,
	"month5" integer,
	"month6" integer,
	"month7" integer,
	"month8" integer,
	"month9" integer,
	"month10" integer,
	"month11" integer,
	"month12" integer,
	"month13" integer,
	"month14" integer,
	"month15" integer,
	"month16" integer,
	"month17" integer,
	"month18" integer,
	"month19" integer,
	"month20" integer,
	"month21" integer,
	"month22" integer,
	"month23" integer,
	"month24" integer,
	"month25" integer,
	"month26" integer,
	"month27" integer,
	"month28" integer,
	"month29" integer,
	"month30" integer,
	"month31" integer,
	"month32" integer,
	"month33" integer,
	"month34" integer,
	"month35" integer,
	"month36" integer,
	"month37" integer,
	"month38" integer,
	"month39" integer,
	"month40" integer,
	"month41" integer,
	"month42" integer,
	"month43" integer,
	"month44" integer,
	"month45" integer,
	"month46" integer,
	"month47" integer,
	"month48" integer,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvperiod_apple" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"month1" integer,
	"month2" integer,
	"month3" integer,
	"month4" integer,
	"month5" integer,
	"month6" integer,
	"month7" integer,
	"month8" integer,
	"month9" integer,
	"month10" integer,
	"month11" integer,
	"month12" integer,
	"month13" integer,
	"month14" integer,
	"month15" integer,
	"month16" integer,
	"month17" integer,
	"month18" integer,
	"month19" integer,
	"month20" integer,
	"month21" integer,
	"month22" integer,
	"month23" integer,
	"month24" integer,
	"month25" integer,
	"month26" integer,
	"month27" integer,
	"month28" integer,
	"month29" integer,
	"month30" integer,
	"month31" integer,
	"month32" integer,
	"month33" integer,
	"month34" integer,
	"month35" integer,
	"month36" integer,
	"month37" integer,
	"month38" integer,
	"month39" integer,
	"month40" integer,
	"month41" integer,
	"month42" integer,
	"month43" integer,
	"month44" integer,
	"month45" integer,
	"month46" integer,
	"month47" integer,
	"month48" integer,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"utm_source" text,
	"utm_campaign" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_apple_%" (
	"period" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" double precision,
	"month2" double precision,
	"month3" double precision,
	"month4" double precision,
	"month5" double precision,
	"month6" double precision,
	"month7" double precision,
	"month8" double precision,
	"month9" double precision,
	"month10" double precision,
	"month11" double precision,
	"month12" double precision,
	"month13" double precision,
	"month14" double precision,
	"month15" double precision,
	"month16" double precision,
	"month17" double precision,
	"month18" double precision,
	"month19" double precision,
	"month20" double precision,
	"month21" double precision,
	"month22" double precision,
	"month23" double precision,
	"month24" double precision,
	"month25" double precision,
	"month26" double precision,
	"month27" double precision,
	"month28" double precision,
	"month29" double precision,
	"month30" double precision,
	"month31" double precision,
	"month32" double precision,
	"month33" double precision,
	"month34" double precision,
	"month35" double precision,
	"month36" double precision,
	"month37" double precision,
	"month38" double precision,
	"month39" double precision,
	"month40" double precision,
	"month41" double precision,
	"month42" double precision,
	"month43" double precision,
	"month44" double precision,
	"month45" double precision,
	"month46" double precision,
	"month47" double precision,
	"month48" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvperiod_invoice" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"month1" integer,
	"month2" integer,
	"month3" integer,
	"month4" integer,
	"month5" integer,
	"month6" integer,
	"month7" integer,
	"month8" integer,
	"month9" integer,
	"month10" integer,
	"month11" integer,
	"month12" integer,
	"month13" integer,
	"month14" integer,
	"month15" integer,
	"month16" integer,
	"month17" integer,
	"month18" integer,
	"month19" integer,
	"month20" integer,
	"month21" integer,
	"month22" integer,
	"month23" integer,
	"month24" integer,
	"month25" integer,
	"month26" integer,
	"month27" integer,
	"month28" integer,
	"month29" integer,
	"month30" integer,
	"month31" integer,
	"month32" integer,
	"month33" integer,
	"month34" integer,
	"month35" integer,
	"month36" integer,
	"month37" integer,
	"month38" integer,
	"month39" integer,
	"month40" integer,
	"month41" integer,
	"month42" integer,
	"month43" integer,
	"month44" integer,
	"month45" integer,
	"month46" integer,
	"month47" integer,
	"month48" integer,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"utm_source" text,
	"utm_campaign" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvdetail_apple_trialsandsubs" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"months" integer,
	"subscription_id" bigint,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"utm_source" text,
	"utm_campaign" text,
	"trial" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvperiod" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"month1" integer,
	"month2" integer,
	"month3" integer,
	"month4" integer,
	"month5" integer,
	"month6" integer,
	"month7" integer,
	"month8" integer,
	"month9" integer,
	"month10" integer,
	"month11" integer,
	"month12" integer,
	"month13" integer,
	"month14" integer,
	"month15" integer,
	"month16" integer,
	"month17" integer,
	"month18" integer,
	"month19" integer,
	"month20" integer,
	"month21" integer,
	"month22" integer,
	"month23" integer,
	"month24" integer,
	"month25" integer,
	"month26" integer,
	"month27" integer,
	"month28" integer,
	"month29" integer,
	"month30" integer,
	"month31" integer,
	"month32" integer,
	"month33" integer,
	"month34" integer,
	"month35" integer,
	"month36" integer,
	"month37" integer,
	"month38" integer,
	"month39" integer,
	"month40" integer,
	"month41" integer,
	"month42" integer,
	"month43" integer,
	"month44" integer,
	"month45" integer,
	"month46" integer,
	"month47" integer,
	"month48" integer,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"utm_source" text,
	"utm_campaign" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_adset_trialsandsubs_%" (
	"period" text,
	"utm_campaign" text,
	"revenue" numeric,
	"trials" bigint,
	"subscribers" bigint,
	"month1" double precision,
	"month2" double precision,
	"month3" double precision,
	"month4" double precision,
	"month5" double precision,
	"month6" double precision,
	"month7" double precision,
	"month8" double precision,
	"month9" double precision,
	"month10" double precision,
	"month11" double precision,
	"month12" double precision,
	"month13" double precision,
	"month14" double precision,
	"month15" double precision,
	"month16" double precision,
	"month17" double precision,
	"month18" double precision,
	"month19" double precision,
	"month20" double precision,
	"month21" double precision,
	"month22" double precision,
	"month23" double precision,
	"month24" double precision,
	"month25" double precision,
	"month26" double precision,
	"month27" double precision,
	"month28" double precision,
	"month29" double precision,
	"month30" double precision,
	"month31" double precision,
	"month32" double precision,
	"month33" double precision,
	"month34" double precision,
	"month35" double precision,
	"month36" double precision,
	"month37" double precision,
	"month38" double precision,
	"month39" double precision,
	"month40" double precision,
	"month41" double precision,
	"month42" double precision,
	"month43" double precision,
	"month44" double precision,
	"month45" double precision,
	"month46" double precision,
	"month47" double precision,
	"month48" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvdetail_invoice_trialsandsubs" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"months" integer,
	"login_stripe_id" text,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"utm_source" text,
	"utm_campaign" text,
	"trial" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvperiod_apple_trialsandsubs" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"month1" integer,
	"month2" integer,
	"month3" integer,
	"month4" integer,
	"month5" integer,
	"month6" integer,
	"month7" integer,
	"month8" integer,
	"month9" integer,
	"month10" integer,
	"month11" integer,
	"month12" integer,
	"month13" integer,
	"month14" integer,
	"month15" integer,
	"month16" integer,
	"month17" integer,
	"month18" integer,
	"month19" integer,
	"month20" integer,
	"month21" integer,
	"month22" integer,
	"month23" integer,
	"month24" integer,
	"month25" integer,
	"month26" integer,
	"month27" integer,
	"month28" integer,
	"month29" integer,
	"month30" integer,
	"month31" integer,
	"month32" integer,
	"month33" integer,
	"month34" integer,
	"month35" integer,
	"month36" integer,
	"month37" integer,
	"month38" integer,
	"month39" integer,
	"month40" integer,
	"month41" integer,
	"month42" integer,
	"month43" integer,
	"month44" integer,
	"month45" integer,
	"month46" integer,
	"month47" integer,
	"month48" integer,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"utm_source" text,
	"utm_campaign" text,
	"trial" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_amount" (
	"period" text,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"revenue" numeric,
	"subscribers" bigint,
	"month1" bigint,
	"month2" bigint,
	"month3" bigint,
	"month4" bigint,
	"month5" bigint,
	"month6" bigint,
	"month7" bigint,
	"month8" bigint,
	"month9" bigint,
	"month10" bigint,
	"month11" bigint,
	"month12" bigint,
	"month13" bigint,
	"month14" bigint,
	"month15" bigint,
	"month16" bigint,
	"month17" bigint,
	"month18" bigint,
	"month19" bigint,
	"month20" bigint,
	"month21" bigint,
	"month22" bigint,
	"month23" bigint,
	"month24" bigint,
	"month25" bigint,
	"month26" bigint,
	"month27" bigint,
	"month28" bigint,
	"month29" bigint,
	"month30" bigint,
	"month31" bigint,
	"month32" bigint,
	"month33" bigint,
	"month34" bigint,
	"month35" bigint,
	"month36" bigint,
	"month37" bigint,
	"month38" bigint,
	"month39" bigint,
	"month40" bigint,
	"month41" bigint,
	"month42" bigint,
	"month43" bigint,
	"month44" bigint,
	"month45" bigint,
	"month46" bigint,
	"month47" bigint,
	"month48" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvperiod_invoice_trialsandsubs" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"month1" integer,
	"month2" integer,
	"month3" integer,
	"month4" integer,
	"month5" integer,
	"month6" integer,
	"month7" integer,
	"month8" integer,
	"month9" integer,
	"month10" integer,
	"month11" integer,
	"month12" integer,
	"month13" integer,
	"month14" integer,
	"month15" integer,
	"month16" integer,
	"month17" integer,
	"month18" integer,
	"month19" integer,
	"month20" integer,
	"month21" integer,
	"month22" integer,
	"month23" integer,
	"month24" integer,
	"month25" integer,
	"month26" integer,
	"month27" integer,
	"month28" integer,
	"month29" integer,
	"month30" integer,
	"month31" integer,
	"month32" integer,
	"month33" integer,
	"month34" integer,
	"month35" integer,
	"month36" integer,
	"month37" integer,
	"month38" integer,
	"month39" integer,
	"month40" integer,
	"month41" integer,
	"month42" integer,
	"month43" integer,
	"month44" integer,
	"month45" integer,
	"month46" integer,
	"month47" integer,
	"month48" integer,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"utm_source" text,
	"utm_campaign" text,
	"trial" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvperiod_trialsandsubs" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"month1" integer,
	"month2" integer,
	"month3" integer,
	"month4" integer,
	"month5" integer,
	"month6" integer,
	"month7" integer,
	"month8" integer,
	"month9" integer,
	"month10" integer,
	"month11" integer,
	"month12" integer,
	"month13" integer,
	"month14" integer,
	"month15" integer,
	"month16" integer,
	"month17" integer,
	"month18" integer,
	"month19" integer,
	"month20" integer,
	"month21" integer,
	"month22" integer,
	"month23" integer,
	"month24" integer,
	"month25" integer,
	"month26" integer,
	"month27" integer,
	"month28" integer,
	"month29" integer,
	"month30" integer,
	"month31" integer,
	"month32" integer,
	"month33" integer,
	"month34" integer,
	"month35" integer,
	"month36" integer,
	"month37" integer,
	"month38" integer,
	"month39" integer,
	"month40" integer,
	"month41" integer,
	"month42" integer,
	"month43" integer,
	"month44" integer,
	"month45" integer,
	"month46" integer,
	"month47" integer,
	"month48" integer,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"utm_source" text,
	"utm_campaign" text,
	"trial" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_invoice" (
	"period" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" bigint,
	"month2" bigint,
	"month3" bigint,
	"month4" bigint,
	"month5" bigint,
	"month6" bigint,
	"month7" bigint,
	"month8" bigint,
	"month9" bigint,
	"month10" bigint,
	"month11" bigint,
	"month12" bigint,
	"month13" bigint,
	"month14" bigint,
	"month15" bigint,
	"month16" bigint,
	"month17" bigint,
	"month18" bigint,
	"month19" bigint,
	"month20" bigint,
	"month21" bigint,
	"month22" bigint,
	"month23" bigint,
	"month24" bigint,
	"month25" bigint,
	"month26" bigint,
	"month27" bigint,
	"month28" bigint,
	"month29" bigint,
	"month30" bigint,
	"month31" bigint,
	"month32" bigint,
	"month33" bigint,
	"month34" bigint,
	"month35" bigint,
	"month36" bigint,
	"month37" bigint,
	"month38" bigint,
	"month39" bigint,
	"month40" bigint,
	"month41" bigint,
	"month42" bigint,
	"month43" bigint,
	"month44" bigint,
	"month45" bigint,
	"month46" bigint,
	"month47" bigint,
	"month48" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_amount_%" (
	"period" text,
	"subscriptiongroup" text,
	"amount" numeric(10, 2),
	"revenue" numeric,
	"subscribers" bigint,
	"month1" double precision,
	"month2" double precision,
	"month3" double precision,
	"month4" double precision,
	"month5" double precision,
	"month6" double precision,
	"month7" double precision,
	"month8" double precision,
	"month9" double precision,
	"month10" double precision,
	"month11" double precision,
	"month12" double precision,
	"month13" double precision,
	"month14" double precision,
	"month15" double precision,
	"month16" double precision,
	"month17" double precision,
	"month18" double precision,
	"month19" double precision,
	"month20" double precision,
	"month21" double precision,
	"month22" double precision,
	"month23" double precision,
	"month24" double precision,
	"month25" double precision,
	"month26" double precision,
	"month27" double precision,
	"month28" double precision,
	"month29" double precision,
	"month30" double precision,
	"month31" double precision,
	"month32" double precision,
	"month33" double precision,
	"month34" double precision,
	"month35" double precision,
	"month36" double precision,
	"month37" double precision,
	"month38" double precision,
	"month39" double precision,
	"month40" double precision,
	"month41" double precision,
	"month42" double precision,
	"month43" double precision,
	"month44" double precision,
	"month45" double precision,
	"month46" double precision,
	"month47" double precision,
	"month48" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_base_apple" (
	"subscription_id" bigint,
	"product_interval" "product_interval",
	"period_0" timestamp with time zone,
	"period_1_days" double precision,
	"period_2_days" double precision,
	"period_3_days" double precision,
	"period_4_days" double precision,
	"period_5_days" double precision,
	"period_6_days" double precision,
	"period_7_days" double precision,
	"period_8_days" double precision,
	"period_9_days" double precision,
	"period_10_days" double precision,
	"period_11_days" double precision,
	"period_12_days" double precision,
	"period_13_days" double precision,
	"period_14_days" double precision,
	"period_15_days" double precision,
	"period_16_days" double precision,
	"period_17_days" double precision,
	"period_18_days" double precision,
	"period_19_days" double precision,
	"period_20_days" double precision,
	"period_21_days" double precision,
	"period_22_days" double precision,
	"period_23_days" double precision,
	"period_24_days" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_android" (
	"period" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" bigint,
	"month2" bigint,
	"month3" bigint,
	"month4" bigint,
	"month5" bigint,
	"month6" bigint,
	"month7" bigint,
	"month8" bigint,
	"month9" bigint,
	"month10" bigint,
	"month11" bigint,
	"month12" bigint,
	"month13" bigint,
	"month14" bigint,
	"month15" bigint,
	"month16" bigint,
	"month17" bigint,
	"month18" bigint,
	"month19" bigint,
	"month20" bigint,
	"month21" bigint,
	"month22" bigint,
	"month23" bigint,
	"month24" bigint,
	"month25" bigint,
	"month26" bigint,
	"month27" bigint,
	"month28" bigint,
	"month29" bigint,
	"month30" bigint,
	"month31" bigint,
	"month32" bigint,
	"month33" bigint,
	"month34" bigint,
	"month35" bigint,
	"month36" bigint,
	"month37" bigint,
	"month38" bigint,
	"month39" bigint,
	"month40" bigint,
	"month41" bigint,
	"month42" bigint,
	"month43" bigint,
	"month44" bigint,
	"month45" bigint,
	"month46" bigint,
	"month47" bigint,
	"month48" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_apple" (
	"period" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" bigint,
	"month2" bigint,
	"month3" bigint,
	"month4" bigint,
	"month5" bigint,
	"month6" bigint,
	"month7" bigint,
	"month8" bigint,
	"month9" bigint,
	"month10" bigint,
	"month11" bigint,
	"month12" bigint,
	"month13" bigint,
	"month14" bigint,
	"month15" bigint,
	"month16" bigint,
	"month17" bigint,
	"month18" bigint,
	"month19" bigint,
	"month20" bigint,
	"month21" bigint,
	"month22" bigint,
	"month23" bigint,
	"month24" bigint,
	"month25" bigint,
	"month26" bigint,
	"month27" bigint,
	"month28" bigint,
	"month29" bigint,
	"month30" bigint,
	"month31" bigint,
	"month32" bigint,
	"month33" bigint,
	"month34" bigint,
	"month35" bigint,
	"month36" bigint,
	"month37" bigint,
	"month38" bigint,
	"month39" bigint,
	"month40" bigint,
	"month41" bigint,
	"month42" bigint,
	"month43" bigint,
	"month44" bigint,
	"month45" bigint,
	"month46" bigint,
	"month47" bigint,
	"month48" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_base_invoice" (
	"subscription_id" text,
	"product_interval" "product_interval",
	"period_0" timestamp with time zone,
	"period_1_days" double precision,
	"period_2_days" double precision,
	"period_3_days" double precision,
	"period_4_days" double precision,
	"period_5_days" double precision,
	"period_6_days" double precision,
	"period_7_days" double precision,
	"period_8_days" double precision,
	"period_9_days" double precision,
	"period_10_days" double precision,
	"period_11_days" double precision,
	"period_12_days" double precision,
	"period_13_days" double precision,
	"period_14_days" double precision,
	"period_15_days" double precision,
	"period_16_days" double precision,
	"period_17_days" double precision,
	"period_18_days" double precision,
	"period_19_days" double precision,
	"period_20_days" double precision,
	"period_21_days" double precision,
	"period_22_days" double precision,
	"period_23_days" double precision,
	"period_24_days" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_source_trialsandsubs" (
	"period" text,
	"utm_source" text,
	"revenue" numeric,
	"trials" bigint,
	"subscribers" bigint,
	"month1" bigint,
	"month2" bigint,
	"month3" bigint,
	"month4" bigint,
	"month5" bigint,
	"month6" bigint,
	"month7" bigint,
	"month8" bigint,
	"month9" bigint,
	"month10" bigint,
	"month11" bigint,
	"month12" bigint,
	"month13" bigint,
	"month14" bigint,
	"month15" bigint,
	"month16" bigint,
	"month17" bigint,
	"month18" bigint,
	"month19" bigint,
	"month20" bigint,
	"month21" bigint,
	"month22" bigint,
	"month23" bigint,
	"month24" bigint,
	"month25" bigint,
	"month26" bigint,
	"month27" bigint,
	"month28" bigint,
	"month29" bigint,
	"month30" bigint,
	"month31" bigint,
	"month32" bigint,
	"month33" bigint,
	"month34" bigint,
	"month35" bigint,
	"month36" bigint,
	"month37" bigint,
	"month38" bigint,
	"month39" bigint,
	"month40" bigint,
	"month41" bigint,
	"month42" bigint,
	"month43" bigint,
	"month44" bigint,
	"month45" bigint,
	"month46" bigint,
	"month47" bigint,
	"month48" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_base" (
	"cohort" text,
	"platform" text,
	"product_interval" text,
	"period_1" double precision,
	"period_2" double precision,
	"period_3" double precision,
	"period_4" double precision,
	"period_5" double precision,
	"period_6" double precision,
	"period_7" double precision,
	"period_8" double precision,
	"period_9" double precision,
	"period_10" double precision,
	"period_11" double precision,
	"period_12" double precision,
	"period_13" double precision,
	"period_14" double precision,
	"period_15" double precision,
	"period_16" double precision,
	"period_17" double precision,
	"period_18" double precision,
	"period_19" double precision,
	"period_20" double precision,
	"period_21" double precision,
	"period_22" double precision,
	"period_23" double precision,
	"period_24" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_invoice_%" (
	"period" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" double precision,
	"month2" double precision,
	"month3" double precision,
	"month4" double precision,
	"month5" double precision,
	"month6" double precision,
	"month7" double precision,
	"month8" double precision,
	"month9" double precision,
	"month10" double precision,
	"month11" double precision,
	"month12" double precision,
	"month13" double precision,
	"month14" double precision,
	"month15" double precision,
	"month16" double precision,
	"month17" double precision,
	"month18" double precision,
	"month19" double precision,
	"month20" double precision,
	"month21" double precision,
	"month22" double precision,
	"month23" double precision,
	"month24" double precision,
	"month25" double precision,
	"month26" double precision,
	"month27" double precision,
	"month28" double precision,
	"month29" double precision,
	"month30" double precision,
	"month31" double precision,
	"month32" double precision,
	"month33" double precision,
	"month34" double precision,
	"month35" double precision,
	"month36" double precision,
	"month37" double precision,
	"month38" double precision,
	"month39" double precision,
	"month40" double precision,
	"month41" double precision,
	"month42" double precision,
	"month43" double precision,
	"month44" double precision,
	"month45" double precision,
	"month46" double precision,
	"month47" double precision,
	"month48" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_source" (
	"period" text,
	"utm_source" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" bigint,
	"month2" bigint,
	"month3" bigint,
	"month4" bigint,
	"month5" bigint,
	"month6" bigint,
	"month7" bigint,
	"month8" bigint,
	"month9" bigint,
	"month10" bigint,
	"month11" bigint,
	"month12" bigint,
	"month13" bigint,
	"month14" bigint,
	"month15" bigint,
	"month16" bigint,
	"month17" bigint,
	"month18" bigint,
	"month19" bigint,
	"month20" bigint,
	"month21" bigint,
	"month22" bigint,
	"month23" bigint,
	"month24" bigint,
	"month25" bigint,
	"month26" bigint,
	"month27" bigint,
	"month28" bigint,
	"month29" bigint,
	"month30" bigint,
	"month31" bigint,
	"month32" bigint,
	"month33" bigint,
	"month34" bigint,
	"month35" bigint,
	"month36" bigint,
	"month37" bigint,
	"month38" bigint,
	"month39" bigint,
	"month40" bigint,
	"month41" bigint,
	"month42" bigint,
	"month43" bigint,
	"month44" bigint,
	"month45" bigint,
	"month46" bigint,
	"month47" bigint,
	"month48" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_source_%" (
	"period" text,
	"utm_source" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" double precision,
	"month2" double precision,
	"month3" double precision,
	"month4" double precision,
	"month5" double precision,
	"month6" double precision,
	"month7" double precision,
	"month8" double precision,
	"month9" double precision,
	"month10" double precision,
	"month11" double precision,
	"month12" double precision,
	"month13" double precision,
	"month14" double precision,
	"month15" double precision,
	"month16" double precision,
	"month17" double precision,
	"month18" double precision,
	"month19" double precision,
	"month20" double precision,
	"month21" double precision,
	"month22" double precision,
	"month23" double precision,
	"month24" double precision,
	"month25" double precision,
	"month26" double precision,
	"month27" double precision,
	"month28" double precision,
	"month29" double precision,
	"month30" double precision,
	"month31" double precision,
	"month32" double precision,
	"month33" double precision,
	"month34" double precision,
	"month35" double precision,
	"month36" double precision,
	"month37" double precision,
	"month38" double precision,
	"month39" double precision,
	"month40" double precision,
	"month41" double precision,
	"month42" double precision,
	"month43" double precision,
	"month44" double precision,
	"month45" double precision,
	"month46" double precision,
	"month47" double precision,
	"month48" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_source_trialsandsubs_%" (
	"period" text,
	"utm_source" text,
	"revenue" numeric,
	"trials" bigint,
	"subscribers" bigint,
	"month1" double precision,
	"month2" double precision,
	"month3" double precision,
	"month4" double precision,
	"month5" double precision,
	"month6" double precision,
	"month7" double precision,
	"month8" double precision,
	"month9" double precision,
	"month10" double precision,
	"month11" double precision,
	"month12" double precision,
	"month13" double precision,
	"month14" double precision,
	"month15" double precision,
	"month16" double precision,
	"month17" double precision,
	"month18" double precision,
	"month19" double precision,
	"month20" double precision,
	"month21" double precision,
	"month22" double precision,
	"month23" double precision,
	"month24" double precision,
	"month25" double precision,
	"month26" double precision,
	"month27" double precision,
	"month28" double precision,
	"month29" double precision,
	"month30" double precision,
	"month31" double precision,
	"month32" double precision,
	"month33" double precision,
	"month34" double precision,
	"month35" double precision,
	"month36" double precision,
	"month37" double precision,
	"month38" double precision,
	"month39" double precision,
	"month40" double precision,
	"month41" double precision,
	"month42" double precision,
	"month43" double precision,
	"month44" double precision,
	"month45" double precision,
	"month46" double precision,
	"month47" double precision,
	"month48" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_subscriptiongroup" (
	"period" text,
	"subscriptiongroup" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" bigint,
	"month2" bigint,
	"month3" bigint,
	"month4" bigint,
	"month5" bigint,
	"month6" bigint,
	"month7" bigint,
	"month8" bigint,
	"month9" bigint,
	"month10" bigint,
	"month11" bigint,
	"month12" bigint,
	"month13" bigint,
	"month14" bigint,
	"month15" bigint,
	"month16" bigint,
	"month17" bigint,
	"month18" bigint,
	"month19" bigint,
	"month20" bigint,
	"month21" bigint,
	"month22" bigint,
	"month23" bigint,
	"month24" bigint,
	"month25" bigint,
	"month26" bigint,
	"month27" bigint,
	"month28" bigint,
	"month29" bigint,
	"month30" bigint,
	"month31" bigint,
	"month32" bigint,
	"month33" bigint,
	"month34" bigint,
	"month35" bigint,
	"month36" bigint,
	"month37" bigint,
	"month38" bigint,
	"month39" bigint,
	"month40" bigint,
	"month41" bigint,
	"month42" bigint,
	"month43" bigint,
	"month44" bigint,
	"month45" bigint,
	"month46" bigint,
	"month47" bigint,
	"month48" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltv_subscriptiongroup_%" (
	"period" text,
	"subscriptiongroup" text,
	"revenue" numeric,
	"subscribers" bigint,
	"month1" double precision,
	"month2" double precision,
	"month3" double precision,
	"month4" double precision,
	"month5" double precision,
	"month6" double precision,
	"month7" double precision,
	"month8" double precision,
	"month9" double precision,
	"month10" double precision,
	"month11" double precision,
	"month12" double precision,
	"month13" double precision,
	"month14" double precision,
	"month15" double precision,
	"month16" double precision,
	"month17" double precision,
	"month18" double precision,
	"month19" double precision,
	"month20" double precision,
	"month21" double precision,
	"month22" double precision,
	"month23" double precision,
	"month24" double precision,
	"month25" double precision,
	"month26" double precision,
	"month27" double precision,
	"month28" double precision,
	"month29" double precision,
	"month30" double precision,
	"month31" double precision,
	"month32" double precision,
	"month33" double precision,
	"month34" double precision,
	"month35" double precision,
	"month36" double precision,
	"month37" double precision,
	"month38" double precision,
	"month39" double precision,
	"month40" double precision,
	"month41" double precision,
	"month42" double precision,
	"month43" double precision,
	"month44" double precision,
	"month45" double precision,
	"month46" double precision,
	"month47" double precision,
	"month48" double precision
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "ltvdetail" (
	"period" text,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"months" integer,
	"subscription_id" text,
	"revenue" numeric,
	"subscriptiongroup" text,
	"amount" numeric(10, 2)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "max_expire" (
	"max" date
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subject" (
	"subject_id" bigserial PRIMARY KEY NOT NULL,
	"object_id" char(15) DEFAULT random_string(15) NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"utm_source" text,
	"utm_campaign" text,
	"utm_medium" text,
	"utm_content" text,
	"utm_term" text,
	CONSTRAINT "subject_object_id_key" UNIQUE("object_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "metrics_cache" (
	"metric_id" bigserial PRIMARY KEY NOT NULL,
	"metric_date" date,
	"bucket" varchar(15) NOT NULL,
	"mean" numeric,
	"bin03" numeric,
	"bin37" numeric,
	"bin71" numeric,
	"user_count" integer,
	"total_swiped" integer,
	"platform" varchar(20),
	"avg_session_swipe" integer,
	CONSTRAINT "metrics_cache_metric_date_bucket_platform_key" UNIQUE("metric_date","bucket","platform")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "narratedarticles" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"narrator_id" bigint,
	"book_cards_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "narrator" (
	"narrator_id" bigserial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"thumbnail_url" text,
	"login_id" bigint NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"objectId" char(10) DEFAULT random_string(10) NOT NULL,
	"bio" text,
	CONSTRAINT "narrator_objectId_key" UNIQUE("objectId")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "stripeannualrenewalrate" (
	"period" text,
	"code" text,
	"year1" bigint,
	"year2" bigint,
	"year2percent" numeric,
	"year3" bigint,
	"year3percent" numeric
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "purchaseproduct_range" (
	"purchaseproduct_code" text,
	"amount" numeric(10, 2),
	"min_amount" numeric
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "report" (
	"report_id" bigserial PRIMARY KEY NOT NULL,
	"title" text NOT NULL,
	"sql" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "oauthtoken" (
	"access_token" text PRIMARY KEY NOT NULL,
	"token_type" text,
	"expiration" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "recommendedcards" (
	"card_id" bigint,
	"shares_count" bigint
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "notifications" (
	"login_id" bigint NOT NULL,
	"notification_type" "notif_type",
	"meta" jsonb,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subscription_invalid" (
	"subscription_id" bigint,
	"expiration" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subjectsubscription" (
	"subject_id" bigint,
	"redemption_start" timestamp with time zone,
	"redemption_end" timestamp with time zone,
	"redemption_products" text[],
	"stripe_trial_start" timestamp with time zone,
	"stripe_trial_end" timestamp with time zone,
	"stripe_start" timestamp with time zone,
	"stripe_end" timestamp with time zone,
	"stripe_products" text[],
	"apple_trial_start" timestamp with time zone,
	"apple_trial_end" timestamp with time zone,
	"apple_start" timestamp with time zone,
	"apple_end" timestamp with time zone,
	"apple_products" text[],
	"android_trial_start" timestamp with time zone,
	"android_trial_end" timestamp with time zone,
	"android_start" timestamp with time zone,
	"android_end" timestamp with time zone,
	"android_products" text[]
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subscription_appsflyer" (
	"id" serial PRIMARY KEY NOT NULL,
	"subscription_id" text NOT NULL,
	"appsflyer_id" text NOT NULL,
	"advertising_id" text,
	"idfa" text,
	"event_name" text,
	"bundle_id" text,
	"created_at" timestamp with time zone DEFAULT now(),
	"updated_at" timestamp with time zone DEFAULT now(),
	CONSTRAINT "subscription_appsflyer_subscription_id_key" UNIQUE("subscription_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subscriptionnotification" (
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"json" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subscriptionnotification_extract" (
	"environment" text,
	"notification_type" text,
	"subscription_id" bigint,
	"subscriptiondetail_id" bigint,
	"trial" boolean,
	"product" text,
	"auto_renew_status" boolean,
	"auto_renew_product" text,
	"created_at" timestamp with time zone,
	"json" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "redemption" (
	"redemption_id" varchar(12) PRIMARY KEY DEFAULT random_string(12) NOT NULL,
	"subscriptionproduct_id" bigint NOT NULL,
	"login_id" bigint,
	"campaign" text NOT NULL,
	"redeemed" timestamp with time zone,
	"expiration" timestamp with time zone,
	"object_id" char(10) DEFAULT random_string(10) NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "redemption_object_id_key" UNIQUE("object_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_profile" (
	"login_id" bigint NOT NULL,
	"userhandle" text,
	"firstname" text,
	"lastname" text,
	"website" text,
	"description" text,
	"profile_picture" text,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"notification_setting" jsonb,
	"email" text,
	CONSTRAINT "user_profile_login_id_key" UNIQUE("login_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_fcm" (
	"subject_id" bigint PRIMARY KEY NOT NULL,
	"fcm_id" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "testdiscoverdailypick" (
	"author_name" text,
	"communityauthor_name" text,
	"category_name" text,
	"book_text_count" bigint,
	"book_text_duration" bigint,
	"book_audio_count" bigint,
	"book_audio_duration" bigint,
	"book_visualize_count" bigint,
	"book_visualize_duration" integer,
	"book_id" bigint,
	"author_id" bigint,
	"communityauthor_id" bigint,
	"category_id" bigint,
	"object_id" char(10),
	"updated_at" timestamp with time zone,
	"created_at" timestamp with time zone,
	"title" text,
	"subtitle" text,
	"summary_type" text,
	"published_at" timestamp(0) with time zone,
	"isbn10" text,
	"isbn13" text,
	"fiction" boolean,
	"live" boolean,
	"markdown_preview" text,
	"cover_url" text,
	"thumbnail_url" text,
	"banner_url" text,
	"fullbook_ids" text[],
	"discover_url" text,
	"preview_url" text,
	"subcategory_ids" bigint[],
	"subcategory_names" text[],
	"content_id" bigint,
	"provider_id" bigint,
	"provider_name" text,
	"provider_type" text,
	"book_cards_count" bigint,
	"book_read" boolean,
	"book_listen" boolean,
	"start_date" timestamp with time zone,
	"end_date" timestamp with time zone,
	"is_active" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_filter_categories" (
	"user_filter_categories_id" bigserial PRIMARY KEY NOT NULL,
	"login_id" bigint NOT NULL,
	"category_filter_ids" integer[],
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "user_filter_categories_login_id_key" UNIQUE("login_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "userfirebasemap" (
	"firebasemap_id" bigserial PRIMARY KEY NOT NULL,
	"firebase_id" text NOT NULL,
	"login_id" bigint NOT NULL,
	"subject" text NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "user_firebase_map_ukey" UNIQUE("firebase_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_follow" (
	"user_login" bigint,
	"follower_login" bigint,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "user_follows_user_login_follower_login_key" UNIQUE("user_login","follower_login")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_follows" (
	"follower_id" bigint NOT NULL,
	"login_id" bigint NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "user_follows_follower_id_login_id_key" UNIQUE("follower_id","login_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_stats" (
	"login_id" bigint PRIMARY KEY NOT NULL,
	"followers" integer DEFAULT 0,
	"follows" integer DEFAULT 0,
	"likes" integer DEFAULT 0
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "userlistprogress" (
	"userlistprogress_id" bigserial PRIMARY KEY NOT NULL,
	"login_id" bigint NOT NULL,
	"list_id" bigint NOT NULL,
	"progress" jsonb,
	"created_from_device" jsonb DEFAULT '{}'::jsonb NOT NULL,
	"updated_from_device" jsonb DEFAULT '{}'::jsonb NOT NULL,
	"mark_as_finished" boolean DEFAULT false,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "user_list_progress_login_id_list_id_key" UNIQUE("login_id","list_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "userbookprogress" (
	"userbookprogress_id" serial PRIMARY KEY NOT NULL,
	"login_id" bigint NOT NULL,
	"book_id" bigint NOT NULL,
	"progress" jsonb,
	"created_from_device" jsonb DEFAULT '{}'::jsonb NOT NULL,
	"updated_from_device" jsonb DEFAULT '{}'::jsonb NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	"mark_as_finished" boolean DEFAULT false,
	CONSTRAINT "userbookprogress_login_id_book_id_key" UNIQUE("login_id","book_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_recent_books" (
	"userrecentbooks_id" bigserial PRIMARY KEY NOT NULL,
	"login_id" bigint NOT NULL,
	"book_id" bigint NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "user_recent_books_login_id_book_id_key" UNIQUE("login_id","book_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "takeaway" (
	"takeaway_id" bigserial PRIMARY KEY NOT NULL,
	"book_id" bigint,
	"display_order" integer DEFAULT 0 NOT NULL,
	"takeaway" text NOT NULL,
	CONSTRAINT "takeaway_book_id_display_order_key" UNIQUE("book_id","display_order")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "loginrole" (
	"login_id" bigint NOT NULL,
	"role" "login_role" NOT NULL,
	CONSTRAINT "loginrole_pkey" PRIMARY KEY("login_id","role")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "similarbook" (
	"book_id" bigserial NOT NULL,
	"similar_book_id" bigserial NOT NULL,
	"rank" bigint NOT NULL,
	CONSTRAINT "similarbook_pkey" PRIMARY KEY("book_id","similar_book_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "fullbookchapter" (
	"fullbook_id" text NOT NULL,
	"object_id" char(10) DEFAULT random_string(10) NOT NULL,
	"part" integer NOT NULL,
	"chapter" integer NOT NULL,
	"duration" integer NOT NULL,
	CONSTRAINT "fullbookchapter_pkey" PRIMARY KEY("fullbook_id","part","chapter"),
	CONSTRAINT "fullbookchapter_object_id_key" UNIQUE("object_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "invoiceitem" (
	"invoiceitem_id" text NOT NULL,
	"invoice_id" text NOT NULL,
	"subscriptionproduct_id" bigint NOT NULL,
	"start" timestamp with time zone NOT NULL,
	"expire" timestamp with time zone NOT NULL,
	"amount" numeric(10, 2) NOT NULL,
	CONSTRAINT "invoiceitem_pkey" PRIMARY KEY("invoiceitem_id","invoice_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "loginfullbook" (
	"fullbook_id" text NOT NULL,
	"login_id" bigint NOT NULL,
	"purchaseproduct_code" text NOT NULL,
	"fullbookproduct_id" text NOT NULL,
	"territory" text NOT NULL,
	"transaction_id" text,
	"display_order" integer DEFAULT -1 NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "loginfullbook_pkey" PRIMARY KEY("fullbook_id","login_id","display_order"),
	CONSTRAINT "loginfullbook_fullbook_id_login_id_key" UNIQUE("fullbook_id","login_id")
);
--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "thirdparty_content_users_email_key" ON "thirdparty_content_users" ("email");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "thirdparty_content_users_user_id_idx" ON "thirdparty_content_users" ("user_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "thirdparty_content_users_email_idx" ON "thirdparty_content_users" ("email");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "thirdparty_content_users_created_at_idx" ON "thirdparty_content_users" ("created_at");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "ProcessorAuditLogs_id_idx" ON "ProcessorAuditLogs" ("id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "ProcessorAuditLogs_timeStamp_idx" ON "ProcessorAuditLogs" ("timeStamp");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "ProcessorAuditLogs_user_id_idx" ON "ProcessorAuditLogs" ("user_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "ProcessorAuditLogs_EventName_idx" ON "ProcessorAuditLogs" ("EventName");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "processor_audit_logs_id_idx" ON "processor_audit_logs" ("id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "processor_audit_logs_timeStamp_idx" ON "processor_audit_logs" ("time_stamp");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "processor_audit_logs_user_id_idx" ON "processor_audit_logs" ("user_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "processor_audit_logs_EventName_idx" ON "processor_audit_logs" ("event_name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "processor_traffic_created_at_idx" ON "processor_traffic" ("created_at");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "processor_traffic_date_provider_url_idx" ON "processor_traffic" ("created_at","url","provider");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "processor_traffic_url_idx" ON "processor_traffic" ("url");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "processor_traffic_provider_idx" ON "processor_traffic" ("provider");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "processor_traffic_url_date_provider_idx" ON "processor_traffic" ("created_at","url","provider");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_article_url_title_blogname" ON "blogaudio" ("blog_name","article_title","article_url");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_article_url" ON "blogaudio" ("article_url");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_article_title" ON "blogaudio" ("article_title");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_blog_name" ON "blogaudio" ("blog_name");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_book_id" ON "blogaudio" ("book_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_provider_id" ON "blogaudio" ("provider_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_published_at" ON "blogaudio" ("createdAt");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_updated_at" ON "blogaudio" ("updatedAt");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "book_search_document_idx" ON "book" ("search_document");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_author_id" ON "book" ("author_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "book_targetting_location_city_idx" ON "book_targetting" ("location_city");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "book_targetting_location_country_idx" ON "book_targetting" ("location_country");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "book_targetting_location_state_idx" ON "book_targetting" ("location_state");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "daily_pick_end_idx" ON "book_dailypick" ("end_date");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "daily_pick_start_idx" ON "book_dailypick" ("start_date");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "fullbook_book_id_idx" ON "fullbook" ("book_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "fullbook_search_document_idx" ON "fullbook" ("search_document");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "booktext_book_id_key" ON "booktext" ("book_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "cards_action_card_id_idx" ON "cards_action" ("card_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "cards_user_card_id_idx" ON "cards_user" ("card_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "cards_user_login_id_idx" ON "cards_user" ("login_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "fullbookproduct_active_idx" ON "fullbookproduct" ("active");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "fullbookproduct_content_cost_idx" ON "fullbookproduct" ("content_cost");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "fullbookproduct_inactive_idx" ON "fullbookproduct" ("inactive");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "fullbookproduct_list_price_idx" ON "fullbookproduct" ("list_price");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "prod_is_active" ON "fullbookproduct" ("is_active");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "idx_gin_user_profile_search" ON "user_profile" ("userhandle","firstname","lastname","email");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "usersearch_trgm_idx" ON "user_profile" ("userhandle","firstname","lastname");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "userbookprogress_book_id_idx" ON "userbookprogress" ("book_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "userbookprogress_login_id_idx" ON "userbookprogress" ("login_id");--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "promoted_users" ADD CONSTRAINT "promoted_users_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_verification" ADD CONSTRAINT "user_verification_subject_id_fkey" FOREIGN KEY ("subject_id") REFERENCES "public"."login"("subject_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "book_mapping_attempt" ADD CONSTRAINT "book_mapping_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "comment_likes" ADD CONSTRAINT "comment_likes_comment_id_fkey" FOREIGN KEY ("comment_id") REFERENCES "public"."cards_comment"("comment_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "comment_likes" ADD CONSTRAINT "comment_likes_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "notifications_sent" ADD CONSTRAINT "notifications_sent_notificationuser_login_id_fkey" FOREIGN KEY ("notificationuser_login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "cards_comment" ADD CONSTRAINT "comments_id_fkey" FOREIGN KEY ("id") REFERENCES "public"."cards_comment"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "cards_comment" ADD CONSTRAINT "comments_card_id_fkey" FOREIGN KEY ("card_id") REFERENCES "public"."cards_book"("card_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "cards_comment" ADD CONSTRAINT "comments_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "public"."cards_comment"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "cards_comment" ADD CONSTRAINT "comments_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."login"("login_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "notifications_failed" ADD CONSTRAINT "notifications_failed_notificationuser_login_id_fkey" FOREIGN KEY ("notificationuser_login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_setupintent" ADD CONSTRAINT "user_setupintent_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "ProcessorAuditLogs" ADD CONSTRAINT "ProcessorAuditLogs_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."thirdparty_content_users"("user_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "processor_audit_logs" ADD CONSTRAINT "processor_audit_logs_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."thirdparty_content_users"("user_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "processor_traffic" ADD CONSTRAINT "processor_traffic_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "public"."thirdparty"("provider_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "androidsubscriptionmixpanel" ADD CONSTRAINT "androidsubscriptionmixpanel_subject_id_fkey" FOREIGN KEY ("subject_id") REFERENCES "public"."subject"("subject_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "androidsubscriptionmixpanel" ADD CONSTRAINT "androidsubscriptionmixpanel_subscription_id_fkey" FOREIGN KEY ("subscription_id") REFERENCES "public"."androidsubscription"("subscription_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "androidsubscriptionnotifications" ADD CONSTRAINT "androidsubscriptionnotifications_subscription_id_fkey" FOREIGN KEY ("subscription_id") REFERENCES "public"."androidsubscription"("subscription_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "androidsubscriptiondetail" ADD CONSTRAINT "androidsubscriptiondetail_subscription_id_fkey" FOREIGN KEY ("subscription_id") REFERENCES "public"."androidsubscription"("subscription_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "androidsubscriptiondetail" ADD CONSTRAINT "androidsubscriptiondetail_subscriptionproduct_id_fkey" FOREIGN KEY ("subscriptionproduct_id") REFERENCES "public"."subscriptionproduct"("subscriptionproduct_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "blogaudio" ADD CONSTRAINT "blogaudio_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "blogaudio" ADD CONSTRAINT "provider_id" FOREIGN KEY ("provider_id") REFERENCES "public"."thirdparty"("provider_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "subscriptiondetail" ADD CONSTRAINT "subscriptiondetail_subscription_id_fkey" FOREIGN KEY ("subscription_id") REFERENCES "public"."subscription"("subscription_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "subscriptiondetail" ADD CONSTRAINT "subscriptiondetail_subscriptionproduct_id_fkey" FOREIGN KEY ("subscriptionproduct_id") REFERENCES "public"."subscriptionproduct"("subscriptionproduct_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "book" ADD CONSTRAINT "book_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "public"."author"("author_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "book" ADD CONSTRAINT "book_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."category"("category_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "book" ADD CONSTRAINT "book_communityauthor_id_fkey" FOREIGN KEY ("communityauthor_id") REFERENCES "public"."author"("author_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "book" ADD CONSTRAINT "book_content_type_fkey" FOREIGN KEY ("content_id") REFERENCES "public"."contenttype"("content_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "book" ADD CONSTRAINT "book_third_party_provider_fkey" FOREIGN KEY ("provider_id") REFERENCES "public"."thirdparty"("provider_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "book" ADD CONSTRAINT "parent_book_id_fkey" FOREIGN KEY ("parent_book_id") REFERENCES "public"."book"("book_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "book_targetting" ADD CONSTRAINT "book_targetting_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE cascade ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "book_dailypick" ADD CONSTRAINT "cards_book_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "booksubcategory" ADD CONSTRAINT "booksubcategory_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE cascade ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "booksubcategory" ADD CONSTRAINT "booksubcategory_subcategory_id_fkey" FOREIGN KEY ("subcategory_id") REFERENCES "public"."subcategory"("subcategory_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "fullbook" ADD CONSTRAINT "fullbook_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE set null ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "cards_book" ADD CONSTRAINT "cards_book_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "bookvisualization" ADD CONSTRAINT "bookvisualization_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE cascade ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "bookaudio" ADD CONSTRAINT "bookaudio_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE cascade ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "booktext" ADD CONSTRAINT "booktext_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE cascade ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "books_list" ADD CONSTRAINT "lists_list_id_fkey" FOREIGN KEY ("list_id") REFERENCES "public"."user_lists"("list_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "books_list" ADD CONSTRAINT "lists_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "bookkeyword" ADD CONSTRAINT "bookkeyword_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE cascade ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "bookkeyword" ADD CONSTRAINT "bookkeyword_keyword_id_fkey" FOREIGN KEY ("keyword_id") REFERENCES "public"."keyword"("keyword_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "cards_activity" ADD CONSTRAINT "cards_book_card_id_fkey" FOREIGN KEY ("card_id") REFERENCES "public"."cards_book"("card_id") ON DELETE cascade ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "cards_book_tmp" ADD CONSTRAINT "cards_book_tmp_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "cards_suggestions" ADD CONSTRAINT "suggestion_book_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "copy" ADD CONSTRAINT "copy_experiment_id_fkey" FOREIGN KEY ("experiment_id") REFERENCES "public"."experiment"("experiment_id") ON DELETE set null ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "cards_user" ADD CONSTRAINT "cards_user_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "experimentsubject" ADD CONSTRAINT "experimentsubject_experiment_id_fkey" FOREIGN KEY ("experiment_id") REFERENCES "public"."experiment"("experiment_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "experimentsubject" ADD CONSTRAINT "experimentsubject_subject_id_fkey" FOREIGN KEY ("subject_id") REFERENCES "public"."subject"("subject_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "login" ADD CONSTRAINT "login_subject_id_fkey" FOREIGN KEY ("subject_id") REFERENCES "public"."subject"("subject_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "fullbookproduct" ADD CONSTRAINT "fullbookproduct_fullbook_id_fkey" FOREIGN KEY ("fullbook_id") REFERENCES "public"."fullbook"("fullbook_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "fullbookproduct" ADD CONSTRAINT "fullbookproduct_purchaseproduct_code_fkey" FOREIGN KEY ("purchaseproduct_code") REFERENCES "public"."purchaseproduct"("purchaseproduct_code") ON DELETE set null ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "gbook" ADD CONSTRAINT "gbook_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "loginbook" ADD CONSTRAINT "loginbook_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "loginbook" ADD CONSTRAINT "loginbook_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "invoice" ADD CONSTRAINT "invoice_stripe_id_fkey" FOREIGN KEY ("stripe_id") REFERENCES "public"."login"("stripe_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "loginresettoken" ADD CONSTRAINT "loginresettoken_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "loginsession" ADD CONSTRAINT "loginsession_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_lists" ADD CONSTRAINT "user_lists_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "list_actions" ADD CONSTRAINT "actions_list_id_fkey" FOREIGN KEY ("list_id") REFERENCES "public"."user_lists"("list_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "list_actions" ADD CONSTRAINT "lists_actions_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "subscriptionmixpanel" ADD CONSTRAINT "subscriptionmixpanel_subject_id_fkey" FOREIGN KEY ("subject_id") REFERENCES "public"."subject"("subject_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "notifications" ADD CONSTRAINT "notifications_new_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "redemption" ADD CONSTRAINT "redemption_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "redemption" ADD CONSTRAINT "redemption_subscriptionproduct_id_fkey" FOREIGN KEY ("subscriptionproduct_id") REFERENCES "public"."subscriptionproduct"("subscriptionproduct_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_profile" ADD CONSTRAINT "user_profile_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_fcm" ADD CONSTRAINT "user_fcm_subject_fkey" FOREIGN KEY ("subject_id") REFERENCES "public"."subject"("subject_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_filter_categories" ADD CONSTRAINT "user_filter_categories_login_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "userfirebasemap" ADD CONSTRAINT "user_firebase_map_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_follows" ADD CONSTRAINT "user_follows_follower_id_fkey" FOREIGN KEY ("follower_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_follows" ADD CONSTRAINT "user_follows_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_stats" ADD CONSTRAINT "user_stats_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "userlistprogress" ADD CONSTRAINT "userlistprogress_list_id_fkey" FOREIGN KEY ("list_id") REFERENCES "public"."user_lists"("list_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "userlistprogress" ADD CONSTRAINT "userlistprogress_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "userbookprogress" ADD CONSTRAINT "userbookprogress_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE restrict ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "userbookprogress" ADD CONSTRAINT "userbookprogress_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_recent_books" ADD CONSTRAINT "userrecenbookslogin_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_recent_books" ADD CONSTRAINT "userrenentbooks_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "takeaway" ADD CONSTRAINT "takeaway_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE cascade ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "loginrole" ADD CONSTRAINT "loginrole_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "similarbook" ADD CONSTRAINT "similarbook_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."book"("book_id") ON DELETE cascade ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "similarbook" ADD CONSTRAINT "similarbook_similar_book_id_fkey" FOREIGN KEY ("similar_book_id") REFERENCES "public"."book"("book_id") ON DELETE cascade ON UPDATE cascade;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "fullbookchapter" ADD CONSTRAINT "fullbookchapter_fullbook_id_fkey" FOREIGN KEY ("fullbook_id") REFERENCES "public"."fullbook"("fullbook_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "invoiceitem" ADD CONSTRAINT "invoiceitem_invoice_id_fkey" FOREIGN KEY ("invoice_id") REFERENCES "public"."invoice"("invoice_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "invoiceitem" ADD CONSTRAINT "invoiceitem_subscriptionproduct_id_fkey" FOREIGN KEY ("subscriptionproduct_id") REFERENCES "public"."subscriptionproduct"("subscriptionproduct_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "loginfullbook" ADD CONSTRAINT "loginfullbook_fullbook_id_fkey" FOREIGN KEY ("fullbook_id") REFERENCES "public"."fullbook"("fullbook_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "loginfullbook" ADD CONSTRAINT "loginfullbook_fullbookproduct_id_fkey" FOREIGN KEY ("fullbookproduct_id") REFERENCES "public"."fullbookproduct"("fullbookproduct_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "loginfullbook" ADD CONSTRAINT "loginfullbook_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "public"."login"("login_id") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "loginfullbook" ADD CONSTRAINT "loginfullbook_purchaseproduct_code_fkey" FOREIGN KEY ("purchaseproduct_code") REFERENCES "public"."purchaseproduct"("purchaseproduct_code") ON DELETE restrict ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

*/