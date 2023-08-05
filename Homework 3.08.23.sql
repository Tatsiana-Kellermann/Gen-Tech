CREATE TABLE `follows` (
  `following_user_id` integer,
  `followed_user_id` integer,
  `created_at` timestamp
);

CREATE TABLE `users` (
  `id` integer PRIMARY KEY,
  `username` varchar(255),
  `role` varchar(255),
  `created_at` timestamp,
  `is_blooked` bool
);

CREATE TABLE `posts` (
  `id` integer PRIMARY KEY,
  `title` varchar(255),
  `body` text COMMENT 'Content of the post',
  `user_id` integer,
  `status` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `reactions` (
  `reaction_id` integer,
  `created_at` timestamp,
  `author_id` varchar(255),
  `post_id` integer
);

CREATE TABLE `comments` (
  `comment_id` integer,
  `created_at` timestamp,
  `author_id` varchar(255),
  `post_id` integer
);

CREATE TABLE `chats` (
  `chat_id` integer,
  `created_at` timestamp,
  `username` varchar(255)
);

CREATE TABLE `messages` (
  `message_id` integer,
  `created_at` timestamp,
  `author_id` integer,
  `chat_id` integer,
  `content` varchar(255)
);

ALTER TABLE `posts` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `follows` ADD FOREIGN KEY (`following_user_id`) REFERENCES `users` (`id`);

ALTER TABLE `follows` ADD FOREIGN KEY (`followed_user_id`) REFERENCES `users` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `reactions` (`author_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `chats` (`username`);

ALTER TABLE `comments` ADD FOREIGN KEY (`author_id`) REFERENCES `chats` (`username`);

ALTER TABLE `chats` ADD FOREIGN KEY (`username`) REFERENCES `messages` (`author_id`);

ALTER TABLE `posts` ADD FOREIGN KEY (`user_id`) REFERENCES `comments` (`author_id`);

ALTER TABLE `chats` ADD FOREIGN KEY (`chat_id`) REFERENCES `messages` (`chat_id`);

ALTER TABLE `reactions` ADD FOREIGN KEY (`author_id`) REFERENCES `posts` (`user_id`);

ALTER TABLE `posts` ADD FOREIGN KEY (`id`) REFERENCES `comments` (`post_id`);
