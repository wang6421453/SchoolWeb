CREATE TABLE `wl_admin_user_info` (
  `ID` varchar(36) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `IP` varchar(255) DEFAULT NULL,
  `REAL_NAME` varchar(255) DEFAULT NULL COMMENT '真实名字',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wl_role_info` (
  `ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wl_school_base_info` (
  `ID` varchar(36) NOT NULL,
  `TITLE` varchar(255) NOT NULL COMMENT '标题',
  `CONTENT` text COMMENT '内容',
  `BUSINESS_TYPE` varchar(20) NOT NULL COMMENT '业务类别',
  `CREATE_TIME` datetime DEFAULT NULL,
  `COMMIT_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否发布（1：草稿；2：已发布）',
  `CLICK_RATE` int(11) DEFAULT '0' COMMENT '点击量',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校新闻';

CREATE TABLE `wl_school_index_show` (
  `ID` varchar(36) NOT NULL,
  `TITLE` varchar(255) NOT NULL COMMENT '标题',
  `CONTENT` text COMMENT '介绍说明',
  `BUSINESS_TYPE` varchar(20) DEFAULT NULL COMMENT '业务类别',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `COMMIT_TIME` datetime DEFAULT NULL COMMENT '发布时间',
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` smallint(1) DEFAULT NULL COMMENT '状态',
  `NO` int(11) DEFAULT NULL COMMENT '排序',
  `SHOW_PIC` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `CLICK_RATE` int(11) DEFAULT NULL COMMENT '点击量',
  PRIMARY KEY (`ID`,`TITLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校领导';

CREATE TABLE `wl_school_introduction` (
  `ID` varchar(36) NOT NULL,
  `CONTENT` text,
  `COMMIT_TIME` datetime DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校简介';

CREATE TABLE `wl_school_person_info` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL COMMENT '姓名',
  `TITLE` varchar(50) DEFAULT NULL COMMENT '职位称号',
  `CONTENT` text COMMENT '介绍说明',
  `BUSINESS_TYPE` varchar(20) DEFAULT NULL COMMENT '业务类别',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `COMMIT_TIME` datetime DEFAULT NULL COMMENT '发布时间',
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` smallint(1) DEFAULT NULL COMMENT '状态',
  `NO` int(11) DEFAULT NULL COMMENT '排序',
  `HEAD_PIC` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `CLICK_RATE` int(11) DEFAULT NULL COMMENT '点击量',
  PRIMARY KEY (`ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校领导';

CREATE TABLE `wl_user_role` (
  `ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) DEFAULT NULL COMMENT '用户id',
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `wl_admin_user_info` (`ID`, `USER_NAME`, `PASSWORD`, `IP`, `REAL_NAME`, `CREATE_TIME`) VALUES ('7f485d2d-f4bc-11e6-b066-00ff8c5ad69e', 'wl', 'admin', NULL, '王磊', '2017-02-17 10:58:07');

INSERT INTO `wl_user_role` (`ID`, `USER_ID`, `ROLE_ID`) VALUES ('d83688c9-f829-11e6-b066-00ff8c5ad69e', '7f485d2d-f4bc-11e6-b066-00ff8c5ad69e', '1');

INSERT INTO `wl_role_info` (`ID`, `ROLE_NAME`, `REMARK`) VALUES ('1', 'root', '超级管理员');
INSERT INTO `wl_role_info` (`ID`, `ROLE_NAME`, `REMARK`) VALUES ('2', 'admin', '管理员');
INSERT INTO `wl_role_info` (`ID`, `ROLE_NAME`, `REMARK`) VALUES ('3', 'student', '学生');



