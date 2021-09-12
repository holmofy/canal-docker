create table if not exists `user`
(
    `id`            bigint primary key auto_increment,
    `shop_name`     varchar(128) not null,
    `enabled`       tinyint default 1,
    `expire_time`   datetime     not null,
    `created`       datetime     not null,
    `last_modified` datetime     not null,
    unique key uk_sn (`shop_name`)
);

create table if not exists `sync_item`
(
    `id`            bigint primary key auto_increment,
    `version`       bigint       not null,
    `shop_id`       bigint       not null,
    `type`          varchar(32)  not null,
    `stop`          bit          not null,
    `progress`      varchar(128) not null,
    `start`         varchar(128) not null,
    `end`           varchar(128) not null,
    `step`          bigint       not null,
    `created`       datetime     not null,
    `last_modified` datetime     not null,
    unique key uk_sid_type (`shop_id`, `type`),
    index idx_type_st_pg (`type`, `stop`, `progress`)
);

create table if not exists `schedule_job`
(
    `id`            bigint primary key auto_increment,
    `version`       bigint       not null,
    `shop_id`       bigint       not null,
    `type`          varchar(32)  not null,
    `config`        text         not null,
    `status`        varchar(32)  not null,
    `error_count`   int default 0,
    `error_reason`  varchar(256) not null,
    `trigger_time`  datetime     not null,
    `created`       datetime     not null,
    `last_modified` datetime     not null,
    index idx_type_status (`type`, `status`)
);

create table if not exists `goods`
(
    `id`          bigint primary key auto_increment,
    `other_field` varchar(256) not null
    -- TODO:
)
