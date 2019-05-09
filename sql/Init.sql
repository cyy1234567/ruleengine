CREATE TABLE rule (
id BIGINT PRIMARY KEY,
rule_name varchar(200) not null COMMENT '规则名称' unique ,
is_delete INT DEFAULT 0 NOT NULL COMMENT '逻辑删除字段  0-未删除 1-删除',
create_date DATETIME  DEFAULT CURRENT_TIMESTAMP NOT NULL,
update_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
delete_date DATETIME,
rule_xml TEXT COMMENT '规则的xml文件',
version int DEFAULT 0 not null
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '规则表,要用Redis实现只有一个终端能编辑';

create table rule_log(
rule_id BIGINT not null,
rule_name varchar(200) not null COMMENT '规则名称',
version int DEFAULT 0 not null,
rule_xml TEXT COMMENT '规则的xml文件'
PRIMARY KEY(rule_id,version)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '规则提交记录';