---- 계정 생성
--CREATE USER heal IDENTIFIED BY heal;
--GRANT CONNECT, RESOURCE TO heal;

-- 날짜 및 시간 설정
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'HH24:MI';

-- 모든 테이블 리셋
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE N_REPLY CASCADE CONSTRAINTS;
DROP TABLE B_REPLY CASCADE CONSTRAINTS;
DROP TABLE BLAME CASCADE CONSTRAINTS;  

-- 모든 시퀀스 리셋
DROP SEQUENCE SEQ_MID;
DROP SEQUENCE SEQ_NID;
DROP SEQUENCE SEQ_BID;
DROP SEQUENCE SEQ_BRID;
DROP SEQUENCE SEQ_NRID;
DROP SEQUENCE SEQ_BLID;

------------------------------------------------------------------------------------------------------------------- MEMBER 생성
CREATE TABLE MEMBER(
MID              NUMBER NOT NULL,
ID               VARCHAR2(50) NOT NULL,   
PWD                 VARCHAR2(200) NOT NULL,
NAME           VARCHAR2(50) NOT NULL,
NICK          VARCHAR2(100) NOT NULL,
BIRTHDAY            DATE NOT NULL,
GENDER      VARCHAR2(10) NOT NULL,
PHONE          VARCHAR2(100) NOT NULL,
EMAIL                VARCHAR2(200),
ADDRESS           VARCHAR2(500) NOT NULL,
JOIN_DATE           DATE  DEFAULT SYSDATE,
ENROLL_DATE       DATE  DEFAULT SYSDATE,
USER_NOW   VARCHAR2(10) DEFAULT 'Y' NOT NULL,
USER_LV               VARCHAR2(100) DEFAULT 'MEMBER' NOT NULL,
ETC                    VARCHAR2(4000),
CONSTRAINT PK_NICK PRIMARY KEY(NICK)
);
 
-------------------------------------------------------------------------------------------------------------------  MEMBER 컬러명 지정
COMMENT ON COLUMN MEMBER.MID IS '회원번호';
COMMENT ON COLUMN MEMBER.ID IS '아이디';
COMMENT ON COLUMN MEMBER.PWD   IS '비밀번호';
COMMENT ON COLUMN MEMBER.NAME   IS '이름';
COMMENT ON COLUMN MEMBER.NICK   IS '닉네임';
COMMENT ON COLUMN MEMBER.BIRTHDAY   IS '생년월일';
COMMENT ON COLUMN MEMBER.GENDER   IS '성별';
COMMENT ON COLUMN MEMBER.PHONE   IS '전화번호';
COMMENT ON COLUMN MEMBER.EMAIL   IS '이메일';
COMMENT ON COLUMN MEMBER.ADDRESS   IS '주소';
COMMENT ON COLUMN MEMBER.JOIN_DATE   IS '가입일';
COMMENT ON COLUMN MEMBER.ENROLL_DATE   IS '정보 수정일';
COMMENT ON COLUMN MEMBER.USER_NOW   IS '상태';
COMMENT ON COLUMN MEMBER.USER_LV IS '등급';
COMMENT ON COLUMN MEMBER.ETC IS '내용';

------------------------------------------------------------------------------------------------------------------- MEMBER 시퀀스
CREATE SEQUENCE SEQ_MID
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(MEMBER)
INSERT INTO MEMBER VALUES(SEQ_MID.NEXTVAL, 'TEST1', '1234', '테스트이름1', '테스트닉네임1', '89/10/01', '남자', '010-1234-5555', 'asdas@gmail.com', '강원도 고성군 간성읍', '21/01/01', NULL, 'Y', 'MEMBER', null);
INSERT INTO MEMBER VALUES(SEQ_MID.NEXTVAL, 'TEST2', '1234', '테스트이름2', '테스트닉네임2', '88/10/02', '여자', '010-1234-5555', 'aFDas@gmail.com', '경기도 고성군 간성읍', '21/01/01', NULL, 'Y', 'MEMBER', null);
INSERT INTO MEMBER VALUES(SEQ_MID.NEXTVAL, 'TEST3', '1234', '테스트이름3', '테스트닉네임3', '87/10/03', '남자', '010-1234-5555', 'ASDas@gmail.com', '충남도 고성군 간성읍', '21/01/01', NULL, 'Y', 'MEMBER', null);
INSERT INTO MEMBER VALUES(SEQ_MID.NEXTVAL, 'TEST4', '1234', '테스트이름4', '테스트닉네임4', '86/10/04', '여자', '010-1234-5555', 'asFGs@gmail.com', '경북도 고성군 간성읍', '21/01/01', NULL, 'Y', 'MEMBER', null);


