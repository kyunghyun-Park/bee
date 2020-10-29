create table category
(
  cate_num  int         not null
    primary key,
  cate_name varchar(30) not null
);

create table member
(
  sq       int auto_increment
    primary key,
  id       varchar(50)          not null,
  pwd      varchar(200)         not null,
  nickname varchar(80)          not null,
  email    varchar(100)         not null,
  lgn_fl   tinyint(1) default 0 not null,
  image    longblob             null
);

create table board
(
  b_sq      int auto_increment
    primary key,
  title     varchar(100)                       not null,
  content   text                               null,
  hit       int      default 0                 null,
  writeDate datetime default CURRENT_TIMESTAMP null,
  m_sq      int                                null,
  c_sq      int                                null,
  rec       int                                null,
  constraint board_category_sq_fk
    foreign key (c_sq) references category (cate_num),
  constraint board_member_sq_fk
    foreign key (m_sq) references member (sq)
      on update cascade on delete set null
);

create table board_review
(
  b_sq      int auto_increment
    primary key,
  content   text                               null,
  writeDate datetime default CURRENT_TIMESTAMP null,
  m_sq      int                                null,
  constraint boardrv_member_sq_fk
    foreign key (m_sq) references member (sq)
      on update cascade on delete set null
);

create table comment
(
  cm_sq     int auto_increment
    primary key,
  b_sq      int                                not null,
  m_sq      int                                null,
  writeDate datetime default CURRENT_TIMESTAMP null,
  parent_sq int                                null,
  content   text                               not null,
  constraint comment_board_sq_fk
    foreign key (b_sq) references board (b_sq)
      on update cascade on delete cascade,
  constraint comment_member_sq_fk
    foreign key (m_sq) references member (sq)
      on update cascade on delete cascade
);

create table heart
(
  b_sq int         null,
  m_id varchar(50) null,
  constraint rec_board_sq_fk
    foreign key (b_sq) references board (b_sq)
);


