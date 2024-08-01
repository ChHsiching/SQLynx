-- data_source definition 1
CREATE TABLE "data_source"
(
    ds_name        varchar,
    nick_name	   varchar,
    type           varchar,
    ip             varchar,
    port           INTEGER,
    conn_path      varchar,
    service_name   varchar,
    service_type   INTEGER,
    db_name        varchar,
    schema_name    varchar,
    username       varchar,
    password       varchar,
    create_time    bigint,
    create_timestamp timestamp,
    update_time    bigint,
    update_timestamp timestamp,
    select_version varchar,
    select_jar     varchar,
    select_class   varchar,
    authenticate_type      integer,
    principal      varchar,
    kerberos_path       varchar,
    krb5_path      varchar,
    conn_pool      integer default 0,
    conn_string    varchar,
    db_version varchar default '-1',
    properties varchar,
    e_int1 INTEGER,
	e_int2 INTEGER,
	e_int3 INTEGER,
	e_int4 INTEGER,
	e_int5 INTEGER,
	e_varchar1 VARCHAR,
	e_varchar2 VARCHAR,
	e_varchar3 VARCHAR,
	e_varchar4 VARCHAR,
	e_varchar5 VARCHAR,
	PRIMARY KEY ("ds_name"));


-- execute_sql definition 2
CREATE TABLE execute_sql
(
    id            varchar      not null
    primary key,
    user_id       integer      not null,
    excute_sql    varchar      not null,
    create_time   bigint not null ,
    create_timestamp timestamp not null ,
    execute_state smallint     not null,
    execute_time  integer,
    ds_name VARCHAR,
    db_name VARCHAR,
    schema_name varchar,
    tables_name varchar,
    operate_status integer,
	e_int1 INTEGER,
	e_int2 INTEGER,
	e_int3 INTEGER,
	e_int4 INTEGER,
	e_int5 INTEGER,
	e_varchar1 VARCHAR,
	e_varchar2 VARCHAR,
	e_varchar3 VARCHAR,
	e_varchar4 VARCHAR,
	e_varchar5 VARCHAR);


-- record_data_export definition 3
CREATE TABLE record_data_export
(
    id              varchar            not null
    primary key,
    ds_name         varchar,
    db_name         varchar,
    schema_name     varchar,
    sql_string      varchar,
    start_time      bigint,
    start_timestamp   timestamp,
    sql_execute_time  integer,
    response_time   integer,
    row_num         bigint,
    execute_status   integer,
    userid          integer,
    file_name       varchar,
    file_format        varchar,
    file_coding       varchar,
    file_properties        varchar,
    export_type       varchar,
    comment        varchar,
    e_int1 INTEGER,
	e_int2 INTEGER,
	e_int3 INTEGER,
	e_int4 INTEGER,
	e_int5 INTEGER,
	e_varchar1 VARCHAR,
	e_varchar2 VARCHAR,
	e_varchar3 VARCHAR,
	e_varchar4 VARCHAR,
	e_varchar5 VARCHAR);


-- sql_script definition 4
CREATE TABLE sql_script (
    id              integer,
    ds_name         varchar,
    db_name         varchar,
    schema_name     varchar,
	filename        varchar,
	userid          integer NOT NULL,
	querystring     varchar,
	create_time       bigint,
	create_timestamp timestamp,
	e_int1 INTEGER,
	e_int2 INTEGER,
	e_int3 INTEGER,
	e_int4 INTEGER,
	e_int5 INTEGER,
	e_varchar1 VARCHAR,
	e_varchar2 VARCHAR,
	e_varchar3 VARCHAR,
	e_varchar4 VARCHAR,
	e_varchar5 VARCHAR,
	PRIMARY KEY ("id") );

-- system_config definition 5
CREATE TABLE system_config (
	id integer primary key,
	name VARCHAR,
	value VARCHAR,
	description VARCHAR,
	create_time bigint,
	create_timestamp TIMESTAMP,
	create_by VARCHAR,
	update_time bigint,
	update_timestamp TIMESTAMP,
	update_by VARCHAR,
	e_int1 INTEGER,
	e_int2 INTEGER,
	e_int3 INTEGER,
	e_int4 INTEGER,
	e_int5 INTEGER,
	e_varchar1 VARCHAR,
	e_varchar2 VARCHAR,
	e_varchar3 VARCHAR,
	e_varchar4 VARCHAR,
	e_varchar5 VARCHAR);


