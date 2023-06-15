-- 원래는 sql 파일은 통상적으로 webapp 상단에 위치하는것이 좋다

-- 회원 테이블 생성
create table member(
id varchar2(10) PRIMARY KEY,
pass varchar2(10) NOT NULL,
name varchar2(30) NOT NULL,
regidate DATE DEFAULT SYSDATE NOT NULL
);

-- 게시판 테이블 생성
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

--comment 추가
comment on table board is '게시판';
comment on column board.num is '일련번호';
comment on column board.title is '제목';
comment on column board.content is '내용';
comment on column board.id is '작성자 아이디';
comment on column board.postdate is '작성일';
comment on column board.visitcount is '조회수';

comment on column member is '회원';
comment on column member.id is '아이디';
comment on column member.pass is '비밀번호';
comment on column member.name is '이름';
comment on column member.regidate is '생성일';

select to_char(sysdate,'yyyy-mm-dd') today from dual;

select sysdate today from dual;

select * from member
where id = 'musthave' and pass='1234';

select id, name, regidate from member;

insert into member values ('king', 1234, '받았죠', sysdate);

insert into member values ('KkIiNnGg', 1234, '받았겠죠?', sysdate);
commit;

select * from board order by num desc;

insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목2입니다', '내용2입니다', 'soNotEasy',
        sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목3입니다', '내용3입니다', 'soNotEasy',
        sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목4입니다', '내용4입니다', 'soNotEasy',
        sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목5입니다', '내용5입니다', 'soNotEasy',
        sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목6입니다', '내용6입니다', 'soNotEasy',
        sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목7입니다', '내용7입니다', 'soNotEasy',
        sysdate, 0);
        
commit;

select count(*)
from board
order by num desc;

select count(*) from board order by num desc;


select * 
from board
-- searchField = title
-- searchWord = title like '%제목%'
where title like '%다%'

order by num desc;

select * from board where title like '%다%' order by num desc;

select count(*) from board where title like '%7%' order by num desc;

insert into board  (num, title, content, id, postdate, visitcount) 
	values (seq_board_num.nextval
    
    , '제목1입니다' -- board --내가 매개변수로 받았잖아 화면에서 넘어온데이터를 박스에 담아주는거야
    , '내용1입니다' -- board 
    , 'test'      -- 아이디 , 세션으로 가지고 올수있습니다.
    
    , sysdate, 0);
    
insert into board  (num, title, content, id, postdate, visitcount) values (seq_board_num.nextval, '제목1입니다', '내용1입니다', 'test', sysdate, 0);

select * from board where num = 11;

update board
set visitcount = visitcount+1
where num=11;

commit;

DELETE FROM board WHERE num = 11;




update board set title='히히히', content='헤헤헤' where num=4;


select * from board;

insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '오늘만든', '따끈따끈한내용입니다', 'soNotEasy',
        sysdate, 0);
        
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '한번', '드셔보세요', 'soNotEasy',
        sysdate, 0);

commit;

-- 오늘 날짜와 같으면 시간을 보여주고
-- 아니면 날짜를 보여주세요!
select sysdate, postdate
from board;

-- 쿼리를 잘짜면 자바의 로직단이 가벼워집니다.

SELECT
    sysdate,
    CASE
        WHEN TRUNC(sysdate) = TRUNC(postdate) THEN TO_CHAR(postdate, 'HH24:MI:SS')
        ELSE TO_CHAR(postdate, 'YYYY-MM-DD')
    END AS formatted_postdate
    ,postdate
FROM
    board;

select * from board;

select num, title, content, id, postdate, visitcount, sysdate, postdate,
    trunc(sysdate), trunc(postdate)
    , decode (trunc(sysdate), trunc(postdate)
                    , to_char(postdate, 'hh24:mi:ss')
                    , to_char(postdate, 'yyyy-mm-dd')) postdate
from board;

-- 값이 여러개면 첫번째꺼 받아올껄? 확인은 안해봤어요
select num, title, content, id, postdate, visitcount, sysdate, postdate, trunc(sysdate), trunc(postdate) , decode (trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')) postdate from board;
-- 이렇게 수정해줍시다
select num, title, content, id, visitcount, decode (trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')) postdate from board;

select * from (
select num, title, content, id, visitcount, decode (trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')) postdate from board order by num desc);

-- 누락된 표현식
select rownum, * from (
select num, title, content, id, visitcount, decode (trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')) postdate from board order by num desc);

-- 테이블에 이름 달아주세요
select rownum, t.* from (
select num, title, content, id, visitcount, decode (trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')) postdate from board order by num desc)t;

-- 1부터 시작은 잘뜨는데? 그 이후 조회는 안됩니다
select rownum rn, t.* from (
select num, title, content, id, visitcount, decode (trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')) postdate from board order by num desc)t
where rownum between 1 and 10;

-- 조회가 안됩니다!! rownum은 1번이 붙어야됩니다 1번들어갔다가 나왔다가.. 조회가 안되서
select rownum rn, t.* from (
select num, title, content, id, visitcount, decode (trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')) postdate from board order by num desc)t
where rownum between 11 and 20;

-- rownum에 별칭을 주어 rn으로 조건을 줍시다!
select * from (
select rownum rn, t.* from (
select num, title, content, id, visitcount, decode (trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')) postdate from board order by num desc)t
)
where rn between 11 and 20;

update board set visitcount = visitcount+1 where num=27;

