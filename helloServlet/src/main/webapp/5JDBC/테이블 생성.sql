create table member(
id varchar2(10) PRIMARY KEY,
pass varchar2(10) NOT NULL,
name varchar2(30) NOT NULL,
regidate DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE board (
num NUMBER PRIMARY KEY,
title varchar2(200) not null,
content varchar2(2000) not null,
id varchar2(10) not null,
postdate date default sysdate not null,
visitcount number(6)
);

-- 외래키 추가
alter table board
add constraint board_mem_fk foreign key (id)
references member (id);

-- 시퀀스 생성
create sequence seq_board_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle 
    nocache; 

-- 게시판 테이블 생성

-- 더미데이터 입력
insert into member values ('musthave', 1234, '익준이', sysdate);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목1입니다', '내용1입니다', 'musthave',
sysdate, 0);


insert into member (id, pass, name) values ('soNotEasy', '1234', '아따어렵다');
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목2입니다', '내용2입니다', 'soNotEasy',
        sysdate, 0);
        
commit;