-- user_login definition 6
CREATE TABLE user_login
(
    id           integer primary key,
    name         varchar,
    sex          varchar,
    password     varchar,
    position     varchar,
    tel          varchar,
    email        varchar,
    role         varchar,
    valid_state integer default 1,
    source       integer default 0,
    comment      varchar,
    real_name    varchar,
    employee_no  varchar,
    create_time  bigint,
    create_timestamp TIMESTAMP,
    create_by    varchar,
    update_time  bigint,
    update_timestamp TIMESTAMP,
    update_by    varchar,
    e_int1 INTEGER,
	e_int2 INTEGER,
	e_int3 INTEGER,
	e_int4 INTEGER,
	e_int5 INTEGER,
	e_varchar1 VARCHAR,
	e_varchar2 VARCHAR,
	e_varchar3 VARCHAR,
	e_varchar4 VARCHAR,
	e_varchar5 VARCHAR);


-- user_login_log definition 7
CREATE TABLE audit_log ( id integer primary key,
	userid integer,
	username varchar,
	event_type varchar,
	event_desc varchar,
	operator_ip varchar,
	browser_name varchar,
	create_time bigint,
	create_timestamp TIMESTAMP,
	operator_status integer,
	fail_reason varchar,
	comment varchar ,
	e_int1 INTEGER,
	e_int2 INTEGER,
	e_int3 INTEGER,
	e_int4 INTEGER,
	e_int5 INTEGER,
	e_varchar1 VARCHAR,
	e_varchar2 VARCHAR,
	e_varchar3 VARCHAR,
	e_varchar4 VARCHAR,
	e_varchar5 VARCHAR);

-- code_template 8
CREATE TABLE code_template
(
    id          integer primary key,
    tab_trigger varchar not null,
    content     varchar,
    meta        varchar,
    tag         varchar,
    db_type     varchar,
    create_time bigint,
    create_timestamp TIMESTAMP,
    create_by   varchar,
    update_time bigint,
    update_timestamp TIMESTAMP,
    update_by   varchar,
    e_int1 INTEGER,
    e_int2 INTEGER,
    e_int3 INTEGER,
    e_int4 INTEGER,
    e_int5 INTEGER,
    e_varchar1 VARCHAR,
    e_varchar2 VARCHAR,
    e_varchar3 VARCHAR,
    e_varchar4 VARCHAR,
    e_varchar5 VARCHAR);

-- permission_group definition 9
CREATE TABLE "permission_group" (
	"group_id"   varchar NOT NULL primary key,
	"group_name" varchar,
	"description" varchar,
	"create_time" bigint,
	"create_timestamp" TIMESTAMP,
	"create_by" varchar,
	"update_time" bigint,
	"update_timestamp" TIMESTAMP,
	"update_by" varchar,
	e_int1 INTEGER,
    e_int2 INTEGER,
    e_int3 INTEGER,
    e_int4 INTEGER,
    e_int5 INTEGER,
    e_varchar1 VARCHAR,
    e_varchar2 VARCHAR,
    e_varchar3 VARCHAR,
    e_varchar4 VARCHAR,
    e_varchar5 VARCHAR
);

-- permission_group_user_ref definition 10
CREATE TABLE "permission_group_user_ref" (
	"group_id" varchar NOT NULL,
	"user_id" integer NOT NULL,
	"create_time" bigint,
	"create_timestamp" TIMESTAMP,
	"create_by" varchar,
	"update_time" bigint,
	"update_timestamp" TIMESTAMP,
	"update_by" varchar,
	e_int1 INTEGER,
    e_int2 INTEGER,
    e_int3 INTEGER,
    e_int4 INTEGER,
    e_int5 INTEGER,
    e_varchar1 VARCHAR,
    e_varchar2 VARCHAR,
    e_varchar3 VARCHAR,
    e_varchar4 VARCHAR,
    e_varchar5 VARCHAR
);


-- permission_group_ds_ref definition 11
CREATE TABLE permission_group_ds_ref
(
    group_id        varchar,
    ds_name         varchar,
    db_name         varchar,
    create_time     bigint,
    create_timestamp TIMESTAMP,
    create_by       varchar,
    update_time     bigint,
    update_timestamp TIMESTAMP,
    update_by       varchar,
    e_int1          INTEGER,
    e_int2          INTEGER,
    e_int3          INTEGER,
    e_int4          INTEGER,
    e_int5          INTEGER,
    e_varchar1      VARCHAR,
    e_varchar2      VARCHAR,
    e_varchar3      VARCHAR,
    e_varchar4      VARCHAR,
    e_varchar5      VARCHAR
);