------------------------------------------------------------------------------------------------------------------- NOTICE(공지사항) 생성
CREATE TABLE NOTICE(
NID      NUMBER,
NTYPE      VARCHAR2(100) DEFAULT '공지사항', 
NUSER      VARCHAR2(50) NOT NULL,
NTITLE      VARCHAR2(500) NOT NULL,
NCONTENT   VARCHAR2(4000),
N_FILE        VARCHAR2(500),
N_RFILE      VARCHAR2(500),
N_DATE      DATE,
N_MODFIY_DATE   DATE,
NCOUNT      NUMBER DEFAULT 0,
NSTATUS      CHAR(2) DEFAULT 'Y',
CONSTRAINT PK_NID PRIMARY KEY(NID),
CONSTRAINT FK_NUSER FOREIGN KEY (NUSER) REFERENCES MEMBER(NICK) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- NOTICE 컬러명 지정
COMMENT ON COLUMN NOTICE.NID IS '공지사항글 번호';
COMMENT ON COLUMN NOTICE.NTYPE IS '공지사항글 구분(1. 공지사항, 2. 이벤트, 3.긴급, 4. 필독)';
COMMENT ON COLUMN NOTICE.NUSER IS '공지사항 작성자';
COMMENT ON COLUMN NOTICE.NTITLE IS '공지사항 제목';
COMMENT ON COLUMN NOTICE.NCONTENT IS '공지사항 내용';
COMMENT ON COLUMN NOTICE.N_FILE IS '공지사항 원래 첨부파일 명';
COMMENT ON COLUMN NOTICE.N_RFILE IS '공지사항 바뀐 첨부파일 명';
COMMENT ON COLUMN NOTICE.N_DATE IS '공지사항 날짜';
COMMENT ON COLUMN NOTICE.N_MODFIY_DATE IS '공지사항 수정날짜';
COMMENT ON COLUMN NOTICE.NCOUNT IS '공지사항 조회수';
COMMENT ON COLUMN NOTICE.NSTATUS IS '공지사항 상태';

------------------------------------------------------------------------------------------------------------------- NOTICE 시퀀스
CREATE SEQUENCE SEQ_NID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(NOTICE)
INSERT INTO NOTICE VALUES(SEQ_NID.NEXTVAL, DEFAULT, '테스트닉네임1', '공지사항 테스트', '공지사항 테스트', NULL, NULL, '21/01/01', NULL, DEFAULT, DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NID.NEXTVAL, '이벤트', '테스트닉네임1', '이벤트 테스트', '이벤트 테스트 입니다.', NULL, NULL, '21/01/01', NULL, DEFAULT, DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NID.NEXTVAL, '긴급', '테스트닉네임1', '긴급 테스트', '코로나 예방수칙을 준수해주세요', NULL, NULL, '21/01/01', NULL, DEFAULT, DEFAULT);

------------------------------------------------------------------------------------------------------------------- BOARD(자유게시판) 생성
CREATE TABLE BOARD(
BID         NUMBER,
BTYPE         VARCHAR2(50) DEFAULT '방문후기', 
BUSER         VARCHAR2(50) NOT NULL,
BTITLE         VARCHAR2(500) NOT NULL,
BCONTENT      VARCHAR2(4000),
B_FILE         VARCHAR2(500),
B_RFILE         VARCHAR2(500),
B_DATE         DATE,
B_MODFIY_DATE      DATE,
BCOUNT         NUMBER DEFAULT 0,
BSTATUS         CHAR(2) DEFAULT 'Y',
CONSTRAINT PK_BID PRIMARY KEY(BID),
CONSTRAINT FK_BUSER FOREIGN KEY (BUSER) REFERENCES MEMBER(NICK) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- BOARD 컬러명 지정
COMMENT ON COLUMN BOARD.BID IS '게시판 글 번호';
COMMENT ON COLUMN BOARD.BTYPE IS '게시판 글 구분(1. 방문후기, 2. 건의사항, 3. 일반게시글, 4. 참고게시글)';
COMMENT ON COLUMN BOARD.BUSER IS '게시판 작성자';
COMMENT ON COLUMN BOARD.BTITLE IS '게시판 제목';
COMMENT ON COLUMN BOARD.BCONTENT IS '게시판 내용';
COMMENT ON COLUMN BOARD.B_FILE IS '게시판 원래 첨부파일 명';
COMMENT ON COLUMN BOARD.B_RFILE IS '게시판 바뀐 첨부파일 명';
COMMENT ON COLUMN BOARD.B_DATE IS '게시판 날짜';
COMMENT ON COLUMN BOARD.B_MODFIY_DATE IS '게시판 수정날짜';
COMMENT ON COLUMN BOARD.BCOUNT IS '게시판 조회수';
COMMENT ON COLUMN BOARD.BSTATUS IS '게시판 상태';

------------------------------------------------------------------------------------------------------------------- BOARD 시퀀스
CREATE SEQUENCE SEQ_BID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(BOARD)
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, DEFAULT, '테스트닉네임1', '게시판 테스트 입니다.', '게시판 테스트', NULL, NULL, '21/01/01', NULL, DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, '건의사항', '테스트닉네임1', '게시판 테스트 입니다.', '게시판 테스트 입니다.', NULL, NULL, '21/01/01', NULL, DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, '참고게시글', '테스트닉네임1', '게시판 테스트 입니다.',  '게시판 테스트 입니다.', NULL, NULL, '21/01/01', NULL, DEFAULT, DEFAULT);

------------------------------------------------------------------------------------------------------------------- B_REPLY(자유게시판) 생성
CREATE TABLE B_REPLY(
  BRID                  NUMBER,
  BRCONTENT          VARCHAR2(400),
  B_REF_BID       NUMBER,
  BRUSER             VARCHAR2(50) NOT NULL,
  BR_DATE               DATE,
  BR_MODIFY_DATE   DATE,
  BR_STATUS            CHAR(1) DEFAULT 'Y',
  CONSTRAINT PK_BRID PRIMARY KEY(BRID),
CONSTRAINT FK_BRUSER FOREIGN KEY (BRUSER) REFERENCES MEMBER(NICK) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- B_REPLY 컬러명 지정
COMMENT ON COLUMN B_REPLY.BRID IS '게시글 댓글 번호';
COMMENT ON COLUMN B_REPLY.BRCONTENT IS '게시글 댓글 내용';
COMMENT ON COLUMN B_REPLY.B_REF_BID IS '참조공지글번호';
COMMENT ON COLUMN B_REPLY.BRUSER IS '게시글 댓글 작성자';
COMMENT ON COLUMN B_REPLY.BR_DATE IS '게시글 댓글 작성 일자';
COMMENT ON COLUMN B_REPLY.BR_MODIFY_DATE IS '게시글 댓글 수정 일자';
COMMENT ON COLUMN B_REPLY.BR_STATUS IS '게시글 댓글 상태';

------------------------------------------------------------------------------------------------------------------- B_REPLY 시퀀스
CREATE SEQUENCE SEQ_BRID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(B_REPLY)
INSERT INTO B_REPLY VALUES(SEQ_BRID.NEXTVAL, '게시글 첫번째 댓글입니다.', '1', '테스트닉네임1', '21/01/02', NULL, DEFAULT);
INSERT INTO B_REPLY VALUES(SEQ_BRID.NEXTVAL, '게시글 두번째 댓글입니다.', '1', '테스트닉네임2', '21/01/02', NULL, DEFAULT);
INSERT INTO B_REPLY VALUES(SEQ_BRID.NEXTVAL, '게시글 세번째 댓글입니다.', '1', '테스트닉네임3', '21/01/02', NULL, DEFAULT);

------------------------------------------------------------------------------------------------------------------- N_REPLY(공지사항 리플 테이블) 생성
CREATE TABLE N_REPLY(
  NRID                  NUMBER,
  NRCONTENT          VARCHAR2(400),
  N_REF_NID       NUMBER,
  NRUSER             VARCHAR2(50) NOT NULL,
  NR_DATE               DATE,
  NR_MODIFY_DATE   DATE,
  NR_STATUS            CHAR(1) DEFAULT 'Y',
  CONSTRAINT PK_NRID PRIMARY KEY(NRID),
CONSTRAINT FK_NRUSER FOREIGN KEY (NRUSER) REFERENCES MEMBER(NICK) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- N_REPLY 컬러명 지정
COMMENT ON COLUMN N_REPLY.NRID IS '공지사항 댓글 번호';
COMMENT ON COLUMN N_REPLY.NRCONTENT IS '공지사항 댓글 내용';
COMMENT ON COLUMN N_REPLY.N_REF_NID IS '참조 공지글 번호';
COMMENT ON COLUMN N_REPLY.NRUSER IS '공지사항 댓글 작성자';
COMMENT ON COLUMN N_REPLY.NR_DATE IS '공지사항 댓글 작성 일자';
COMMENT ON COLUMN N_REPLY.NR_MODIFY_DATE IS '공지사항 댓글 수정 일자';
COMMENT ON COLUMN N_REPLY.NR_STATUS IS '공지사항 댓글 상태';

------------------------------------------------------------------------------------------------------------------- N_REPLY 시퀀스
CREATE SEQUENCE SEQ_NRID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(N_REPLY)
INSERT INTO N_REPLY VALUES(SEQ_NRID.NEXTVAL, '공지사항 첫번째 댓글입니다.', '1',  '테스트닉네임1', '21/01/01', NULL, DEFAULT);
INSERT INTO N_REPLY VALUES(SEQ_NRID.NEXTVAL, '공지사항 두번째 댓글입니다.', '1',  '테스트닉네임1', '21/01/01', NULL, DEFAULT);
INSERT INTO N_REPLY VALUES(SEQ_NRID.NEXTVAL, '공지사항 세번째 댓글입니다.', '1',  '테스트닉네임1', '21/01/01', NULL, DEFAULT);


------------------------------------------------------------------------------------------------------------------- BLAME 테이블 생성
CREATE TABLE BLAME(
BLAME_NO      NUMBER,
BLAME_BID         NUMBER,
BLAME_TYPE      CHAR(50) DEFAULT '부적절', 
REPORTER         VARCHAR2(100),
TARGETUSER      VARCHAR2(100),
BLAME_DATE      DATE,
BLAME_CONTENT      VARCHAR2(2000),
CONSTRAINT PK_BLAME_NO PRIMARY KEY(BLAME_NO),
CONSTRAINT FK_REPORTER FOREIGN KEY (REPORTER) REFERENCES MEMBER(NICK) ON DELETE SET NULL,
CONSTRAINT FK_TARGETUSER FOREIGN KEY (TARGETUSER) REFERENCES MEMBER(NICK) ON DELETE SET NULL,
CONSTRAINT FK_BLAME_BID FOREIGN KEY (BLAME_BID) REFERENCES BOARD(BID) ON DELETE SET NULL
);
                                     
------------------------------------------------------------------------------------------------------------------- BLAME (신고한 내역이 저장) 컬럼명 생성
COMMENT ON COLUMN BLAME.BLAME_NO IS '신고번호';
COMMENT ON COLUMN BLAME.BLAME_BID IS '신고 게시물 번호';
COMMENT ON COLUMN BLAME.BLAME_TYPE IS '신고 글 구분(1. 부적절, 2. 욕설, 3. 광고, 4. 음란물)';
COMMENT ON COLUMN BLAME.REPORTER IS '신고한 회원';
COMMENT ON COLUMN BLAME.TARGETUSER IS '신고당한 회원';
COMMENT ON COLUMN BLAME.BLAME_DATE IS '신고 일시';
COMMENT ON COLUMN BLAME.BLAME_CONTENT IS '신고 내용';

------------------------------------------------------------------------------------------------------------------- BLAME 시퀀스
CREATE SEQUENCE SEQ_BLID
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(BLAME)
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL,'1', '부적절', '테스트닉네임1', '테스트닉네임1', '21/01/01', '광고성 홍보글을 올리고 있어요');
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL,'1', '욕설', '테스트닉네임1', '테스트닉네임1', '21/01/01', '광고성 홍보글을 올리고 있어요');
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL,'1', '사기', '테스트닉네임1', '테스트닉네임1', '21/01/01', '광고성 홍보글을 올리고 있어요');


------------------------------------------------------------------------------------------------------------------- 방문자 테이블
CREATE TABLE VISIT(
V_DATE DATE NOT NULL,
CONSTRAINT PK_V_DATE PRIMARY KEY(V_DATE)
);

COMMENT ON COLUMN VISIT.V_DATE IS '방문자';

INSERT INTO VISIT VALUES(TO_DATE('10-06-2016','MM-DD-YYYY'));
INSERT INTO VISIT VALUES(TO_DATE('11-07-2016','MM-DD-YYYY'));
INSERT INTO VISIT VALUES(TO_DATE('11-08-2016','MM-DD-YYYY'));
--1
COMMIT;