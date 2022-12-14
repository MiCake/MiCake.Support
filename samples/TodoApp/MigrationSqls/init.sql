CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;

CREATE TABLE "ConcernedTodo" (
    "Id" integer GENERATED BY DEFAULT AS IDENTITY,
    "TodoId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "CreatedTime" timestamp with time zone NOT NULL DEFAULT (current_timestamp),
    "UpdatedTime" timestamp with time zone NULL,
    "CreatedBy" integer NULL,
    CONSTRAINT "PK_ConcernedTodo" PRIMARY KEY ("Id")
);

CREATE TABLE "TodoItem" (
    "Id" integer GENERATED BY DEFAULT AS IDENTITY,
    "AuthorId" integer NOT NULL,
    "Title" text NULL,
    "Detail" text NULL,
    "State" integer NOT NULL,
    "CreatedTime" timestamp with time zone NOT NULL DEFAULT (current_timestamp),
    "UpdatedTime" timestamp with time zone NULL,
    CONSTRAINT "PK_TodoItem" PRIMARY KEY ("Id")
);

CREATE TABLE "TodoUser" (
    "Id" integer GENERATED BY DEFAULT AS IDENTITY,
    "Name_FirstName" text NULL,
    "Name_LastName" text NULL,
    "LoginName" text NULL,
    "Password" text NULL,
    CONSTRAINT "PK_TodoUser" PRIMARY KEY ("Id")
);

CREATE INDEX "IX_ConcernedTodo_TodoId" ON "ConcernedTodo" ("TodoId");

CREATE INDEX "IX_ConcernedTodo_UserId" ON "ConcernedTodo" ("UserId");

CREATE INDEX "IX_TodoItem_AuthorId" ON "TodoItem" ("AuthorId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20220822100908_Init', '6.0.8');

COMMIT;