-- @2.1.0
-- 申请表 12
create table apply_permission
(
    apply_id          VARCHAR PRIMARY KEY,
    ds_name           VARCHAR,
    db_name           varchar,
    schema_name       varchar,
    table_name        varchar,
    sql_applied       varchar,
    operation_applied varchar,
    apply_user_id     INTEGER,
    apply_user_name   VARCHAR,
    permission_type   INTEGER,
    status            INTEGER,
    comment           VARCHAR,
    valid_time_start  bigint,
    valid_time_end    bigint,
    valid_times       INTEGER,
    create_time       bigint,
    create_by         VARCHAR,
    update_time       bigint,
    update_by         VARCHAR,
    e_int1            INTEGER,
    e_int2            INTEGER,
    e_int3            INTEGER,
    e_int4            INTEGER,
    e_int5            INTEGER,
    e_varchar1        VARCHAR,
    e_varchar2        VARCHAR,
    e_varchar3        VARCHAR,
    e_varchar4        VARCHAR,
    e_varchar5        VARCHAR
);

-- 申请表——权限关系表 13
create table apply_rule_relation
(
    relation_id VARCHAR PRIMARY KEY,
    apply_id    VARCHAR,
    rule_id     VARCHAR,
    valid       INTEGER,
    call_times  INTEGER,
    create_time bigint,
    create_by   VARCHAR,
    update_time bigint,
    update_by   VARCHAR,
    e_int1      INTEGER,
    e_int2      INTEGER,
    e_int3      INTEGER,
    e_int4      INTEGER,
    e_int5      INTEGER,
    e_varchar1  VARCHAR,
    e_varchar2  VARCHAR,
    e_varchar3  VARCHAR,
    e_varchar4  VARCHAR,
    e_varchar5  VARCHAR
);


-- 审批状态表 14
create table approval_status
(
    approval_status_id VARCHAR PRIMARY KEY,
    apply_id           VARCHAR,
    approve_level      INTEGER,
    approve_user_id    INTEGER,
    approve_user_name  VARCHAR,
    status             INTEGER,
    comment            VARCHAR,
    create_time        bigint,
    create_by          VARCHAR,
    update_time        bigint,
    update_by          VARCHAR,
    e_int1             INTEGER,
    e_int2             INTEGER,
    e_int3             INTEGER,
    e_int4             INTEGER,
    e_int5             INTEGER,
    e_varchar1         VARCHAR,
    e_varchar2         VARCHAR,
    e_varchar3         VARCHAR,
    e_varchar4         VARCHAR,
    e_varchar5         VARCHAR
);


-- 审批流配置表（审批组表）15
create table approval_flow
(
    approval_flow_id VARCHAR PRIMARY KEY,
    name             VARCHAR,
    approval_nodes   VARCHAR,
    comment          VARCHAR,
    flow_graph_data VARCHAR,
    create_time      bigint,
    create_by        VARCHAR,
    update_time      bigint,
    update_by        VARCHAR,
    e_int1           INTEGER,
    e_int2           INTEGER,
    e_int3           INTEGER,
    e_int4           INTEGER,
    e_int5           INTEGER,
    e_varchar1       VARCHAR,
    e_varchar2       VARCHAR,
    e_varchar3       VARCHAR,
    e_varchar4       VARCHAR,
    e_varchar5       VARCHAR
);

-- 数据源和审批组关系表 16
create table ds_approval_flow_relation
(
    relation_id       VARCHAR PRIMARY KEY,
    approval_flow_id  VARCHAR,
    ds_name           VARCHAR UNIQUE,
    db_name           varchar,
    schema_name       varchar,
    table_name        varchar,
    sql_applied       varchar,
    operation_applied varchar,
    create_time       bigint,
    create_by         VARCHAR,
    update_time       bigint,
    update_by         VARCHAR,
    e_int1            INTEGER,
    e_int2            INTEGER,
    e_int3            INTEGER,
    e_int4            INTEGER,
    e_int5            INTEGER,
    e_varchar1        VARCHAR,
    e_varchar2        VARCHAR,
    e_varchar3        VARCHAR,
    e_varchar4        VARCHAR,
    e_varchar5        VARCHAR
);


-- 权限自定义配置表 17
create table permission_custom_rule
(
    rule_id          VARCHAR PRIMARY KEY,
    rule_name        VARCHAR UNIQUE,
    rule_detail      VARCHAR,
    comment          VARCHAR,
    risk_level       varchar,
    valid_time_start bigint,
    valid_time_end   bigint,
    valid_times      INTEGER,
    create_time      bigint,
    create_by        VARCHAR,
    update_time      bigint,
    update_by        VARCHAR,
    e_int1           INTEGER,
    e_int2           INTEGER,
    e_int3           INTEGER,
    e_int4           INTEGER,
    e_int5           INTEGER,
    e_varchar1       VARCHAR,
    e_varchar2       VARCHAR,
    e_varchar3       VARCHAR,
    e_varchar4       VARCHAR,
    e_varchar5       VARCHAR
);

