CREATE TABLE rule (
id BIGINT PRIMARY KEY,
rule_name varchar(200) not null COMMENT '规则名称' unique ,
own_user_id BIGINT not null COMMENT '所有者(创建者)的user_id',
update_user_id BIGINT not null COMMENT '当前是最新状态，该状态操作者的user_id',
is_delete INT DEFAULT 0 NOT NULL COMMENT '逻辑删除字段  0-未删除 1-删除',
create_date DATETIME  DEFAULT CURRENT_TIMESTAMP NOT NULL,
update_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
delete_date DATETIME,
rule_xml TEXT COMMENT '规则的xml文件',
version int DEFAULT 0 not null
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '规则表,要用Redis实现只有一个终端能编辑';

create table rule_log(
rule_id BIGINT not null,
op_user_id BIGINT not null COMMENT '操作者的user_id',
rule_name varchar(200) not null COMMENT '规则名称',
version int DEFAULT 0 not null,
rule_xml TEXT COMMENT '规则的xml文件'
PRIMARY KEY(rule_id,version)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '规则提交记录';

create table projects(

)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '项目，项目下有包、规则、变量、规则流、函数，不同项目下不共通，按项目授予权限';

CREATE TABLE packages (
package_type varchar(200) not null comment '包类型  folder中有规则和规则流   package变量、函数'
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '包，包中有规则、变量、规则流、函数';

create table functions(
fun_name varchar(200)  not null COMMENT '函数名称',
scope varchar(200) default 'private' not null COMMENT '作用域 private只在当前项目可用  public所有项目可用',
parameter TEXT COMMENT '参数列表 例如： {'str':'String','flag':'boolean'} '
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '函数';

--这里所有的函数都是用二元操作符(即我们不给对象定义方法)
--变量的类型暂时包括：
    boolean
    int
    String
    class
    double


