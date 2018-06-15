/*
Navicat MySQL Data Transfer

Source Server         : localhost_root_phpStudy
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : prj_shop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-06-15 19:36:41
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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='【操作日志】后台管理员';

-- ----------------------------
-- Records of market_admin_operation_log
-- ----------------------------

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
INSERT INTO `market_system_config` VALUES ('1', 'SYSTEM_NAME', 'LOGO_name', '0', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='【上传文件】文件信息表';

-- ----------------------------
-- Records of market_upload_file
-- ----------------------------
INSERT INTO `market_upload_file` VALUES ('23', '96effea7gy1frm9cu1347j21kw1lfu0x.jpg', 'shop33f8abcbfda9ad0ad2fc5d55234455ca1529061870.jpg', 'imgserver1//img/shop33f8abcbfda9ad0ad2fc5d55234455ca1529061870.jpg', 'jpg', 'image/jpeg', '163092', '33f8abcbfda9ad0ad2fc5d55234455ca', '5d895ab5c19a1e2af6ac859b8af7a6576d38e5b8', '33f8abcbfda9ad0ad2fc5d55234455ca', '1529061870', '2018-06-15 19:24:30', '1');

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
INSERT INTO `market_user_auths` VALUES ('6', '5', 'mobile', '18853993555', 'd93a5def7511da3d0f2d171d9c344e91', '1', '1515417690', '1515417690', '2018-01-08 21:21:30', '1');
INSERT INTO `market_user_auths` VALUES ('7', '6', 'mobile', '18853993556', 'd93a5def7511da3d0f2d171d9c344e91', '1', '1515421979', '1515421979', '2018-01-08 22:32:59', '1');
