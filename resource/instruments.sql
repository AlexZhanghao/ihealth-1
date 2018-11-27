CREATE DATABASE instruments;

# Host: 139.224.24.116  (Version: 5.5.50-0ubuntu0.12.04.1)
# Date: 2018-08-23 10:35:01
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "doctor"
#

CREATE TABLE `doctor` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `loginid` int(32) NOT NULL COMMENT '登录信息ID',
  `hospitalid` int(32) NOT NULL COMMENT '医院ID',
  `employeenumber` varchar(32) NOT NULL COMMENT '员工编号',
  `name` varchar(32) NOT NULL COMMENT '姓名',
  `sex` varchar(32) NOT NULL COMMENT '性别',
  `birthday` varchar(16) NOT NULL COMMENT '出生日期',
  `certid` varchar(32) NOT NULL COMMENT '身份证',
  `telephone` varchar(32) NOT NULL COMMENT '联系方式',
  `bloodtype` int(8) NOT NULL COMMENT '0 A    1 B	   2AB    3 O',
  `address` varchar(32) NOT NULL COMMENT '地址',
  `education` varchar(16) NOT NULL COMMENT '学历',
  `nation` varchar(16) NOT NULL COMMENT '民族',
  `birthplace` varchar(32) NOT NULL COMMENT '籍贯',
  `householdprop` varchar(32) NOT NULL COMMENT '户籍性质',
  `department` varchar(16) NOT NULL COMMENT '部门',
  `projgroup` varchar(16) NOT NULL COMMENT '科室',
  `positon` varchar(16) NOT NULL COMMENT '职位',
  `entrydate` varchar(16) NOT NULL COMMENT '入职日期',
  `flag` int(8) NOT NULL COMMENT '删除标识 0 未删除      1 已删除',
  `createtime` varchar(16) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Structure for table "evaluation"
#

CREATE TABLE `evaluation` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `doctorid` int(32) NOT NULL,
  `patientid` int(32) NOT NULL,
  `evaldate` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `score` varchar(32) NOT NULL,
  `type` int(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

#
# Structure for table "evaluationrecord"
#

CREATE TABLE `evaluationrecord` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `evalid` int(32) NOT NULL,
  `item` varchar(128) NOT NULL,
  `result` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

#
# Structure for table "hospital"
#

CREATE TABLE `hospital` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `loginid` int(32) NOT NULL COMMENT '登录信息ID',
  `hospitalid` int(32) NOT NULL COMMENT '医院编号',
  `telephone` varchar(32) NOT NULL COMMENT '联系方式',
  `address` varchar(32) NOT NULL COMMENT '地址',
  `contacts` varchar(32) NOT NULL COMMENT '联系人',
  `contactsnumber` varchar(32) NOT NULL COMMENT '联系人电话',
  `name` varchar(32) NOT NULL COMMENT '医院名称',
  `level` varchar(32) NOT NULL COMMENT '等级',
  `prop` varchar(32) NOT NULL COMMENT '经营性质',
  `corporation` varchar(32) NOT NULL COMMENT '法人',
  `subject` varchar(512) NOT NULL COMMENT '诊疗科目',
  `flag` int(8) NOT NULL COMMENT '删除标识',
  `createtime` varchar(16) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Structure for table "logininfo"
#

CREATE TABLE `logininfo` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  `role` int(8) NOT NULL COMMENT '0 管理员      1 医院        2医师',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Structure for table "passivetrain"
#

CREATE TABLE `passivetrain` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL COMMENT '名称',
  `traintype` varchar(32) NOT NULL COMMENT '类型',
  `movements` text NOT NULL COMMENT '运动轨迹',
  `timelen` varchar(32) NOT NULL COMMENT '时长',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

#
# Structure for table "patient"
#

CREATE TABLE `patient` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `hospitalid` int(32) NOT NULL COMMENT '医院ID',
  `doctorid` int(32) NOT NULL COMMENT '员工ID',
  `name` varchar(32) NOT NULL COMMENT '姓名',
  `sex` varchar(32) NOT NULL COMMENT '性别',
  `age` int(8) NOT NULL COMMENT '年龄',
  `createtime` varchar(16) NOT NULL COMMENT '创建时间',
  `lasttreattime` varchar(16) NOT NULL COMMENT '上次治疗时间',
  `totaltreattime` varchar(16) NOT NULL COMMENT '累计康复时间',
  `recoverdetail` varchar(32) NOT NULL COMMENT '康复详情',
  `remarks` varchar(32) DEFAULT NULL COMMENT '备注',
  `flag` int(8) NOT NULL COMMENT '删除标识 0 未删除      1 已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8;

#
# Structure for table "patienttrain"
#

CREATE TABLE `patienttrain` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `patientid` int(32) NOT NULL COMMENT '患者ID',
  `traindate` varchar(16) NOT NULL COMMENT '时间',
  `content` varchar(32) NOT NULL COMMENT '训练内容',
  `duration` varchar(32) NOT NULL COMMENT '起始时间',
  `traintime` varchar(8) NOT NULL COMMENT '时长',
  `createtime` varchar(16) NOT NULL COMMENT '创建时间',
  `flag` int(8) NOT NULL COMMENT '删除标识 0 未删除      1 已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2464 DEFAULT CHARSET=utf8;

#
# Structure for table "testtable"
#

CREATE TABLE `testtable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `testname` varchar(16) DEFAULT NULL,
  `testpassword` varchar(32) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for table "traindata"
#

CREATE TABLE `traindata` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '1 关节运动角度 2 握力 3 EMG信号 4 肩关节力矩 5 肘关节力矩',
  `traindetailid` int(64) NOT NULL,
  `tracevalue` text NOT NULL,
  `traintype` int(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10438 DEFAULT CHARSET=utf8;
