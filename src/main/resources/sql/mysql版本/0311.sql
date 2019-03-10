/*
 Navicat Premium Data Transfer

 Source Server         : afabao
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : erp

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 11/03/2019 00:54:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for purchase_ order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_ order`;
CREATE TABLE `purchase_ order`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NUMBER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SUPPLIER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SUPPLIER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_NUMBER` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TOTAL_PRICE` double(20, 0) NOT NULL,
  `APPLY_USER` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `APPLY_TIME` datetime(6) NULL,
  `STATE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ORDER_AUDIT_USER` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ORDER_AUDIT_TIME` datetime(6) NULL DEFAULT NULL,
  `PAY_AUDIT_USER` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PAY_AUDIT_TIME` datetime(6) NULL DEFAULT NULL,
  `APPLY_DESCRIBE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AUDIT_DESCRIBE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_access_permission_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_access_permission_test`;
CREATE TABLE `sys_access_permission_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问权限表',
  `URL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问链接',
  `ROLES` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色列表用,分割',
  `SORT` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `IS_DELETED` int(2) NULL DEFAULT NULL COMMENT '是否删除',
  `CREATE_USER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `UPDATE_USER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uidx_request_url`(`URL`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_access_permission_test
-- ----------------------------
INSERT INTO `sys_access_permission_test` VALUES ('0dc46a787e4a4cf0bbeadd98d649820c', 'supplier_goods/*', 'authc,roleOr[test,admin]', 584, NULL, 'gameloft9', NULL, NULL, NULL);
INSERT INTO `sys_access_permission_test` VALUES ('0ebb4bc6aaf24491b28cb47a56033a1e', 'supplier/*', 'authc,roleOr[test,admin]', 332, NULL, 'gameloft9', NULL, NULL, NULL);
INSERT INTO `sys_access_permission_test` VALUES ('1', '/', 'anon', 1, 0, 'admin', '2017-12-25 16:41:02', 'admin', '2017-12-25 16:41:02');
INSERT INTO `sys_access_permission_test` VALUES ('2', '/index', 'anon', 2, 0, 'admin', '2017-12-25 16:41:08', 'admin', '2017-12-25 16:41:08');
INSERT INTO `sys_access_permission_test` VALUES ('22874f2822724956b674cb64f88aa56e', 'backlogByBuyerM/*', 'authc,roleOr[采购部领导,admin]', 331, NULL, 'afabao', NULL, NULL, NULL);
INSERT INTO `sys_access_permission_test` VALUES ('3', '/login', 'anon', 3, 0, 'admin', '2017-12-25 16:41:08', 'admin', '2017-12-25 16:41:08');
INSERT INTO `sys_access_permission_test` VALUES ('4', '/role/*', 'authc,roles[admin]', 5, 0, 'admin', '2017-12-25 16:41:08', 'admin', '2017-12-25 16:41:08');
INSERT INTO `sys_access_permission_test` VALUES ('428529f107ea4dcf802afb3088597461', 'meterial/*', 'authc,roleOr[test,admin]', 192, NULL, 'gameloft9', NULL, NULL, NULL);
INSERT INTO `sys_access_permission_test` VALUES ('5', '/getVCode', 'anon', 4, 0, 'admin', '2017-12-25 16:41:09', 'admin', '2017-12-25 16:41:09');
INSERT INTO `sys_access_permission_test` VALUES ('521e8de3df85423792dd43ee4388cff4', 'material_goods/*', 'authc,roleOr[test,admin]', 551, NULL, 'gameloft9', NULL, NULL, NULL);
INSERT INTO `sys_access_permission_test` VALUES ('6', '/**/*.do', 'authc', 999, 0, 'admin', '2017-12-25 16:41:09', 'admin', '2017-12-25 16:41:09');
INSERT INTO `sys_access_permission_test` VALUES ('6319f8a7688343139ac4ba0d40877e2c', 'sys/*', 'authc,roles[test,admin]', 201, 0, 'gameloft9', '2017-12-28 11:04:58', NULL, '2017-12-28 11:04:58');
INSERT INTO `sys_access_permission_test` VALUES ('66d79202dfb24a3cb274de2fd9c9bb08', '/supplier', 'authc,roleOr[test,admin]', 425, NULL, 'gameloft9', NULL, NULL, NULL);
INSERT INTO `sys_access_permission_test` VALUES ('7042e4eeebf5433388ddfdfb09764369', 'log/*', 'authc,roles[test,admin]', 419, 0, 'gameloft9', '2017-12-27 17:04:10', NULL, '2017-12-27 17:04:10');
INSERT INTO `sys_access_permission_test` VALUES ('7c1f21aa63cf4fd6a5be43072e81ab99', 'test/*', 'authc,roles[test,admin]', 135, 0, 'gameloft9', '2017-12-28 11:05:10', NULL, '2017-12-28 11:05:10');
INSERT INTO `sys_access_permission_test` VALUES ('7ee176c20c904536862da37aacb0f7c8', 'org/*', 'authc,roles[test]', 123, 0, 'gameloft9', '2017-12-27 17:04:18', NULL, '2017-12-27 17:04:18');
INSERT INTO `sys_access_permission_test` VALUES ('8e68507e882c4165b06a4a9147d14a34', 'role/*', 'authc,roles[admin]', 669, 0, 'gameloft9', '2017-12-27 17:04:04', NULL, '2017-12-27 17:04:04');
INSERT INTO `sys_access_permission_test` VALUES ('90762decb8874ba0955eb8cef21b6682', 'menu/*', 'authc,roles[admin]', 197, 0, 'gameloft9', '2017-12-28 11:02:26', NULL, '2017-12-28 11:02:26');
INSERT INTO `sys_access_permission_test` VALUES ('947984d463bc46be8dd50834445807ae', 'order/*', 'authc,roleOr[test,采购部员工,admin]', 561, NULL, 'afabao', NULL, NULL, NULL);
INSERT INTO `sys_access_permission_test` VALUES ('964ec98bc90a42c3924474fa45e71b4d', 'purchase_order/*', 'authc,roleOr[test,采购部员工,admin]', 667, NULL, 'afabao', NULL, NULL, NULL);
INSERT INTO `sys_access_permission_test` VALUES ('c8c4e92a1ece4da79ede1763faecdf77', 'sysUser/*', 'authc,roles[admin]', 170, 0, 'gameloft9', '2017-12-27 17:05:49', NULL, '2017-12-27 17:05:49');
INSERT INTO `sys_access_permission_test` VALUES ('c8d3538bfc0d4e0490108a2a23322566', 'sup/*', 'authc,roleOr[test,admin]', 222, NULL, 'gameloft9', NULL, NULL, NULL);
INSERT INTO `sys_access_permission_test` VALUES ('e76385f3ce1a45dc9f0be111d844d1a9', 'supplier/list', 'authc,roleOr[test,admin]', 394, NULL, 'gameloft9', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_material_goods_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_material_goods_test`;
CREATE TABLE `sys_material_goods_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SUPPLIER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MATERIAL_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_PRICE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_material_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_material_test`;
CREATE TABLE `sys_material_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_DESCRIBE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_material_test
-- ----------------------------
INSERT INTO `sys_material_test` VALUES ('1c3da2c5d97e4c28bf9404346d3a3997', '深沟球轴承', '轴承', '深沟球轴承 (GB/T 276—1994) 原名单列向心球轴承，是应用最广泛 的一种滚动轴承。其特点是摩擦阻力小，转速高，能用于承受径向负荷或径 向和轴向同时作用的联合负荷的机件上，也可用于承受轴向负荷的机件上， 例如小功率电动机、汽车及拖拉机变速箱、机床齿轮箱，一般机器、工具等。');
INSERT INTO `sys_material_test` VALUES ('3a5710e490d046479975302c31473dc6', '调心球轴承', '轴承', '调心球轴承是二条滚道的内圈和滚道为球面的外圈之间，装配有圆球状滚珠的轴承。外圈滚道面的曲率中心与轴承中心一致，所以具有与自动调心球轴承同样的调心功能。在轴、外壳出现挠曲时，可以自动调整，不增加轴承负担。调心滚子轴承可以承受径向负荷及二个方向的轴向负荷。 调心球轴承径向负荷能力大，适用于有重负荷、冲击负荷的情况。内圈内径是锥孔的轴承，可直接安装。');
INSERT INTO `sys_material_test` VALUES ('3dc21eaa6e1b480fa77073f6ba866eae', '向心轴承', '轴承', '其中径向接触轴承为公称接触角为0的向心轴承，向心角接触轴承为公称接触角大于0到45的向心轴承。');
INSERT INTO `sys_material_test` VALUES ('3f9bb5f2783146dc937c8136fb91ed30', '滑动轴承', '轴承', '滑动轴承不分内外圈也没有滚动体，一般是由耐磨材料制成。常用于低速，轻载及加注润滑油及维护困难的机械转动部位。');
INSERT INTO `sys_material_test` VALUES ('423dffdd98a84885a835ee3c9ab07fb1', '角接触球轴承', '轴承', '一般习惯上称为36、46型轴承为代表的六类轴承，角接触一般为15度、25度、45度等。');
INSERT INTO `sys_material_test` VALUES ('62b868302e704608bb06dbd75eca12ec', '关节轴承', '轴承', '关节轴承的滑动接触表面为球面，主要适用于摆动运动、倾斜运动和旋转运动。');
INSERT INTO `sys_material_test` VALUES ('6ea095efef69445fb292fc0e8fb9cf39', '滚针轴承', '轴承', '用途组合滚针轴承是由向心滚针轴承和推力轴承部件组合的轴承单元，其结构紧凑体积小，旋转精度高，可在承受很高径向负荷的同时承受一定的轴向负荷。并且产品结构形式多样、适应性广、易于安装。组合滚针轴承广泛用于机床、冶金机械、纺织机械和印刷机械等各种机械设备，并可使机械系统设计的十分紧凑灵巧。');
INSERT INTO `sys_material_test` VALUES ('797f5e2c4a384c898eab3c71857a8b1c', '法兰轴承', '轴承', '法兰轴承外轮上带有凸缘法兰。特点是能简化主机结构，缩小主机尺寸，使轴承更容易定位。');
INSERT INTO `sys_material_test` VALUES ('8cafbbb6c8bd4a3aaf609279a045081a', '推力轴承', '轴承', '轴向接触轴承为公称接触角为90的推力轴承，推力角接触轴承为公称接触角大于45但小于90的推力轴承。');
INSERT INTO `sys_material_test` VALUES ('ae9c2b1f27ca4cf09be132f24eafb054', '带座轴承', '轴承', '向心轴承与座组合在一起的一种组件，在与轴承轴心线平行的支撑表面上有个安装螺钉的底板。');
INSERT INTO `sys_material_test` VALUES ('b134f0eb3d594c0d9c55b09561338f97', 'O型密封圈', '密封圈', '主要用于精密封和往复运动密封，用于旋转运动密封时，仅限于低速回转密封装置。精密封的压力为0～400Mpa，动密封压力为5～35Mpa。O型圈工作介质：空气、水、矿物油、原油、乳化液、水-乙二醇等，主要适用于一般液压缸、通用设备液压缸、工程机械液压缸及高温、高压用油缸等。材质有丁腈橡胶、氟橡胶、硅橡胶、乙丙橡胶、氯丁橡胶、丁基橡胶、聚四氟乙烯等。');

-- ----------------------------
-- Table structure for sys_menu_role_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_role_test`;
CREATE TABLE `sys_menu_role_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MENU_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单id',
  `ROLE_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `CREATE_USER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `UPDATE_USER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uidx_menu_role`(`MENU_ID`, `ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu_role_test
-- ----------------------------
INSERT INTO `sys_menu_role_test` VALUES ('00c5f31d13db4ad48b7ea7e185b7f427', 'a48ae33ab0df4bc9a857f95ff9533a68', 'J/F9-+?', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('10f999c5f7af4bc5b7c2e28cd4d933bd', '98a67fb5f80d42ebb8fc32eee2202975', 'J/F9-+?', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('123456789ijhg', '244247008b53450fa16bc503bc861b7c', 'J/F9-+?', NULL, '2017-12-26 09:46:03', NULL, '2017-12-26 09:46:03');
INSERT INTO `sys_menu_role_test` VALUES ('1e410be808834b2fa57df4bd8bd81944', 'e85ca213b98f4fbe880102f4487cd27e', 'J/F9-+?', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('20a6f29e91a3498498a8f5659aae8d1a', 'e1e2fb1387534c5582960cbe3d55029c', '343859934ece44c988f53700fb34c80a', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('40c4f1e70ec54e48984f5778067ee0a7', 'afd55749de24469c98992c378371eb36', 'J/F9-+?', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('439f2e3eb0714e39a4e6b4e223c6ef50', 'a48ae33ab0df4bc9a857f95ff9533a68', '343859934ece44c988f53700fb34c80a', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('4523b393aae64771aac4f91c5623599b', '244247008b53450fa16bc503bc861b7c', '343859934ece44c988f53700fb34c80a', NULL, '2018-01-11 14:47:33', NULL, '2018-01-11 14:47:33');
INSERT INTO `sys_menu_role_test` VALUES ('456c2d51362646cc98d2ded5198b54ef', 'd34346224f6d463d9ddca89a801f3e35', '343859934ece44c988f53700fb34c80a', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('5905556900e741a89aafec25948b8fca', '89e9f1eb41a240fea361e0d188375884', 'J/F9-+?', NULL, '2017-12-27 17:04:18', NULL, '2017-12-27 17:04:18');
INSERT INTO `sys_menu_role_test` VALUES ('5b79d6e436154cfb9533a531fb7eb744', '882b26afbdbb4d63bcba0cd826a5b9c1', '343859934ece44c988f53700fb34c80a', NULL, '2018-01-11 14:47:16', NULL, '2018-01-11 14:47:16');
INSERT INTO `sys_menu_role_test` VALUES ('60d911ddc1db4046b86976f5f8468e3e', 'd34346224f6d463d9ddca89a801f3e35', 'J/F9-+?', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('6302f705514e4c839400f804ec29ec5c', '89e9f1eb41a240fea361e0d188375884', '343859934ece44c988f53700fb34c80a', NULL, '2018-01-11 14:46:55', NULL, '2018-01-11 14:46:55');
INSERT INTO `sys_menu_role_test` VALUES ('6c821d6c6adf4a95a27b9fc866e6dd61', 'e85ca213b98f4fbe880102f4487cd27e', '91e5948321b842728ef60e187bc3b6ca', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('71fa522e4da04ab9abd6008d2cb1c070', '26b3df2c6d464a0b89858eb896b849d2', 'J/F9-+?', NULL, '2017-12-27 17:05:49', NULL, '2017-12-27 17:05:49');
INSERT INTO `sys_menu_role_test` VALUES ('84ea3ba35c754a1181150d9220cf18ea', 'e85ca213b98f4fbe880102f4487cd27e', '343859934ece44c988f53700fb34c80a', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('8510e23b4a4645f593373a82d5f28931', 'afd55749de24469c98992c378371eb36', '343859934ece44c988f53700fb34c80a', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('874970f9c9b14021909485f201479373', '1688998d013c4ebf95be6fd7e1fecb20', 'J/F9-+?', NULL, '2017-12-28 11:05:10', NULL, '2017-12-28 11:05:10');
INSERT INTO `sys_menu_role_test` VALUES ('asdfr456yhbv123', '4a7f3cae133e4a51b8f35769b55163dd', 'J/F9-+?', NULL, '2017-12-26 09:46:29', NULL, '2017-12-26 09:46:29');
INSERT INTO `sys_menu_role_test` VALUES ('b9275e6c0334474480b975a02c8c51ac', 'd34346224f6d463d9ddca89a801f3e35', '91e5948321b842728ef60e187bc3b6ca', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('bac28fb0e9cb4c859ef42dd23e0cbc67', '9b2fb915c2a24ed29de0661afda6ef0d', 'b1c3a938bdef49b98892cb6d9dcd537e', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('bd3b96f8742940e8acc628ff5c940465', 'b53bfdfe33444703aa76c2c1a1b8d820', 'J/F9-+?', NULL, '2017-12-27 17:04:03', NULL, '2017-12-27 17:04:03');
INSERT INTO `sys_menu_role_test` VALUES ('c89cc73ffa1b40da943cb542b9b9819f', '882b26afbdbb4d63bcba0cd826a5b9c1', 'J/F9-+?', NULL, '2017-12-27 17:04:10', NULL, '2017-12-27 17:04:10');
INSERT INTO `sys_menu_role_test` VALUES ('e1536b33a3c3431aa7373c57cf61154c', 'e1e2fb1387534c5582960cbe3d55029c', 'J/F9-+?', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('e92a68532e134b2e9b8af46a43ce61e0', '1688998d013c4ebf95be6fd7e1fecb20', '343859934ece44c988f53700fb34c80a', NULL, '2018-01-11 14:47:42', NULL, '2018-01-11 14:47:42');
INSERT INTO `sys_menu_role_test` VALUES ('ebd08a1adcc74e4c9fceb4befe2b300c', '98a67fb5f80d42ebb8fc32eee2202975', '343859934ece44c988f53700fb34c80a', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu_role_test` VALUES ('f92a195b89e644ccbe6208b86c116450', '9b2fb915c2a24ed29de0661afda6ef0d', 'J/F9-+?', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_menu_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_test`;
CREATE TABLE `sys_menu_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单表',
  `TITLE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `HREF` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问链接',
  `REQUEST_URL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后台请求url',
  `ICON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编码',
  `TARGET` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标窗口,_blank则直接跳转，否则在子页面打开',
  `PARENT_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单',
  `SORT` int(2) NULL DEFAULT NULL COMMENT '排序号',
  `CREATE_USER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `UPDATE_USER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uidx_title`(`TITLE`) USING BTREE,
  UNIQUE INDEX `uidx_menu_req_url`(`REQUEST_URL`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu_test
-- ----------------------------
INSERT INTO `sys_menu_test` VALUES ('1688998d013c4ebf95be6fd7e1fecb20', '测试一级菜单', '/memCard/index.do', 'test/*', 'icon-text', '2', NULL, NULL, 2, 'gameloft9', '2017-12-27 17:09:17', NULL, '2017-12-27 17:09:17');
INSERT INTO `sys_menu_test` VALUES ('244247008b53450fa16bc503bc861b7c', '系统管理', '#', 'sys/*', 'icon-text', '1', NULL, NULL, 1, 'gameloft9', '2017-12-25 19:31:22', NULL, '2017-12-25 19:31:22');
INSERT INTO `sys_menu_test` VALUES ('26b3df2c6d464a0b89858eb896b849d2', '系统用户管理', 'page/system/sysUser/allUsers.html', 'sysUser/*', 'icon-text', '1-5', NULL, '244247008b53450fa16bc503bc861b7c', 4, 'gameloft9', '2017-12-27 17:05:40', NULL, '2017-12-27 17:05:40');
INSERT INTO `sys_menu_test` VALUES ('4a7f3cae133e4a51b8f35769b55163dd', '菜单管理', 'page/system/sysMenu/allMenus.html', 'menu/*', 'icon-text', '1-1', NULL, '244247008b53450fa16bc503bc861b7c', 1, 'gameloft9', '2017-12-25 19:32:25', NULL, '2017-12-25 19:32:25');
INSERT INTO `sys_menu_test` VALUES ('882b26afbdbb4d63bcba0cd826a5b9c1', '系统日志管理', 'page/system/sysLog/allLogs.html', 'log/*', 'icon-text', '1-4', NULL, '244247008b53450fa16bc503bc861b7c', 5, 'gameloft9', '2017-12-27 17:03:41', NULL, '2017-12-27 17:03:41');
INSERT INTO `sys_menu_test` VALUES ('89e9f1eb41a240fea361e0d188375884', '机构管理', 'page/system/sysOrg/allOrgs.html', 'org/*', 'icon-text', '1-2', NULL, '244247008b53450fa16bc503bc861b7c', 3, 'gameloft9', '2017-12-27 17:01:58', NULL, '2017-12-27 17:01:58');
INSERT INTO `sys_menu_test` VALUES ('98a67fb5f80d42ebb8fc32eee2202975', '原料商品一览表', 'page/system/sysSupplier_Goods/allSupplier_Goods.html', 'supplier_goods/*', 'icon-text', '3-3', NULL, 'afd55749de24469c98992c378371eb36', 3, 'gameloft9', '2019-03-06 09:46:34', NULL, '2019-03-06 09:46:34');
INSERT INTO `sys_menu_test` VALUES ('9b2fb915c2a24ed29de0661afda6ef0d', '待办事项', 'page/system/purchase_order/backlogByBuyerM.html', 'backlogByBuyerM/*', 'icon-text', '4-2', NULL, 'e85ca213b98f4fbe880102f4487cd27e', 2, 'afabao', NULL, NULL, NULL);
INSERT INTO `sys_menu_test` VALUES ('a48ae33ab0df4bc9a857f95ff9533a68', '供应商档案', 'page/system/sysSupplier/allSupplier.html', 'supplier/*', 'icon-text', '3-1', NULL, 'afd55749de24469c98992c378371eb36', 1, 'gameloft9', '2019-03-04 20:17:55', NULL, '2019-03-04 20:17:55');
INSERT INTO `sys_menu_test` VALUES ('afd55749de24469c98992c378371eb36', '供应商管理', '#', 'sup/*', 'icon-text', '3', NULL, NULL, 3, 'gameloft9', '2019-03-04 20:17:47', NULL, '2019-03-04 20:17:47');
INSERT INTO `sys_menu_test` VALUES ('b53bfdfe33444703aa76c2c1a1b8d820', '角色管理', 'page/system/sysRole/allRoles.html', 'role/*', 'icon-text', '1-3', NULL, '244247008b53450fa16bc503bc861b7c', 2, 'gameloft9', '2017-12-27 17:02:42', NULL, '2017-12-27 17:02:42');
INSERT INTO `sys_menu_test` VALUES ('d34346224f6d463d9ddca89a801f3e35', '采购申请', 'page/system/purchase_order/allPurchase_order.html', 'purchase_order/*', 'icon-text', '4-1', NULL, 'e85ca213b98f4fbe880102f4487cd27e', 1, 'gameloft9', '2019-03-07 09:37:14', NULL, '2019-03-07 09:37:14');
INSERT INTO `sys_menu_test` VALUES ('e1e2fb1387534c5582960cbe3d55029c', '原料', 'page/system/sysMeterial/allMeterial.html', 'meterial/*', 'icon-text', '3-2', NULL, 'afd55749de24469c98992c378371eb36', 2, 'gameloft9', '2019-03-05 16:10:49', NULL, '2019-03-05 16:10:49');
INSERT INTO `sys_menu_test` VALUES ('e85ca213b98f4fbe880102f4487cd27e', '采购订单管理', '#', 'order/*', 'icon-text', '4', NULL, NULL, 4, 'gameloft9', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log_test`;
CREATE TABLE `sys_oper_log_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用日志表',
  `USER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LOGIN_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IP_ADDR` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OPER_TYPE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `MEMO` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log_test
-- ----------------------------
INSERT INTO `sys_oper_log_test` VALUES ('01724e2ef17b4ef9a8b825a62e1d3191', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 08:01:14', '修改原料商品');
INSERT INTO `sys_oper_log_test` VALUES ('03363a15c0fc46de8a1efbd1413a10a1', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:15:43', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('03b87a7ce2ae4095b85328961b238e82', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 11:34:14', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('04136ea66432452789ad489942886dd6', 'e25c20254049449cbc5e10f6c41113bc', 'afabao', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 12:46:34', '更新个人密码');
INSERT INTO `sys_oper_log_test` VALUES ('068e89a013c247d59e58af8333d22ac6', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:23:28', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('0863e44ade1248d187bd7a59ddccb843', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-07 01:37:14', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('08a7512891944bb08c92aaa89fb4ead8', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 16:44:03', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('096c05abbabd439ab3fd0fed4babc6a9', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:46:59', '删除订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('0bb2b6f681ef41e5ab2ac4637545bd21', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:43:57', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('0bb2cee8b8cf41a8b5037835f76c1e8b', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 15:43:26', '提交订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('0c058e78cd6a4f13aa93eb773604a1d1', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:11:09', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('0eadeb105c4148498c25a96c68425254', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:02:48', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('0fa523c4e62542a7b62486ca11dfb2c5', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:26:09', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('1098a0a8abdb4b1b9ea65712d19d1041', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:26:06', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('10ef11cd96fd427798efb19f42179560', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-05 01:41:33', '删除菜单');
INSERT INTO `sys_oper_log_test` VALUES ('160351b5b50a4c3a8cc4522e903449dd', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:24:43', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('16c7cc9e0ee449fa9de68cbfde2ffbb9', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-10 14:27:36', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('17bede21415349a993882a707580bb76', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 08:58:05', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('196833dfa57c417a892a4f1758a98a13', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 14:18:55', '添加用户');
INSERT INTO `sys_oper_log_test` VALUES ('196f6500cdcf4a97a64943f2a5e48dec', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 07:35:24', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('1d177c3a93fe44f3a5b07a02a89fcc72', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 16:33:32', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('1e09a2f7e1eb4ca2bc09129a422fb221', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:17:59', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('1e25b06589c8422382e69153d49be04b', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-05 01:59:35', '修改供应商');
INSERT INTO `sys_oper_log_test` VALUES ('20354debe30548e9a7be94c74be801bd', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 05:37:08', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('20d1610b98b8411a9461b4f4dd43ca93', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 05:37:43', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('22d853be165a4fab89926a2b6cb240c2', 'e25c20254049449cbc5e10f6c41113bc', 'afabao', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 12:46:51', '更新个人密码');
INSERT INTO `sys_oper_log_test` VALUES ('23481062782340fca65025cba3c17e23', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 14:16:54', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('2519193c51944e5e9cff7684549842e3', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 16:07:29', '提交订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('2952d1e28b5441ea9678b967e63319b7', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:01:37', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('2a5f3a58b8ed4855ba39b121d89044f5', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 08:53:12', '删除订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('2b379b7493014a7abf9b13b5e9d8f6b9', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 04:36:24', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('2bbaa644fb8f43fc8277b26dd240b8f5', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 08:03:39', '修改原料商品');
INSERT INTO `sys_oper_log_test` VALUES ('2bcf2b27252e4df6afe836ef5e652c9b', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 09:56:43', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('2be36dadf4594516ba575d106830b2b7', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 08:52:28', '删除原料商品');
INSERT INTO `sys_oper_log_test` VALUES ('2d67c0c36cfe4415a5ad6042aa785309', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 12:45:28', '添加用户');
INSERT INTO `sys_oper_log_test` VALUES ('3192dc2bb9104ad3821846db85484e6e', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 10:58:01', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('327a1e5fb2c44d1ba8601df327635321', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 10:58:50', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('33ba29569af7463bb23f25b1e6def38a', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 08:42:03', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('33bca2be143f4211b6b93507ec1d5817', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 08:40:13', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('33ddb7b391f843b599fe80139081fa03', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 11:59:04', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('33fa8cbd2d874299ab4df7c48be00bbf', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 11:42:49', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('3481e7ad933c4762b1b403f52327bba9', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-06 03:22:32', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('37ce2ce898114b3c8aec3913cf850a68', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 16:32:58', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('380dc34194a942c78453e9ec67d02bde', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 11:41:14', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('3816b965ab114f4fa17e7d712ce2fe3f', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-04 08:03:54', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('39c3669f155045f2a4c55ec977d1d0e1', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-05 01:42:01', '删除菜单');
INSERT INTO `sys_oper_log_test` VALUES ('3a142627baab408ea14b8b2c93972be1', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:31:09', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('3a8fdfe8baa0479bafd246ca39ec16f0', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:17:20', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('3a92083ee069428bb48fe5b736be8290', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 14:21:06', '添加用户');
INSERT INTO `sys_oper_log_test` VALUES ('3be9957a27f043a5b31bbdd49a872bfc', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:23:46', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('3c099647b34c4c44bd9c8e7e5497dfd8', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:18:50', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('3c74868c95484104a2e5c799477c6b8a', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:43:06', '删除订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('3f9abf29a2ec4b94af4b5d1cac72472c', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:43:49', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('42f9cac3da944b04be7c9f5ea665e474', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 11:20:21', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('43580cc5e26046e3bb355f9383e177af', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 11:39:32', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('44b4bf88ff8d4337b1007cb60de55968', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 15:33:58', '提交订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('459277f60d17473e9388cac3d277f565', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:34:45', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('45e7acfdf30543db86c3188349f9b7f4', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 16:41:36', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('462d485b24eb4d88b2297949d9594a8f', '123', 'gameloft9', '127.0.0.1', 'del', '2019-03-05 09:23:40', '删除原料');
INSERT INTO `sys_oper_log_test` VALUES ('464ff74b6cae46628a707d47ca9e94ed', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:33:34', '修改供应商');
INSERT INTO `sys_oper_log_test` VALUES ('46808a092c114a328982dfc8adbf04e2', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:15:19', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('46f7592c5b3a463b90c486cb92517d74', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-04 08:17:38', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('474d2ea643db4c4aac8cae5d8750b653', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-04 08:03:45', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('48ee58a3938a4bda8b44540f677850ed', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 18:18:22', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('4912fdc1bc5d4578a02b7b970a3bdc4e', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 15:04:35', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('4a40e1092aef4a3dad59454ebc2614c9', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 11:32:48', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('4a76905b4db045af8d2dcda6e5f6ae32', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 15:26:44', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('4c00120a34c1437fa49361b9f1f997cb', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 07:35:01', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('4c2f280b97a440d0afe0f4eee03e3203', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:19:13', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('4e5a091f9357476ca8938899207a490b', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 12:27:12', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('50af9c193eeb4a27bcadd833b01df213', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 08:35:37', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('50f0ae11ab7e40d4a686d57b0f465d4e', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:11:43', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('50f5afc6afd347c993c0bee7278051d5', '123', 'gameloft9', '127.0.0.1', 'del', '2019-03-05 09:29:52', '删除原料');
INSERT INTO `sys_oper_log_test` VALUES ('5141720b039143989a24168838e0f005', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:47:14', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('534a181c7c2b43af9e83f5c47d90d140', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:33:41', '修改供应商');
INSERT INTO `sys_oper_log_test` VALUES ('535fca6f57c84e35a2092588b6f00370', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-04 08:03:32', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('538edcf0265049059d422062d4a67284', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 14:06:38', '更新用户');
INSERT INTO `sys_oper_log_test` VALUES ('5459f00e00af48aaae65c636089a69ad', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:23:14', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('547438e863e448f69c18aac532d51d6c', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 08:39:27', '删除订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('54ba0279c326493c93f633d83cb90518', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-10 05:59:59', '提交订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('54c6dbb3e4cd4120ba8ba044f0a85399', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 13:08:35', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('558317b7a9df436db8a2cdc46bac7206', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 15:59:03', '提交订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('570c6798e728421a96eb18b8f4ea133f', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:30:30', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('5721855d63144fe98156468eb3c4c938', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-04 08:07:17', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('5b7b410807564f93be9f70fea5ab603e', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:26:43', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('5c59776091674bfda769fd1c1ffff447', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 10:54:41', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('5d24d2a2f3564892bab0bc92a7237efa', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-07 01:35:23', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('5e356109015a4e45a81241f635d758f0', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 08:10:50', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('5e660678e877407e81921ebbfa267ad7', '123', 'gameloft9', '127.0.0.1', 'del', '2019-03-05 09:24:59', '删除原料');
INSERT INTO `sys_oper_log_test` VALUES ('61ffacbfb88d4771aa4f93253347e652', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:19:02', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('62da3b8691b6400980e2b0d2db26dc75', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-04 12:17:56', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('65a4b23d9d044d709daa868d9266d3b0', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 08:39:07', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('6648e7b376bb4784b1cee7a7cdb69ff9', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 08:19:11', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('6709aa53bbba41798a85ae85dcd65a4c', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 09:59:36', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('677b746a96e44f74a0a4fb8a32ebbf9b', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:21:28', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('67f61cff187f4325bf68a6b94598934e', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:24:33', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('6870865048014a19aa4262d063a4e031', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 08:58:25', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('68c287ee82014d3084a0c09600794427', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:25:45', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('6a04780c0e4a4f66922b349a8a9364d4', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:23:45', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('6a2dfdf53b7541e982e3b8942a9d1d79', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 12:27:36', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('6a6ce907fd194659b69b6cf64dc8a71d', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-05 01:40:56', '删除菜单');
INSERT INTO `sys_oper_log_test` VALUES ('6b58ab1a0ab24137be45e63aa73c06aa', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-04 08:02:05', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('6c17619d5bcc4b9fbbd782c8f73da63c', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:13:37', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('6cbf000fac2f4efdb87801f5f99cea0f', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-06 01:46:34', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('6e50a0be7b81424395dd6eab4ac14f21', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-05 01:53:01', '删除供应商');
INSERT INTO `sys_oper_log_test` VALUES ('6f9b1fef0c20418faf345818fcaaccb2', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 14:19:34', '更新用户');
INSERT INTO `sys_oper_log_test` VALUES ('702589a762b741b6914df8781f06ac38', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:47:20', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('70e5e84f3b844980b9456bfaee307353', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-07 01:36:37', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('72e79fdc74794fdf955da184e172d7dd', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 11:36:41', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('7399bd41b8b24e2ea445da0752e2b387', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-09 12:54:05', '删除角色');
INSERT INTO `sys_oper_log_test` VALUES ('73d1c154ceed458383302a52ce5e52f4', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:25:11', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('7461442e21c14f3094afa9274ee47d73', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-04 08:15:56', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('74629e128bb942359c503ed02cba5d87', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 07:28:19', '修改供应商');
INSERT INTO `sys_oper_log_test` VALUES ('77af12a380624e769370a5f32435bfde', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:02:14', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('788d9cc1a8f84874830f85c82c1bdb6e', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 07:37:33', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('789b99b920dd4d55bd519fb0e3ee710b', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 12:49:06', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('78c2fea8e1374f47bff507c20066dd19', '123', 'gameloft9', '127.0.0.1', 'del', '2019-03-05 09:29:04', '删除原料');
INSERT INTO `sys_oper_log_test` VALUES ('79b1b25011ff4406bc0d9027eed6c23b', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:20:27', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('7b1784af88ad4995984d87ac65739700', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 08:42:35', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('7d16aec0d2314de8a9bf0ee79977d8a1', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 08:38:00', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('7d68fa552d3440be9e860ffe7e6cd33c', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-10 13:52:00', '提交订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('7dc16d3e5f984e1d84ea49ed60dc590a', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:10:10', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('7dc4409513c54a09b2c9946bb9f942f5', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 13:00:23', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('7ddb97708a87419fb967d9aefee375cc', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-04 08:15:46', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('813a8931e1a74bafa87bf715a026b9ca', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 12:46:00', '初始化密码');
INSERT INTO `sys_oper_log_test` VALUES ('823b804a40904511b7727f9f58f3c6a3', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:00:51', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('83f8b678ac1a419cad1d0378b267e0a6', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-07 01:35:06', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('849a2e4b817e45f7ae8a12588cdd45ad', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:24:10', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('851e6101e8fc4f4cbbb4140957c9c680', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 10:57:16', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('8583a0e17b954c6bb12b95c8ac1c21cd', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 07:59:40', '修改原料商品');
INSERT INTO `sys_oper_log_test` VALUES ('85e4ef08f3134a598a32e235aa4bb7c4', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 10:58:55', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('8690e975819b46d9acccb7113368fd66', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 12:53:12', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('8789a8a618de455f8686e0a6907acfd8', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:26:25', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('87a1d01f597d49a798e6f447b1850832', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 15:26:03', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('899c5cc71d9640ce8d5f41222cb603cb', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:29:41', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('8a83d24f2e34448ab20e2f1547c7e5a4', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 12:56:17', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('8bff04ed25144b7ca44f655d3aa2b337', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:28:49', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('8c0f14d74a6d49a1b399a4e9db78cc20', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 17:32:10', '提交订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('8d6baae72230419490743589043e699b', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 08:39:37', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('8e6039450fdc4d8ca42fd8afa014a2d0', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 08:58:36', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('94f3ef91544c438aa8230f9afd8fcc3b', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:13:15', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('960d164562dd4750ae32c7eb981a9b85', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 08:09:40', '修改原料商品');
INSERT INTO `sys_oper_log_test` VALUES ('96109d2338f74d0d95fa027c847b279b', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:39:08', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('975f1ba3351c435f8a0e9113f2fe065a', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 08:22:25', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('97b1f311f6de4d969b987f3925314b29', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 08:23:24', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('9825799bf52e4478949b136fa1d3b405', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 13:07:43', '更新用户');
INSERT INTO `sys_oper_log_test` VALUES ('9a937919d30346edbd7cfa50e5b38494', '123', 'gameloft9', '127.0.0.1', 'del', '2019-03-04 08:02:46', '删除菜单');
INSERT INTO `sys_oper_log_test` VALUES ('9f23eb1be7a44847a54985185800c8d7', '123', 'gameloft9', '127.0.0.1', 'del', '2019-03-07 01:33:39', '删除原料');
INSERT INTO `sys_oper_log_test` VALUES ('a36cb1f11c9e4e788a889c056014bf6d', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 11:44:15', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('a3e629d105814a4cb1bc0552824341ab', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:24:13', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('a4809a5e106b45d5b1c0fc48a4acb147', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 09:58:38', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('a4ab15e99e444c8f842507c43b13ab2c', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-05 01:53:29', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('a6d011f3ab3f439d84fd367a6549837a', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:22:11', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('a72e1dba37014ca48c9545d30efa0151', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 15:25:47', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('a77e5a8d5ba3477a9c0f886fc6409a8b', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-06 09:52:34', '删除供应商');
INSERT INTO `sys_oper_log_test` VALUES ('a8c1b5681be447e389e75aed583d1093', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 12:52:57', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('aa921e4801654ff9948b339e9ae7176d', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 11:23:58', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('abcda8e512d74c6681e03706b658e51d', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 07:58:52', '修改原料商品');
INSERT INTO `sys_oper_log_test` VALUES ('ad20029da6004b74829380a501405c69', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 04:43:17', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('ad850e709e91424da4f08bd3bc482505', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:14:15', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('ade082e7f34943419d05c9a0e635e069', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 15:57:43', '提交订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('ae95c45d4f004c2483996e61e0b47115', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 16:35:10', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('aef7c2875b1943728bb95097b77feb88', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 08:07:56', '修改原料商品');
INSERT INTO `sys_oper_log_test` VALUES ('afe3bf23ae774e7b97ab9469fc0429b6', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:13:19', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('b09a1c9b72204360a25d7bb4f800a549', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:43:09', '删除订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('b0b30d4d529a4c2a81d4269395354a79', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 12:57:06', '初始化密码');
INSERT INTO `sys_oper_log_test` VALUES ('b2942a1bd8cc476d922311cc24276aff', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:11:27', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('b40ed3c528494adebbf2b0120910ac19', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'del', '2019-03-09 15:22:45', '删除菜单');
INSERT INTO `sys_oper_log_test` VALUES ('b46ff4d848f8405fb00f01e021da6112', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 11:30:09', '添加菜单');
INSERT INTO `sys_oper_log_test` VALUES ('b5a1c3d671e54700b3cfc3b99dcfa68e', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 16:36:06', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('b5b5c02441ea41f5a7db5501ab06ebec', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:13:47', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('b5f4b27d41dc46029b8b02a65d3195a8', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 16:46:28', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('b7739492740a43eaa06a9d5a3315ec4b', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 09:56:18', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('b9e9cb063441402e9d28edf6ad840376', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:03:18', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('ba2e55742f1f4db6914d1e6f72eef349', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:24:04', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('ba9dd30138264985bbae74503168d7f0', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 05:37:49', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('bb0d5b67481342a79b2151ccfc7f0d7d', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:07:15', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('bb4c02c1545d4dd99e80acaadc857bdb', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:15:04', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('bb7fe6ae4cb146c189e5b1cd1acee42f', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 12:56:45', '添加用户');
INSERT INTO `sys_oper_log_test` VALUES ('bc663283e4b2497888bc8c18460f1129', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:21:28', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('bf7d345dcd71452c87e20b5fa282588c', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-06 12:00:21', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('c0b277c106ea4c01ae1012db6b664d16', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-06 09:52:22', '删除原料');
INSERT INTO `sys_oper_log_test` VALUES ('c2a5a09bae1f4f1e8d27fbac7436496f', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 12:26:49', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('c430c21c1734441b921d1f427efd66eb', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:29:27', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('c463391301b54553bad2dfe464fc6aa0', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 11:37:29', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('c539f63aa4014b4390f3e0a1d2b6635d', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:09:04', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('c5a636d7e18b464e912045f32692fd74', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-05 02:00:16', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('ca28db38bb634939bbd538f70fb0959c', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-09 12:55:50', '删除用户');
INSERT INTO `sys_oper_log_test` VALUES ('ca7a0ccc33344543b71f6d143c5e112f', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-04 12:17:48', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('cbaaf236afec47048f4b07a363530035', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:27:45', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('cd99d98731344352b353fc3b14d48905', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:14:58', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('ce538b54ffe444b18c98d8ba19dd2461', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 09:58:00', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('cf7e84d5ea21425da8cec1de54cefeeb', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:25:42', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('d03e3bd7e15b4911a340693a31f349ee', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 13:09:13', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('d0865a63a57c441d8c6ce8ea656e24fe', 'fec32288675747ccb4a678a5f3f6cd8d', 'afabao', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 14:20:53', '添加用户');
INSERT INTO `sys_oper_log_test` VALUES ('d31a937cee3e4e418d4af8468ebaeced', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 11:00:53', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('d39626db8263401f884f6cfc4f2a1396', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-04 08:17:48', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('d3d972c7879f4ddbbf2e838df5e49893', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-06 09:52:19', '删除原料');
INSERT INTO `sys_oper_log_test` VALUES ('d3f568fa094c46f8afe83b08843142b0', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:14:32', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('d5658918c4974f09aca44d4c5174c47c', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:24:55', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('d8d2831805964a8a9f818b6747736cc5', '123', 'gameloft9', '127.0.0.1', 'del', '2019-03-05 05:37:21', '删除菜单');
INSERT INTO `sys_oper_log_test` VALUES ('d903009542994491b0350dc0a040c560', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 16:32:22', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('da7b3135c3474eaa994a45d6515881a1', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:16:50', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('de32d0ba7b244b05905b95829f5aea07', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:44:11', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('e1004f66ef14458bbf725cf039102f8c', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:25:49', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('e1040f24e4aa42e3858b72a97af249da', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 08:38:48', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('e1709912c7d84cac9bc866a258ba4b66', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:20:04', '修改原料');
INSERT INTO `sys_oper_log_test` VALUES ('e21cb4e912644172b23be8eb959784fd', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:29:07', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('e26e740c29834c6cb13afa89cbf9862b', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-04 08:16:25', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('e3f933c901d94a01af70e07d24ed94ab', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:18:25', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('e621214cdc1a40c58a2d596dbb2235a8', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 05:38:27', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('e7d799bd4b444a368da483c5d7321ba9', '123', 'gameloft9', '127.0.0.1', 'del', '2019-03-05 09:27:14', '删除原料');
INSERT INTO `sys_oper_log_test` VALUES ('e9655540babb4c129e4c461dcd1902ef', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 08:09:14', '修改原料商品');
INSERT INTO `sys_oper_log_test` VALUES ('eb8ac92bf39844baa589a63d9ae8db69', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:44:04', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('ec58bcaf068b40cb92d80269f9640ec9', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:20:02', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('edf7e91f9c3d421097f61954e17d5925', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-10 14:04:05', '提交订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('ef9c3694aaeb4283818fb0a8bab0d5c4', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:21:14', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('f0d9e6a2036346bbbc45d0cbac103a6a', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 16:07:09', '提交订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('f1b9307fd0094b478f001d49a9e42b70', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 16:49:35', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('f1c85bd703e94f7d9c8319bf2ae0806a', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-05 09:29:58', '添加原料');
INSERT INTO `sys_oper_log_test` VALUES ('f1ce42f615754c9aab007c3ece9f34a0', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-07 01:36:46', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('f2d21941c72645e6b3f1ba357b20a6f2', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'del', '2019-03-06 09:52:31', '删除供应商');
INSERT INTO `sys_oper_log_test` VALUES ('f300b09bd1f9479e84ae901abee65fc9', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-05 01:46:31', '删除供应商');
INSERT INTO `sys_oper_log_test` VALUES ('f31f7cdcd75146c3a2266dac3eeed900', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:29:54', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('f5159b5dcc7c4e55b362982b84f62d77', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 08:27:13', '修改订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('f5e527a2954c408686801762f9579197', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-09 12:52:22', '添加角色');
INSERT INTO `sys_oper_log_test` VALUES ('f957f4c0d15c42b99fcb6c03270d9b36', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-06 10:00:09', '添加供应商');
INSERT INTO `sys_oper_log_test` VALUES ('fab2752aff704cafb836b4f5337c4f24', '123', 'gameloft9', '127.0.0.1', 'upd', '2019-03-05 11:31:28', '更新菜单');
INSERT INTO `sys_oper_log_test` VALUES ('fb37e3e816d34bebaf922553b813d833', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-07 12:00:21', '添加订单');
INSERT INTO `sys_oper_log_test` VALUES ('fbee32978d574ada8f47511981b83835', 'e25c20254049449cbc5e10f6c41113bc', 'afabao', '0:0:0:0:0:0:0:1', 'upd', '2019-03-09 12:48:17', '更新个人信息');
INSERT INTO `sys_oper_log_test` VALUES ('fc93c3378f9349beba284c1fc197ae6d', '123', 'gameloft9', '0:0:0:0:0:0:0:1', 'add', '2019-03-10 14:02:10', '提交订单申请');
INSERT INTO `sys_oper_log_test` VALUES ('ff90c4563dcf421dabff49ee24a1ae94', '123', 'gameloft9', '127.0.0.1', 'add', '2019-03-08 03:31:28', '添加订单');

-- ----------------------------
-- Table structure for sys_organize_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_organize_test`;
CREATE TABLE `sys_organize_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织机构表',
  `PARENT_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ORGANIZE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构名称',
  `ORGANIZE_CODE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构编码',
  `TREE_LEVEL` int(11) NOT NULL COMMENT '机构级别',
  `TREE_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构路径',
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uidx_org_name`(`ORGANIZE_NAME`) USING BTREE,
  UNIQUE INDEX `uidx_org_code`(`ORGANIZE_CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_organize_test
-- ----------------------------
INSERT INTO `sys_organize_test` VALUES ('21a6ff8a6abf410eaf97981c1da039d8', NULL, '总公司', '010001', 1, '21a6ff8a6abf410eaf97981c1da039d8', '2017-12-27 17:06:04', '2017-12-27 17:06:04');
INSERT INTO `sys_organize_test` VALUES ('54fa67f3d443427c9f47432ead20f2f4', '21a6ff8a6abf410eaf97981c1da039d8', '湖北分公司', '010002', 2, '21a6ff8a6abf410eaf97981c1da039d8#54fa67f3d443427c9f47432ead20f2f4', '2017-12-27 17:06:22', '2017-12-27 17:06:22');
INSERT INTO `sys_organize_test` VALUES ('6b15411e103e4c50abc8a61b1ea0d16d', '54fa67f3d443427c9f47432ead20f2f4', '采购部', '030001', 3, '21a6ff8a6abf410eaf97981c1da039d8#54fa67f3d443427c9f47432ead20f2f4#6b15411e103e4c50abc8a61b1ea0d16d', NULL, NULL);
INSERT INTO `sys_organize_test` VALUES ('9542aa6ef8284e4d8be36d3f9faeeac9', '54fa67f3d443427c9f47432ead20f2f4', '仓库', '030004', 3, '21a6ff8a6abf410eaf97981c1da039d8#54fa67f3d443427c9f47432ead20f2f4#9542aa6ef8284e4d8be36d3f9faeeac9', NULL, NULL);
INSERT INTO `sys_organize_test` VALUES ('b46767cfd27b41828003efbeb1a9ef0d', '54fa67f3d443427c9f47432ead20f2f4', '财务部', '030003', 3, '21a6ff8a6abf410eaf97981c1da039d8#54fa67f3d443427c9f47432ead20f2f4#b46767cfd27b41828003efbeb1a9ef0d', NULL, NULL);
INSERT INTO `sys_organize_test` VALUES ('d0ff3b54d5bc4c409156a67cdeb000c1', '54fa67f3d443427c9f47432ead20f2f4', '生产部', '030002', 3, '21a6ff8a6abf410eaf97981c1da039d8#54fa67f3d443427c9f47432ead20f2f4#d0ff3b54d5bc4c409156a67cdeb000c1', NULL, NULL);

-- ----------------------------
-- Table structure for sys_purchase_order_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_purchase_order_test`;
CREATE TABLE `sys_purchase_order_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ORDER_NUMBER` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SUPPLIER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SUPPLIER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_NUMBER` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TOTAL_PRICE` decimal(10, 0) NOT NULL,
  `APPLY_USER` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `APPLY_TIME` date NULL DEFAULT NULL,
  `AUDIT_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ORDER_AUDIT_USER` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ORDER_AUDIT_TIME` date NULL DEFAULT NULL,
  `PAY_AUDIT_USER` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PAY_AUDIT_TIME` date NULL DEFAULT NULL,
  `PAY_STATE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `APPLY_DESCRIBE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AUDIT_DESCRIBE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_purchase_order_test
-- ----------------------------
INSERT INTO `sys_purchase_order_test` VALUES ('8a9725b3c0614226ad7004e3466d3d92', '36b23f39a9ea4357b8b6f52ff26c7c1a', '1c3da2c5d97e4c28bf9404346d3a3997', '轴承', '深沟球轴承', '25ef61dbca5841dd9e35214500194876', '广州一诺橡胶密封件有限公司', '6', 78, 'gameloft9', '2019-03-15', '待审核', NULL, NULL, NULL, NULL, '待付款', '额', NULL);
INSERT INTO `sys_purchase_order_test` VALUES ('daa95647f18542858accd47eae451d83', '9fc74123f7fa42e29866ecf21bfd522b', 'b134f0eb3d594c0d9c55b09561338f97', '密封圈', 'O型密封圈', '25ef61dbca5841dd9e35214500194876', '广州一诺橡胶密封件有限公司', '10', 150, 'gameloft9', NULL, '未提交', NULL, NULL, NULL, NULL, '待付款', '啊手动阀手动阀', NULL);

-- ----------------------------
-- Table structure for sys_role_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_test`;
CREATE TABLE `sys_role_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色表',
  `ROLE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  `IS_SUPER` int(2) NULL DEFAULT NULL COMMENT '是否是超级管理员',
  `IS_DELETED` int(2) NULL DEFAULT NULL COMMENT '是否删除',
  `CREATE_USER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `UPDATE_USER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_test
-- ----------------------------
INSERT INTO `sys_role_test` VALUES ('343859934ece44c988f53700fb34c80a', 'test', 0, 0, 'gameloft9', '2018-01-11 14:46:22', NULL, '2018-01-11 14:46:22');
INSERT INTO `sys_role_test` VALUES ('91e5948321b842728ef60e187bc3b6ca', '采购部员工', 0, 0, 'afabao', '2019-03-09 21:07:00', NULL, '2019-03-09 21:07:00');
INSERT INTO `sys_role_test` VALUES ('b1c3a938bdef49b98892cb6d9dcd537e', '采购部领导', 0, 0, 'afabao', '2019-03-09 22:17:00', NULL, '2019-03-09 22:17:00');
INSERT INTO `sys_role_test` VALUES ('J/F9-+?', 'admin', 1, 0, 'v[l_4zL8', '2008-03-01 04:17:00', ':9He2+GW', '2002-09-27 03:13:16');

-- ----------------------------
-- Table structure for sys_supplier_goods_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_supplier_goods_test`;
CREATE TABLE `sys_supplier_goods_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SUPPLIER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MATERIAL_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GOODS_PRICE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_supplier_goods_test
-- ----------------------------
INSERT INTO `sys_supplier_goods_test` VALUES ('d2fbd237a7574433896e004585a3ca3c', '25ef61dbca5841dd9e35214500194876', 'b134f0eb3d594c0d9c55b09561338f97', '15');
INSERT INTO `sys_supplier_goods_test` VALUES ('d96d2fdf6e394f4cb9bae6b0a3191131', 'bf6cd09256fe44bca5a3740d0238ba57', 'b134f0eb3d594c0d9c55b09561338f97', '40');
INSERT INTO `sys_supplier_goods_test` VALUES ('64d7ca26512144cdb07aa637bdf94c01', '4b1a44361a7e44f980462a398398e90a', '62b868302e704608bb06dbd75eca12ec', '45');

-- ----------------------------
-- Table structure for sys_supplier_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_supplier_test`;
CREATE TABLE `sys_supplier_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SUPPLIER_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `SUPPLIER_DESCRIBE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商描述',
  `PHONE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商电话',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_supplier_test
-- ----------------------------
INSERT INTO `sys_supplier_test` VALUES ('1db3f80dd5134344809b69718bb73690', '铁姆肯(中国)投资有限公司', '创于1899年美国,轴承十大品牌,1992年进入中国市场,专业从事研发并制造轴承和机械动力传动组件,铁姆肯(中国)投资有限公司', '0535-6242411');
INSERT INTO `sys_supplier_test` VALUES ('25ef61dbca5841dd9e35214500194876', '广州一诺橡胶密封件有限公司', '本公司生产的衬套，油封，气门室垫，异形胶圈主要适用于宝马，奔驰高端车型，质量可靠，信  誉至上。本公司秉承客户第一，品质优良。一诺品质，一诺千金。', '400-6066208');
INSERT INTO `sys_supplier_test` VALUES ('2c631efa17aa41b3a0d858def53fbf5f', '人本集团有限公司', '创于1991年,轴承十大品牌,以轴承生产为主同时涉足商业超市/机电贸易等产业的大型集团公司,人本集团有限公司', '400-820-3393');
INSERT INTO `sys_supplier_test` VALUES ('315faa5d32b244ed99bb45a8bc70566d', '广州伯拉汽车零部件有限公司', '广州伯拉汽车零部件有限公司是一家以汽车配件批发及进出口贸易的公司。公司创立于  1999  年，是  企业对企业的国内外汽配供货平台。台湾，俄罗斯，蒙古，朝鲜，迪拜等汽配市场推出基于中介的安  全交易服务，并在海外设立俄罗斯、外蒙等分支机构，在内蒙古满洲里、海拉尔，黑龙江绥芬河、黑  河、同江、抚远、饶河、东宁、密山，吉林珲春、延吉等口岸城市都有很好的信誉和生意往来。', '020-37361361');
INSERT INTO `sys_supplier_test` VALUES ('3b6a72f6da944ad881313c57598f0d79', '邢台市海驰密封件厂', '邢台市海驰密封件厂是建筑机械、食品机械、木工机械及橡胶密封产品专业生产加工的公  司，拥有完整、科学的质量管理体系              地理位置优越、交通、运输便利。     本公司多年以来专业  从事建筑机械，食品机械，木工机械及橡胶密封所用设备的研发、制造与销售。是 一 家实力雄厚的实体企业。', '13785900193');
INSERT INTO `sys_supplier_test` VALUES ('4b1a44361a7e44f980462a398398e90a', '哈尔滨轴承制造有限公司', '始于1950年,黑龙江著名商标,专营铁路客车提速轴承/精密机床主轴轴承/矿山冶金轴承,哈尔滨轴承制造有限公司', '0451-87902420');
INSERT INTO `sys_supplier_test` VALUES ('6714b9dabb7d44f5bbde34710270ee6a', '恩梯恩(中国)投资有限公司', '创于1918年日本,世界综合性精密机械制造厂家,其产品广泛用于轨道卫星/航空/铁道与汽车/办公设备与食品机械等领域,恩梯恩(中国)投资有限公司', '021-57745500');
INSERT INTO `sys_supplier_test` VALUES ('7320a913c40c4a9c8beede143f5d50cf', '舍弗勒投资(中国)有限公司', '始于1883年,德国舍弗勒集团旗下,提供滚动轴承/滑动轴承产品和解决方案,全球领先的综合性汽车和工业产品供应商,舍弗勒投资(中国)有限公司', '021-39576666');
INSERT INTO `sys_supplier_test` VALUES ('7d51e27655f44d57b8ecdf5b0f80b4db', '上海盈封机电设备有限公司', '上海盈封机电设备位于中国最大的经济中心和贸易港口、全国最大的综合性工业城市、全国重要  的科技中心、贸易中心、  金融和信息中心。是一家专业生产国标、美标、  英标、德标黄油嘴  （铁油嘴，  铜油嘴，不锈钢油嘴），黄油枪附件（黄油枪头，平油枪头，尖嘴，黄油枪软管，黄油枪硬管），工  程机械配件（挖掘机配件），订做各种非标黄油嘴、管接头以及各种机械配件。', '021-60541796');
INSERT INTO `sys_supplier_test` VALUES ('988d935d60f94b3ba813de8a2fdd9997', '洛阳LYC轴承有限公司', '始于1954年,轴承十大品牌,河南省著名商标,行业标准制定单位,大型综合轴承制造企业牌,洛阳LYC轴承有限公司', '400-6379-000');
INSERT INTO `sys_supplier_test` VALUES ('9e3e59f6687f40768dd033f015970073', '永嘉县路口五金铅质厂', '浙江省永嘉县路口五金铅质厂专业生产各种铅封、  防盗铅封、  铅封线、  铅封钳、  塑料电表封、  施封环、  挂锁、  钢丝铅封、  高保封等铅质产品。  生产的铅封钳后密封牢固、  耐温易锁、  防腐性能好、  标识清晰、  使用方便、质量可靠、物美价廉', '86-577-21815009	');
INSERT INTO `sys_supplier_test` VALUES ('9e4490d4c7704c0e9baff31b6ae82893', '瓦房店轴承集团有限责任公司', '始建于1938年,从事重大技术装备配套轴承/轨道交通轴承/汽车车辆轴承/军事装备轴承等产品的企业,瓦房店轴承集团有限责任公司', '400-167-3377');
INSERT INTO `sys_supplier_test` VALUES ('a81509eed52d4bcd931bde5c53ab70a4', '斯凯孚(中国)有限公司', '始于1907年瑞典,全球领先的滚动轴承/密封件/机电一体化/服务和润滑系统产品/解决方案和服务的供应商,斯凯孚(中国)有限公司', '021-53068866');
INSERT INTO `sys_supplier_test` VALUES ('b7dd3a4dad134366a60705bf6fb627d8', '恩斯克投资有限公司', '始于1916年,日本精工株式会社旗下,以生产轴承起家,现已扩展到汽车零部件/精密机械产品/电子应用产品等领域,恩斯克投资有限公司', '0512-57963000');
INSERT INTO `sys_supplier_test` VALUES ('bf6cd09256fe44bca5a3740d0238ba57', '扬中市汉中密封件有限公司', '扬中市汉中密封件有限公司座落在富饶的水上美丽花园城市－－江苏省扬中市，是省级开发区  的门户，交通十分便捷。公司主营聚四氟制品、机械密封制品、车削板、密封件、油封、四氟垫片、  铁氟龙的企业，经过多年的奋斗，  目前已形成了规模性生产能力的企业，  在密封件行业中占有领先地  位。', '0511-88533102');
INSERT INTO `sys_supplier_test` VALUES ('c1ae4678a1674335a7df89a65e6d0f3c', '旺卓橡塑科技（上海）有限公司', '旺卓橡塑科技（上海）制品有限公司，是一家致力于密封条，密封垫片，保温隔热材料，降噪消音材  料等开发  ,  生产，定制及销售为一体的高科技综合型企业。公司成立于  2002  年  4  月，座落于黄浦江  畔的古城——松江。     10  年的专业团队及品牌打造，  我公司已拥有德国及日本进口的先进生产设备和  专用精密检测仪器，生产能力，工艺及技术水平已居国内同业前列。', '86-021-51086578-811');
INSERT INTO `sys_supplier_test` VALUES ('c263c0cfcf6a4a439c73eecd5b81309b', '莒南县晨光橡塑制品厂', '莒南县晨光橡塑制品厂，位于莒南县涝坡工业园，紧靠风景秀丽的马亓山。距离日照港口  40  公里，  距离临沂  60  公里。北依日东高速，西靠京沪高速，地理环境优越，交通便利。     本厂是橡塑制品专  业研发生产厂家，主要生产销售橡胶混炼胶、各类橡塑产品，有硅橡胶、丁晴橡胶、氟橡胶、卫生胶  等混炼胶，主要为汽车零部件、太阳能、空调、空压机、机电、机械、阀门等厂家配套橡塑制品，另  可根据客户需求加工制作各类橡塑产品。', '0539-7845028');
INSERT INTO `sys_supplier_test` VALUES ('d503993fe16b40509b71ffb2a66626d9', '捷太格特(中国)投资有限公司', '始创于1921年日本,十大轴承品牌,轴承/汽车动力驾驶和机械设备领域的著名企业,捷太格特(中国)投资有限公司', '021-51781000');
INSERT INTO `sys_supplier_test` VALUES ('d5eb8fdaee4341dba4115fab3c39445c', '常州市凯瑞利导热油泵公司', '州市武进凯瑞利导热油泵有限公司，  主要生产销售：  WRY  系列热油泵，     HD  系列高温导热油，  合成导热油，专业清洗导热油锅炉及销售各种配件。              常州市凯瑞利导热油泵有限公司生产的  WRY  系列热油泵在国内载体加热系统中得到广泛使用，适用于石油、橡胶、树脂、纺织、印染、建  筑、  机械、  船舶等各个工业领域，  主要用于输送不含固体颗粒的弱腐蚀性高温液体，  使用温度≤  350  ℃。', '0519-88873800');
INSERT INTO `sys_supplier_test` VALUES ('d8775c0dad9d4fdaa939355df4c94957', '河北鼎丰橡塑管业有限公司', '河北鼎丰橡塑管业有限公司是生产销售各种规格高压钢丝编织胶管，  高压钢丝缠绕胶管，  高压石油钻  探胶管，海洋高压输油胶管，耐高温蒸汽胶管，高耐磨喷砂胶管，夹布胶管系列，大口径钢丝胶管，  尼龙树脂管，膨胀胶管，伸缩软管，橡胶软接头，金属软管，硅胶管，四氟管，油管，胶管接头，补  偿器系列，  橡胶制品及密封件等产品的科技型生产厂家', '13403184588');
INSERT INTO `sys_supplier_test` VALUES ('f1da882acdc84519b4d72d04c92af597', '铁岭市科沃力橡塑制品有限公司', '我厂成立于  1990  年，  本厂是专门从事开发生产高科技密封件的生产单位。  技术力量雄厚，  设备精良，  检测设备齐全，是通过  ISO9002  国际体系认证企业，产品销往全国  25  个省市和地区，深受用户青  睐，已达到国内外先进水平。本厂生产的产品具有耐油  .  耐高温  .  耐低温  .  耐酸碱  .  耐老化  .  及磷酸酯类  .  氟  利  昂  等  多  项  特  长  。', '13941099992 ');
INSERT INTO `sys_supplier_test` VALUES ('f260881ecb4840298c1833ad48f4dad3', '佛山市壹佰年密封技术有限公司', '专业代理国外进口品牌高  性能密封件。  自  2000  年成立以来，  我们一直与国外具有良好信誉的密封件制造商进行着密切的合作，  为国内客户提供优质的进口密封解决方案。     “求实、创新、精益求精”是我们所遵循的企业精神，  “诚信为本、  客户第一、  质量第一、  服务第一、  安全第一”  是我们全体员工一直遵守的工作原则，  “向  客户提供更快、更好、更优的服务”是我们一直以来不断追求的目标。', '86-0757-83300321　');

-- ----------------------------
-- Table structure for sys_user_role_test
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_test`;
CREATE TABLE `sys_user_role_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户角色表',
  `USER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `ROLE_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role_test
-- ----------------------------
INSERT INTO `sys_user_role_test` VALUES ('03f9afb1d42e49d6a026f537d9f033b6', '9dbdc3a6cc444190bb5ac4e15df6234b', '343859934ece44c988f53700fb34c80a');
INSERT INTO `sys_user_role_test` VALUES ('0608074265924757bc763ac1380be8a9', 'fec32288675747ccb4a678a5f3f6cd8d', '343859934ece44c988f53700fb34c80a');
INSERT INTO `sys_user_role_test` VALUES ('2fb2a9fb965e462eb72c14361a83f006', '123', 'J/F9-+?');
INSERT INTO `sys_user_role_test` VALUES ('ae44be136ea44029a8e9f1bbc9b0f146', '9ea7566511554bbdb6a86bf4ba2e2501', '91e5948321b842728ef60e187bc3b6ca');
INSERT INTO `sys_user_role_test` VALUES ('b12cdb46df9f42b48221b41083a846ff', 'fec32288675747ccb4a678a5f3f6cd8d', 'J/F9-+?');
INSERT INTO `sys_user_role_test` VALUES ('c10ada0c4bf74370a560aadbaebe833f', '60319f7cbbbd468f942e449d6ce126cd', 'b1c3a938bdef49b98892cb6d9dcd537e');

-- ----------------------------
-- Table structure for user_test
-- ----------------------------
DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户测试表',
  `LOGIN_NAME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REAL_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_FORBIDDEN` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MOBILE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ICON` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ORG_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ORG_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `UPDATE_DATE` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uidx_login_name`(`LOGIN_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_test
-- ----------------------------
INSERT INTO `user_test` VALUES ('123', 'gameloft9', '7C4A8D09CA3762AF61E59520943DC26494F8941B', 'leiyao', '0', '13618629441', NULL, 'gameloft9', '总公司', '2017-12-28 16:24:32', '2017-12-28 16:32:57');
INSERT INTO `user_test` VALUES ('60319f7cbbbd468f942e449d6ce126cd', 'buyerM', '123456', '张三领导', '0', '13405918211', NULL, '6b15411e103e4c50abc8a61b1ea0d16d', '采购部', NULL, NULL);
INSERT INTO `user_test` VALUES ('9ea7566511554bbdb6a86bf4ba2e2501', 'buyer', '123456', '张三', '0', '13405918210', NULL, '6b15411e103e4c50abc8a61b1ea0d16d', '采购部', NULL, NULL);
INSERT INTO `user_test` VALUES ('fec32288675747ccb4a678a5f3f6cd8d', 'afabao', 'E47104BC5DF2C01039F791BA6A19EF6BFD34B461', '啊发包', '0', '13405918215', NULL, '21a6ff8a6abf410eaf97981c1da039d8', '总公司', '2019-03-09 20:57:05', NULL);

-- ----------------------------
-- Procedure structure for prc_init_db
-- ----------------------------
DROP PROCEDURE IF EXISTS `prc_init_db`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_init_db`()
begin
   /*
   清空表
   */
   delete from   `sys_access_permission_test`;
   delete from   `sys_menu_role_test`;
   delete from   `sys_menu_test`;
   delete from   `sys_oper_log_test`;
   delete from   `sys_organize_test`;
   delete from   `sys_role_test`;
   delete from   `sys_user_role_test`;


   /*初始化数据-user_test*/
   insert into `user_test`(`ID`,`LOGIN_NAME`,`PASSWORD`,`REAL_NAME`,`IS_FORBIDDEN`,`MOBILE`,`ICON`,`ORG_ID`,`ORG_NAME`,`CREATE_DATE`,`UPDATE_DATE`)
values('123','gameloft9','7C4A8D09CA3762AF61E59520943DC26494F8941B','leiyao','0','13618629441',null,'gameloft9','总公司','2017-12-28 16:24:32','2017-12-28 16:32:57');

/*初始化数据-sys_access_permission_test*/
insert into `sys_access_permission_test`(`ID`,`URL`,`ROLES`,`SORT`,`IS_DELETED`,`CREATE_USER`,`CREATE_TIME`,`UPDATE_USER`,`UPDATE_TIME`) values
('c8c4e92a1ece4da79ede1763faecdf77','/sysUser/**','authc,roles[admin]','170','0','gameloft9','2017-12-27 17:05:49',null,'2017-12-27 17:05:49'),
('90762decb8874ba0955eb8cef21b6682','/menu/**','authc,roles[admin]','197','0','gameloft9','2017-12-28 11:02:26',null,'2017-12-28 11:02:26'),
('7ee176c20c904536862da37aacb0f7c8','/org/**','authc,roles[test]','123','0','gameloft9','2017-12-27 17:04:18',null,'2017-12-27 17:04:18'),
('7c1f21aa63cf4fd6a5be43072e81ab99','/test/**','authc,roleOr[test,admin]','135','0','gameloft9','2017-12-28 11:05:10',null,'2017-12-28 11:05:10'),
('7042e4eeebf5433388ddfdfb09764369','/log/**','authc,roleOr[test,admin]','419','0','gameloft9','2017-12-27 17:04:10',null,'2017-12-27 17:04:10'),
('6319f8a7688343139ac4ba0d40877e2c','/sys/**','authc,roleOr[test,admin]','201','0','gameloft9','2017-12-28 11:04:58',null,'2017-12-28 11:04:58'),
('6','/**/*.do','authc','999','0','admin','2017-12-25 16:41:09','admin','2017-12-25 16:41:09'),
('5','/getVCode','anon','4','0','admin','2017-12-25 16:41:09','admin','2017-12-25 16:41:09'),
('4','/role/**','authc,roles[admin]','5','0','admin','2017-12-25 16:41:08','admin','2017-12-25 16:41:08'),
('3','/login','anon','3','0','admin','2017-12-25 16:41:08','admin','2017-12-25 16:41:08'),
('2','/index','anon','2','0','admin','2017-12-25 16:41:08','admin','2017-12-25 16:41:08'),
('1','/','anon','1','0','admin','2017-12-25 16:41:02','admin','2017-12-25 16:41:02');

/*初始化数据-sys_menu_role_test*/
insert into `sys_menu_role_test`(`ID`,`MENU_ID`,`ROLE_ID`,`CREATE_USER`,`CREATE_TIME`,`UPDATE_USER`,`UPDATE_TIME`) values
('e92a68532e134b2e9b8af46a43ce61e0','1688998d013c4ebf95be6fd7e1fecb20','343859934ece44c988f53700fb34c80a',null,'2018-01-11 14:47:42',null,'2018-01-11 14:47:42'),
('c89cc73ffa1b40da943cb542b9b9819f','882b26afbdbb4d63bcba0cd826a5b9c1','J/F9-+?',null,'2017-12-27 17:04:10',null,'2017-12-27 17:04:10'),
('bd3b96f8742940e8acc628ff5c940465','b53bfdfe33444703aa76c2c1a1b8d820','J/F9-+?',null,'2017-12-27 17:04:03',null,'2017-12-27 17:04:03'),
('asdfr456yhbv123','4a7f3cae133e4a51b8f35769b55163dd','J/F9-+?',null,'2017-12-26 09:46:29',null,'2017-12-26 09:46:29'),
('874970f9c9b14021909485f201479373','1688998d013c4ebf95be6fd7e1fecb20','J/F9-+?',null,'2017-12-28 11:05:10',null,'2017-12-28 11:05:10'),
('71fa522e4da04ab9abd6008d2cb1c070','26b3df2c6d464a0b89858eb896b849d2','J/F9-+?',null,'2017-12-27 17:05:49',null,'2017-12-27 17:05:49'),
('6302f705514e4c839400f804ec29ec5c','89e9f1eb41a240fea361e0d188375884','343859934ece44c988f53700fb34c80a',null,'2018-01-11 14:46:55',null,'2018-01-11 14:46:55'),
('5b79d6e436154cfb9533a531fb7eb744','882b26afbdbb4d63bcba0cd826a5b9c1','343859934ece44c988f53700fb34c80a',null,'2018-01-11 14:47:16',null,'2018-01-11 14:47:16'),
('5905556900e741a89aafec25948b8fca','89e9f1eb41a240fea361e0d188375884','J/F9-+?',null,'2017-12-27 17:04:18',null,'2017-12-27 17:04:18'),
('4523b393aae64771aac4f91c5623599b','244247008b53450fa16bc503bc861b7c','343859934ece44c988f53700fb34c80a',null,'2018-01-11 14:47:33',null,'2018-01-11 14:47:33'),
('123456789ijhg','244247008b53450fa16bc503bc861b7c','J/F9-+?',null,'2017-12-26 09:46:03',null,'2017-12-26 09:46:03');

/*初始化数据-sys_menu_test*/
insert into `sys_menu_test`(`ID`,`TITLE`,`HREF`,`REQUEST_URL`,`ICON`,`CODE`,`TARGET`,`PARENT_ID`,`SORT`,`CREATE_USER`,`CREATE_TIME`,`UPDATE_USER`,`UPDATE_TIME`) values
('b53bfdfe33444703aa76c2c1a1b8d820','角色管理','page/system/sysRole/allRoles.html','/role/**','icon-text','1-3',null,'244247008b53450fa16bc503bc861b7c','2','gameloft9','2017-12-27 17:02:42',null,'2017-12-27 17:02:42'),
('89e9f1eb41a240fea361e0d188375884','机构管理','page/system/sysOrg/allOrgs.html','/org/**','icon-text','1-2',null,'244247008b53450fa16bc503bc861b7c','3','gameloft9','2017-12-27 17:01:58',null,'2017-12-27 17:01:58'),
('882b26afbdbb4d63bcba0cd826a5b9c1','系统日志管理','page/system/sysLog/allLogs.html','/log/**','icon-text','1-4',null,'244247008b53450fa16bc503bc861b7c','5','gameloft9','2017-12-27 17:03:41',null,'2017-12-27 17:03:41'),
('4a7f3cae133e4a51b8f35769b55163dd','菜单管理','page/system/sysMenu/allMenus.html','/menu/**','icon-text','1-1',null,'244247008b53450fa16bc503bc861b7c','1','gameloft9','2017-12-25 19:32:25',null,'2017-12-25 19:32:25'),
('26b3df2c6d464a0b89858eb896b849d2','系统用户管理','page/system/sysUser/allUsers.html','/sysUser/**','icon-text','1-5',null,'244247008b53450fa16bc503bc861b7c','4','gameloft9','2017-12-27 17:05:40',null,'2017-12-27 17:05:40'),
('244247008b53450fa16bc503bc861b7c','系统管理','#','/sys/**','icon-text','1',null,null,'1','gameloft9','2017-12-25 19:31:22',null,'2017-12-25 19:31:22'),
('1688998d013c4ebf95be6fd7e1fecb20','测试一级菜单','/memCard/index.do','test/**','icon-text','2',null,null,'2','gameloft9','2017-12-27 17:09:17',null,'2017-12-27 17:09:17');

/*初始化数据-sys_organize_test*/
insert into `sys_organize_test`(`ID`,`PARENT_ID`,`ORGANIZE_NAME`,`ORGANIZE_CODE`,`TREE_LEVEL`,`TREE_PATH`,`CREATE_DATE`,`UPDATE_DATE`) values
('54fa67f3d443427c9f47432ead20f2f4','21a6ff8a6abf410eaf97981c1da039d8','湖北分公司','010002','2','21a6ff8a6abf410eaf97981c1da039d8#54fa67f3d443427c9f47432ead20f2f4','2017-12-27 17:06:22','2017-12-27 17:06:22'),
('21a6ff8a6abf410eaf97981c1da039d8',null,'总公司','010001','1','21a6ff8a6abf410eaf97981c1da039d8','2017-12-27 17:06:04','2017-12-27 17:06:04');

/*初始化数据-sys_role_test*/
insert into `sys_role_test`(`ID`,`ROLE_NAME`,`IS_SUPER`,`IS_DELETED`,`CREATE_USER`,`CREATE_TIME`,`UPDATE_USER`,`UPDATE_TIME`) values
('J/F9-+?','admin','1','0','v[l_4zL8','2008-03-01 04:17:00',':9He2+GW','2002-09-27 03:13:16'),
('343859934ece44c988f53700fb34c80a','test','0','0','gameloft9','2018-01-11 14:46:22',null,'2018-01-11 14:46:22');

/*初始化数据-sys_user_role_test*/
insert into `sys_user_role_test`(`ID`,`USER_ID`,`ROLE_ID`) values
('2fb2a9fb965e462eb72c14361a83f006','123','J/F9-+?'),
('03f9afb1d42e49d6a026f537d9f033b6','9dbdc3a6cc444190bb5ac4e15df6234b','343859934ece44c988f53700fb34c80a');
   
end
;;
delimiter ;

-- ----------------------------
-- Event structure for evt_init_db
-- ----------------------------
DROP EVENT IF EXISTS `evt_init_db`;
delimiter ;;
CREATE DEFINER = `root`@`localhost` EVENT `evt_init_db`
ON SCHEDULE
EVERY '20' MINUTE STARTS '2019-03-04 10:03:45'
ON COMPLETION PRESERVE
DO call prc_init_db()
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
