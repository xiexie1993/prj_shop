/*
Navicat MySQL Data Transfer

Source Server         : localhost_root
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : shop_market

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-02-16 01:46:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for market_admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `market_admin_operation_log`;
CREATE TABLE `market_admin_operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `uid` int(11) NOT NULL COMMENT '订单ID',
  `username` varchar(50) NOT NULL COMMENT '记录该日志时的用户名',
  `content` varchar(255) DEFAULT NULL COMMENT '操作内容',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='【操作日志】后台管理员';

-- ----------------------------
-- Records of market_admin_operation_log
-- ----------------------------
INSERT INTO `market_admin_operation_log` VALUES ('1', '1', 'admin', '登录', null, '2017-12-23 21:41:51', '1');
INSERT INTO `market_admin_operation_log` VALUES ('2', '0', '', '早已退出！未知自动退出', '1514039595', '2017-12-23 22:33:17', '1');
INSERT INTO `market_admin_operation_log` VALUES ('3', '3', 'admin', '登录', '1514040270', '2017-12-23 22:44:30', '1');
INSERT INTO `market_admin_operation_log` VALUES ('4', '3', 'admin', '退出成功！', '1514040714', '2017-12-23 22:51:55', '1');
INSERT INTO `market_admin_operation_log` VALUES ('5', '3', 'admin', '登录', '1514040727', '2017-12-23 22:52:07', '1');
INSERT INTO `market_admin_operation_log` VALUES ('6', '3', 'admin', '登录', '1514041373', '2017-12-23 23:02:53', '1');
INSERT INTO `market_admin_operation_log` VALUES ('7', '3', 'admin', '登录', '1514041510', '2017-12-23 23:05:10', '1');
INSERT INTO `market_admin_operation_log` VALUES ('8', '3', 'admin', '编辑了租赁方案类目', '1514041603', '2017-12-23 23:06:43', '1');
INSERT INTO `market_admin_operation_log` VALUES ('9', '3', 'admin', '编辑了租赁方案类目', '1514041849', '2017-12-23 23:10:49', '1');
INSERT INTO `market_admin_operation_log` VALUES ('10', '3', 'admin', '编辑了租赁方案类目', '1514041869', '2017-12-23 23:11:09', '1');
INSERT INTO `market_admin_operation_log` VALUES ('11', '3', 'admin', '退出成功！', '1514041874', '2017-12-23 23:11:15', '1');
INSERT INTO `market_admin_operation_log` VALUES ('12', '3', 'admin', '登录', '1514041890', '2017-12-23 23:11:30', '1');
INSERT INTO `market_admin_operation_log` VALUES ('13', '3', 'admin', '删除了一个租赁方案类目', '1514042164', '2017-12-23 23:16:04', '1');
INSERT INTO `market_admin_operation_log` VALUES ('14', '0', '未知用户，请求退出', '未知自动退出', '1514095277', '2017-12-24 14:01:18', '1');
INSERT INTO `market_admin_operation_log` VALUES ('15', '3', 'admin', '登录', '1514095288', '2017-12-24 14:01:28', '1');
INSERT INTO `market_admin_operation_log` VALUES ('16', '3', 'admin', '登录', '1514100537', '2017-12-24 15:28:57', '1');
INSERT INTO `market_admin_operation_log` VALUES ('17', '3', 'admin', '编辑了租赁方案类目', '1514100597', '2017-12-24 15:29:57', '1');
INSERT INTO `market_admin_operation_log` VALUES ('18', '3', 'admin', '删除了一个租赁方案类目', '1514100641', '2017-12-24 15:30:41', '1');
INSERT INTO `market_admin_operation_log` VALUES ('19', '3', 'admin', '登录', '1514111317', '2017-12-24 18:28:37', '1');
INSERT INTO `market_admin_operation_log` VALUES ('20', '3', 'admin', '登录', '1514112524', '2017-12-24 18:48:44', '1');
INSERT INTO `market_admin_operation_log` VALUES ('21', '3', 'admin', '登录', '1514114485', '2017-12-24 19:21:25', '1');
INSERT INTO `market_admin_operation_log` VALUES ('22', '3', 'admin', '编辑了 租赁订单', '1514114630', '2017-12-24 19:23:50', '1');
INSERT INTO `market_admin_operation_log` VALUES ('23', '3', 'admin', '编辑了 租赁订单', '1514114909', '2017-12-24 19:28:29', '1');
INSERT INTO `market_admin_operation_log` VALUES ('24', '3', 'admin', '登录', '1514117121', '2017-12-24 20:05:21', '1');
INSERT INTO `market_admin_operation_log` VALUES ('25', '3', 'admin', '编辑了 租赁订单', '1514117143', '2017-12-24 20:05:43', '1');
INSERT INTO `market_admin_operation_log` VALUES ('26', '3', 'admin', '编辑了 租赁订单', '1514117363', '2017-12-24 20:09:23', '1');
INSERT INTO `market_admin_operation_log` VALUES ('27', '3', 'admin', '编辑了 租赁订单', '1514117487', '2017-12-24 20:11:27', '1');
INSERT INTO `market_admin_operation_log` VALUES ('28', '3', 'admin', '编辑了 租赁订单', '1514117772', '2017-12-24 20:16:12', '1');
INSERT INTO `market_admin_operation_log` VALUES ('29', '3', 'admin', '退出成功！', '1514119271', '2017-12-24 20:41:12', '1');
INSERT INTO `market_admin_operation_log` VALUES ('30', '3', 'admin', '登录', '1514119284', '2017-12-24 20:41:25', '1');
INSERT INTO `market_admin_operation_log` VALUES ('31', '3', 'admin', '登录', '1514119902', '2017-12-24 20:51:42', '1');
INSERT INTO `market_admin_operation_log` VALUES ('32', '3', 'admin', '登录', '1514120580', '2017-12-24 21:03:00', '1');
INSERT INTO `market_admin_operation_log` VALUES ('33', '3', 'admin', '登录', '1514206181', '2017-12-25 20:49:41', '1');
INSERT INTO `market_admin_operation_log` VALUES ('34', '3', 'admin', '登录', '1514207199', '2017-12-25 21:06:39', '1');
INSERT INTO `market_admin_operation_log` VALUES ('35', '3', 'admin', '登录', '1514374670', '2017-12-27 19:37:50', '1');
INSERT INTO `market_admin_operation_log` VALUES ('36', '3', 'admin', '退出成功！', '1514377757', '2017-12-27 20:29:18', '1');
INSERT INTO `market_admin_operation_log` VALUES ('37', '3', 'admin', '登录', '1514377785', '2017-12-27 20:29:45', '1');
INSERT INTO `market_admin_operation_log` VALUES ('38', '3', 'admin', '退出成功！', '1514378582', '2017-12-27 20:43:03', '1');
INSERT INTO `market_admin_operation_log` VALUES ('39', '3', 'admin', '登录', '1514378607', '2017-12-27 20:43:27', '1');
INSERT INTO `market_admin_operation_log` VALUES ('40', '3', 'admin', '编辑了租赁方案类目', '1514378730', '2017-12-27 20:45:30', '1');
INSERT INTO `market_admin_operation_log` VALUES ('41', '3', 'admin', '删除了一个租赁方案类目', '1514378755', '2017-12-27 20:45:55', '1');
INSERT INTO `market_admin_operation_log` VALUES ('42', '3', 'admin', '编辑了 帮助中心文章类目', '1514378901', '2017-12-27 20:48:21', '1');
INSERT INTO `market_admin_operation_log` VALUES ('43', '3', 'admin', '编辑了 帮助中心文章类目', '1514379153', '2017-12-27 20:52:33', '1');
INSERT INTO `market_admin_operation_log` VALUES ('44', '3', 'admin', '退出成功！', '1514379302', '2017-12-27 20:55:03', '1');
INSERT INTO `market_admin_operation_log` VALUES ('45', '3', 'admin', '登录', '1514379314', '2017-12-27 20:55:14', '1');
INSERT INTO `market_admin_operation_log` VALUES ('46', '3', 'admin', '编辑了 帮助中心文章类目', '1514379337', '2017-12-27 20:55:37', '1');
INSERT INTO `market_admin_operation_log` VALUES ('47', '3', 'admin', '删除了一个租赁方案类目', '1514379517', '2017-12-27 20:58:37', '1');
INSERT INTO `market_admin_operation_log` VALUES ('48', '3', 'admin', '编辑了 帮助中心文章类目', '1514379539', '2017-12-27 20:58:59', '1');
INSERT INTO `market_admin_operation_log` VALUES ('49', '3', 'admin', '编辑了 帮助中心文章类目', '1514379564', '2017-12-27 20:59:24', '1');
INSERT INTO `market_admin_operation_log` VALUES ('50', '3', 'admin', '退出成功！', '1514379750', '2017-12-27 21:02:31', '1');
INSERT INTO `market_admin_operation_log` VALUES ('51', '3', 'admin', '登录', '1514379771', '2017-12-27 21:02:51', '1');
INSERT INTO `market_admin_operation_log` VALUES ('52', '3', 'admin', '新增了 帮助中心文章类目', '1514380062', '2017-12-27 21:07:42', '1');
INSERT INTO `market_admin_operation_log` VALUES ('53', '3', 'admin', '删除了一个 帮助中心文章类目', '1514380079', '2017-12-27 21:07:59', '1');
INSERT INTO `market_admin_operation_log` VALUES ('54', '3', 'admin', '删除了一个 帮助中心文章类目', '1514380087', '2017-12-27 21:08:07', '1');
INSERT INTO `market_admin_operation_log` VALUES ('55', '3', 'admin', '编辑了 帮助中心文章类目', '1514384177', '2017-12-27 22:16:17', '1');
INSERT INTO `market_admin_operation_log` VALUES ('56', '3', 'admin', '退出成功！', '1514384213', '2017-12-27 22:16:54', '1');
INSERT INTO `market_admin_operation_log` VALUES ('57', '3', 'admin', '登录', '1514384225', '2017-12-27 22:17:05', '1');
INSERT INTO `market_admin_operation_log` VALUES ('58', '3', 'admin', '编辑了 帮助中心文章', '1514385747', '2017-12-27 22:42:27', '1');
INSERT INTO `market_admin_operation_log` VALUES ('59', '3', 'admin', '删除了一个 帮助中心文章', '1514385861', '2017-12-27 22:44:21', '1');
INSERT INTO `market_admin_operation_log` VALUES ('60', '3', 'admin', '登录', '1514464000', '2017-12-28 20:26:40', '1');
INSERT INTO `market_admin_operation_log` VALUES ('61', '3', 'admin', '退出成功！', '1514465844', '2017-12-28 20:57:25', '1');
INSERT INTO `market_admin_operation_log` VALUES ('62', '3', 'admin', '登录', '1514465878', '2017-12-28 20:57:58', '1');
INSERT INTO `market_admin_operation_log` VALUES ('63', '3', 'admin', '退出成功！', '1514468270', '2017-12-28 21:37:51', '1');
INSERT INTO `market_admin_operation_log` VALUES ('64', '3', 'admin', '登录', '1514468293', '2017-12-28 21:38:13', '1');
INSERT INTO `market_admin_operation_log` VALUES ('65', '3', 'admin', '退出成功！', '1514469290', '2017-12-28 21:54:51', '1');
INSERT INTO `market_admin_operation_log` VALUES ('66', '3', 'admin', '登录', '1514469321', '2017-12-28 21:55:21', '1');
INSERT INTO `market_admin_operation_log` VALUES ('67', '3', 'admin', '编辑了租赁方案类目', '1514469464', '2017-12-28 21:57:44', '1');
INSERT INTO `market_admin_operation_log` VALUES ('68', '3', 'admin', '编辑了 租赁方案类目 下 商品规格', '1514469921', '2017-12-28 22:05:21', '1');
INSERT INTO `market_admin_operation_log` VALUES ('69', '3', 'admin', '编辑了 租赁方案类目 下 商品规格', '1514469954', '2017-12-28 22:05:54', '1');
INSERT INTO `market_admin_operation_log` VALUES ('70', '3', 'admin', '编辑了 租赁方案类目 下 商品规格', '1514469970', '2017-12-28 22:06:10', '1');
INSERT INTO `market_admin_operation_log` VALUES ('71', '3', 'admin', '编辑了 租赁方案类目 下 商品规格', '1514471029', '2017-12-28 22:23:49', '1');
INSERT INTO `market_admin_operation_log` VALUES ('72', '3', 'admin', '编辑了 租赁方案类目 下 商品规格', '1514471583', '2017-12-28 22:33:03', '1');
INSERT INTO `market_admin_operation_log` VALUES ('73', '3', 'admin', '新增了 租赁方案类目 下 商品规格', '1514473733', '2017-12-28 23:08:53', '1');
INSERT INTO `market_admin_operation_log` VALUES ('74', '3', 'admin', '删除了一个 租赁方案类目 下 商品规格', '1514474333', '2017-12-28 23:18:53', '1');
INSERT INTO `market_admin_operation_log` VALUES ('75', '3', 'admin', '退出成功！', '1514474975', '2017-12-28 23:29:36', '1');
INSERT INTO `market_admin_operation_log` VALUES ('76', '3', 'admin', '登录', '1514475014', '2017-12-28 23:30:14', '1');
INSERT INTO `market_admin_operation_log` VALUES ('77', '0', '未知用户，请求退出', '未知自动退出', '1514476257', '2017-12-28 23:50:58', '1');
INSERT INTO `market_admin_operation_log` VALUES ('78', '3', 'admin', '登录', '1514476273', '2017-12-28 23:51:13', '1');
INSERT INTO `market_admin_operation_log` VALUES ('79', '0', '未知用户，请求退出', '未知自动退出', '1514477038', '2017-12-29 00:03:59', '1');
INSERT INTO `market_admin_operation_log` VALUES ('80', '3', 'admin', '登录', '1514477068', '2017-12-29 00:04:28', '1');
INSERT INTO `market_admin_operation_log` VALUES ('81', '3', 'admin', '退出成功！', '1514477874', '2017-12-29 00:17:55', '1');
INSERT INTO `market_admin_operation_log` VALUES ('82', '3', 'admin', '登录', '1514477898', '2017-12-29 00:18:18', '1');
INSERT INTO `market_admin_operation_log` VALUES ('83', '3', 'admin', '新增了 帮助中心文章', '1514477912', '2017-12-29 00:18:32', '1');
INSERT INTO `market_admin_operation_log` VALUES ('84', '3', 'admin', '编辑了 帮助中心文章', '1514477930', '2017-12-29 00:18:50', '1');
INSERT INTO `market_admin_operation_log` VALUES ('85', '3', 'admin', '编辑了 帮助中心文章', '1514478048', '2017-12-29 00:20:48', '1');
INSERT INTO `market_admin_operation_log` VALUES ('86', '3', 'admin', '登录', '1514547520', '2017-12-29 19:38:40', '1');
INSERT INTO `market_admin_operation_log` VALUES ('87', '3', 'admin', '登录', '1514554161', '2017-12-29 21:29:21', '1');
INSERT INTO `market_admin_operation_log` VALUES ('88', '0', '未知用户，请求退出', '未知自动退出', '1514556770', '2017-12-29 22:12:51', '1');
INSERT INTO `market_admin_operation_log` VALUES ('89', '3', 'admin', '登录', '1514556793', '2017-12-29 22:13:13', '1');
INSERT INTO `market_admin_operation_log` VALUES ('90', '3', 'admin', '登录', '1514638211', '2017-12-30 20:50:11', '1');
INSERT INTO `market_admin_operation_log` VALUES ('91', '3', 'admin', '登录', '1514641877', '2017-12-30 21:51:17', '1');
INSERT INTO `market_admin_operation_log` VALUES ('92', '3', 'admin', '退出成功！', '1514641911', '2017-12-30 21:51:52', '1');
INSERT INTO `market_admin_operation_log` VALUES ('93', '3', 'admin', '登录', '1514641932', '2017-12-30 21:52:12', '1');
INSERT INTO `market_admin_operation_log` VALUES ('94', '3', 'admin', '退出成功！', '1514643572', '2017-12-30 22:19:33', '1');
INSERT INTO `market_admin_operation_log` VALUES ('95', '3', 'admin', '登录', '1514643592', '2017-12-30 22:19:52', '1');
INSERT INTO `market_admin_operation_log` VALUES ('96', '3', 'admin', '新增了 租赁方案类目 下 商品规格 属性值 ', '1514644429', '2017-12-30 22:33:49', '1');
INSERT INTO `market_admin_operation_log` VALUES ('97', '3', 'admin', '新增了 租赁方案类目 下 商品规格 属性值 ', '1514644582', '2017-12-30 22:36:22', '1');
INSERT INTO `market_admin_operation_log` VALUES ('98', '3', 'admin', '退出成功！', '1514645276', '2017-12-30 22:47:57', '1');
INSERT INTO `market_admin_operation_log` VALUES ('99', '3', 'admin', '登录', '1514645303', '2017-12-30 22:48:23', '1');
INSERT INTO `market_admin_operation_log` VALUES ('100', '3', 'admin', '删除了一个 租赁方案类目 下 商品规格 属性值 ', '1514645602', '2017-12-30 22:53:22', '1');
INSERT INTO `market_admin_operation_log` VALUES ('101', '3', 'admin', '编辑了 租赁方案类目 下 商品规格 属性值 ', '1514645745', '2017-12-30 22:55:45', '1');
INSERT INTO `market_admin_operation_log` VALUES ('102', '3', 'admin', '登录', '1514901822', '2018-01-02 22:03:42', '1');
INSERT INTO `market_admin_operation_log` VALUES ('103', '3', 'admin', '登录', '1514902283', '2018-01-02 22:11:23', '1');
INSERT INTO `market_admin_operation_log` VALUES ('104', '3', 'admin', '登录', '1514982579', '2018-01-03 20:29:39', '1');
INSERT INTO `market_admin_operation_log` VALUES ('105', '3', 'admin', '登录', '1514982597', '2018-01-03 20:29:57', '1');
INSERT INTO `market_admin_operation_log` VALUES ('106', '3', 'admin', '登录', '1515072096', '2018-01-04 21:21:36', '1');
INSERT INTO `market_admin_operation_log` VALUES ('107', '3', 'admin', '登录', '1515074923', '2018-01-04 22:08:43', '1');
INSERT INTO `market_admin_operation_log` VALUES ('108', '3', 'admin', '退出成功！', '1515076154', '2018-01-04 22:29:15', '1');
INSERT INTO `market_admin_operation_log` VALUES ('109', '3', 'admin', '登录', '1515076177', '2018-01-04 22:29:37', '1');
INSERT INTO `market_admin_operation_log` VALUES ('110', '3', 'admin', '退出成功！', '1515077920', '2018-01-04 22:58:41', '1');
INSERT INTO `market_admin_operation_log` VALUES ('111', '3', 'admin', '登录', '1515077942', '2018-01-04 22:59:02', '1');
INSERT INTO `market_admin_operation_log` VALUES ('112', '3', 'admin', '登录', '1515079486', '2018-01-04 23:24:46', '1');
INSERT INTO `market_admin_operation_log` VALUES ('113', '3', 'admin', '退出成功！', '1515080084', '2018-01-04 23:34:45', '1');
INSERT INTO `market_admin_operation_log` VALUES ('114', '3', 'admin', '登录', '1515080105', '2018-01-04 23:35:05', '1');
INSERT INTO `market_admin_operation_log` VALUES ('115', '3', 'admin', '新增了 Banner图 ', '1515081722', '2018-01-05 00:02:02', '1');
INSERT INTO `market_admin_operation_log` VALUES ('116', '3', 'admin', '新增了 Banner图 ', '1515083396', '2018-01-05 00:29:56', '1');
INSERT INTO `market_admin_operation_log` VALUES ('117', '3', 'admin', '新增了 Banner图 ', '1515083654', '2018-01-05 00:34:14', '1');
INSERT INTO `market_admin_operation_log` VALUES ('118', '3', 'admin', '新增了 Banner图 ', '1515083822', '2018-01-05 00:37:02', '1');
INSERT INTO `market_admin_operation_log` VALUES ('119', '3', 'admin', '新增了 Banner图 ', '1515083856', '2018-01-05 00:37:36', '1');
INSERT INTO `market_admin_operation_log` VALUES ('120', '3', 'admin', '登录', '1515165439', '2018-01-05 23:17:19', '1');
INSERT INTO `market_admin_operation_log` VALUES ('121', '3', 'admin', '删除了一个 租赁方案类目 下 商品规格 属性值 ', '1515165495', '2018-01-05 23:18:15', '1');
INSERT INTO `market_admin_operation_log` VALUES ('122', '0', '未知用户，请求退出', '未知自动退出', '1515167315', '2018-01-05 23:48:36', '1');
INSERT INTO `market_admin_operation_log` VALUES ('123', '3', 'admin', '登录', '1515167345', '2018-01-05 23:49:05', '1');
INSERT INTO `market_admin_operation_log` VALUES ('124', '3', 'admin', '登录', '1515167724', '2018-01-05 23:55:24', '1');
INSERT INTO `market_admin_operation_log` VALUES ('125', '3', 'admin', '删除了一个 Banner图 ', '1515167744', '2018-01-05 23:55:44', '1');
INSERT INTO `market_admin_operation_log` VALUES ('126', '3', 'admin', '新增了 Banner图 ', '1515168024', '2018-01-06 00:00:25', '1');
INSERT INTO `market_admin_operation_log` VALUES ('127', '3', 'admin', '退出成功！', '1515168126', '2018-01-06 00:02:07', '1');
INSERT INTO `market_admin_operation_log` VALUES ('128', '3', 'admin', '登录', '1515168158', '2018-01-06 00:02:38', '1');
INSERT INTO `market_admin_operation_log` VALUES ('129', '3', 'admin', '新增了 Banner图 ', '1515168231', '2018-01-06 00:03:51', '1');
INSERT INTO `market_admin_operation_log` VALUES ('130', '3', 'admin', '编辑了 Banner图 ', '1515170207', '2018-01-06 00:36:47', '1');
INSERT INTO `market_admin_operation_log` VALUES ('131', '3', 'admin', '编辑了 Banner图 ', '1515170233', '2018-01-06 00:37:13', '1');
INSERT INTO `market_admin_operation_log` VALUES ('132', '3', 'admin', '编辑了 Banner图 ', '1515170261', '2018-01-06 00:37:41', '1');
INSERT INTO `market_admin_operation_log` VALUES ('133', '3', 'admin', '编辑了 Banner图 ', '1515170277', '2018-01-06 00:37:57', '1');
INSERT INTO `market_admin_operation_log` VALUES ('134', '3', 'admin', '编辑了 Banner图 ', '1515170319', '2018-01-06 00:38:39', '1');
INSERT INTO `market_admin_operation_log` VALUES ('135', '3', 'admin', '编辑了 Banner图 ', '1515170654', '2018-01-06 00:44:14', '1');
INSERT INTO `market_admin_operation_log` VALUES ('136', '3', 'admin', '编辑了 Banner图 ', '1515170671', '2018-01-06 00:44:31', '1');
INSERT INTO `market_admin_operation_log` VALUES ('137', '3', 'admin', '编辑了 Banner图 ', '1515170683', '2018-01-06 00:44:43', '1');
INSERT INTO `market_admin_operation_log` VALUES ('138', '3', 'admin', '编辑了 Banner图 ', '1515170738', '2018-01-06 00:45:38', '1');
INSERT INTO `market_admin_operation_log` VALUES ('139', '3', 'admin', '编辑了 Banner图 ', '1515170751', '2018-01-06 00:45:51', '1');
INSERT INTO `market_admin_operation_log` VALUES ('140', '3', 'admin', '登录', '1515239538', '2018-01-06 19:52:18', '1');
INSERT INTO `market_admin_operation_log` VALUES ('141', '3', 'admin', '登录', '1515412662', '2018-01-08 19:57:42', '1');
INSERT INTO `market_admin_operation_log` VALUES ('142', '0', '未知用户，请求退出', '未知自动退出', '1515415800', '2018-01-08 20:50:01', '1');
INSERT INTO `market_admin_operation_log` VALUES ('143', '3', 'admin', '登录', '1515415806', '2018-01-08 20:50:06', '1');
INSERT INTO `market_admin_operation_log` VALUES ('144', '3', 'admin', '登录', '1515422715', '2018-01-08 22:45:15', '1');
INSERT INTO `market_admin_operation_log` VALUES ('145', '3', 'admin', '登录', '1515498975', '2018-01-09 19:56:15', '1');
INSERT INTO `market_admin_operation_log` VALUES ('146', '3', 'admin', '登录', '1515594391', '2018-01-10 22:26:31', '1');
INSERT INTO `market_admin_operation_log` VALUES ('147', '3', 'admin', '登录', '1515595238', '2018-01-10 22:40:39', '1');
INSERT INTO `market_admin_operation_log` VALUES ('148', '3', 'admin', '登录', '1515674355', '2018-01-11 20:39:15', '1');
INSERT INTO `market_admin_operation_log` VALUES ('149', '3', 'admin', '退出成功！', '1515676401', '2018-01-11 21:13:22', '1');
INSERT INTO `market_admin_operation_log` VALUES ('150', '3', 'admin', '登录', '1515676480', '2018-01-11 21:14:40', '1');
INSERT INTO `market_admin_operation_log` VALUES ('151', '3', 'admin', '新增了 【 商品类目 】', '1515677134', '2018-01-11 21:25:34', '1');
INSERT INTO `market_admin_operation_log` VALUES ('152', '3', 'admin', '编辑了 【 商品类目 】', '1515677143', '2018-01-11 21:25:43', '1');
INSERT INTO `market_admin_operation_log` VALUES ('153', '3', 'admin', '编辑了 【 商品类目 】', '1515677238', '2018-01-11 21:27:18', '1');
INSERT INTO `market_admin_operation_log` VALUES ('154', '3', 'admin', '新增了 【 商品类目 】', '1515677266', '2018-01-11 21:27:46', '1');
INSERT INTO `market_admin_operation_log` VALUES ('155', '3', 'admin', '删除了一个 【 商品类目 】', '1515677275', '2018-01-11 21:27:55', '1');

-- ----------------------------
-- Table structure for market_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `market_admin_user`;
CREATE TABLE `market_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) DEFAULT NULL COMMENT '管理后台账号',
  `password` varchar(100) DEFAULT NULL COMMENT '管理后台密码',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `create_time` int(11) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `structure_id` int(11) DEFAULT NULL COMMENT '部门',
  `post_id` int(11) DEFAULT NULL COMMENT '岗位',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态,1启用0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='【用户】后台管理员表';

-- ----------------------------
-- Records of market_admin_user
-- ----------------------------
INSERT INTO `market_admin_user` VALUES ('1', 'admin_bak', 'd93a5def7511da3d0f2d171d9c344e91', '', null, '超级管理员', '1', '5', '1');
INSERT INTO `market_admin_user` VALUES ('3', 'admin', '44209a6a592dea91bcf7d4dd53e47a5a', '', '1487217060', '超级管理员', '5', '20', '1');
INSERT INTO `market_admin_user` VALUES ('4', 'xiexie', '44209a6a592dea91bcf7d4dd53e47a5a', null, null, '谢振斌', null, null, null);

-- ----------------------------
-- Table structure for market_banner
-- ----------------------------
DROP TABLE IF EXISTS `market_banner`;
CREATE TABLE `market_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'BannerID',
  `name` varchar(100) DEFAULT NULL COMMENT 'banner名',
  `url` varchar(255) DEFAULT NULL COMMENT 'banner跳转链接',
  `banner_pic` varchar(100) DEFAULT NULL COMMENT 'bannner地址',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='【  banner图  】表';

-- ----------------------------
-- Records of market_banner
-- ----------------------------
INSERT INTO `market_banner` VALUES ('1', '新那些', 'http://www.baidu.com', 'public/img/bwhc6b47ddc9c0cdb7ab9369c024f10b9cd1515083821.jpg', '', '0', '0', null, null, '1');
INSERT INTO `market_banner` VALUES ('2', null, '', null, '', '0', '0', null, null, '0');
INSERT INTO `market_banner` VALUES ('3', '阿范德萨萨达', '', 'public/img/bwh036a22f447cc378c2ee1316a472e6ce31514210697.jpg', '阿萨德 阿达', '0', '1', null, null, '1');
INSERT INTO `market_banner` VALUES ('4', '大叔大婶1111', '11二 ', 'public/img/bwh21ee12f47e5ade01e71abf4a501a73df1514211778.jpg', 'SaaS为去', '0', '0', null, null, '1');
INSERT INTO `market_banner` VALUES ('5', null, '试试', 'public/img/bwhc6b47ddc9c0cdb7ab9369c024f10b9cd1515083821.jpg', 'SaaS', '0', '0', null, null, '1');
INSERT INTO `market_banner` VALUES ('6', null, '的士速递', 'public/img/bwhe86f57a58f45642762cf033dd01d48121515082083.jpg', '订单', '0', '0', null, null, '1');
INSERT INTO `market_banner` VALUES ('7', '粉红色的回复', '试试', 'public/img/bwh21ee12f47e5ade01e71abf4a501a73df1514211778.jpg', '按时', '0', '0', null, null, '1');
INSERT INTO `market_banner` VALUES ('8', '的撒 而非个人', '啊分', 'public/img/bwh47b3e5608da90f592baea36402c64f291515083396.jpg', ' 分', '0', '1', null, null, '1');

-- ----------------------------
-- Table structure for market_goods
-- ----------------------------
DROP TABLE IF EXISTS `market_goods`;
CREATE TABLE `market_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID/商品编号',
  `name` varchar(255) DEFAULT NULL COMMENT '类目名称',
  `cover` varchar(255) DEFAULT NULL COMMENT '商品封面',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `category_id` int(11) DEFAULT NULL COMMENT '所属类目ID',
  `brand` varchar(255) DEFAULT NULL COMMENT '所属品牌名称',
  `brand_id` int(11) DEFAULT NULL COMMENT '所属品牌ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 商品信息表 】主表';

-- ----------------------------
-- Records of market_goods
-- ----------------------------

-- ----------------------------
-- Table structure for market_goods_belong_value
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_belong_value`;
CREATE TABLE `market_goods_belong_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID/商品编号',
  `category_id` varchar(255) DEFAULT NULL COMMENT '类目编号',
  `attr_id` varchar(255) DEFAULT NULL COMMENT '属性编号',
  `attr_value_id` varchar(255) DEFAULT NULL COMMENT '属性名称值下的值编号',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 具体商品中的所属属性数据表';

-- ----------------------------
-- Records of market_goods_belong_value
-- ----------------------------

-- ----------------------------
-- Table structure for market_goods_describe
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_describe`;
CREATE TABLE `market_goods_describe` (
  `desc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID/商品编号',
  `content` text COMMENT '商品描述内容（富文本编辑器的html内容）',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`desc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品图片表';

-- ----------------------------
-- Records of market_goods_describe
-- ----------------------------

-- ----------------------------
-- Table structure for market_goods_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_evaluate`;
CREATE TABLE `market_goods_evaluate` (
  `evaluate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID/商品编号',
  `content` varchar(255) DEFAULT NULL COMMENT ' 评价内容 ',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`evaluate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品评论表';

-- ----------------------------
-- Records of market_goods_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for market_goods_evaluate_reply
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_evaluate_reply`;
CREATE TABLE `market_goods_evaluate_reply` (
  `eval_reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复ID',
  `respondent_id` int(11) DEFAULT NULL COMMENT '回复者ID',
  `content` varchar(255) DEFAULT NULL COMMENT '评论回复内容',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`eval_reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品评论回复表';

-- ----------------------------
-- Records of market_goods_evaluate_reply
-- ----------------------------

-- ----------------------------
-- Table structure for market_goods_extended_attributes
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_extended_attributes`;
CREATE TABLE `market_goods_extended_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID/商品编号',
  `name` varchar(255) DEFAULT NULL COMMENT ' 名称 ',
  `attr_value` varchar(255) DEFAULT NULL COMMENT ' 对应值 ',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品介绍中的自定义规格属性数据表（纵表）';

-- ----------------------------
-- Records of market_goods_extended_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for market_goods_message
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_message`;
CREATE TABLE `market_goods_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID/商品编号',
  `content` varchar(255) DEFAULT NULL COMMENT ' 留言内容 ',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品留言表';

-- ----------------------------
-- Records of market_goods_message
-- ----------------------------

-- ----------------------------
-- Table structure for market_goods_message_reply
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_message_reply`;
CREATE TABLE `market_goods_message_reply` (
  `msg_rep_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言回复ID',
  `respondent_id` int(11) DEFAULT NULL COMMENT '回复者ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID/商品编号',
  `content` varchar(255) DEFAULT NULL COMMENT ' 留言内容 ',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`msg_rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品留言回复表';

-- ----------------------------
-- Records of market_goods_message_reply
-- ----------------------------

-- ----------------------------
-- Table structure for market_goods_option_attr
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_option_attr`;
CREATE TABLE `market_goods_option_attr` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `category_id` int(11) NOT NULL COMMENT '类目ID',
  `attr_name` varchar(255) NOT NULL COMMENT '属性ID',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 商品 选项数据 】 品类下的属性表';

-- ----------------------------
-- Records of market_goods_option_attr
-- ----------------------------

-- ----------------------------
-- Table structure for market_goods_option_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_option_attr_value`;
CREATE TABLE `market_goods_option_attr_value` (
  `attr_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
  `category_id` int(11) NOT NULL COMMENT '类目ID',
  `attr_id` int(11) NOT NULL COMMENT '属性ID',
  `attr_value` varchar(255) NOT NULL COMMENT '属性值',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`attr_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 商品 选项数据 】类目下属性值选项表';

-- ----------------------------
-- Records of market_goods_option_attr_value
-- ----------------------------

-- ----------------------------
-- Table structure for market_goods_option_brand
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_option_brand`;
CREATE TABLE `market_goods_option_brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `category_id` int(11) NOT NULL COMMENT '类目ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='【 商品 选项数据 】 不同品类下的品牌选择值';

-- ----------------------------
-- Records of market_goods_option_brand
-- ----------------------------
INSERT INTO `market_goods_option_brand` VALUES ('1', '1', 'Apple', null, '0', '0', null, null, '2018-01-11 22:02:32', '1');
INSERT INTO `market_goods_option_brand` VALUES ('2', '2', '小米', null, '0', '0', null, null, '2018-01-11 22:07:22', '1');
INSERT INTO `market_goods_option_brand` VALUES ('3', '1', '戴尔', null, '0', '0', null, null, '2018-01-11 22:07:37', '1');
INSERT INTO `market_goods_option_brand` VALUES ('4', '1', '联想', null, '0', '0', null, null, '2018-01-11 22:07:49', '1');

-- ----------------------------
-- Table structure for market_goods_option_category
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_option_category`;
CREATE TABLE `market_goods_option_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `title` varchar(100) DEFAULT NULL COMMENT '类目名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='【 商品 选项数据 】 品类选项表';

-- ----------------------------
-- Records of market_goods_option_category
-- ----------------------------
INSERT INTO `market_goods_option_category` VALUES ('1', '电脑', '戴尔|小米|ThinkPad', '0', '1', null, null, '2018-01-11 21:27:18', '1');
INSERT INTO `market_goods_option_category` VALUES ('2', '净水器', null, '0', '1', null, null, '2018-01-11 21:25:34', '1');
INSERT INTO `market_goods_option_category` VALUES ('3', '床上用品', null, '0', '1', null, null, '2018-01-11 21:27:55', '0');

-- ----------------------------
-- Table structure for market_goods_picture
-- ----------------------------
DROP TABLE IF EXISTS `market_goods_picture`;
CREATE TABLE `market_goods_picture` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID/商品编号',
  `pic_path` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `enable` tinyint(5) DEFAULT '1' COMMENT '启禁状态 （0 禁用,1 启用）',
  `create_time` int(11) DEFAULT NULL COMMENT '(代码) 数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '(代码) 数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 商品信息子表 】 商品图片表';

-- ----------------------------
-- Records of market_goods_picture
-- ----------------------------

-- ----------------------------
-- Table structure for market_help_article
-- ----------------------------
DROP TABLE IF EXISTS `market_help_article`;
CREATE TABLE `market_help_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `category_id` int(11) NOT NULL COMMENT '所属类目ID',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `author` varchar(100) DEFAULT NULL COMMENT '文章作者',
  `content` text COMMENT '文章内容',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='【帮助中心】帮助文章';

-- ----------------------------
-- Records of market_help_article
-- ----------------------------
INSERT INTO `market_help_article` VALUES ('1', '3', 'ss', '', 'sss', 'sss', '0', '1', '1', null, null, '2017-12-29 00:20:48');
INSERT INTO `market_help_article` VALUES ('2', '2', '微信支付不能使用问题', 'zz', '<div><img src=\"http://192.168.1.110:9999/public/img/bwh076e3caed758a1c18c91a0e9cae3368f1514383725.jpg\" style=\"\">测试</div><div>哈哈哈</div>', '噢噢噢噢', '0', '0', '1', null, null, '2017-12-27 22:42:27');
INSERT INTO `market_help_article` VALUES ('3', '1', 'ss', '', 'sss', 'sss', '0', '1', '1', null, null, '2017-12-29 00:18:50');

-- ----------------------------
-- Table structure for market_help_category
-- ----------------------------
DROP TABLE IF EXISTS `market_help_category`;
CREATE TABLE `market_help_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `title` varchar(100) DEFAULT NULL COMMENT '类目名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` tinyint(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='【帮助中心】一级类目表';

-- ----------------------------
-- Records of market_help_category
-- ----------------------------
INSERT INTO `market_help_category` VALUES ('1', '支付问题类', '关于支付问题的回复', '4', '1', '1', null, null, '2017-12-27 20:58:59');
INSERT INTO `market_help_category` VALUES ('2', '购买问题类', null, '0', '0', '1', null, null, '2017-12-26 21:07:43');
INSERT INTO `market_help_category` VALUES ('3', '退货问题类', '关于退货问题的回复', '5', '1', '1', null, null, '2017-12-27 20:59:24');
INSERT INTO `market_help_category` VALUES ('4', '归还问题类', null, '0', '0', '1', null, null, '2017-12-26 21:07:36');
INSERT INTO `market_help_category` VALUES ('5', 'ssssss', null, '0', '0', '0', null, null, '2017-12-27 21:08:07');
INSERT INTO `market_help_category` VALUES ('6', '测试问题类', '无', '6', '1', '0', null, null, '2017-12-27 21:07:59');

-- ----------------------------
-- Table structure for market_orders
-- ----------------------------
DROP TABLE IF EXISTS `market_orders`;
CREATE TABLE `market_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_number` varchar(18) NOT NULL COMMENT '订单号',
  `client_uid` int(11) NOT NULL COMMENT '客户UID',
  `name` varchar(100) DEFAULT NULL COMMENT '订单名称',
  `cover` varchar(100) DEFAULT NULL COMMENT '订单封面',
  `rent` decimal(10,2) DEFAULT NULL COMMENT '租金',
  `deposit` decimal(10,2) DEFAULT NULL COMMENT '押金',
  `num` int(10) DEFAULT NULL COMMENT '数量',
  `lease_period_start` int(10) DEFAULT NULL COMMENT '租期开始时间',
  `lease_period_end` int(10) DEFAULT NULL COMMENT '租期结束时间',
  `address` varchar(255) DEFAULT NULL COMMENT '用户地址',
  `certification_info` varchar(255) DEFAULT NULL COMMENT '当时认证资料',
  `price` decimal(10,2) DEFAULT NULL COMMENT '实付款',
  `remark` varchar(100) DEFAULT NULL COMMENT '客户备注',
  `order_status` tinyint(3) DEFAULT NULL COMMENT '订单状态 1待付款,2待发货,4待收货,5待归还,6归还中,7交易完成, 8订单关闭',
  `ship_name` varchar(100) DEFAULT NULL COMMENT '发货物流名称',
  `ship_number` varchar(100) DEFAULT NULL COMMENT '发货物流订单号',
  `return_ship_name` varchar(100) DEFAULT NULL COMMENT '归还物流名称',
  `return_ship_number` varchar(100) DEFAULT NULL COMMENT '归还物流订单号',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除, 1 未删除）',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='【 租赁订单 】简表';

-- ----------------------------
-- Records of market_orders
-- ----------------------------
INSERT INTO `market_orders` VALUES ('1', '2017122414034021', '1', '小米1', null, '999.99', '888.88', null, null, null, null, null, '1.00', null, '7', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('2', '2017122414034022', '2', '小米2', null, '9999.99', '999.99', null, null, null, null, null, '2.00', null, '4', '申通快递', '884884882', null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('3', '2017122414066021', '3', '小米3', null, '300.00', null, null, null, null, null, null, '3.00', null, '4', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('4', '2017122414034062', '4', '小米4', null, '400.00', null, null, null, null, null, null, '4.00', null, '3', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('5', '2017122414034066', '5', '小米5', null, '500.00', null, null, null, null, null, null, '5.00', null, '4', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('6', '2017122414034078', '6', '小米6', null, '600.00', null, null, null, null, null, null, '6.00', null, '5', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('7', '2017122424034022', '7', '小米7', null, '700.00', null, null, null, null, null, null, '7.00', null, '6', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('8', '2017122414034025', '8', '小米8', null, '800.00', null, null, null, null, null, null, '8.00', null, '7', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('9', '2017122414034028', '9', '小米9', null, '900.00', null, null, null, null, null, null, '9.00', null, '7', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('10', '2017122414034028', '10', 'iphone4', null, '44.00', null, null, null, null, null, null, '4.00', null, '7', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('11', '2017122414034028', '11', 'iphone5', null, '55.00', null, null, null, null, null, null, '5.00', null, '2', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('12', '2017122414034028', '12', 'iphone6', null, '66.00', null, null, null, null, null, null, '6.00', null, '2', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('13', '2017122414034028', '13', 'iphone7', null, '77.00', null, null, null, null, null, null, '7.00', null, '3', null, null, null, null, null, null, '1');
INSERT INTO `market_orders` VALUES ('14', '2017122414034028', '14', '小米note1', null, '88.00', null, null, null, null, null, null, '8.00', null, '5', null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for market_orders_log
-- ----------------------------
DROP TABLE IF EXISTS `market_orders_log`;
CREATE TABLE `market_orders_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_number` varchar(18) NOT NULL COMMENT '订单号',
  `order_status` tinyint(3) DEFAULT NULL COMMENT '订单状态 1待付款,2待发货,4待收货,5待归还,6归还中,7交易完成, 8 订单关闭',
  `operator` varchar(100) DEFAULT NULL COMMENT '操作者',
  `operat_content` varchar(255) DEFAULT NULL COMMENT '操作内容',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除, 1 未删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【 租赁订单 】日志表';

-- ----------------------------
-- Records of market_orders_log
-- ----------------------------

-- ----------------------------
-- Table structure for market_system_config
-- ----------------------------
DROP TABLE IF EXISTS `market_system_config`;
CREATE TABLE `market_system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(50) DEFAULT '',
  `value` varchar(100) DEFAULT '' COMMENT '配置值',
  `group` tinyint(4) unsigned DEFAULT '0' COMMENT '配置分组',
  `need_auth` tinyint(4) DEFAULT '1' COMMENT '1需要登录后才能获取，0不需要登录即可获取',
  PRIMARY KEY (`id`),
  UNIQUE KEY `参数名` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='【配置】系统配置表';

-- ----------------------------
-- Records of market_system_config
-- ----------------------------
INSERT INTO `market_system_config` VALUES ('1', 'SYSTEM_NAME', 'BWH', '0', '1');
INSERT INTO `market_system_config` VALUES ('2', 'SYSTEM_LOGO', 'uploads\\20170219\\d9fe7b784e1b1f406234b7b301e627e8.png', '0', '1');
INSERT INTO `market_system_config` VALUES ('3', 'LOGIN_SESSION_VALID', '1644', '0', '1');
INSERT INTO `market_system_config` VALUES ('4', 'IDENTIFYING_CODE', '0', '0', '1');

-- ----------------------------
-- Table structure for market_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `market_upload_file`;
CREATE TABLE `market_upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `name` varchar(255) DEFAULT NULL COMMENT '上传时的文件名',
  `savename` varchar(255) DEFAULT NULL COMMENT '保存时的文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '文件存放路径（相对路径）',
  `extension` varchar(50) DEFAULT NULL COMMENT '扩展名',
  `type` varchar(50) DEFAULT NULL COMMENT '文件类型',
  `size` varchar(50) DEFAULT NULL COMMENT '文件存储大小',
  `md5` varchar(255) DEFAULT NULL COMMENT '文件MD5散列',
  `sha1` varchar(255) DEFAULT NULL COMMENT '文件sha1散列',
  `md5_hash` varchar(255) DEFAULT NULL COMMENT '文件md5哈希散列',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='【上传文件】文件信息表';

-- ----------------------------
-- Records of market_upload_file
-- ----------------------------
INSERT INTO `market_upload_file` VALUES ('8', '紫衣女.jpg', 'bwh036a22f447cc378c2ee1316a472e6ce31514210697.jpg', 'public/img/bwh036a22f447cc378c2ee1316a472e6ce31514210697.jpg', 'jpg', 'image/jpeg', '285294', '036a22f447cc378c2ee1316a472e6ce3', '60c3d4a0123d9f3915ec0c75ac9c1ca797c4a2c3', '036a22f447cc378c2ee1316a472e6ce3', null, '2017-12-25 22:04:57', '1');
INSERT INTO `market_upload_file` VALUES ('9', '刘亦菲三国.jpg', 'bwh54f65c3cd6b3bad2587ef560a6eb02591514210733.jpg', 'public/img/bwh54f65c3cd6b3bad2587ef560a6eb02591514210733.jpg', 'jpg', 'image/jpeg', '126851', '54f65c3cd6b3bad2587ef560a6eb0259', 'f86f6369b1304e9306bf79b9373c88ca7bb99b8e', '54f65c3cd6b3bad2587ef560a6eb0259', null, '2017-12-25 22:05:33', '1');
INSERT INTO `market_upload_file` VALUES ('10', '刘亦菲红尘初状.jpg', 'bwhb98142d965e18122136e8333453940301514210951.jpg', 'public/img/bwhb98142d965e18122136e8333453940301514210951.jpg', 'jpg', 'image/jpeg', '83320', 'b98142d965e18122136e833345394030', '299e9f1ca3e03228eb9deedd9adbcac730b644eb', 'b98142d965e18122136e833345394030', null, '2017-12-25 22:09:11', '1');
INSERT INTO `market_upload_file` VALUES ('11', '书香女执笔.jpg', 'bwh21ee12f47e5ade01e71abf4a501a73df1514211778.jpg', 'public/img/bwh21ee12f47e5ade01e71abf4a501a73df1514211778.jpg', 'jpg', 'image/jpeg', '112244', '21ee12f47e5ade01e71abf4a501a73df', '30332f607dfdda726cb4d923e273c27441663552', '21ee12f47e5ade01e71abf4a501a73df', null, '2017-12-25 22:22:58', '1');
INSERT INTO `market_upload_file` VALUES ('12', 'Koala.jpg', 'bwh2b04df3ecc1d94afddff082d139c6f151514383481.jpg', 'public/img/bwh2b04df3ecc1d94afddff082d139c6f151514383481.jpg', 'jpg', 'image/jpeg', '780831', '2b04df3ecc1d94afddff082d139c6f15', '9c3dcb1f9185a314ea25d51aed3b5881b32f420c', '2b04df3ecc1d94afddff082d139c6f15', null, '2017-12-27 22:04:41', '1');
INSERT INTO `market_upload_file` VALUES ('13', '4.jpg', 'bwhfafa5efeaf3cbe3b23b2748d13e629a11514383657.jpg', 'public/img/bwhfafa5efeaf3cbe3b23b2748d13e629a11514383657.jpg', 'jpg', 'image/jpeg', '620888', 'fafa5efeaf3cbe3b23b2748d13e629a1', '54c2f1a1eb6f12d681a5c7078421a5500cee02ad', 'fafa5efeaf3cbe3b23b2748d13e629a1', null, '2017-12-27 22:07:37', '1');
INSERT INTO `market_upload_file` VALUES ('14', 'Chrysanthemum.jpg', 'bwh076e3caed758a1c18c91a0e9cae3368f1514383725.jpg', 'public/img/bwh076e3caed758a1c18c91a0e9cae3368f1514383725.jpg', 'jpg', 'image/jpeg', '879394', '076e3caed758a1c18c91a0e9cae3368f', 'f5f8ad26819a471318d24631fa5055036712a87e', '076e3caed758a1c18c91a0e9cae3368f', null, '2017-12-27 22:08:45', '1');
INSERT INTO `market_upload_file` VALUES ('15', '1.jpg', 'bwhba45c8f60456a672e003a875e469d0eb1514383763.jpg', 'public/img/bwhba45c8f60456a672e003a875e469d0eb1514383763.jpg', 'jpg', 'image/jpeg', '845941', 'ba45c8f60456a672e003a875e469d0eb', '30420d1a9afb2bcb60335812569af4435a59ce17', 'ba45c8f60456a672e003a875e469d0eb', null, '2017-12-27 22:09:23', '1');
INSERT INTO `market_upload_file` VALUES ('16', 'Penguins.jpg', 'bwh9d377b10ce778c4938b3c7e2c63a229a1514383842.jpg', 'public/img/bwh9d377b10ce778c4938b3c7e2c63a229a1514383842.jpg', 'jpg', 'image/jpeg', '777835', '9d377b10ce778c4938b3c7e2c63a229a', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '9d377b10ce778c4938b3c7e2c63a229a', null, '2017-12-27 22:10:42', '1');
INSERT INTO `market_upload_file` VALUES ('17', '2.jpg', 'bwh5a44c7ba5bbe4ec867233d67e48068481514384243.jpg', 'public/img/bwh5a44c7ba5bbe4ec867233d67e48068481514384243.jpg', 'jpg', 'image/jpeg', '775702', '5a44c7ba5bbe4ec867233d67e4806848', '3b15be84aff20b322a93c0b9aaa62e25ad33b4b4', '5a44c7ba5bbe4ec867233d67e4806848', null, '2017-12-27 22:17:23', '1');
INSERT INTO `market_upload_file` VALUES ('18', '刘诗诗红妆.jpg', 'bwhe86f57a58f45642762cf033dd01d48121515082083.jpg', 'public/img/bwhe86f57a58f45642762cf033dd01d48121515082083.jpg', 'jpg', 'image/jpeg', '230657', 'e86f57a58f45642762cf033dd01d4812', '3e2285b840cb55856128825646237a86f53b39fd', 'e86f57a58f45642762cf033dd01d4812', '1515082083', '2018-01-05 00:08:03', '1');
INSERT INTO `market_upload_file` VALUES ('19', '红妆绿木.jpg', 'bwh47b3e5608da90f592baea36402c64f291515083396.jpg', 'public/img/bwh47b3e5608da90f592baea36402c64f291515083396.jpg', 'jpg', 'image/jpeg', '86994', '47b3e5608da90f592baea36402c64f29', '7d9c7f5338ede79eb626472c9c9207658f817c91', '47b3e5608da90f592baea36402c64f29', '1515083396', '2018-01-05 00:29:56', '1');
INSERT INTO `market_upload_file` VALUES ('20', '刘亦菲（桥）.jpg', 'bwhc6b47ddc9c0cdb7ab9369c024f10b9cd1515083821.jpg', 'public/img/bwhc6b47ddc9c0cdb7ab9369c024f10b9cd1515083821.jpg', 'jpg', 'image/jpeg', '116040', 'c6b47ddc9c0cdb7ab9369c024f10b9cd', '868dcabb53371d38b54bc33321729f9411953b30', 'c6b47ddc9c0cdb7ab9369c024f10b9cd', '1515083821', '2018-01-05 00:37:01', '1');

-- ----------------------------
-- Table structure for market_users
-- ----------------------------
DROP TABLE IF EXISTS `market_users`;
CREATE TABLE `market_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户名/昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像图片',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
  `create_time` int(11) DEFAULT NULL COMMENT '（代码）数据创建时间戳',
  `update_time` int(11) DEFAULT NULL COMMENT '（代码）数据更新时间戳',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='【  用户表-客户  】主表 用户基础信息表';

-- ----------------------------
-- Records of market_users
-- ----------------------------
INSERT INTO `market_users` VALUES ('1', '18853993551', null, null, '1', '1515416418', null, '2018-01-08 21:00:18', '1');
INSERT INTO `market_users` VALUES ('2', '18853993552', null, null, '1', '1515416573', '1515416573', '2018-01-08 21:02:53', '1');
INSERT INTO `market_users` VALUES ('3', '18853993553', null, null, '1', '1515416683', '1515416683', '2018-01-08 21:04:43', '1');
INSERT INTO `market_users` VALUES ('4', '18853993554', null, null, '1', '1515417024', '1515417024', '2018-01-08 21:10:24', '1');
INSERT INTO `market_users` VALUES ('5', '18853993555', null, null, '1', '1515417690', '1515417690', '2018-01-08 21:21:30', '1');
INSERT INTO `market_users` VALUES ('6', '18853993556', null, null, '1', '1515421979', '1515421979', '2018-01-08 22:32:59', '1');

-- ----------------------------
-- Table structure for market_user_auths
-- ----------------------------
DROP TABLE IF EXISTS `market_user_auths`;
CREATE TABLE `market_user_auths` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `identity_type` varchar(255) DEFAULT NULL COMMENT '登录类型（手机号 邮箱 用户名）或第三方应用名称（微信 微博等） mobile（手机）、mailbox（邮箱）、username（用户名）、WeChat（微信）、Alipay（支付宝）、Weibo（微博）',
  `identifier` varchar(255) DEFAULT NULL COMMENT '标识（手机号 邮箱 用户名或第三方应用的唯一标识）',
  `credential` varchar(255) DEFAULT NULL COMMENT '密码凭证（站内的保存密码，站外的不保存或保存token）',
  `enable` tinyint(5) DEFAULT '0' COMMENT '启禁状态 （0 禁用,1 启用）',
  `create_time` int(11) DEFAULT NULL COMMENT '（代码）数据创建时间戳',
  `update_time` int(11) DEFAULT NULL COMMENT '（代码）数据更新时间戳',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '（数据库）数据更新时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态 （0 已删除;1 未删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='【  用户表-客户  】用户授权信息表（第三方应用授权）';

-- ----------------------------
-- Records of market_user_auths
-- ----------------------------
INSERT INTO `market_user_auths` VALUES ('1', '1', 'mobile', '18853993549', '', '0', null, null, '2018-01-08 20:27:35', '1');
INSERT INTO `market_user_auths` VALUES ('2', '0', 'mobile', '18853993550', null, '1', null, null, '2018-01-08 20:45:16', '1');
INSERT INTO `market_user_auths` VALUES ('3', '0', 'mobile', '18853993552', null, '1', '1515416573', '1515416573', '2018-01-08 21:02:53', '1');
INSERT INTO `market_user_auths` VALUES ('4', '0', 'mobile', '18853993553', null, '1', '1515416683', '1515416683', '2018-01-08 21:04:43', '1');
INSERT INTO `market_user_auths` VALUES ('5', '4', 'mobile', '18853993554', null, '1', '1515417024', '1515417024', '2018-01-08 21:10:24', '1');
INSERT INTO `market_user_auths` VALUES ('6', '5', 'mobile', '18853993555', 'd93a5def7511da3d0f2d171d9c344e91', '1', '1515417690', '1515417690', '2018-01-08 21:21:30', '1');
INSERT INTO `market_user_auths` VALUES ('7', '6', 'mobile', '18853993556', 'd93a5def7511da3d0f2d171d9c344e91', '1', '1515421979', '1515421979', '2018-01-08 22:32:59', '1');