-- 数据库类型和权限自定义配置关系表 18
create table db_type_rule_relation
(
    relation_id VARCHAR PRIMARY KEY,
    rule_id     VARCHAR,
    db_type     VARCHAR,
    create_time bigint,
    create_by   VARCHAR,
    update_time bigint,
    update_by   VARCHAR,
    e_int1      INTEGER,
    e_int2      INTEGER,
    e_int3      INTEGER,
    e_int4      INTEGER,
    e_int5      INTEGER,
    e_varchar1  VARCHAR,
    e_varchar2  VARCHAR,
    e_varchar3  VARCHAR,
    e_varchar4  VARCHAR,
    e_varchar5  VARCHAR
);

-- add for data source mange 19-29
ALTER TABLE "data_source" ADD "create_by" varchar;
ALTER TABLE "data_source" ADD "update_by" varchar;
ALTER TABLE "data_source" ADD "manage_by" varchar;
update data_source set create_by='sqlynx' where create_by is null;
update data_source set manage_by='sqlynx' where manage_by is null;

ALTER TABLE "permission_group_ds_ref" ADD "permission_type" INTEGER;
ALTER TABLE "permission_group_ds_ref" ADD "permission_rule_ids" VARCHAR;

ALTER TABLE "record_data_export" ADD "ip" VARCHAR;
ALTER TABLE "record_data_export" ADD "error_log" VARCHAR;

ALTER TABLE "execute_sql" ADD "ip" VARCHAR;
ALTER TABLE "execute_sql" ADD "error_log" VARCHAR;

-- add for owner and folder 20231031 30-33

ALTER TABLE "user_login" ADD "manage_by" varchar;
update user_login set manage_by=create_by where manage_by is null;

ALTER TABLE "permission_group" ADD "manage_by" varchar;
update permission_group set manage_by=create_by where manage_by is null;

-- folder_datasource definition 34
CREATE TABLE folder_datasource
(
    folder_id       varchar  not null primary key,
    folder_name         varchar,
    folder_description  varchar,
    create_by         varchar,
    create_time       bigint,
    create_timestamp  timestamp,
    update_by         varchar,
    update_time       bigint,
    update_timestamp  timestamp,
    comment           varchar,
    e_int1 INTEGER,
    e_int2 INTEGER,
    e_int3 INTEGER,
    e_int4 INTEGER,
    e_int5 INTEGER,
    e_varchar1 VARCHAR,
    e_varchar2 VARCHAR,
    e_varchar3 VARCHAR,
    e_varchar4 VARCHAR,
    e_varchar5 VARCHAR);

-- folder_datasource_user_ref definition 35
CREATE TABLE folder_datasource_user_ref
(
    id       varchar  not null primary key,
    folder_id       varchar,
    user_id         integer,
    ds_name         varchar,
    create_by         varchar,
    create_time       bigint,
    create_timestamp  timestamp,
    update_by         varchar,
    update_time       bigint,
    update_timestamp  timestamp,
    e_int1 INTEGER,
    e_int2 INTEGER,
    e_int3 INTEGER,
    e_int4 INTEGER,
    e_int5 INTEGER,
    e_varchar1 VARCHAR,
    e_varchar2 VARCHAR,
    e_varchar3 VARCHAR,
    e_varchar4 VARCHAR,
    e_varchar5 VARCHAR);

ALTER TABLE "data_source" ADD "mode" varchar;
update data_source set mode='edit' where mode is null;

-- add for error code and operate type 20231031 38-40
ALTER TABLE "record_data_export" ADD "error_code" integer;

ALTER TABLE "execute_sql" ADD "error_code" integer;
ALTER TABLE "execute_sql" ADD "operate_type" varchar(100);

-- add for permission type error 20231101 41-42
ALTER TABLE "execute_sql" ADD "error_label" varchar(100);
ALTER TABLE "record_data_export" ADD "error_label" varchar(100);

-- 3.0.0 remove no need table
drop table ds_approval_flow_relation;
drop table approval_status;
drop table approval_flow;

update user_login set role='normal_user' where role="普通用户";
update user_login set role='admin_user' where role="管理员";

-- 3.5.0 change to sqlynx
update user_login set name='sqlynx' where name='maicong';
update folder_datasource_user_ref set create_by='sqlynx' where create_by='maicong';
update folder_datasource set create_by='sqlynx' where create_by='maicong';


