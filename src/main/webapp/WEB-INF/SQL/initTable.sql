CREATE TABLE `wl_admin_user_info` (
  `ID` varchar(36) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL COMMENT '�û���',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '����',
  `IP` varchar(255) DEFAULT NULL,
  `REAL_NAME` varchar(255) DEFAULT NULL COMMENT '��ʵ����',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wl_role_info` (
  `ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(255) DEFAULT NULL COMMENT '��ɫ����',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wl_school_base_info` (
  `ID` varchar(36) NOT NULL,
  `TITLE` varchar(255) NOT NULL COMMENT '����',
  `CONTENT` text COMMENT '����',
  `BUSINESS_TYPE` varchar(20) NOT NULL COMMENT 'ҵ�����',
  `CREATE_TIME` datetime DEFAULT NULL,
  `COMMIT_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` smallint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ񷢲���1���ݸ壻2���ѷ�����',
  `CLICK_RATE` int(11) DEFAULT '0' COMMENT '�����',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ѧУ����';

CREATE TABLE `wl_school_index_show` (
  `ID` varchar(36) NOT NULL,
  `TITLE` varchar(255) NOT NULL COMMENT '����',
  `CONTENT` text COMMENT '����˵��',
  `BUSINESS_TYPE` varchar(20) DEFAULT NULL COMMENT 'ҵ�����',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `COMMIT_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` smallint(1) DEFAULT NULL COMMENT '״̬',
  `NO` int(11) DEFAULT NULL COMMENT '����',
  `SHOW_PIC` varchar(255) DEFAULT NULL COMMENT 'ͷ���ַ',
  `CLICK_RATE` int(11) DEFAULT NULL COMMENT '�����',
  PRIMARY KEY (`ID`,`TITLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ѧУ�쵼';

CREATE TABLE `wl_school_introduction` (
  `ID` varchar(36) NOT NULL,
  `CONTENT` text,
  `COMMIT_TIME` datetime DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ѧУ���';

CREATE TABLE `wl_school_person_info` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL COMMENT '����',
  `TITLE` varchar(50) DEFAULT NULL COMMENT 'ְλ�ƺ�',
  `CONTENT` text COMMENT '����˵��',
  `BUSINESS_TYPE` varchar(20) DEFAULT NULL COMMENT 'ҵ�����',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `COMMIT_TIME` datetime DEFAULT NULL COMMENT '����ʱ��',
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` smallint(1) DEFAULT NULL COMMENT '״̬',
  `NO` int(11) DEFAULT NULL COMMENT '����',
  `HEAD_PIC` varchar(255) DEFAULT NULL COMMENT 'ͷ���ַ',
  `CLICK_RATE` int(11) DEFAULT NULL COMMENT '�����',
  PRIMARY KEY (`ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ѧУ�쵼';

CREATE TABLE `wl_user_role` (
  `ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) DEFAULT NULL COMMENT '�û�id',
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '��ɫid',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `wl_admin_user_info` (`ID`, `USER_NAME`, `PASSWORD`, `IP`, `REAL_NAME`, `CREATE_TIME`) VALUES ('7f485d2d-f4bc-11e6-b066-00ff8c5ad69e', 'wl', 'admin', NULL, '����', '2017-02-17 10:58:07');

INSERT INTO `wl_user_role` (`ID`, `USER_ID`, `ROLE_ID`) VALUES ('d83688c9-f829-11e6-b066-00ff8c5ad69e', '7f485d2d-f4bc-11e6-b066-00ff8c5ad69e', '1');

INSERT INTO `wl_role_info` (`ID`, `ROLE_NAME`, `REMARK`) VALUES ('1', 'root', '��������Ա');
INSERT INTO `wl_role_info` (`ID`, `ROLE_NAME`, `REMARK`) VALUES ('2', 'admin', '����Ա');
INSERT INTO `wl_role_info` (`ID`, `ROLE_NAME`, `REMARK`) VALUES ('3', 'student', 'ѧ��');



