/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80020 (8.0.20)
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 80020 (8.0.20)
 File Encoding         : 65001

*/
create database  SelfStudy;
use SelfStudy;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


CREATE TABLE `classroom` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `details` TEXT,
    `total_seats` INT NOT NULL,
    `occupied_seats` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE message_board (
    id int NOT NULL AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE
);



-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
BEGIN;
INSERT INTO `notice` (`id`, `name`, `content`, `time`) VALUES (1, '周六周日自习室正常营业！', '多读书，读好书，好读书！', '2023-07-15 00:00:00');
INSERT INTO `notice` (`id`, `name`, `content`, `time`) VALUES (2, '在自习室请同学们保持安静。', '希望同学们自觉遵守。', '2023-07-15 00:00:00');
INSERT INTO `notice` (`id`, `name`, `content`, `time`) VALUES (3, '自习室又引进一批新书。', NULL, '2023-07-15 00:00:00');
INSERT INTO `notice` (`id`, `name`, `content`, `time`) VALUES (4, '违纪通告：王兰花上星期在自习室大吵大闹', NULL, '2023-07-15 00:00:00');
INSERT INTO `notice` (`id`, `name`, `content`, `time`) VALUES (5, '警告信息：禁止在自习室内吃有气味的物品', '如果遇到这种情况，禁止在次进入', '2023-07-15 00:00:00');
INSERT INTO `notice` (`id`, `name`, `content`, `time`) VALUES (6, '学校读书日互动来啦！', NULL, '2023-07-15 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简介',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '座位照片',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '座位状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='座位管理';

-- ----------------------------
-- Records of seat
-- ----------------------------
BEGIN;
INSERT INTO `seat` (`id`, `name`, `info`, `img`, `user_id`, `user_name`, `state`) VALUES (1, '专注单人座位', '静下心学习的最好座位', 'http://localhost:9090/file/f6a62a299d544a2cbb7013b4a375818f.jpeg', NULL, NULL, '否');
INSERT INTO `seat` (`id`, `name`, `info`, `img`, `user_id`, `user_name`, `state`) VALUES (2, '风景靠窗', '如果你喜欢学一会儿就抬头看看风景，选我', 'http://localhost:9090/file/bc644d223fd54f9c8b2ce2b787b7bf93.jpeg', NULL, NULL, '否');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (1, 'user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (2, 'house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (3, 'menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (4, 's-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (5, 's-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (6, 'document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (7, 'coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (8, 's-marketing', 'el-icon-s-marketing', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (9, 'phone-outline', 'el-icon-phone-outline', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (10, 'platform-eleme', 'el-icon-platform-eleme', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (11, 'eleme', 'el-icon-eleme', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (12, 'delete-solid', 'el-icon-delete-solid', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (13, 'delete', 'el-icon-delete', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (14, 's-tools', 'el-icon-s-tools', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (15, 'setting', 'el-icon-setting', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (16, 'user-solid', 'el-icon-user-solid', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (17, 'phone', 'el-icon-phone', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (18, 'more', 'el-icon-more', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (19, 'more-outline', 'el-icon-more-outline', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (20, 'star-on', 'el-icon-star-on', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (21, 'star-off', 'el-icon-star-off', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (22, 's-goods', 'el-icon-s-goods', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (23, 'goods', 'el-icon-goods', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (24, 'warning', 'el-icon-warning', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (25, 'warning-outline', 'el-icon-warning-outline', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (26, 'question', 'el-icon-question', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (27, 'info', 'el-icon-info', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (28, 'remove', 'el-icon-remove', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (29, 'circle-plus', 'el-icon-circle-plus', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (30, 'success', 'el-icon-success', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (31, 'error', 'el-icon-error', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (32, 'zoom-in', 'el-icon-zoom-in', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (33, 'zoom-out', 'el-icon-zoom-out', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (34, 'remove-outline', 'el-icon-remove-outline', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (35, 'circle-plus-outline', 'el-icon-circle-plus-outline', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (36, 'circle-check', 'el-icon-circle-check', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (37, 'circle-close', 'el-icon-circle-close', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (38, 's-help', 'el-icon-s-help', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (39, 'help', 'el-icon-help', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (40, 'minus', 'el-icon-minus', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (41, 'plus', 'el-icon-plus', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (42, 'check', 'el-icon-check', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (43, 'close', 'el-icon-close', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (44, 'picture', 'el-icon-picture', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (45, 'picture-outline', 'el-icon-picture-outline', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (46, 'picture-outline-round', 'el-icon-picture-outline-round', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (47, 'upload', 'el-icon-upload', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (48, 'upload2', 'el-icon-upload2', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (49, 'download', 'el-icon-download', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (50, 'camera-solid', 'el-icon-camera-solid', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (51, 'camera', 'el-icon-camera', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (52, 'video-camera-solid', 'el-icon-video-camera-solid', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (53, 'video-camera', 'el-icon-video-camera', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (54, 'message-solid', 'el-icon-message-solid', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (55, 'bell', 'el-icon-bell', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (56, 's-cooperation', 'el-icon-s-cooperation', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (57, 's-order', 'el-icon-s-order', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (58, 's-platform', 'el-icon-s-platform', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (59, 's-fold', 'el-icon-s-fold', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (60, 's-unfold', 'el-icon-s-unfold', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (61, 's-operation', 'el-icon-s-operation', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (62, 's-promotion', 'el-icon-s-promotion', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (63, 's-home', 'el-icon-s-home', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (64, 's-release', 'el-icon-s-release', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (65, 's-ticket', 'el-icon-s-ticket', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (66, 's-management', 'el-icon-s-management', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (67, 's-open', 'el-icon-s-open', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (68, 's-shop', 'el-icon-s-shop', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (69, 's-flag', 'el-icon-s-flag', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (70, 's-comment', 'el-icon-s-comment', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (71, 's-finance', 'el-icon-s-finance', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (72, 's-claim', 'el-icon-s-claim', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (73, 's-opportunity', 'el-icon-s-opportunity', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (74, 's-data', 'el-icon-s-data', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (75, 's-check', 'el-icon-s-check', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (76, 'share', 'el-icon-share', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (77, 'd-caret', 'el-icon-d-caret', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (78, 'caret-left', 'el-icon-caret-left', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (79, 'caret-right', 'el-icon-caret-right', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (80, 'caret-bottom', 'el-icon-caret-bottom', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (81, 'caret-top', 'el-icon-caret-top', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (82, 'bottom-left', 'el-icon-bottom-left', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (83, 'bottom-right', 'el-icon-bottom-right', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (84, 'back', 'el-icon-back', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (85, 'right', 'el-icon-right', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (86, 'bottom', 'el-icon-bottom', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (87, 'top', 'el-icon-top', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (88, 'top-left', 'el-icon-top-left', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (89, 'top-right', 'el-icon-top-right', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (90, 'arrow-left', 'el-icon-arrow-left', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (91, 'arrow-right', 'el-icon-arrow-right', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (92, 'arrow-down', 'el-icon-arrow-down', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (93, 'arrow-up', 'el-icon-arrow-up', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (94, 'd-arrow-left', 'el-icon-d-arrow-left', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (95, 'd-arrow-right', 'el-icon-d-arrow-right', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (96, 'video-pause', 'el-icon-video-pause', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (97, 'video-play', 'el-icon-video-play', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (98, 'refresh', 'el-icon-refresh', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (99, 'refresh-right', 'el-icon-refresh-right', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (100, 'refresh-left', 'el-icon-refresh-left', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (101, 'finished', 'el-icon-finished', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (102, 'sort', 'el-icon-sort', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (103, 'sort-up', 'el-icon-sort-up', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (104, 'sort-down', 'el-icon-sort-down', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (105, 'rank', 'el-icon-rank', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (106, 'loading', 'el-icon-loading', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (107, 'view', 'el-icon-view', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (108, 'c-scale-to-original', 'el-icon-c-scale-to-original', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (109, 'date', 'el-icon-date', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (110, 'edit', 'el-icon-edit', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (111, 'edit-outline', 'el-icon-edit-outline', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (112, 'folder', 'el-icon-folder', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (113, 'folder-opened', 'el-icon-folder-opened', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (114, 'folder-add', 'el-icon-folder-add', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (115, 'folder-remove', 'el-icon-folder-remove', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (116, 'folder-delete', 'el-icon-folder-delete', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (117, 'folder-checked', 'el-icon-folder-checked', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (118, 'tickets', 'el-icon-tickets', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (119, 'document-remove', 'el-icon-document-remove', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (120, 'document-delete', 'el-icon-document-delete', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (121, 'document-copy', 'el-icon-document-copy', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (122, 'document-checked', 'el-icon-document-checked', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (123, 'document-add', 'el-icon-document-add', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (124, 'printer', 'el-icon-printer', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (125, 'paperclip', 'el-icon-paperclip', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (126, 'takeaway-box', 'el-icon-takeaway-box', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (127, 'search', 'el-icon-search', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (128, 'monitor', 'el-icon-monitor', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (129, 'attract', 'el-icon-attract', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (130, 'mobile', 'el-icon-mobile', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (131, 'scissors', 'el-icon-scissors', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (132, 'umbrella', 'el-icon-umbrella', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (133, 'headset', 'el-icon-headset', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (134, 'brush', 'el-icon-brush', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (135, 'mouse', 'el-icon-mouse', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (136, 'coordinate', 'el-icon-coordinate', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (137, 'magic-stick', 'el-icon-magic-stick', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (138, 'reading', 'el-icon-reading', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (139, 'data-line', 'el-icon-data-line', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (140, 'data-board', 'el-icon-data-board', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (141, 'pie-chart', 'el-icon-pie-chart', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (142, 'data-analysis', 'el-icon-data-analysis', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (143, 'collection-tag', 'el-icon-collection-tag', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (144, 'film', 'el-icon-film', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (145, 'suitcase', 'el-icon-suitcase', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (146, 'suitcase-1', 'el-icon-suitcase-1', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (147, 'receiving', 'el-icon-receiving', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (148, 'collection', 'el-icon-collection', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (149, 'files', 'el-icon-files', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (150, 'notebook-1', 'el-icon-notebook-1', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (151, 'notebook-2', 'el-icon-notebook-2', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (152, 'toilet-paper', 'el-icon-toilet-paper', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (153, 'office-building', 'el-icon-office-building', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (154, 'school', 'el-icon-school', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (155, 'table-lamp', 'el-icon-table-lamp', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (156, 'no-smoking', 'el-icon-no-smoking', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (157, 'smoking', 'el-icon-smoking', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (158, 'shopping-cart-full', 'el-icon-shopping-cart-full', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (159, 'shopping-cart-1', 'el-icon-shopping-cart-1', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (160, 'shopping-cart-2', 'el-icon-shopping-cart-2', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (161, 'shopping-bag-1', 'el-icon-shopping-bag-1', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (162, 'shopping-bag-2', 'el-icon-shopping-bag-2', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (163, 'sold-out', 'el-icon-sold-out', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (164, 'sell', 'el-icon-sell', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (165, 'present', 'el-icon-present', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (166, 'box', 'el-icon-box', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (167, 'bank-card', 'el-icon-bank-card', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (168, 'money', 'el-icon-money', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (169, 'coin', 'el-icon-coin', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (170, 'wallet', 'el-icon-wallet', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (171, 'discount', 'el-icon-discount', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (172, 'price-tag', 'el-icon-price-tag', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (173, 'news', 'el-icon-news', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (174, 'guide', 'el-icon-guide', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (175, 'male', 'el-icon-male', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (176, 'female', 'el-icon-female', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (177, 'thumb', 'el-icon-thumb', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (178, 'cpu', 'el-icon-cpu', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (179, 'link', 'el-icon-link', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (180, 'connection', 'el-icon-connection', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (181, 'open', 'el-icon-open', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (182, 'turn-off', 'el-icon-turn-off', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (183, 'set-up', 'el-icon-set-up', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (184, 'chat-round', 'el-icon-chat-round', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (185, 'chat-line-round', 'el-icon-chat-line-round', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (186, 'chat-square', 'el-icon-chat-square', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (187, 'chat-dot-round', 'el-icon-chat-dot-round', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (188, 'chat-dot-square', 'el-icon-chat-dot-square', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (189, 'chat-line-square', 'el-icon-chat-line-square', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (190, 'message', 'el-icon-message', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (191, 'postcard', 'el-icon-postcard', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (192, 'position', 'el-icon-position', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (193, 'turn-off-microphone', 'el-icon-turn-off-microphone', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (194, 'microphone', 'el-icon-microphone', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (195, 'close-notification', 'el-icon-close-notification', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (196, 'bangzhu', 'el-icon-bangzhu', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (197, 'time', 'el-icon-time', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (198, 'odometer', 'el-icon-odometer', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (199, 'crop', 'el-icon-crop', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (200, 'aim', 'el-icon-aim', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (201, 'switch-button', 'el-icon-switch-button', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (202, 'full-screen', 'el-icon-full-screen', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (203, 'copy-document', 'el-icon-copy-document', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (204, 'mic', 'el-icon-mic', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (205, 'stopwatch', 'el-icon-stopwatch', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (206, 'medal-1', 'el-icon-medal-1', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (207, 'medal', 'el-icon-medal', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (208, 'trophy', 'el-icon-trophy', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (209, 'trophy-1', 'el-icon-trophy-1', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (210, 'first-aid-kit', 'el-icon-first-aid-kit', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (211, 'discover', 'el-icon-discover', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (212, 'place', 'el-icon-place', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (213, 'location', 'el-icon-location', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (214, 'location-outline', 'el-icon-location-outline', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (215, 'location-information', 'el-icon-location-information', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (216, 'add-location', 'el-icon-add-location', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (217, 'delete-location', 'el-icon-delete-location', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (218, 'map-location', 'el-icon-map-location', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (219, 'alarm-clock', 'el-icon-alarm-clock', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (220, 'timer', 'el-icon-timer', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (221, 'watch-1', 'el-icon-watch-1', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (222, 'watch', 'el-icon-watch', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (223, 'lock', 'el-icon-lock', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (224, 'unlock', 'el-icon-unlock', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (225, 'key', 'el-icon-key', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (226, 'service', 'el-icon-service', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (227, 'mobile-phone', 'el-icon-mobile-phone', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (228, 'bicycle', 'el-icon-bicycle', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (229, 'truck', 'el-icon-truck', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (230, 'ship', 'el-icon-ship', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (231, 'basketball', 'el-icon-basketball', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (232, 'football', 'el-icon-football', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (233, 'soccer', 'el-icon-soccer', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (234, 'baseball', 'el-icon-baseball', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (235, 'wind-power', 'el-icon-wind-power', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (236, 'light-rain', 'el-icon-light-rain', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (237, 'lightning', 'el-icon-lightning', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (238, 'heavy-rain', 'el-icon-heavy-rain', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (239, 'sunrise', 'el-icon-sunrise', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (240, 'sunrise-1', 'el-icon-sunrise-1', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (241, 'sunset', 'el-icon-sunset', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (242, 'sunny', 'el-icon-sunny', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (243, 'cloudy', 'el-icon-cloudy', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (244, 'partly-cloudy', 'el-icon-partly-cloudy', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (245, 'cloudy-and-sunny', 'el-icon-cloudy-and-sunny', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (246, 'moon', 'el-icon-moon', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (247, 'moon-night', 'el-icon-moon-night', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (248, 'dish', 'el-icon-dish', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (249, 'dish-1', 'el-icon-dish-1', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (250, 'food', 'el-icon-food', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (251, 'chicken', 'el-icon-chicken', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (252, 'fork-spoon', 'el-icon-fork-spoon', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (253, 'knife-fork', 'el-icon-knife-fork', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (254, 'burger', 'el-icon-burger', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (255, 'tableware', 'el-icon-tableware', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (256, 'sugar', 'el-icon-sugar', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (257, 'dessert', 'el-icon-dessert', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (258, 'ice-cream', 'el-icon-ice-cream', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (259, 'hot-water', 'el-icon-hot-water', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (260, 'water-cup', 'el-icon-water-cup', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (261, 'coffee-cup', 'el-icon-coffee-cup', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (262, 'cold-drink', 'el-icon-cold-drink', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (263, 'goblet', 'el-icon-goblet', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (264, 'goblet-full', 'el-icon-goblet-full', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (265, 'goblet-square', 'el-icon-goblet-square', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (266, 'goblet-square-full', 'el-icon-goblet-square-full', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (267, 'refrigerator', 'el-icon-refrigerator', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (268, 'grape', 'el-icon-grape', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (269, 'watermelon', 'el-icon-watermelon', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (270, 'cherry', 'el-icon-cherry', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (271, 'apple', 'el-icon-apple', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (272, 'pear', 'el-icon-pear', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (273, 'orange', 'el-icon-orange', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (274, 'ice-tea', 'el-icon-ice-tea', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (275, 'ice-drink', 'el-icon-ice-drink', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (276, 'milk-tea', 'el-icon-milk-tea', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (277, 'potato-strips', 'el-icon-potato-strips', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (278, 'lollipop', 'el-icon-lollipop', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (279, 'ice-cream-square', 'el-icon-ice-cream-square', 'icon');
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES (280, 'ice-cream-round', 'el-icon-ice-cream-round', 'icon');
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (1, '专注单人.jpeg', 'jpeg', 80, 'http://localhost:9090/file/f6a62a299d544a2cbb7013b4a375818f.jpeg', 'd0f6d4c979f0806bec5e9dddb5ca6d30', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (2, '风景靠窗.jpeg', 'jpeg', 204, 'http://localhost:9090/file/bc644d223fd54f9c8b2ce2b787b7bf93.jpeg', '18215e012bd933d4e4495bd6e703dd0f', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `sort_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (1, '用户管理', '/user', 'el-icon-user', NULL, NULL, 'User', 301);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (2, '菜单管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (3, '公告管理', '/notice', 'el-icon-menu', NULL, NULL, 'Notice', 999);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (4, '座位管理', '/seat', 'el-icon-menu', NULL, NULL, 'Seat', 999);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (5, '教室管理', '/Classroom', 'el-icon-house', NULL, NULL, 'Classroom', 999);
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES (10, '留言榜', '/home', 'el-icon-date', NULL, NULL, 'Home', 0);


COMMIT;
-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
                                 `role_id` int NOT NULL COMMENT '角色id',
                                 `menu_id` int NOT NULL COMMENT '菜单id',
                                 PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 5);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 10);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 10);
COMMIT;



-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES (2, '普通用户', '普通用户', 'ROLE_USER');
COMMIT;


-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (1, 'admin', 'admin', '管理员', 'admin@qq.com', '13988997788', '安徽合肥', '2023-07-15 17:44:51', '', 'ROLE_ADMIN');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (2, '111', '111', '王兰花', 'zhang@qq.com', '13677889900', '湖北武汉', '2023-07-15 17:45:02', '', 'ROLE_USER');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES (3, '222', '222', '李大壮', 'wang@qq.com', '13877668855', '湖北武汉', '2023-07-15 17:45:06', '', 'ROLE_USER');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
