/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : item_data

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 22/07/2020 17:56:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item_classification
-- ----------------------------
DROP TABLE IF EXISTS `item_classification`;
CREATE TABLE `item_classification`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `classification_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类图标',
  `previous_classification` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '上级分类',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sort_number` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_furniture
-- ----------------------------
DROP TABLE IF EXISTS `item_furniture`;
CREATE TABLE `item_furniture`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `furniture_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '家具名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `room_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '房间ID',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sort_number` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '家具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_item
-- ----------------------------
DROP TABLE IF EXISTS `item_item`;
CREATE TABLE `item_item`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `item_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物品名称',
  `item_count` int(11) NOT NULL COMMENT '物品数量',
  `item_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物品图片',
  `shelf_life` int(11) NULL DEFAULT NULL COMMENT '保质期(天)',
  `production_date` datetime(0) NULL DEFAULT NULL COMMENT '生产日期',
  `expiry_date` datetime(0) NULL DEFAULT NULL COMMENT '到期日期',
  `open_date` datetime(0) NULL DEFAULT NULL COMMENT '开封日期',
  `fresh_date` datetime(0) NULL DEFAULT NULL COMMENT '保鲜日期',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '购入价格',
  `net_weight` double NULL DEFAULT NULL COMMENT '净含量',
  `unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `discount` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠价格参考',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `location_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '位置ID',
  `box_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '收纳盒ID',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sort_number` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_item_classification_relation
-- ----------------------------
DROP TABLE IF EXISTS `item_item_classification_relation`;
CREATE TABLE `item_item_classification_relation`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `item_id` bigint(20) UNSIGNED NOT NULL COMMENT '物品ID',
  `classification_id` bigint(20) UNSIGNED NOT NULL COMMENT '分类ID',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物品-分类关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_item_label_relation
-- ----------------------------
DROP TABLE IF EXISTS `item_item_label_relation`;
CREATE TABLE `item_item_label_relation`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `item_id` bigint(20) UNSIGNED NOT NULL COMMENT '物品ID',
  `label_id` bigint(20) UNSIGNED NOT NULL COMMENT '标签ID',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物品-标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_label
-- ----------------------------
DROP TABLE IF EXISTS `item_label`;
CREATE TABLE `item_label`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `label_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名称',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物品标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_location
-- ----------------------------
DROP TABLE IF EXISTS `item_location`;
CREATE TABLE `item_location`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `location_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '位置名称',
  `start_row` int(11) NOT NULL COMMENT '位置起始行',
  `start_column` int(11) NOT NULL COMMENT '位置起始列',
  `width` int(11) NOT NULL COMMENT '位置宽度',
  `height` int(11) NOT NULL COMMENT '位置高度',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `furniture_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '家具ID',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物品位置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_memorandum
-- ----------------------------
DROP TABLE IF EXISTS `item_memorandum`;
CREATE TABLE `item_memorandum`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备忘录内容',
  `is_remind` smallint(6) NOT NULL COMMENT '是否提醒 0否 1是',
  `remind_time` datetime(0) NULL DEFAULT NULL COMMENT '提醒时间',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '备忘录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_password_book
-- ----------------------------
DROP TABLE IF EXISTS `item_password_book`;
CREATE TABLE `item_password_book`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '记录标题',
  `accout` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sort_number` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '密码簿表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_room
-- ----------------------------
DROP TABLE IF EXISTS `item_room`;
CREATE TABLE `item_room`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `room_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '房间名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sort_number` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '房间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_storage_box
-- ----------------------------
DROP TABLE IF EXISTS `item_storage_box`;
CREATE TABLE `item_storage_box`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `box_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收纳盒名称',
  `box_image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收纳盒图片',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `location_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '位置ID',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sort_number` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收纳盒表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_default_classification
-- ----------------------------
DROP TABLE IF EXISTS `sys_default_classification`;
CREATE TABLE `sys_default_classification`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `classification_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类图标',
  `previous_classification` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '上级分类',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `is_default` tinyint(4) NULL DEFAULT NULL COMMENT '是否为用户默认添加 0否 1是',
  `sort_number` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'ϵͳĬ????Ʒ?????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dictionary_type` smallint(6) NULL DEFAULT NULL COMMENT '字典类型',
  `dictionary_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典名称',
  `dictionary_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典编码',
  `dictionary_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典值',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典描述',
  `sort_number` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  `previous_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '上级字典ID',
  `enable_status` tinyint(4) NULL DEFAULT NULL COMMENT '是否启用 0否 1是',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名称',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `type` int(11) NOT NULL COMMENT '用户类型',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
