-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2022 年 3 月 04 日 06:41
-- サーバのバージョン： 10.4.21-MariaDB
-- PHP のバージョン: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gsacf_d10_05`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `file_table`
--

CREATE TABLE `file_table` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(140) COLLATE utf8mb4_bin DEFAULT NULL,
  `insert_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `file_table`
--

INSERT INTO `file_table` (`id`, `file_name`, `file_path`, `description`, `insert_time`, `update_time`) VALUES
(4, 'スクリーンショット 2022-02-25 22.06.29.png', 'prof/20220303171046スクリーンショット 2022-02-25 22.06.29.png', NULL, '2022-03-04 01:10:46', '2022-03-04 01:10:46'),
(6, 'ダウンロード.jpeg', 'images/20220304063717ダウンロード.jpeg', NULL, '2022-03-04 14:37:17', '2022-03-04 14:37:17'),
(7, 'スクリーンショット 2022-02-25 22.08.59.png', 'images/20220304063902スクリーンショット 2022-02-25 22.08.59.png', NULL, '2022-03-04 14:39:02', '2022-03-04 14:39:02');

-- --------------------------------------------------------

--
-- テーブルの構造 `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `image_name` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `image_type` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `image_content` mediumblob NOT NULL,
  `image_size` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- テーブルの構造 `like_table`
--

CREATE TABLE `like_table` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `todo_id` int(12) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `like_table`
--

INSERT INTO `like_table` (`id`, `user_id`, `todo_id`, `created_at`) VALUES
(8, 1, 24, '2022-02-26 16:03:17'),
(9, 1, 25, '2022-02-26 16:03:23'),
(18, 1, 26, '2022-02-26 16:12:18'),
(21, 1, 26, '2022-02-26 16:13:45'),
(22, 1, 29, '2022-02-26 16:14:08'),
(24, 1, 29, '2022-02-26 16:15:10'),
(25, 1, 2, '2022-02-26 16:18:50'),
(27, 1, 2, '2022-02-26 16:19:37'),
(28, 1, 3, '2022-02-26 16:45:51'),
(29, 1, 5, '2022-02-26 16:45:54'),
(30, 1, 3, '2022-02-26 16:45:54'),
(31, 1, 3, '2022-02-26 16:45:55'),
(32, 1, 6, '2022-02-26 16:49:02'),
(33, 1, 7, '2022-02-26 16:49:04'),
(34, 1, 8, '2022-02-26 16:49:05'),
(35, 1, 9, '2022-02-26 16:49:06'),
(36, 1, 27, '2022-02-26 16:49:08'),
(37, 1, 28, '2022-02-26 16:49:09'),
(38, 1, 5, '2022-02-26 16:56:00'),
(39, 1, 7, '2022-02-26 16:56:02'),
(40, 1, 7, '2022-02-26 16:56:02'),
(41, 1, 7, '2022-02-26 16:56:03');

-- --------------------------------------------------------

--
-- テーブルの構造 `todo_table`
--

CREATE TABLE `todo_table` (
  `id` int(12) NOT NULL,
  `todo` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `deadline` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `todo_table`
--

INSERT INTO `todo_table` (`id`, `todo`, `deadline`, `created_at`, `updated_at`, `is_deleted`) VALUES
(2, '海', '2022-02-20', '2022-02-05 15:34:25', '2022-02-05 15:34:25', 0),
(3, '休日', '2022-02-20', '2022-02-05 15:34:25', '2022-02-05 15:34:25', 0),
(5, '運動', '2022-02-20', '2022-02-05 15:34:25', '2022-02-12 17:21:52', 1),
(6, 'ジャンクフード', '2022-02-20', '2022-02-05 15:34:25', '2022-02-05 15:34:25', 0),
(7, '筋トレ', '2022-02-20', '2022-02-05 15:34:25', '2022-02-12 17:21:48', 1),
(8, 'サウナ', '2022-02-20', '2022-02-05 15:34:25', '2022-02-05 15:34:25', 0),
(9, '温泉', '2022-02-20', '2022-02-05 15:34:25', '2022-02-05 15:34:25', 0),
(24, 'aaa', '2022-02-01', '2022-02-05 16:52:50', '2022-02-05 16:52:50', 0),
(25, 'aaa', '2022-02-07', '2022-02-05 16:53:53', '2022-02-05 16:53:53', 0),
(27, 'aaa', '2022-02-14', '2022-02-05 16:57:18', '2022-02-05 16:57:18', 0),
(28, 'aaaa', '2022-02-14', '2022-02-12 14:35:04', '2022-02-12 17:21:50', 1),
(29, 'aaaa', '2022-02-22', '2022-02-23 23:23:51', '2022-02-23 23:23:51', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `users_table`
--

CREATE TABLE `users_table` (
  `id` int(12) NOT NULL,
  `username` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `is_admin` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `score` int(11) DEFAULT NULL,
  `profile` blob NOT NULL,
  `img` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `users_table`
--

INSERT INTO `users_table` (`id`, `username`, `password`, `is_admin`, `is_deleted`, `created_at`, `updated_at`, `score`, `profile`, `img`) VALUES
(1, 'testuser01', '111111', 1, 0, '2022-02-19 15:17:26', '2022-02-19 15:17:26', NULL, '', ''),
(2, 'testuser02', '222222', 0, 0, '2022-02-19 15:17:26', '2022-02-19 15:17:26', NULL, '', ''),
(3, 'testuser03', '333333', 0, 0, '2022-02-19 15:17:26', '2022-02-19 15:17:26', NULL, '', ''),
(4, 'testuser04', '444444', 0, 0, '2022-02-19 15:17:26', '2022-02-19 15:17:26', NULL, '', ''),
(5, 'aaa', 'aaaa', 0, 0, '2022-02-24 22:50:08', '2022-02-24 22:50:08', NULL, '', ''),
(6, 'kkk', 'kkk', 0, 0, '2022-02-24 22:58:22', '2022-02-24 22:58:22', NULL, '', '');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `file_table`
--
ALTER TABLE `file_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- テーブルのインデックス `like_table`
--
ALTER TABLE `like_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `todo_table`
--
ALTER TABLE `todo_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `file_table`
--
ALTER TABLE `file_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- テーブルの AUTO_INCREMENT `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `like_table`
--
ALTER TABLE `like_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- テーブルの AUTO_INCREMENT `todo_table`
--
ALTER TABLE `todo_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- テーブルの AUTO_INCREMENT `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
