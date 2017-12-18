/*
 Navicat Premium Data Transfer

 Source Server         : mysql_localhost
 Source Server Type    : MySQL
 Source Server Version : 50638
 Source Host           : localhost:3306
 Source Schema         : fomagic

 Target Server Type    : MySQL
 Target Server Version : 50638
 File Encoding         : 65001

 Date: 18/12/2017 18:29:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单url',
  `perms` varchar(500) DEFAULT NULL COMMENT '权限（多个逗号分隔，如：user:add,user:delete）',
  `type` int(11) DEFAULT NULL COMMENT '类型  0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'fa fa-th-list', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'modules/job/schedule.html', NULL, 1, 'fa fa-tasks', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'modules/sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'modules/oss/oss.html', 'sys:oss:all', 1, 'fa fa-file-image-o', 6);
INSERT INTO `sys_menu` VALUES (62, 0, '目录1', '', '', 0, '', 1);
INSERT INTO `sys_menu` VALUES (63, 0, '目录修改2', '', '', 0, 'fa fa-bookmark', 3);
INSERT INTO `sys_menu` VALUES (65, 62, '目录1-2', '', '', 0, '', NULL);
INSERT INTO `sys_menu` VALUES (67, 65, '菜单1', '', '', 0, '', 0);
INSERT INTO `sys_menu` VALUES (68, 65, '菜单2', '21212', '', 1, '', 0);
INSERT INTO `sys_menu` VALUES (69, 63, '菜单2-2', '22222', '', 1, '', NULL);
INSERT INTO `sys_menu` VALUES (70, 0, '21212121212121', '21212', '', 1, '', 0);
INSERT INTO `sys_menu` VALUES (71, 0, '1212121212121212', '', '', 0, '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (14, 'zcdasd', 'adsasdd', 1, '2017-12-11 16:01:07');
INSERT INTO `sys_role` VALUES (15, 'aadasd', 'asdadasds', 1, '2017-12-11 16:03:40');
INSERT INTO `sys_role` VALUES (16, 'dfsdfedfedf', 'sdfsdfdsf', 1, '2017-12-12 18:02:20');
INSERT INTO `sys_role` VALUES (17, '哈哈哈', '深深的', 1, '2017-12-18 10:13:47');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (21, 16, 1);
INSERT INTO `sys_role_menu` VALUES (22, 16, 3);
INSERT INTO `sys_role_menu` VALUES (23, 16, 19);
INSERT INTO `sys_role_menu` VALUES (24, 16, 4);
INSERT INTO `sys_role_menu` VALUES (25, 16, 23);
INSERT INTO `sys_role_menu` VALUES (26, 16, 24);
INSERT INTO `sys_role_menu` VALUES (27, 16, 25);
INSERT INTO `sys_role_menu` VALUES (28, 16, 26);
INSERT INTO `sys_role_menu` VALUES (29, 17, 1);
INSERT INTO `sys_role_menu` VALUES (30, 17, 3);
INSERT INTO `sys_role_menu` VALUES (31, 17, 19);
INSERT INTO `sys_role_menu` VALUES (32, 17, 20);
INSERT INTO `sys_role_menu` VALUES (33, 17, 21);
INSERT INTO `sys_role_menu` VALUES (34, 17, 22);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `salt` varchar(50) DEFAULT NULL COMMENT '盐值',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` varchar(4) DEFAULT NULL COMMENT '用户状态  0：禁用  1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'magic', '6676480f0f77c6915478739fcb67e7b5', 'magic', 'magic@qqq.com', '1234', '1', 1, '2017-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (2, 'soul', 'b5b089370c04bc0892d6ffc0bf6d9cdd', 'magic', 'soul@qq.com', '12345678', '0', 1, NULL);
INSERT INTO `sys_user` VALUES (4, 'sssss', '208a2bb5e0f45bbe4e2a228b34b0322e', 'magic', 'soul@qq.com', '12345678', '0', 1, NULL);
INSERT INTO `sys_user` VALUES (5, 'dssds', '6676480f0f77c6915478739fcb67e7b5', 'magic', 'magic@qqq.com', '1234', '1', 1, '2017-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (6, 'dfffdf', '208a2bb5e0f45bbe4e2a228b34b0322e', 'magic', 'soul@qq.com', '12345678', '0', 1, NULL);
INSERT INTO `sys_user` VALUES (7, 'vbvbvb', '6676480f0f77c6915478739fcb67e7b5', 'magic', 'magic@qqq.com', '1234', '1', 1, '2017-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (8, 'nbnbnb', '208a2bb5e0f45bbe4e2a228b34b0322e', 'magic', 'soul@qq.com', '12345678', '0', 1, NULL);
INSERT INTO `sys_user` VALUES (9, 'xcxcx', '6676480f0f77c6915478739fcb67e7b5', 'magic', 'magic@qqq.com', '1234', '1', 1, '2017-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (45, '2121', '48e7c93922546313d118b1eb14751982', '2121', '212', '21212', '1', 1, '2017-12-08 17:27:06');
INSERT INTO `sys_user` VALUES (46, '12121212', '741c7ce99daa8fb6a81ee59f67ede114', '12121212', '4343', '45454', '1', 1, '2017-12-08 17:27:14');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色的对应关系';

SET FOREIGN_KEY_CHECKS = 1;
