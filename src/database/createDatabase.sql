CREATE DATABASE "shortly";

CREATE TABLE "users" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"email" TEXT UNIQUE NOT NULL,
	"password" TEXT NOT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE "sessions" (
	"id" SERIAL PRIMARY KEY,
  "userId" INTEGER NOT NULL,
	"token" TEXT UNIQUE NOT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE "usersUrls" (
	"id" SERIAL PRIMARY KEY,
	"userId" INTEGER NOT NULL,
	"urlId" INTEGER NOT NULL,
	"shortUrl" TEXT UNIQUE NOT NULL,
	"visitCount" INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE "urls" (
	"id" SERIAL PRIMARY KEY,
	"bigUrl" TEXT UNIQUE NOT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT NOW()
);

ALTER TABLE "sessions" ADD CONSTRAINT "sessions_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "usersUrls" ADD CONSTRAINT "usersUrls_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "usersUrls" ADD CONSTRAINT "usersUrls_fk1" FOREIGN KEY ("urlId") REFERENCES "urls"("id");