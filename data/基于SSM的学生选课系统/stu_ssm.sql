/*
Navicat MySQL Data Transfer

Source Server         : cx
Source Server Version : 50515
Source Host           : 127.0.0.1:3306
Source Database       : stu_ssm

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2019-12-12 20:30:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bulletin
-- ----------------------------
DROP TABLE IF EXISTS `bulletin`;
CREATE TABLE `bulletin` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(50) DEFAULT NULL,
  `b_date` date DEFAULT NULL,
  `b_content` varchar(1000) DEFAULT NULL,
  `b_drop` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bulletin
-- ----------------------------
INSERT INTO `bulletin` VALUES ('1', '2020年元旦放假通知', '2019-11-28', '<p>各二级学院、处（室）：</p><p>根据国务院办公厅通知精神，现将学院2020年元旦放假时间安排通知如下：</p><p>元旦放假时间为2020年1月1日（星期三），共一天，周末正常休息。</p><p>节假日期间，中层干部值班照常进行，各部门认真做好值班和安全保卫工作。遇有情况，按规定及时报告并妥善处置，确保师生度过平安愉快假期。</p><p>特此通知</p>', '学院办公室<br/>2019年11月27日');
INSERT INTO `bulletin` VALUES ('2', '公示', '2019-10-24', '<p>根据《江西工业工程职业技术学院中层干部年度考核暂行办法》（工院党字〔2013〕32号）、《关于做好中层干部2018年度考核工作的通知》（工院党字〔2019〕2号）精神，学院考核工作领导小组会议研究确定了中层干部2018年度考核等次。</p><p>其中，贾进元、陈立(小)、刘计华、周密、付进扬、刘志宏、宋藜、卢运辉等8人考核等级为“优秀”，张国文、陈虎、贺楚雄、刘小群、陈再萍、汤海霞、王晓华、谢伟光、黎许新、余斌、李先建、朱志强、欧阳慧平、曾琳、邓传军、朱海蓉、戴小勇、黄仁欣、陈立（大）、章小印、文金萍、李焕春、舒斯洁、吴明发、赵火英、刘涛、姜建农、王社欣、李志忠、梁永禄等30人考核等级为“称职”。</p><p>现将考核结果进行公示，公示期五天，从2019年10月24日至28日。</p><p>如对学院中层干部2018年度考核结果有异议，请于2019年10月28日17：00前向考核办（设在党委组织部）、监察办（设在学院纪委、监察室 ）书面反映。</p><p>考核办联系人：易强，电话7062219、13407996146；</p><p>监察办联系人：贺楚雄，电话7062017、13707990160。</p>', '考核工作领导小组办公室<br/>2019年10月23日');
INSERT INTO `bulletin` VALUES ('3', '安全提示', '2019-10-23', '<p class=\"font-weight-bold>全体学生：</p><p>开学至今，学院综治办开展了全校范围内的安全隐患排查，基本情况良好。但是仍然存在一些问题，特别是学生安全意识比较薄弱，现将有关情况通报如下：</p><p>一是学生使用共享单车、共享电动车频率较高，且部分学生交通安全意识弱，在道路上逆行、骑车超载、随意掉头、乱停乱放，存在的较大安全隐患。二是滑轮、滑板协会的学生活跃度较高，但是少数学生安全意识薄弱，踩着滑轮、滑板出入校园，并到校外交通道路上滑。校外交通道路车流量多，存在很大的安全隐患。</p><p>根据以上情况，特向全院同学温馨提示：</p><p>1．请广大同学尽量少骑共享单车、共享电动车，即便要骑，也严格遵守交通规则，不逆行、不随意掉头、不超速、不超载、不乱停乱放，确保人身财产安全。</p><p>2．请广大同学滑轮、滑板时提高安全隐患意识，做好自我保护措施，坚决杜绝到校外交通道路上滑轮、滑板，防止安全事故的发生。</p>', '综治办、保卫处<br/>2019年10月21日');
INSERT INTO `bulletin` VALUES ('4', '关于清理校区“僵尸车”的通知', '2019-10-11', '<p>全校师生员工：<p/><p>随着校区内摩托车、电动车、自行车的不断增加，停车位资源日趋紧张，有些废旧无人维护，落满灰尘的“僵尸车”挤占了有限的非机动车停车位，同时还给消防安全带来了很大隐患。<p/><p>为了充分利用校区有限的停车位资源，消除消防安全隐患，学院保卫处计划于2019年10月20日统一清理车棚中停放的“僵尸车”，请各位车主于2019年10月19日前将自己的废旧车辆及时处理，逾期未处理的学院保卫处将对长期停放不动的车辆视做无主车辆统一集中处理。请广大师生员工支持配合，为创建文明有序校园而持续努力。<p/>', '学院保卫处<br/>2019年10月10日');
INSERT INTO `bulletin` VALUES ('5', '公示', '2019-09-24', '<p><strong>根据《关于组织推荐2019年国家“万人计划”教学名师候选人的通知》（赣教师字〔2019〕22号）文件精神，经个人申请、学院遴选，学院拟推荐陈虎（江西工业工程职业技术学院）为“有关人才计划”推荐人选，现予以公示，公示期三天（2019年9月24日至2019年9月26日），公示期内，若有异议，请以书面材料形式向学院纪委反映。</strong></p><p>监督电话：0799—7062017</p>', '教务处<br/>2019年9月24日');
INSERT INTO `bulletin` VALUES ('6', '2019年国庆节放假安排的通知', '2019-09-23', '<strong>各二级学院、各部门：</strong><p>根据国务院办公厅通知精神，2019年国庆节放假安排如下：</p><p>1、10月1日至10月7日，共放假7天。</p><p>2、9月29日（周日）上班（补10月4日周五的课），10月12日（周六）上班（补10月7日周一的课程）。</p><p>放假期间，各部门要严格落实安全工作责任制，切实加强值守应急工作，重点加强实验室安全管理，做好安全保卫、防火防盗、卫生防疫和后勤保障等各项工作。</p><p>国庆节期间，值班干部要认真履行值班职责，遇有突发情况，要按规定及时报告并妥善处理，确保师生祥和平安度过节日假期。</p><p>特此通知。</p>', '行政办公室<br/>2019年9月23日');
INSERT INTO `bulletin` VALUES ('7', '紧急通知', '2019-07-09', '<strong>各位体检考生：</strong><p>因萍乡市近日连续暴雨，严重影响居民生活秩序和出行，市内部分交通中断，体检中心因停电有关工作也受到影响，故部分体检考生体检工作无法如期完成，现将原定于2019年7月9日新老师体检截止日期推迟到（2019年7月12日）。</p>', '特此通知<br/>人事处<br/>2019年7月9日');
INSERT INTO `bulletin` VALUES ('8', '公示2', '2019-12-12', '                                        <p>根据《江西工业工程职业技术学院中层干部年度考核暂行办法》（工院党字〔2013〕32号）、《关于做好中层干部2018年度考核工作的通知》（工院党字〔2019〕2号）精神，学院考核工作领导小组会议研究确定了中层干部2018年度考核等次。</p><p>其中，贾进元、陈立(小)、刘计华、周密、付进扬、刘志宏、宋藜、卢运辉等8人考核等级为“优秀”，张国文、陈虎、贺楚雄、刘小群、陈再萍、汤海霞、王晓华、谢伟光、黎许新、余斌、李先建、朱志强、欧阳慧平、曾琳、邓传军、朱海蓉、戴小勇、黄仁欣、陈立（大）、章小印、文金萍、李焕春、舒斯洁、吴明发、赵火英、刘涛、姜建农、王社欣、李志忠、梁永禄等30人考核等级为“称职”。</p><p>现将考核结果进行公示，公示期五天，从2019年10月24日至28日。</p><p>如对学院中层干部2018年度考核结果有异议，请于2019年10月28日17：00前向考核办（设在党委组织部）、监察办（设在学院纪委、监察室 ）书面反映。考核办联系人：易强，电话7062219、13407996146；</p><p>监察办联系人：贺楚雄，电话7062017、13707990160。</p>\r\n                \r\n                ', '考核工作领导小组办公室<br/>2019年10月23日');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_num` varchar(10) DEFAULT NULL,
  `c_name` varchar(20) DEFAULT NULL,
  `c_type` int(11) DEFAULT NULL,
  `c_score` double DEFAULT NULL,
  `c_teacher` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '100001', 'C语言程序设计', '1', '3', '李云芳');
INSERT INTO `course` VALUES ('2', '100002', 'Java程序设计', '1', '3', '吴桂芳');
INSERT INTO `course` VALUES ('3', '100003', 'JSP程序设计', '1', '3', '陈磊');
INSERT INTO `course` VALUES ('4', '100004', '网页设计', '1', '3', '周琪');
INSERT INTO `course` VALUES ('5', '100005', 'Photoshop基础', '1', '3', '付云');
INSERT INTO `course` VALUES ('6', '100006', '移动UI设计', '1', '3', '蔡英龙');
INSERT INTO `course` VALUES ('7', '100007', 'Android基础应用', '1', '3', '张爱春');
INSERT INTO `course` VALUES ('8', '100008', 'Android高级应用', '1', '3', '张爱春');
INSERT INTO `course` VALUES ('9', '1000021', 'C语言程序设计', '1', '3', '李云芳');

-- ----------------------------
-- Table structure for elective
-- ----------------------------
DROP TABLE IF EXISTS `elective`;
CREATE TABLE `elective` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`e_id`),
  KEY `FK_Relationship_1` (`u_id`),
  KEY `FK_Relationship_2` (`c_id`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elective
-- ----------------------------
INSERT INTO `elective` VALUES ('14', '1', '1');
INSERT INTO `elective` VALUES ('17', '4', '3');
INSERT INTO `elective` VALUES ('20', '6', '4');
INSERT INTO `elective` VALUES ('21', '9', '5');
INSERT INTO `elective` VALUES ('22', '10', '6');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_username` varchar(20) NOT NULL,
  `u_password` varchar(20) DEFAULT NULL,
  `u_name` varchar(20) DEFAULT NULL,
  `u_sex` int(11) DEFAULT NULL,
  `u_class` varchar(20) DEFAULT NULL,
  `u_email` varchar(25) DEFAULT NULL,
  `u_type` int(11) DEFAULT NULL,
  `u_phone` varchar(11) DEFAULT NULL,
  `u_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '20xxxxx487', '123456', '崔信', '1', '软件1710', '1287805570@qq.com', '0', '188799xxxxx', '1');
INSERT INTO `user` VALUES ('3', '20xxxxx315', '123456', '陈俊杰', '1', '软件1710班', '2512808383@qq.com', '1', '138799xxxxx', '1');
INSERT INTO `user` VALUES ('4', '20xxxxx714', '123456', 'lyb', '1', 'rj1710', '1175xxxxx@qq.com', '0', '15870075802', '0');
INSERT INTO `user` VALUES ('6', '20xxxxx051', '123456', '张航', '1', '软件1710班', '1741179105@qq.com', '1', '187204xxxxx', '1');
INSERT INTO `user` VALUES ('9', '20xxxxx000', '123456', 'test', '1', '软件1709', '123456@qq.com', '1', '188796xxxxx', '1');
INSERT INTO `user` VALUES ('10', '20xxxxx001', '123456', '测试', '1', '软件1710', '123456@qq.com', '1', '138799xxxxx', '1');
INSERT INTO `user` VALUES ('11', '20xxxxx333', '123456', 'test', '1', '软件1710', '111@qq.com', '1', '138794xxxxx', '1');
INSERT INTO `user` VALUES ('12', '20xxxxx312', '123456', 'test', '1', '软件1710班', '117xxxxx@qq.com', '0', '158700xxxxx', '1');
INSERT INTO `user` VALUES ('13', '123456', '12323', '13', '1', '123', '128xxxxx@qq.com', '0', '158700xxxxx', '1');
INSERT INTO `user` VALUES ('14', '20xxxxx313', '123456', '测试23', '1', '软件1710班', '128xxxxx@qq.com', '0', '188799xxxxx', '1');
