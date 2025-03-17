-- ----------------------------
-- 1. Department Table
-- ----------------------------
DROP TABLE IF EXISTS sys_dept;
CREATE TABLE sys_dept (
  dept_id           BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT 'Department ID',
  parent_id         BIGINT(20)      DEFAULT 0                  COMMENT 'Parent Department ID',
  ancestors         VARCHAR(50)     DEFAULT ''                 COMMENT 'Ancestor List',
  dept_name         VARCHAR(30)     DEFAULT ''                 COMMENT 'Department Name',
  order_num         INT(4)          DEFAULT 0                  COMMENT 'Display Order',
  leader            VARCHAR(20)     DEFAULT NULL               COMMENT 'Leader',
  phone             VARCHAR(11)     DEFAULT NULL               COMMENT 'Contact Number',
  email             VARCHAR(50)     DEFAULT NULL               COMMENT 'Email',
  status            CHAR(1)         DEFAULT '0'                COMMENT 'Department Status (0 Normal 1 Disabled)',
  del_flag          CHAR(1)         DEFAULT '0'                COMMENT 'Deletion Flag (0 Exists 2 Deleted)',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Creator',
  create_time       DATETIME                                   COMMENT 'Creation Time',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Updater',
  update_time       DATETIME                                   COMMENT 'Update Time',
  PRIMARY KEY (dept_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=200 COMMENT = 'Department Table';

-- ----------------------------
-- Initialization - Department Table Data
-- ----------------------------
INSERT INTO sys_dept VALUES(100,  0,   '0',          'RuoYi Technology',   0, 'RuoYi', '15888888888', 'ry@qq.com', '0', '0', 'admin', SYSDATE(), '', NULL);
INSERT INTO sys_dept VALUES(101,  100, '0,100',      'Shenzhen Headquarters', 1, 'RuoYi', '15888888888', 'ry@qq.com', '0', '0', 'admin', SYSDATE(), '', NULL);
INSERT INTO sys_dept VALUES(102,  100, '0,100',      'Changsha Branch', 2, 'RuoYi', '15888888888', 'ry@qq.com', '0', '0', 'admin', SYSDATE(), '', NULL);
INSERT INTO sys_dept VALUES(103,  101, '0,100,101',  'R&D Department',   1, 'RuoYi', '15888888888', 'ry@qq.com', '0', '0', 'admin', SYSDATE(), '', NULL);
INSERT INTO sys_dept VALUES(104,  101, '0,100,101',  'Marketing Department',   2, 'RuoYi', '15888888888', 'ry@qq.com', '0', '0', 'admin', SYSDATE(), '', NULL);
INSERT INTO sys_dept VALUES(105,  101, '0,100,101',  'Testing Department',   3, 'RuoYi', '15888888888', 'ry@qq.com', '0', '0', 'admin', SYSDATE(), '', NULL);
INSERT INTO sys_dept VALUES(106,  101, '0,100,101',  'Finance Department',   4, 'RuoYi', '15888888888', 'ry@qq.com', '0', '0', 'admin', SYSDATE(), '', NULL);
INSERT INTO sys_dept VALUES(107,  101, '0,100,101',  'Operations Department',   5, 'RuoYi', '15888888888', 'ry@qq.com', '0', '0', 'admin', SYSDATE(), '', NULL);
INSERT INTO sys_dept VALUES(108,  102, '0,100,102',  'Marketing Department',   1, 'RuoYi', '15888888888', 'ry@qq.com', '0', '0', 'admin', SYSDATE(), '', NULL);
INSERT INTO sys_dept VALUES(109,  102, '0,100,102',  'Finance Department',   2, 'RuoYi', '15888888888', 'ry@qq.com', '0', '0', 'admin', SYSDATE(), '', NULL);

-- ----------------------------
-- 2. User Information Table
-- ----------------------------
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  user_id           BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT 'User ID',
  dept_id           BIGINT(20)      DEFAULT NULL               COMMENT 'Department ID',
  login_name        VARCHAR(30)     NOT NULL                   COMMENT 'Login Account',
  user_name         VARCHAR(30)     DEFAULT ''                 COMMENT 'User Nickname',
  user_type         VARCHAR(2)      DEFAULT '00'               COMMENT 'User Type (00 System User 01 Registered User)',
  email             VARCHAR(50)     DEFAULT ''                 COMMENT 'User Email',
  phonenumber       VARCHAR(11)     DEFAULT ''                 COMMENT 'Phone Number',
  sex               CHAR(1)         DEFAULT '0'                COMMENT 'User Gender (0 Male 1 Female 2 Unknown)',
  avatar            VARCHAR(100)    DEFAULT ''                 COMMENT 'Avatar Path',
  password          VARCHAR(50)     DEFAULT ''                 COMMENT 'Password',
  salt              VARCHAR(20)     DEFAULT ''                 COMMENT 'Salt Encryption',
  status            CHAR(1)         DEFAULT '0'                COMMENT 'Account Status (0 Normal 1 Disabled)',
  del_flag          CHAR(1)         DEFAULT '0'                COMMENT 'Deletion Flag (0 Exists 2 Deleted)',
  login_ip          VARCHAR(128)    DEFAULT ''                 COMMENT 'Last Login IP',
  login_date        DATETIME                                   COMMENT 'Last Login Time',
  pwd_update_date   DATETIME                                   COMMENT 'Last Password Update Time',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Creator',
  create_time       DATETIME                                   COMMENT 'Creation Time',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Updater',
  update_time       DATETIME                                   COMMENT 'Update Time',
  remark            VARCHAR(500)    DEFAULT NULL               COMMENT 'Remark',
  PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=100 COMMENT = 'User Information Table';

-- ----------------------------
-- Initialization - User Information Table Data
-- ----------------------------
INSERT INTO sys_user VALUES(1,  103, 'admin', 'RuoYi', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', NULL, NULL, 'admin', SYSDATE(), '', NULL, 'Administrator');
INSERT INTO sys_user VALUES(2,  105, 'ry',    'RuoYi', '00', 'ry@qq.com',  '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', NULL, NULL, 'admin', SYSDATE(), '', NULL, 'Tester');

-- ----------------------------
-- 3. Position Information Table
-- ----------------------------
DROP TABLE IF EXISTS sys_post;
CREATE TABLE sys_post
(
  post_id       BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT 'Position ID',
  post_code     VARCHAR(64)     NOT NULL                   COMMENT 'Position Code',
  post_name     VARCHAR(50)     NOT NULL                   COMMENT 'Position Name',
  post_sort     INT(4)          NOT NULL                   COMMENT 'Display Order',
  status        CHAR(1)         NOT NULL                   COMMENT 'Status (0 Normal 1 Disabled)',
  create_by     VARCHAR(64)     DEFAULT ''                 COMMENT 'Creator',
  create_time   DATETIME                                   COMMENT 'Creation Time',
  update_by     VARCHAR(64)     DEFAULT ''                 COMMENT 'Updater',
  update_time   DATETIME                                   COMMENT 'Update Time',
  remark        VARCHAR(500)    DEFAULT NULL               COMMENT 'Remark',
  PRIMARY KEY (post_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT = 'Position Information Table';

-- ----------------------------
-- Initialization - Position Information Table Data
-- ----------------------------
INSERT INTO sys_post VALUES(1, 'ceo',  'Chairman',    1, '0', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_post VALUES(2, 'se',   'Project Manager',  2, '0', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_post VALUES(3, 'hr',   'Human Resources',  3, '0', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_post VALUES(4, 'user', 'General Employee',  4, '0', 'admin', SYSDATE(), '', NULL, '');

-- ----------------------------
-- 4. Role Information Table
-- ----------------------------
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
  role_id           BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT 'Role ID',
  role_name         VARCHAR(30)     NOT NULL                   COMMENT 'Role Name',
  role_key          VARCHAR(100)    NOT NULL                   COMMENT 'Role Permission String',
  role_sort         INT(4)          NOT NULL                   COMMENT 'Display Order',
  data_scope        CHAR(1)         DEFAULT '1'                COMMENT 'Data Scope (1: All Data Permissions 2: Custom Data Permissions 3: Department Data Permissions 4: Department and Below Data Permissions)',
  status            CHAR(1)         NOT NULL                   COMMENT 'Role Status (0 Normal 1 Disabled)',
  del_flag          CHAR(1)         DEFAULT '0'                COMMENT 'Deletion Flag (0 Exists 2 Deleted)',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Creator',
  create_time       DATETIME                                   COMMENT 'Creation Time',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Updater',
  update_time       DATETIME                                   COMMENT 'Update Time',
  remark            VARCHAR(500)    DEFAULT NULL               COMMENT 'Remark',
  PRIMARY KEY (role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=100 COMMENT = 'Role Information Table';

-- ----------------------------
-- Initialization - Role Information Table Data
-- ----------------------------
INSERT INTO sys_role VALUES('1', 'Super Administrator', 'admin',  1, 1, '0', '0', 'admin', SYSDATE(), '', NULL, 'Super Administrator');
INSERT INTO sys_role VALUES('2', 'Common Role',   'common', 2, 2, '0', '0', 'admin', SYSDATE(), '', NULL, 'Common Role');

-- ----------------------------
-- 5. Menu Permissions Table
-- ----------------------------
DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu (
  menu_id           BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT 'Menu ID',
  menu_name         VARCHAR(50)     NOT NULL                   COMMENT 'Menu Name',
  parent_id         BIGINT(20)      DEFAULT 0                  COMMENT 'Parent Menu ID',
  order_num         INT(4)          DEFAULT 0                  COMMENT 'Display Order',
  url               VARCHAR(200)    DEFAULT '#'                COMMENT 'Request Address',
  target            VARCHAR(20)     DEFAULT ''                 COMMENT 'Open Method (menuItem Tab menuBlank New Window)',
  menu_type         CHAR(1)         DEFAULT ''                 COMMENT 'Menu Type (M Directory C Menu F Button)',
  visible           CHAR(1)         DEFAULT 0                  COMMENT 'Menu Status (0 Display 1 Hidden)',
  is_refresh        CHAR(1)         DEFAULT 1                  COMMENT 'Whether to Refresh (0 Refresh 1 Do Not Refresh)',
  perms             VARCHAR(100)    DEFAULT NULL               COMMENT 'Permission Identifier',
  icon              VARCHAR(100)    DEFAULT '#'                COMMENT 'Menu Icon',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Creator',
  create_time       DATETIME                                   COMMENT 'Creation Time',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Updater',
  update_time       DATETIME                                   COMMENT 'Update Time',
  remark            VARCHAR(500)    DEFAULT ''                 COMMENT 'Remark',
  PRIMARY KEY (menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=2000 COMMENT = 'Menu Permissions Table';

-- ----------------------------
-- Initialization - Menu Information Table Data
-- ----------------------------
-- Level One Menus
INSERT INTO sys_menu VALUES('1', 'System Management', '0', '1', '#',                '',          'M', '0', '1', '', 'fa fa-gear',           'admin', SYSDATE(), '', NULL, 'System Management Directory');
INSERT INTO sys_menu VALUES('2', 'System Monitoring', '0', '2', '#',                '',          'M', '0', '1', '', 'fa fa-video-camera',   'admin', SYSDATE(), '', NULL, 'System Monitoring Directory');
INSERT INTO sys_menu VALUES('3', 'System Tools', '0', '3', '#',                '',          'M', '0', '1', '', 'fa fa-bars',           'admin', SYSDATE(), '', NULL, 'System Tools Directory');
INSERT INTO sys_menu VALUES('4', 'RuoYi Official Website', '0', '4', 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', SYSDATE(), '', NULL, 'RuoYi Official Website Address');
-- Level Two Menus
INSERT INTO sys_menu VALUES('100',  'User Management', '1', '1', '/system/user',          '', 'C', '0', '1', 'system:user:view',         'fa fa-user-o',          'admin', SYSDATE(), '', NULL, 'User Management Menu');
INSERT INTO sys_menu VALUES('101',  'Role Management', '1', '2', '/system/role',          '', 'C', '0', '1', 'system:role:view',         'fa fa-user-secret',     'admin', SYSDATE(), '', NULL, 'Role Management Menu');
INSERT INTO sys_menu VALUES('102',  'Menu Management', '1', '3', '/system/menu',          '', 'C', '0', '1', 'system:menu:view',         'fa fa-th-list',         'admin', SYSDATE(), '', NULL, 'Menu Management Menu');
INSERT INTO sys_menu VALUES('103',  'Department Management', '1', '4', '/system/dept',          '', 'C', '0', '1', 'system:dept:view',         'fa fa-outdent',         'admin', SYSDATE(), '', NULL, 'Department Management Menu');
INSERT INTO sys_menu VALUES('104',  'Position Management', '1', '5', '/system/post',          '', 'C', '0', '1', 'system:post:view',         'fa fa-address-card-o',  'admin', SYSDATE(), '', NULL, 'Position Management Menu');
INSERT INTO sys_menu VALUES('105',  'Dictionary Management', '1', '6', '/system/dict',          '', 'C', '0', '1', 'system:dict:view',         'fa fa-bookmark-o',      'admin', SYSDATE(), '', NULL, 'Dictionary Management Menu');
INSERT INTO sys_menu VALUES('106',  'Parameter Settings', '1', '7', '/system/config',        '', 'C', '0', '1', 'system:config:view',       'fa fa-sun-o',           'admin', SYSDATE(), '', NULL, 'Parameter Settings Menu');
INSERT INTO sys_menu VALUES('107',  'Notice Announcement', '1', '8', '/system/notice',        '', 'C', '0', '1', 'system:notice:view',       'fa fa-bullhorn',        'admin', SYSDATE(), '', NULL, 'Notice Announcement Menu');
INSERT INTO sys_menu VALUES('108',  'Log Management', '1', '9', '#',                     '', 'M', '0', '1', '',                         'fa fa-pencil-square-o', 'admin', SYSDATE(), '', NULL, 'Log Management Menu');
INSERT INTO sys_menu VALUES('109',  'Online Users', '2', '1', '/monitor/online',       '', 'C', '0', '1', 'monitor:online:view',      'fa fa-user-circle',     'admin', SYSDATE(), '', NULL, 'Online Users Menu');
INSERT INTO sys_menu VALUES('110',  'Scheduled Tasks', '2', '2', '/monitor/job',          '', 'C', '0', '1', 'monitor:job:view',         'fa fa-tasks',           'admin', SYSDATE(), '', NULL, 'Scheduled Tasks Menu');
INSERT INTO sys_menu VALUES('111',  'Data Monitoring', '2', '3', '/monitor/data',         '', 'C', '0', '1', 'monitor:data:view',        'fa fa-bug',             'admin', SYSDATE(), '', NULL, 'Data Monitoring Menu');
INSERT INTO sys_menu VALUES('112',  'Service Monitoring', '2', '4', '/monitor/server',       '', 'C', '0', '1', 'monitor:server:view',      'fa fa-server',          'admin', SYSDATE(), '', NULL, 'Service Monitoring Menu');
INSERT INTO sys_menu VALUES('113',  'Cache Monitoring', '2', '5', '/monitor/cache',        '', 'C', '0', '1', 'monitor:cache:view',       'fa fa-cube',            'admin', SYSDATE(), '', NULL, 'Cache Monitoring Menu');
INSERT INTO sys_menu VALUES('114',  'Form Builder', '3', '1', '/tool/build',           '', 'C', '0', '1', 'tool:build:view',          'fa fa-wpforms',         'admin', SYSDATE(), '', NULL, 'Form Builder Menu');
INSERT INTO sys_menu VALUES('115',  'Code Generation', '3', '2', '/tool/gen',             '', 'C', '0', '1', 'tool:gen:view',            'fa fa-code',            'admin', SYSDATE(), '', NULL, 'Code Generation Menu');
INSERT INTO sys_menu VALUES('116',  'System Interface', '3', '3', '/tool/swagger',         '', 'C', '0', '1', 'tool:swagger:view',        'fa fa-gg',              'admin', SYSDATE(), '', NULL, 'System Interface Menu');
-- Level Three Menus
INSERT INTO sys_menu VALUES('500',  'Operation Log', '108', '1', '/monitor/operlog',    '', 'C', '0', '1', 'monitor:operlog:view',     'fa fa-address-book',    'admin', SYSDATE(), '', NULL, 'Operation Log Menu');
INSERT INTO sys_menu VALUES('501',  'Login Log', '108', '2', '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view',  'fa fa-file-image-o',    'admin', SYSDATE(), '', NULL, 'Login Log Menu');
-- User Management Buttons
INSERT INTO sys_menu VALUES('1000', 'User Query', '100', '1',  '#', '',  'F', '0', '1', 'system:user:list',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1001', 'User Add', '100', '2',  '#', '',  'F', '0', '1', 'system:user:add',         '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1002', 'User Edit', '100', '3',  '#', '',  'F', '0', '1', 'system:user:edit',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1003', 'User Delete', '100', '4',  '#', '',  'F', '0', '1', 'system:user:remove',      '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1004', 'User Export', '100', '5',  '#', '',  'F', '0', '1', 'system:user:export',      '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1005', 'User Import', '100', '6',  '#', '',  'F', '0', '1', 'system:user:import',      '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1006', 'Reset Password', '100', '7',  '#', '',  'F', '0', '1', 'system:user:resetPwd',    '#', 'admin', SYSDATE(), '', NULL, '');
-- Role Management Buttons
INSERT INTO sys_menu VALUES('1007', 'Role Query', '101', '1',  '#', '',  'F', '0', '1', 'system:role:list',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1008', 'Role Add', '101', '2',  '#', '',  'F', '0', '1', 'system:role:add',         '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1009', 'Role Edit', '101', '3',  '#', '',  'F', '0', '1', 'system:role:edit',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1010', 'Role Delete', '101', '4',  '#', '',  'F', '0', '1', 'system:role:remove',      '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1011', 'Role Export', '101', '5',  '#', '',  'F', '0', '1', 'system:role:export',      '#', 'admin', SYSDATE(), '', NULL, '');
-- Menu Management Buttons
INSERT INTO sys_menu VALUES('1012', 'Menu Query', '102', '1',  '#', '',  'F', '0', '1', 'system:menu:list',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1013', 'Menu Add', '102', '2',  '#', '',  'F', '0', '1', 'system:menu:add',         '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1014', 'Menu Edit', '102', '3',  '#', '',  'F', '0', '1', 'system:menu:edit',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1015', 'Menu Delete', '102', '4',  '#', '',  'F', '0', '1', 'system:menu:remove',      '#', 'admin', SYSDATE(), '', NULL, '');
-- Department Management Buttons
INSERT INTO sys_menu VALUES('1016', 'Department Query', '103', '1',  '#', '',  'F', '0', '1', 'system:dept:list',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1017', 'Department Add', '103', '2',  '#', '',  'F', '0', '1', 'system:dept:add',         '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1018', 'Department Edit', '103', '3',  '#', '',  'F', '0', '1', 'system:dept:edit',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1019', 'Department Delete', '103', '4',  '#', '',  'F', '0', '1', 'system:dept:remove',      '#', 'admin', SYSDATE(), '', NULL, '');
-- Position Management Buttons
INSERT INTO sys_menu VALUES('1020', 'Position Query', '104', '1',  '#', '',  'F', '0', '1', 'system:post:list',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1021', 'Position Add', '104', '2',  '#', '',  'F', '0', '1', 'system:post:add',         '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1022', 'Position Edit', '104', '3',  '#', '',  'F', '0', '1', 'system:post:edit',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1023', 'Position Delete', '104', '4',  '#', '',  'F', '0', '1', 'system:post:remove',      '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1024', 'Position Export', '104', '5',  '#', '',  'F', '0', '1', 'system:post:export',      '#', 'admin', SYSDATE(), '', NULL, '');
-- Dictionary Management Buttons
INSERT INTO sys_menu VALUES('1025', 'Dictionary Query', '105', '1',  '#', '',  'F', '0', '1', 'system:dict:list',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1026', 'Dictionary Add', '105', '2',  '#', '',  'F', '0', '1', 'system:dict:add',         '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1027', 'Dictionary Edit', '105', '3',  '#', '',  'F', '0', '1', 'system:dict:edit',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1028', 'Dictionary Delete', '105', '4',  '#', '',  'F', '0', '1', 'system:dict:remove',      '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1029', 'Dictionary Export', '105', '5',  '#', '',  'F', '0', '1', 'system:dict:export',      '#', 'admin', SYSDATE(), '', NULL, '');
-- Parameter Settings Buttons
INSERT INTO sys_menu VALUES('1030', 'Parameter Query', '106', '1',  '#', '',  'F', '0', '1', 'system:config:list',      '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1031', 'Parameter Add', '106', '2',  '#', '',  'F', '0', '1', 'system:config:add',       '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1032', 'Parameter Edit', '106', '3',  '#', '',  'F', '0', '1', 'system:config:edit',      '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1033', 'Parameter Delete', '106', '4',  '#', '',  'F', '0', '1', 'system:config:remove',    '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1034', 'Parameter Export', '106', '5',  '#', '',  'F', '0', '1', 'system:config:export',    '#', 'admin', SYSDATE(), '', NULL, '');
-- Notice Announcement Buttons
INSERT INTO sys_menu VALUES('1035', 'Notice Query', '107', '1',  '#', '',  'F', '0', '1', 'system:notice:list',      '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1036', 'Notice Add', '107', '2',  '#', '',  'F', '0', '1', 'system:notice:add',       '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1037', 'Notice Edit', '107', '3',  '#', '',  'F', '0', '1', 'system:notice:edit',      '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1038', 'Notice Delete', '107', '4',  '#', '',  'F', '0', '1', 'system:notice:remove',    '#', 'admin', SYSDATE(), '', NULL, '');
-- Operation Log Buttons
INSERT INTO sys_menu VALUES('1039', 'Operation Query', '500', '1',  '#', '',  'F', '0', '1', 'monitor:operlog:list',    '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1040', 'Operation Delete', '500', '2',  '#', '',  'F', '0', '1', 'monitor:operlog:remove',  '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1041', 'Operation Detail', '500', '3',  '#', '',  'F', '0', '1', 'monitor:operlog:detail',  '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1042', 'Operation Export', '500', '4',  '#', '',  'F', '0', '1', 'monitor:operlog:export',  '#', 'admin', SYSDATE(), '', NULL, '');
-- Login Log Buttons
INSERT INTO sys_menu VALUES('1043', 'Login Query', '501', '1',  '#', '',  'F', '0', '1', 'monitor:logininfor:list',         '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1044', 'Login Delete', '501', '2',  '#', '',  'F', '0', '1', 'monitor:logininfor:remove',       '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1045', 'Login Export', '501', '3',  '#', '',  'F', '0', '1', 'monitor:logininfor:export',       '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1046', 'Account Unlock', '501', '4',  '#', '',  'F', '0', '1', 'monitor:logininfor:unlock',       '#', 'admin', SYSDATE(), '', NULL, '');
-- Online Users Buttons
INSERT INTO sys_menu VALUES('1047', 'Online Query', '109', '1',  '#', '',  'F', '0', '1', 'monitor:online:list',             '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1048', 'Batch Force Logout', '109', '2',  '#', '',  'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1049', 'Single Force Logout', '109', '3',  '#', '',  'F', '0', '1', 'monitor:online:forceLogout',      '#', 'admin', SYSDATE(), '', NULL, '');
-- Scheduled Tasks Buttons
INSERT INTO sys_menu VALUES('1050', 'Task Query', '110', '1',  '#', '',  'F', '0', '1', 'monitor:job:list',                '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1051', 'Task Add', '110', '2',  '#', '',  'F', '0', '1', 'monitor:job:add',                 '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1052', 'Task Edit', '110', '3',  '#', '',  'F', '0', '1', 'monitor:job:edit',                '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1053', 'Task Delete', '110', '4',  '#', '',  'F', '0', '1', 'monitor:job:remove',              '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1054', 'Task Status Change', '110', '5',  '#', '',  'F', '0', '1', 'monitor:job:changeStatus',        '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1055', 'Task Detail', '110', '6',  '#', '',  'F', '0', '1', 'monitor:job:detail',              '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1056', 'Task Export', '110', '7',  '#', '',  'F', '0', '1', 'monitor:job:export',              '#', 'admin', SYSDATE(), '', NULL, '');
-- Code Generation Buttons
INSERT INTO sys_menu VALUES('1057', 'Generation Query', '115', '1',  '#', '',  'F', '0', '1', 'tool:gen:list',     '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1058', 'Generation Edit', '115', '2',  '#', '',  'F', '0', '1', 'tool:gen:edit',     '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1059', 'Generation Delete', '115', '3',  '#', '',  'F', '0', '1', 'tool:gen:remove',   '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1060', 'Preview Code', '115', '4',  '#', '',  'F', '0', '1', 'tool:gen:preview',  '#', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_menu VALUES('1061', 'Generate Code', '115', '5',  '#', '',  'F', '0', '1', 'tool:gen:code',     '#', 'admin', SYSDATE(), '', NULL, '');

-- ----------------------------
-- 6. User and Role Association Table  User N-1 Role
-- ----------------------------
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role (
  user_id   BIGINT(20) NOT NULL COMMENT 'User ID',
  role_id   BIGINT(20) NOT NULL COMMENT 'Role ID',
  PRIMARY KEY(user_id, role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT = 'User and Role Association Table';

-- ----------------------------
-- Initialization - User and Role Association Table Data
-- ----------------------------
INSERT INTO sys_user_role VALUES ('1', '1');
INSERT INTO sys_user_role VALUES ('2', '2');

-- ----------------------------
-- 7. Role and Menu Association Table  Role 1-N Menu
-- ----------------------------
DROP TABLE IF EXISTS sys_role_menu;
CREATE TABLE sys_role_menu (
  role_id   BIGINT(20) NOT NULL COMMENT 'Role ID',
  menu_id   BIGINT(20) NOT NULL COMMENT 'Menu ID',
  PRIMARY KEY(role_id, menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT = 'Role and Menu Association Table';

-- ----------------------------
-- Initialization - Role and Menu Association Table Data
-- ----------------------------
INSERT INTO sys_role_menu VALUES ('2', '1');
INSERT INTO sys_role_menu VALUES ('2', '2');
INSERT INTO sys_role_menu VALUES ('2', '3');
INSERT INTO sys_role_menu VALUES ('2', '4');
INSERT INTO sys_role_menu VALUES ('2', '100');
INSERT INTO sys_role_menu VALUES ('2', '101');
INSERT INTO sys_role_menu VALUES ('2', '102');
INSERT INTO sys_role_menu VALUES ('2', '103');
INSERT INTO sys_role_menu VALUES ('2', '104');
INSERT INTO sys_role_menu VALUES ('2', '105');
INSERT INTO sys_role_menu VALUES ('2', '106');
INSERT INTO sys_role_menu VALUES ('2', '107');
INSERT INTO sys_role_menu VALUES ('2', '108');
INSERT INTO sys_role_menu VALUES ('2', '109');
INSERT INTO sys_role_menu VALUES ('2', '110');
INSERT INTO sys_role_menu VALUES ('2', '111');
INSERT INTO sys_role_menu VALUES ('2', '112');
INSERT INTO sys_role_menu VALUES ('2', '113');
INSERT INTO sys_role_menu VALUES ('2', '114');
INSERT INTO sys_role_menu VALUES ('2', '115');
INSERT INTO sys_role_menu VALUES ('2', '116');
INSERT INTO sys_role_menu VALUES ('2', '500');
INSERT INTO sys_role_menu VALUES ('2', '501');
INSERT INTO sys_role_menu VALUES ('2', '1000');
INSERT INTO sys_role_menu VALUES ('2', '1001');
INSERT INTO sys_role_menu VALUES ('2', '1002');
INSERT INTO sys_role_menu VALUES ('2', '1003');
INSERT INTO sys_role_menu VALUES ('2', '1004');
INSERT INTO sys_role_menu VALUES ('2', '1005');
INSERT INTO sys_role_menu VALUES ('2', '1006');
INSERT INTO sys_role_menu VALUES ('2', '1007');
INSERT INTO sys_role_menu VALUES ('2', '1008');
INSERT INTO sys_role_menu VALUES ('2', '1009');
INSERT INTO sys_role_menu VALUES ('2', '1010');
INSERT INTO sys_role_menu VALUES ('2', '1011');
INSERT INTO sys_role_menu VALUES ('2', '1012');
INSERT INTO sys_role_menu VALUES ('2', '1013');
INSERT INTO sys_role_menu VALUES ('2', '1014');
INSERT INTO sys_role_menu VALUES ('2', '1015');
INSERT INTO sys_role_menu VALUES ('2', '1016');
INSERT INTO sys_role_menu VALUES ('2', '1017');
INSERT INTO sys_role_menu VALUES ('2', '1018');
INSERT INTO sys_role_menu VALUES ('2', '1019');
INSERT INTO sys_role_menu VALUES ('2', '1020');
INSERT INTO sys_role_menu VALUES ('2', '1021');
INSERT INTO sys_role_menu VALUES ('2', '1022');
INSERT INTO sys_role_menu VALUES ('2', '1023');
INSERT INTO sys_role_menu VALUES ('2', '1024');
INSERT INTO sys_role_menu VALUES ('2', '1025');
INSERT INTO sys_role_menu VALUES ('2', '1026');
INSERT INTO sys_role_menu VALUES ('2', '1027');
INSERT INTO sys_role_menu VALUES ('2', '1028');
INSERT INTO sys_role_menu VALUES ('2', '1029');
INSERT INTO sys_role_menu VALUES ('2', '1030');
INSERT INTO sys_role_menu VALUES ('2', '1031');
INSERT INTO sys_role_menu VALUES ('2', '1032');
INSERT INTO sys_role_menu VALUES ('2', '1033');
INSERT INTO sys_role_menu VALUES ('2', '1034');
INSERT INTO sys_role_menu VALUES ('2', '1035');
INSERT INTO sys_role_menu VALUES ('2', '1036');
INSERT INTO sys_role_menu VALUES ('2', '1037');
INSERT INTO sys_role_menu VALUES ('2', '1038');
INSERT INTO sys_role_menu VALUES ('2', '1039');
INSERT INTO sys_role_menu VALUES ('2', '1040');
INSERT INTO sys_role_menu VALUES ('2', '1041');
INSERT INTO sys_role_menu VALUES ('2', '1042');
INSERT INTO sys_role_menu VALUES ('2', '1043');
INSERT INTO sys_role_menu VALUES ('2', '1044');
INSERT INTO sys_role_menu VALUES ('2', '1045');
INSERT INTO sys_role_menu VALUES ('2', '1046');
INSERT INTO sys_role_menu VALUES ('2', '1047');
INSERT INTO sys_role_menu VALUES ('2', '1048');
INSERT INTO sys_role_menu VALUES ('2', '1049');
INSERT INTO sys_role_menu VALUES ('2', '1050');
INSERT INTO sys_role_menu VALUES ('2', '1051');
INSERT INTO sys_role_menu VALUES ('2', '1052');
INSERT INTO sys_role_menu VALUES ('2', '1053');
INSERT INTO sys_role_menu VALUES ('2', '1054');
INSERT INTO sys_role_menu VALUES ('2', '1055');
INSERT INTO sys_role_menu VALUES ('2', '1056');
INSERT INTO sys_role_menu VALUES ('2', '1057');
INSERT INTO sys_role_menu VALUES ('2', '1058');
INSERT INTO sys_role_menu VALUES ('2', '1059');
INSERT INTO sys_role_menu VALUES ('2', '1060');
INSERT INTO sys_role_menu VALUES ('2', '1061');

-- ----------------------------
-- 8. Role and Department Association Table  Role 1-N Department
-- ----------------------------
DROP TABLE IF EXISTS sys_role_dept;
CREATE TABLE sys_role_dept (
  role_id   BIGINT(20) NOT NULL COMMENT 'Role ID',
  dept_id   BIGINT(20) NOT NULL COMMENT 'Department ID',
  PRIMARY KEY(role_id, dept_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT = 'Role and Department Association Table';

-- ----------------------------
-- Initialization - Role and Department Association Table Data
-- ----------------------------
INSERT INTO sys_role_dept VALUES ('2', '100');
INSERT INTO sys_role_dept VALUES ('2', '101');
INSERT INTO sys_role_dept VALUES ('2', '105');

-- ----------------------------
-- 9. User and Position Association Table  User 1-N Position
-- ----------------------------
DROP TABLE IF EXISTS sys_user_post;
CREATE TABLE sys_user_post
(
  user_id   BIGINT(20) NOT NULL COMMENT 'User ID',
  post_id   BIGINT(20) NOT NULL COMMENT 'Position ID',
  PRIMARY KEY (user_id, post_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT = 'User and Position Association Table';

-- ----------------------------
-- Initialization - User and Position Association Table Data
-- ----------------------------
INSERT INTO sys_user_post VALUES ('1', '1');
INSERT INTO sys_user_post VALUES ('2', '2');

-- ----------------------------
-- 10. Operation Log Record
-- ----------------------------
DROP TABLE IF EXISTS sys_oper_log;
CREATE TABLE sys_oper_log (
  oper_id           BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT 'Log Primary Key',
  title             VARCHAR(50)     DEFAULT ''                 COMMENT 'Module Title',
  business_type     INT(2)          DEFAULT 0                  COMMENT 'Business Type (0 Other 1 Add 2 Edit 3 Delete)',
  method            VARCHAR(200)    DEFAULT ''                 COMMENT 'Method Name',
  request_method    VARCHAR(10)     DEFAULT ''                 COMMENT 'Request Method',
  operator_type     INT(1)          DEFAULT 0                  COMMENT 'Operator Type (0 Other 1 Backend User 2 Mobile User)',
  oper_name         VARCHAR(50)     DEFAULT ''                 COMMENT 'Operator Name',
  dept_name         VARCHAR(50)     DEFAULT ''                 COMMENT 'Department Name',
  oper_url          VARCHAR(255)    DEFAULT ''                 COMMENT 'Request URL',
  oper_ip           VARCHAR(128)    DEFAULT ''                 COMMENT 'Host Address',
  oper_location     VARCHAR(255)    DEFAULT ''                 COMMENT 'Operation Location',
  oper_param        VARCHAR(2000)   DEFAULT ''                 COMMENT 'Request Parameters',
  json_result       VARCHAR(2000)   DEFAULT ''                 COMMENT 'Return Parameters',
  status            INT(1)          DEFAULT 0                  COMMENT 'Operation Status (0 Normal 1 Exception)',
  error_msg         VARCHAR(2000)   DEFAULT ''                 COMMENT 'Error Message',
  oper_time         DATETIME                                   COMMENT 'Operation Time',
  cost_time         BIGINT(20)      DEFAULT 0                  COMMENT 'Cost Time',
  PRIMARY KEY (oper_id),
  KEY idx_sys_oper_log_bt (business_type),
  KEY idx_sys_oper_log_s  (status),
  KEY idx_sys_oper_log_ot (oper_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=100 COMMENT = 'Operation Log Record';

-- ----------------------------
-- 11. Dictionary Type Table
-- ----------------------------
DROP TABLE IF EXISTS sys_dict_type;
CREATE TABLE sys_dict_type
(
  dict_id          BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT 'Dictionary Primary Key',
  dict_name        VARCHAR(100)    DEFAULT ''                 COMMENT 'Dictionary Name',
  dict_type        VARCHAR(100)    DEFAULT ''                 COMMENT 'Dictionary Type',
  status           CHAR(1)         DEFAULT '0'                COMMENT 'Status (0 Normal 1 Disabled)',
  create_by        VARCHAR(64)     DEFAULT ''                 COMMENT 'Creator',
  create_time      DATETIME                                   COMMENT 'Creation Time',
  update_by        VARCHAR(64)     DEFAULT ''                 COMMENT 'Updater',
  update_time      DATETIME                                   COMMENT 'Update Time',
  remark           VARCHAR(500)    DEFAULT NULL               COMMENT 'Remark',
  PRIMARY KEY (dict_id),
  UNIQUE (dict_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=100 COMMENT = 'Dictionary Type Table';

INSERT INTO sys_dict_type VALUES(1,  'User Gender', 'sys_user_sex',        '0', 'admin', SYSDATE(), '', NULL, 'User Gender List');
INSERT INTO sys_dict_type VALUES(2,  'Menu Status', 'sys_show_hide',       '0', 'admin', SYSDATE(), '', NULL, 'Menu Status List');
INSERT INTO sys_dict_type VALUES(3,  'System Switch', 'sys_normal_disable',  '0', 'admin', SYSDATE(), '', NULL, 'System Switch List');
INSERT INTO sys_dict_type VALUES(4,  'Task Status', 'sys_job_status',      '0', 'admin', SYSDATE(), '', NULL, 'Task Status List');
INSERT INTO sys_dict_type VALUES(5,  'Task Group', 'sys_job_group',       '0', 'admin', SYSDATE(), '', NULL, 'Task Group List');
INSERT INTO sys_dict_type VALUES(6,  'System Yes/No', 'sys_yes_no',          '0', 'admin', SYSDATE(), '', NULL, 'System Yes/No List');
INSERT INTO sys_dict_type VALUES(7,  'Notice Type', 'sys_notice_type',     '0', 'admin', SYSDATE(), '', NULL, 'Notice Type List');
INSERT INTO sys_dict_type VALUES(8,  'Notice Status', 'sys_notice_status',   '0', 'admin', SYSDATE(), '', NULL, 'Notice Status List');
INSERT INTO sys_dict_type VALUES(9,  'Operation Type', 'sys_oper_type',       '0', 'admin', SYSDATE(), '', NULL, 'Operation Type List');
INSERT INTO sys_dict_type VALUES(10, 'Common Status', 'sys_common_status',   '0', 'admin', SYSDATE(), '', NULL, 'Login Status List');

-- ----------------------------
-- 12. Dictionary Data Table
-- ----------------------------
DROP TABLE IF EXISTS sys_dict_data;
CREATE TABLE sys_dict_data
(
  dict_code        BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT 'Dictionary Code',
  dict_sort        INT(4)          DEFAULT 0                  COMMENT 'Dictionary Sort Order',
  dict_label       VARCHAR(100)    DEFAULT ''                 COMMENT 'Dictionary Label',
  dict_value       VARCHAR(100)    DEFAULT ''                 COMMENT 'Dictionary Key Value',
  dict_type        VARCHAR(100)    DEFAULT ''                 COMMENT 'Dictionary Type',
  css_class        VARCHAR(100)    DEFAULT NULL               COMMENT 'Style Attribute (Other Style Extensions)',
  list_class       VARCHAR(100)    DEFAULT NULL               COMMENT 'Table Echo Style',
  is_default       CHAR(1)         DEFAULT 'N'                COMMENT 'Is Default (Y Yes N No)',
  status           CHAR(1)         DEFAULT '0'                COMMENT 'Status (0 Normal 1 Disabled)',
  create_by        VARCHAR(64)     DEFAULT ''                 COMMENT 'Creator',
  create_time      DATETIME                                   COMMENT 'Creation Time',
  update_by        VARCHAR(64)     DEFAULT ''                 COMMENT 'Updater',
  update_time      DATETIME                                   COMMENT 'Update Time',
  remark           VARCHAR(500)    DEFAULT NULL               COMMENT 'Remark',
  PRIMARY KEY (dict_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=100 COMMENT = 'Dictionary Data Table';

INSERT INTO sys_dict_data VALUES(1,  1,  'Male',       '0',       'sys_user_sex',        '',   '',        'Y', '0', 'admin', SYSDATE(), '', NULL, 'Male Gender');
INSERT INTO sys_dict_data VALUES(2,  2,  'Female',     '1',       'sys_user_sex',        '',   '',        'N', '0', 'admin', SYSDATE(), '', NULL, 'Female Gender');
INSERT INTO sys_dict_data VALUES(3,  3,  'Unknown',    '2',       'sys_user_sex',        '',   '',        'N', '0', 'admin', SYSDATE(), '', NULL, 'Unknown Gender');
INSERT INTO sys_dict_data VALUES(4,  1,  'Display',    '0',       'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', SYSDATE(), '', NULL, 'Display Menu');
INSERT INTO sys_dict_data VALUES(5,  2,  'Hidden',     '1',       'sys_show_hide',       '',   'danger',  'N', '0', 'admin', SYSDATE(), '', NULL, 'Hidden Menu');
INSERT INTO sys_dict_data VALUES(6,  1,  'Normal',     '0',       'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', SYSDATE(), '', NULL, 'Normal Status');
INSERT INTO sys_dict_data VALUES(7,  2,  'Disabled',   '1',       'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', SYSDATE(), '', NULL, 'Disabled Status');
INSERT INTO sys_dict_data VALUES(8,  1,  'Normal',     '0',       'sys_job_status',      '',   'primary', 'Y', '0', 'admin', SYSDATE(), '', NULL, 'Normal Status');
INSERT INTO sys_dict_data VALUES(9,  2,  'Paused',     '1',       'sys_job_status',      '',   'danger',  'N', '0', 'admin', SYSDATE(), '', NULL, 'Paused Status');
INSERT INTO sys_dict_data VALUES(10, 1,  'Default',    'DEFAULT', 'sys_job_group',       '',   '',        'Y', '0', 'admin', SYSDATE(), '', NULL, 'Default Group');
INSERT INTO sys_dict_data VALUES(11, 2,  'System',     'SYSTEM',  'sys_job_group',       '',   '',        'N', '0', 'admin', SYSDATE(), '', NULL, 'System Group');
INSERT INTO sys_dict_data VALUES(12, 1,  'Yes',        'Y',       'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', SYSDATE(), '', NULL, 'System Default Yes');
INSERT INTO sys_dict_data VALUES(13, 2,  'No',         'N',       'sys_yes_no',          '',   'danger',  'N', '0', 'admin', SYSDATE(), '', NULL, 'System Default No');
INSERT INTO sys_dict_data VALUES(14, 1,  'Notice',     '1',       'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', SYSDATE(), '', NULL, 'Notice');
INSERT INTO sys_dict_data VALUES(15, 2,  'Announcement', '2',     'sys_notice_type',     '',   'success', 'N', '0', 'admin', SYSDATE(), '', NULL, 'Announcement');
INSERT INTO sys_dict_data VALUES(16, 1,  'Normal',     '0',       'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', SYSDATE(), '', NULL, 'Normal Status');
INSERT INTO sys_dict_data VALUES(17, 2,  'Closed',     '1',       'sys_notice_status',   '',   'danger',  'N', '0', 'admin', SYSDATE(), '', NULL, 'Closed Status');
INSERT INTO sys_dict_data VALUES(18, 99, 'Other',      '0',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', SYSDATE(), '', NULL, 'Other Operation');
INSERT INTO sys_dict_data VALUES(19, 1,  'Add',        '1',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', SYSDATE(), '', NULL, 'Add Operation');
INSERT INTO sys_dict_data VALUES(20, 2,  'Edit',       '2',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', SYSDATE(), '', NULL, 'Edit Operation');
INSERT INTO sys_dict_data VALUES(21, 3,  'Delete',     '3',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', SYSDATE(), '', NULL, 'Delete Operation');
INSERT INTO sys_dict_data VALUES(22, 4,  'Authorize',  '4',       'sys_oper_type',       '',   'primary', 'N', '0', 'admin', SYSDATE(), '', NULL, 'Authorize Operation');
INSERT INTO sys_dict_data VALUES(23, 5,  'Export',     '5',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', SYSDATE(), '', NULL, 'Export Operation');
INSERT INTO sys_dict_data VALUES(24, 6,  'Import',     '6',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', SYSDATE(), '', NULL, 'Import Operation');
INSERT INTO sys_dict_data VALUES(25, 7,  'Force Logout', '7',     'sys_oper_type',       '',   'danger',  'N', '0', 'admin', SYSDATE(), '', NULL, 'Force Logout Operation');
INSERT INTO sys_dict_data VALUES(26, 8,  'Generate Code', '8',    'sys_oper_type',       '',   'warning', 'N', '0', 'admin', SYSDATE(), '', NULL, 'Generate Operation');
INSERT INTO sys_dict_data VALUES(27, 9,  'Clear Data', '9',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', SYSDATE(), '', NULL, 'Clear Operation');
INSERT INTO sys_dict_data VALUES(28, 1,  'Success',    '0',       'sys_common_status',   '',   'primary', 'N', '0', 'admin', SYSDATE(), '', NULL, 'Normal Status');
INSERT INTO sys_dict_data VALUES(29, 2,  'Failure',    '1',       'sys_common_status',   '',   'danger',  'N', '0', 'admin', SYSDATE(), '', NULL, 'Disabled Status');

-- ----------------------------
-- 13. Parameter Configuration Table
-- ----------------------------
DROP TABLE IF EXISTS sys_config;
CREATE TABLE sys_config (
  config_id         INT(5)          NOT NULL AUTO_INCREMENT    COMMENT 'Parameter Primary Key',
  config_name       VARCHAR(100)    DEFAULT ''                 COMMENT 'Parameter Name',
  config_key        VARCHAR(100)    DEFAULT ''                 COMMENT 'Parameter Key Name',
  config_value      VARCHAR(500)    DEFAULT ''                 COMMENT 'Parameter Key Value',
  config_type       CHAR(1)         DEFAULT 'N'                COMMENT 'System Built-in (Y Yes N No)',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Creator',
  create_time       DATETIME                                   COMMENT 'Creation Time',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Updater',
  update_time       DATETIME                                   COMMENT 'Update Time',
  remark            VARCHAR(500)    DEFAULT NULL               COMMENT 'Remark',
  PRIMARY KEY (config_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=100 COMMENT = 'Parameter Configuration Table';

INSERT INTO sys_config VALUES(1,  'Main Frame Page - Default Skin Style Name',     'sys.index.skinName',               'skin-blue',     'Y', 'admin', SYSDATE(), '', NULL, 'Blue skin-blue, Green skin-green, Purple skin-purple, Red skin-red, Yellow skin-yellow');
INSERT INTO sys_config VALUES(2,  'User Management - Account Initial Password',   'sys.user.initPassword',            '123456',        'Y', 'admin', SYSDATE(), '', NULL, 'Initial Password 123456');
INSERT INTO sys_config VALUES(3,  'Main Frame Page - Sidebar Theme',             'sys.index.sideTheme',              'theme-dark',    'Y', 'admin', SYSDATE(), '', NULL, 'Dark Theme theme-dark, Light Theme theme-light, Blue Theme theme-blue');
INSERT INTO sys_config VALUES(4,  'Account Self-service - Enable User Registration Function', 'sys.account.registerUser',         'false',         'Y', 'admin', SYSDATE(), '', NULL, 'Whether to enable user registration function (true enable, false disable)');
INSERT INTO sys_config VALUES(5,  'User Management - Password Character Range',  'sys.account.chrtype',              '0',             'Y', 'admin', SYSDATE(), '', NULL, 'Default any character range, 0 any (password can be any character), 1 numeric (password can only be 0-9 numbers), 2 English letters (password can only be a-z and A-Z letters), 3 letters and numbers (password must contain letters, numbers), 4 letters, numbers and special characters (currently supported special characters include: ~!@#$%^&*()-=_+)');
INSERT INTO sys_config VALUES(6,  'User Management - Initial Password Modification Policy', 'sys.account.initPasswordModify',   '1',             'Y', 'admin', SYSDATE(), '', NULL, '0: Initial password modification policy is off, no prompt at all, 1: Remind users, if the initial password has not been modified, then a password modification dialog box will appear at login');
INSERT INTO sys_config VALUES(7,  'User Management - Account Password Update Cycle', 'sys.account.passwordValidateDays', '0',             'Y', 'admin', SYSDATE(), '', NULL, 'Password update cycle (fill in the number, the default value is 0 unlimited, if modified must be a positive integer greater than 0 and less than 365), if exceeded this cycle when logging into the system, then a password modification dialog box will appear at login');
INSERT INTO sys_config VALUES(8,  'Main Frame Page - Menu Navigation Display Style', 'sys.index.menuStyle',              'default',       'Y', 'admin', SYSDATE(), '', NULL, 'Menu navigation display style (default for left navigation menu, topnav for top navigation menu)');
INSERT INTO sys_config VALUES(9,  'Main Frame Page - Enable Footer',               'sys.index.footer',                 'true',          'Y', 'admin', SYSDATE(), '', NULL, 'Whether to enable the display of the bottom footer (true display, false hide)');
INSERT INTO sys_config VALUES(10, 'Main Frame Page - Enable Tabs',                 'sys.index.tagsView',               'true',          'Y', 'admin', SYSDATE(), '', NULL, 'Whether to enable menu multi-page tab display (true display, false hide)');
INSERT INTO sys_config VALUES(11, 'User Login - Blacklist List',                   'sys.login.blackIPList',            '',              'Y', 'admin', SYSDATE(), '', NULL, 'Set login IP blacklist restrictions, multiple matching items are separated by ;, support matching (* wildcard, subnet)');

-- ----------------------------
-- 14. System Access Record
-- ----------------------------
DROP TABLE IF EXISTS sys_logininfor;
CREATE TABLE sys_logininfor (
  info_id        BIGINT(20)     NOT NULL AUTO_INCREMENT   COMMENT 'Access ID',
  login_name     VARCHAR(50)    DEFAULT ''                COMMENT 'Login Account',
  ipaddr         VARCHAR(128)   DEFAULT ''                COMMENT 'Login IP Address',
  login_location VARCHAR(255)   DEFAULT ''                COMMENT 'Login Location',
  browser        VARCHAR(50)    DEFAULT ''                COMMENT 'Browser Type',
  os             VARCHAR(50)    DEFAULT ''                COMMENT 'Operating System',
  status         CHAR(1)        DEFAULT '0'               COMMENT 'Login Status (0 Success 1 Failure)',
  msg            VARCHAR(255)   DEFAULT ''                COMMENT 'Prompt Message',
  login_time     DATETIME                                 COMMENT 'Access Time',
  PRIMARY KEY (info_id),
  KEY idx_sys_logininfor_s  (status),
  KEY idx_sys_logininfor_lt (login_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=100 COMMENT = 'System Access Record';

-- ----------------------------
-- 15. Online User Record
-- ----------------------------
DROP TABLE IF EXISTS sys_user_online;
CREATE TABLE sys_user_online (
  sessionId         VARCHAR(50)   DEFAULT ''                COMMENT 'User Session ID',
  login_name        VARCHAR(50)   DEFAULT ''                COMMENT 'Login Account',
  dept_name         VARCHAR(50)   DEFAULT ''                COMMENT 'Department Name',
  ipaddr            VARCHAR(128)  DEFAULT ''                COMMENT 'Login IP Address',
  login_location    VARCHAR(255)  DEFAULT ''                COMMENT 'Login Location',
  browser           VARCHAR(50)   DEFAULT ''                COMMENT 'Browser Type',
  os                VARCHAR(50)   DEFAULT ''                COMMENT 'Operating System',
  status            VARCHAR(10)   DEFAULT ''                COMMENT 'Online Status on_line Online off_line Offline',
  start_timestamp   DATETIME                                COMMENT 'Session Creation Time',
  last_access_time  DATETIME                                COMMENT 'Session Last Access Time',
  expire_time       INT(5)        DEFAULT 0                 COMMENT 'Timeout Time, in minutes',
  PRIMARY KEY (sessionId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT = 'Online User Record';

-- ----------------------------
-- 16. Scheduled Task Scheduling Table
-- ----------------------------
DROP TABLE IF EXISTS sys_job;
CREATE TABLE sys_job (
  job_id              BIGINT(20)    NOT NULL AUTO_INCREMENT    COMMENT 'Task ID',
  job_name            VARCHAR(64)   DEFAULT ''                 COMMENT 'Task Name',
  job_group           VARCHAR(64)   DEFAULT 'DEFAULT'          COMMENT 'Task Group Name',
  invoke_target       VARCHAR(500)  NOT NULL                   COMMENT 'Invoke Target String',
  cron_expression     VARCHAR(255)  DEFAULT ''                 COMMENT 'Cron Execution Expression',
  misfire_policy      VARCHAR(20)   DEFAULT '3'                COMMENT 'Scheduled Execution Error Policy (1 Immediate Execution 2 Execute Once 3 Abandon Execution)',
  concurrent          CHAR(1)       DEFAULT '1'                COMMENT 'Whether to Execute Concurrently (0 Allow 1 Prohibit)',
  status              CHAR(1)       DEFAULT '0'                COMMENT 'Status (0 Normal 1 Paused)',
  create_by           VARCHAR(64)   DEFAULT ''                 COMMENT 'Creator',
  create_time         DATETIME                                 COMMENT 'Creation Time',
  update_by           VARCHAR(64)   DEFAULT ''                 COMMENT 'Updater',
  update_time         DATETIME                                 COMMENT 'Update Time',
  remark              VARCHAR(500)  DEFAULT ''                 COMMENT 'Remark Information',
  PRIMARY KEY (job_id, job_name, job_group)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=100 COMMENT = 'Scheduled Task Scheduling Table';

INSERT INTO sys_job VALUES(1, 'System Default (No Parameters)', 'DEFAULT', 'ryTask.ryNoParams',        '0/10 * * * * ?', '3', '1', '1', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_job VALUES(2, 'System Default (With Parameters)', 'DEFAULT', 'ryTask.ryParams(\'ry\')',  '0/15 * * * * ?', '3', '1', '1', 'admin', SYSDATE(), '', NULL, '');
INSERT INTO sys_job VALUES(3, 'System Default (Multiple Parameters)', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)',  '0/20 * * * * ?', '3', '1', '1', 'admin', SYSDATE(), '', NULL, '');

-- ----------------------------
-- 17. Scheduled Task Scheduling Log Table
-- ----------------------------
DROP TABLE IF EXISTS sys_job_log;
CREATE TABLE sys_job_log (
  job_log_id          BIGINT(20)     NOT NULL AUTO_INCREMENT    COMMENT 'Task Log ID',
  job_name            VARCHAR(64)    NOT NULL                   COMMENT 'Task Name',
  job_group           VARCHAR(64)    NOT NULL                   COMMENT 'Task Group Name',
  invoke_target       VARCHAR(500)   NOT NULL                   COMMENT 'Invoke Target String',
  job_message         VARCHAR(500)                              COMMENT 'Log Information',
  status              CHAR(1)        DEFAULT '0'                COMMENT 'Execution Status (0 Normal 1 Failure)',
  exception_info      VARCHAR(2000)  DEFAULT ''                 COMMENT 'Exception Information',
  create_time         DATETIME                                  COMMENT 'Creation Time',
  PRIMARY KEY (job_log_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT = 'Scheduled Task Scheduling Log Table';

-- ----------------------------
-- 18. Notice Announcement Table
-- ----------------------------
DROP TABLE IF EXISTS sys_notice;
CREATE TABLE sys_notice (
  notice_id         INT(4)          NOT NULL AUTO_INCREMENT    COMMENT 'Notice ID',
  notice_title      VARCHAR(200)     NOT NULL                   COMMENT 'Notice Title',
  notice_type       CHAR(1)         NOT NULL                   COMMENT 'Notice Type (1 Notice 2 Announcement)',
  notice_content    LONGBLOB        DEFAULT NULL               COMMENT 'Notice Content',
  status            CHAR(1)         DEFAULT '0'                COMMENT 'Notice Status (0 Normal 1 Closed)',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Creator',
  create_time       DATETIME                                   COMMENT 'Creation Time',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Updater',
  update_time       DATETIME                                   COMMENT 'Update Time',
  remark            VARCHAR(255)    DEFAULT NULL               COMMENT 'Remark',
  PRIMARY KEY (notice_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=10 COMMENT = 'Notice Announcement Table';

-- ----------------------------
-- Initialization - Notice Information Table Data
-- ----------------------------
INSERT INTO sys_notice VALUES('1', 'Warm Reminder: RuoYi New Version Released on 2018-07-01', '2', 'New Version Content', '0', 'admin', SYSDATE(), '', NULL, 'Administrator');
INSERT INTO sys_notice VALUES('2', 'Maintenance Notice: RuoYi System Maintenance at Midnight on 2018-07-01', '1', 'Maintenance Content',   '0', 'admin', SYSDATE(), '', NULL, 'Administrator');
INSERT INTO sys_notice VALUES('3', 'RuoYi Open Source Framework Introduction', '1', '<p><span style=\"color: rgb(230, 0, 0);\">Project Introduction</span></p><p><font color=\"#333333\">The RuoYi open source project is a backend scaffolding framework customized for enterprise users, providing a one-stop solution for enterprises to reduce development costs and improve development efficiency. It mainly includes user management, role management, department management, menu management, parameter management, dictionary management, </font><span style=\"color: rgb(51, 51, 51);\">position management</span><span style=\"color: rgb(51, 51, 51);\">, scheduled tasks</span><span style=\"color: rgb(51, 51, 51);\">, service monitoring, login logs, operation logs, code generation and other functions. It also supports multi-data sources, data permissions, internationalization, Redis caching, Docker deployment, slide verification code, third-party authentication login, distributed transactions, </span><font color=\"#333333\">distributed file storage</font><span style=\"color: rgb(51, 51, 51);\">, sharding processing and other technical features.</span></p><p><img src=\"https://foruda.gitee.com/images/1705030583977401651/5ed5db6a_1151004.png\" style=\"width: 64px;\"><br></p><p><span style=\"color: rgb(230, 0, 0);\">Official Website and Demo</span></p><p><span style=\"color: rgb(51, 51, 51);\">RuoYi Official Website: &nbsp;</span><a href=\"http://ruoyi.vip\" target=\"_blank\">http://ruoyi.vip</a><a href=\"http://ruoyi.vip\" target=\"_blank\"></a></p><p><span style=\"color: rgb(51, 51, 51);\">RuoYi Documentation Website: &nbsp;</span><a href=\"http://doc.ruoyi.vip\" target=\"_blank\">http://doc.ruoyi.vip</a><br></p><p><span style=\"color: rgb(51, 51, 51);\">Demo Address [Non-separated Version]: &nbsp;</span><a href=\"http://demo.ruoyi.vip\" target=\"_blank\">http://demo.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">Demo Address [Separated Version]: &nbsp;</span><a href=\"http://vue.ruoyi.vip\" target=\"_blank\">http://vue.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">Demo Address [Microservice Version]: &nbsp;</span><a href=\"http://cloud.ruoyi.vip\" target=\"_blank\">http://cloud.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">Demo Address [Mobile Version]: &nbsp;</span><a href=\"http://h5.ruoyi.vip\" target=\"_blank\">http://h5.ruoyi.vip</a></p><p><br style=\"color: rgb(48, 49, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12px;\"></p>', '0', 'admin', SYSDATE(), '', NULL, 'Administrator');

-- ----------------------------
-- 19. Code Generation Business Table
-- ----------------------------
DROP TABLE IF EXISTS gen_table;
CREATE TABLE gen_table (
  table_id             BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT 'Serial Number',
  table_name           VARCHAR(200)    DEFAULT ''                 COMMENT 'Table Name',
  table_comment        VARCHAR(500)    DEFAULT ''                 COMMENT 'Table Description',
  sub_table_name       VARCHAR(64)     DEFAULT NULL               COMMENT 'Sub-table Name',
  sub_table_fk_name    VARCHAR(64)     DEFAULT NULL               COMMENT 'Foreign Key Name of Sub-table',
  class_name           VARCHAR(100)    DEFAULT ''                 COMMENT 'Entity Class Name',
  tpl_category         VARCHAR(200)    DEFAULT 'crud'             COMMENT 'Template Used (crud Single Table Operation tree Tree Table Operation sub Master-Sub Table Operation)',
  package_name         VARCHAR(100)                               COMMENT 'Generated Package Path',
  module_name          VARCHAR(30)                                COMMENT 'Generated Module Name',
  business_name        VARCHAR(30)                                COMMENT 'Generated Business Name',
  function_name        VARCHAR(50)                                COMMENT 'Generated Function Name',
  function_author      VARCHAR(50)                                COMMENT 'Generated Function Author',
  form_col_num         INT(1)          DEFAULT 1                  COMMENT 'Form Layout (Single Column Double Column Triple Column)',
  gen_type             CHAR(1)         DEFAULT '0'                COMMENT 'Code Generation Method (0 Zip Compressed Package 1 Custom Path)',
  gen_path             VARCHAR(200)    DEFAULT '/'                COMMENT 'Generation Path (Default is Project Path if Not Filled)',
  options              VARCHAR(1000)                              COMMENT 'Other Generation Options',
  create_by            VARCHAR(64)     DEFAULT ''                 COMMENT 'Creator',
  create_time          DATETIME                                   COMMENT 'Creation Time',
  update_by            VARCHAR(64)     DEFAULT ''                 COMMENT 'Updater',
  update_time          DATETIME                                   COMMENT 'Update Time',
  remark               VARCHAR(500)    DEFAULT NULL               COMMENT 'Remark',
  PRIMARY KEY (table_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=1 COMMENT = 'Code Generation Business Table';

-- ----------------------------
-- 20. Code Generation Business Table Fields
-- ----------------------------
DROP TABLE IF EXISTS gen_table_column;
CREATE TABLE gen_table_column (
  column_id         BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT 'Serial Number',
  table_id          BIGINT(20)                                 COMMENT 'Belonging Table Serial Number',
  column_name       VARCHAR(200)                               COMMENT 'Column Name',
  column_comment    VARCHAR(500)                               COMMENT 'Column Description',
  column_type       VARCHAR(100)                               COMMENT 'Column Type',
  java_type         VARCHAR(500)                               COMMENT 'Java Type',
  java_field        VARCHAR(200)                               COMMENT 'Java Field Name',
  is_pk             CHAR(1)                                    COMMENT 'Whether Primary Key (1 Yes)',
  is_increment      CHAR(1)                                    COMMENT 'Whether Auto-increment (1 Yes)',
  is_required       CHAR(1)                                    COMMENT 'Whether Required (1 Yes)',
  is_insert         CHAR(1)                                    COMMENT 'Whether Insert Field (1 Yes)',
  is_edit           CHAR(1)                                    COMMENT 'Whether Edit Field (1 Yes)',
  is_list           CHAR(1)                                    COMMENT 'Whether List Field (1 Yes)',
  is_query          CHAR(1)                                    COMMENT 'Whether Query Field (1 Yes)',
  query_type        VARCHAR(200)    DEFAULT 'EQ'               COMMENT 'Query Method (Equals, Not Equals, Greater Than, Less Than, Range)',
  html_type         VARCHAR(200)                               COMMENT 'Display Type (Text Box, Text Area, Drop-down Box, Check Box, Radio Box, Date Picker)',
  dict_type         VARCHAR(200)    DEFAULT ''                 COMMENT 'Dictionary Type',
  sort              INT                                        COMMENT 'Sort Order',
  create_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Creator',
  create_time       DATETIME                                   COMMENT 'Creation Time',
  update_by         VARCHAR(64)     DEFAULT ''                 COMMENT 'Updater',
  update_time       DATETIME                                   COMMENT 'Update Time',
  PRIMARY KEY (column_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AUTO_INCREMENT=1 COMMENT = 'Code Generation Business Table Fields';