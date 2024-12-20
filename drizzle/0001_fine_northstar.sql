ALTER TABLE `users_table` ADD `weight` real DEFAULT 0;--> statement-breakpoint
ALTER TABLE `users_table` ADD `height` real DEFAULT 0;--> statement-breakpoint
ALTER TABLE `users_table` ADD `body_fat_percentage` real DEFAULT 0;--> statement-breakpoint
ALTER TABLE `users_table` ADD `activity_level` text DEFAULT 'Sedentary';--> statement-breakpoint
ALTER TABLE `users_table` ADD `calorires_goal` real DEFAULT 0;--> statement-breakpoint
ALTER TABLE `users_table` ADD `macros_goal` text;--> statement-breakpoint
ALTER TABLE `users_table` ADD `extra` text;--> statement-breakpoint
ALTER TABLE `users_table` ADD `auth` text;--> statement-breakpoint
ALTER TABLE `users_table` ADD `oauth` text;--> statement-breakpoint
CREATE INDEX `email_idx` ON `users_table` (`email`);--> statement-breakpoint
CREATE INDEX `name_age_idx` ON `users_table` (`name`,`age`);