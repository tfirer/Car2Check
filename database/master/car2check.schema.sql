# 数据库表结构初始化脚本
set names utf8;

CREATE TABLE `order` (
   `id` INT NOT NULL AUTO_INCREMENT COMMENT '账订单ID',
   `number` CHAR(20) NOT NULL COMMENT '订单编号',
   `customer_tel` VARCHAR(20) NOT NULL COMMENT '客户电话',
   `car_number` VARCHAR(10) NOT NULL COMMENT '车牌号',
   `status` SMALLINT NOT NULL COMMENT '状态()',
   `create_time` DATETIME NOT NULL COMMENT '添加时间',
   `update_time` DATETIME NOT NULL COMMENT '更新时间',
   PRIMARY KEY (`id`),
   UNIQUE KEY (`number`),
   KEY (`customer_tel`),
   KEY (`car_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT '订单表';

CREATE TABLE `order_picture` (
   `id` BIGINT NOT NULL auto_increment COMMENT 'ID',
   `order_id` BIGINT NOT NULL COMMENT '订单ID',
   `specification_id` INT NOT NULL COMMENT '属性规格ID',
   `value` VARCHAR(255) NOT NULL COMMENT '属性值',
   PRIMARY KEY (id),
   KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT '订单快照(大表)';

CREATE TABLE `picture_specification` (
   `id` INT NOT NULL COMMENT '属性规格ID',
   `key` VARCHAR(20) NOT NULL COMMENT '属性KEY',
   `name` VARCHAR(64) NOT NULL COMMENT '属性名称',
   `description` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '描述',
   PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin COMMENT '快照属性规格';

INSERT INTO `picture_specification` VALUES(10000, 'full', '整车', '整车完整照片');
INSERT INTO `picture_specification` VALUES(20000, 'frontFender', '前翼子板', '前翼子板');
INSERT INTO `picture_specification` VALUES(20001, 'frontRightFender', '前右翼子板', '前右翼子板');
INSERT INTO `picture_specification` VALUES(20002, 'frontLeftFender', '前左翼子板', '前左翼子板');