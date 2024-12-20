CREATE TABLE `devices` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`device_id` text NOT NULL,
	`user_id` integer,
	`device_type` text NOT NULL,
	`last_sync` text DEFAULT (CURRENT_TIMESTAMP),
	`sync_token` text,
	FOREIGN KEY (`user_id`) REFERENCES `users_table`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `devices_device_id_unique` ON `devices` (`device_id`);--> statement-breakpoint
CREATE TABLE `sync_log` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`table_name` text NOT NULL,
	`record_id` integer NOT NULL,
	`operation` text NOT NULL,
	`sync_status` text NOT NULL,
	`created_at` text DEFAULT (CURRENT_TIMESTAMP),
	`device_id` text,
	`error_message` text,
	FOREIGN KEY (`device_id`) REFERENCES `devices`(`device_id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
ALTER TABLE `users_table` ADD `server_id` text;--> statement-breakpoint
ALTER TABLE `users_table` ADD `created_at` text DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `users_table` ADD `updated_at` text DEFAULT (CURRENT_TIMESTAMP);--> statement-breakpoint
ALTER TABLE `users_table` ADD `deleted_at` text;--> statement-breakpoint
ALTER TABLE `users_table` ADD `is_synced` integer DEFAULT 0;--> statement-breakpoint
ALTER TABLE `users_table` ADD `sync_version` integer DEFAULT 0;--> statement-breakpoint
ALTER TABLE `users_table` ADD `device_id` integer REFERENCES devices(id);--> statement-breakpoint
CREATE UNIQUE INDEX `users_table_server_id_unique` ON `users_table` (`server_id`);--> statement-breakpoint
CREATE INDEX `sync_idx` ON `users_table` (`is_synced`,`sync_version`);--> statement-breakpoint
CREATE INDEX `server_id_idx` ON `users_table` (`server_id`);