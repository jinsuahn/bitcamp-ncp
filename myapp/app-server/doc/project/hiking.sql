-- 산
DROP TABLE IF EXISTS hms_mt_information;

-- 산악뉴스
DROP TABLE IF EXISTS hms_mt_news;

-- 지역행사
DROP TABLE IF EXISTS hms_local_event;

-- 맛집정보
DROP TABLE IF EXISTS hms_food;

-- 등산일지
DROP TABLE IF EXISTS hms_diary;

-- 회원
DROP TABLE IF EXISTS hms_member;

-- 게시판
DROP TABLE IF EXISTS hms_board;

-- 등산코스
DROP TABLE IF EXISTS hms_course_information;

-- 지역
DROP TABLE IF EXISTS hms_region;

-- 댓글
DROP TABLE IF EXISTS hms_comment;

-- 사진
DROP TABLE IF EXISTS hms_photo;

-- 댓글좋아요
DROP TABLE IF EXISTS comment_like;

-- 게시판유형
DROP TABLE IF EXISTS hms_board_category;

-- 게시판좋아요
DROP TABLE IF EXISTS board_like;

-- QnA
DROP TABLE IF EXISTS hms_QnA;

-- 산
CREATE TABLE hms_mt_information (
  mt_information_id INTEGER NOT NULL,
  region_id INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  height VARCHAR(50) NOT NULL,
  photo LONGTEXT NOT NULL,
  address VARCHAR(255) NOT NULL,
  sunrise DATETIME NOT NULL,
  sunset DATETIME NOT NULL
);

-- 산
ALTER TABLE hms_mt_information
  ADD CONSTRAINT PK_hms_mt_information -- 산 기본키
  PRIMARY KEY (
  mt_information_id -- 산번호
  );

ALTER TABLE hms_mt_information
  MODIFY COLUMN mt_information_id INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 산악뉴스
CREATE TABLE hms_mt_news (
  mt_news_id INTEGER NOT NULL,
  board_id INTEGER NOT NULL
);

-- 산악뉴스
ALTER TABLE hms_mt_news
  ADD CONSTRAINT PK_hms_mt_news -- 산악뉴스 기본키
  PRIMARY KEY (
  mt_news_id, -- 산악뉴스번호
  board_id    -- 게시판번호
  );

ALTER TABLE hms_mt_news
  MODIFY COLUMN mt_news_id INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 지역행사
CREATE TABLE hms_local_event (
  board_id INTEGER NOT NULL,
  period VARCHAR(50) NOT NULL,
  postno VARCHAR(10) NULL,
  basic_address VARCHAR(255) NOT NULL,
  detail_address VARCHAR(255) NOT NULL
);

-- 지역행사
ALTER TABLE hms_local_event
  ADD CONSTRAINT PK_hms_local_event -- 지역행사 기본키
  PRIMARY KEY (
  board_id -- 지역행사번호
  );

-- 맛집정보
CREATE TABLE hms_food (
  board_id INTEGER NOT NULL,
  food_address VARCHAR(255) NULL,
  food_tel VARCHAR(30) NULL
);

-- 맛집정보
ALTER TABLE hms_food
  ADD CONSTRAINT PK_hms_food -- 맛집정보 기본키
  PRIMARY KEY (
  board_id -- 맛집정보번호
  );

ALTER TABLE hms_food
  MODIFY COLUMN board_id INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 등산일지
CREATE TABLE hms_diary (
  board_id INTEGER NOT NULL,
  mt_information_id INTEGER NOT NULL,
  course VARCHAR(50) NULL,
  record_length VARCHAR(50) NULL,
  record_time VARCHAR(50) NULL
);

-- 등산일지
ALTER TABLE hms_diary
  ADD CONSTRAINT PK_hms_diary -- 등산일지 기본키
  PRIMARY KEY (
  board_id -- 등산일지번호
  );

-- 회원
CREATE TABLE hms_member (
  member_id INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  tel VARCHAR(30) NOT NULL,
  email VARCHAR(40) NOT NULL,
  id VARCHAR(10) NOT NULL,
  profile_photo VARCHAR(255) NULL,
  password VARCHAR(10) NOT NULL,
  nickname VARCHAR(50) NOT NULL,
  postno VARCHAR(10) NOT NULL,
  basic_address VARCHAR(255) NOT NULL,
  detail_address VARCHAR(255) NULL,
  birth DATE NOT NULL,
  status_message TEXT NULL,
  created_date DATETIME NOT NULL,
  authority VARCHAR(10) NULL
);

-- 회원
ALTER TABLE hms_member
  ADD CONSTRAINT PK_hms_member -- 회원 기본키
  PRIMARY KEY (
  member_id -- 회원번호
  );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_hms_member
  ON hms_member ( -- 회원
        id ASC,       -- 아이디
        email ASC,    -- 이메일
        nickname ASC  -- 닉네임
  );

-- 게시판
CREATE TABLE hms_board (
  board_id INTEGER NOT NULL,
  board_category_id INTEGER NULL,
  member_id INTEGER NULL,
  title VARCHAR(255) NOT NULL,
  content MEDIUMTEXT NOT NULL,
  tag VARCHAR(50) NOT NULL,
  writer VARCHAR(50) NOT NULL,
  created_date DATETIME NOT NULL
);

-- 게시판
ALTER TABLE hms_board
  ADD CONSTRAINT PK_hms_board -- 게시판 기본키
  PRIMARY KEY (
  board_id -- 게시판번호
  );

ALTER TABLE hms_board
  MODIFY COLUMN board_id INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 등산코스
CREATE TABLE hms_course_information (
  course_information_id INTEGER NOT NULL,
  mt_information_id INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  length VARCHAR(50) NOT NULL,
  time VARCHAR(50) NOT NULL,
  level VARCHAR(50) NOT NULL,
  photo LONGTEXT NOT NULL
);

-- 등산코스
ALTER TABLE hms_course_information
  ADD CONSTRAINT PK_hms_course_information -- 등산코스 기본키
  PRIMARY KEY (
  course_information_id -- 등산코스번호
  );

ALTER TABLE hms_course_information
  MODIFY COLUMN course_information_id INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 지역
CREATE TABLE hms_region (
  region_id INTEGER NOT NULL,
  region_list VARCHAR(50) NOT NULL
);

-- 지역
ALTER TABLE hms_region
  ADD CONSTRAINT PK_hms_region -- 지역 기본키
  PRIMARY KEY (
  region_id -- 지역번호
  );

-- 지역 유니크 인덱스
CREATE UNIQUE INDEX UIX_hms_region
  ON hms_region ( -- 지역
        region_list ASC -- 지역별
  );

ALTER TABLE hms_region
  MODIFY COLUMN region_id INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 댓글
CREATE TABLE hms_comment (
  comment_id INTEGER NOT NULL,
  board_id INTEGER NOT NULL,
  member_id INTEGER NOT NULL,
  content TEXT NOT NULL,
  created_date DATETIME NOT NULL
);

-- 댓글
ALTER TABLE hms_comment
  ADD CONSTRAINT PK_hms_comment -- 댓글 기본키
  PRIMARY KEY (
  comment_id -- 댓글번호
  );

ALTER TABLE hms_comment
  MODIFY COLUMN comment_id INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 사진
CREATE TABLE hms_photo (
  photo_id INTEGER NOT NULL,
  board_id INTEGER NULL,
  photo LONGTEXT NULL,
  mimetype VARCHAR(10) NULL
);

-- 사진
ALTER TABLE hms_photo
  ADD CONSTRAINT PK_hms_photo -- 사진 기본키
  PRIMARY KEY (
  photo_id -- 사진번호
  );

-- 댓글좋아요
CREATE TABLE comment_like (
  comment_id INTEGER NOT NULL,
  member_id INTEGER NOT NULL,
  like_count INTEGER NOT NULL
);

-- 댓글좋아요
ALTER TABLE comment_like
  ADD CONSTRAINT PK_comment_like -- 댓글좋아요 기본키
  PRIMARY KEY (
  comment_id, -- 댓글번호
  member_id   -- 회원번호
  );

-- 게시판유형
CREATE TABLE hms_board_category (
  board_category_id INTEGER NOT NULL,
  board_name VARCHAR(50) NULL
);

-- 게시판유형
ALTER TABLE hms_board_category
  ADD CONSTRAINT PK_hms_board_category -- 게시판유형 기본키
  PRIMARY KEY (
  board_category_id -- 게시판유형번호
  );

ALTER TABLE hms_board_category
  MODIFY COLUMN board_category_id INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 게시판좋아요
CREATE TABLE board_like (
  board_id INTEGER NOT NULL,
  member_id INTEGER NOT NULL,
  like_count INTEGER NOT NULL
);

-- 게시판좋아요
ALTER TABLE board_like
  ADD CONSTRAINT PK_board_like -- 게시판좋아요 기본키
  PRIMARY KEY (
  board_id,  -- 게시판번호
  member_id  -- 회원번호
  );

-- QnA
CREATE TABLE hms_QnA (
  QnA_id INTEGER NOT NULL,
  member_id INTEGER NOT NULL,
  title VARCHAR(255) NOT NULL,
  COL MEDIUMTEXT NOT NULL,
  created_date DATETIME NOT NULL,
  response MEDIUMTEXT NOT NULL
);

-- QnA
ALTER TABLE hms_QnA
  ADD CONSTRAINT PK_hms_QnA -- QnA 기본키
  PRIMARY KEY (
  QnA_id -- 문의번호
  );

-- 산
ALTER TABLE hms_mt_information
  ADD CONSTRAINT FK_hms_region_TO_hms_mt_information -- 지역 -> 산
  FOREIGN KEY (
  region_id -- 지역번호
  )
  REFERENCES hms_region ( -- 지역
  region_id -- 지역번호
  );

-- 산악뉴스
ALTER TABLE hms_mt_news
  ADD CONSTRAINT FK_hms_board_TO_hms_mt_news -- 게시판 -> 산악뉴스
  FOREIGN KEY (
  board_id -- 게시판번호
  )
  REFERENCES hms_board ( -- 게시판
  board_id -- 게시판번호
  );

-- 지역행사
ALTER TABLE hms_local_event
  ADD CONSTRAINT FK_hms_board_TO_hms_local_event -- 게시판 -> 지역행사
  FOREIGN KEY (
  board_id -- 지역행사번호
  )
  REFERENCES hms_board ( -- 게시판
  board_id -- 게시판번호
  );

-- 맛집정보
ALTER TABLE hms_food
  ADD CONSTRAINT FK_hms_board_TO_hms_food -- 게시판 -> 맛집정보
  FOREIGN KEY (
  board_id -- 맛집정보번호
  )
  REFERENCES hms_board ( -- 게시판
  board_id -- 게시판번호
  );

-- 등산일지
ALTER TABLE hms_diary
  ADD CONSTRAINT FK_hms_mt_information_TO_hms_diary -- 산 -> 등산일지
  FOREIGN KEY (
  mt_information_id -- 산번호
  )
  REFERENCES hms_mt_information ( -- 산
  mt_information_id -- 산번호
  );

-- 등산일지
ALTER TABLE hms_diary
  ADD CONSTRAINT FK_hms_board_TO_hms_diary -- 게시판 -> 등산일지
  FOREIGN KEY (
  board_id -- 등산일지번호
  )
  REFERENCES hms_board ( -- 게시판
  board_id -- 게시판번호
  );

-- 게시판
ALTER TABLE hms_board
  ADD CONSTRAINT FK_hms_member_TO_hms_board -- 회원 -> 게시판
  FOREIGN KEY (
  member_id -- 회원번호
  )
  REFERENCES hms_member ( -- 회원
  member_id -- 회원번호
  );

-- 게시판
ALTER TABLE hms_board
  ADD CONSTRAINT FK_hms_board_category_TO_hms_board -- 게시판유형 -> 게시판
  FOREIGN KEY (
  board_category_id -- 게시판유형번호
  )
  REFERENCES hms_board_category ( -- 게시판유형
  board_category_id -- 게시판유형번호
  );

-- 등산코스
ALTER TABLE hms_course_information
  ADD CONSTRAINT FK_hms_mt_information_TO_hms_course_information -- 산 -> 등산코스
  FOREIGN KEY (
  mt_information_id -- 산번호
  )
  REFERENCES hms_mt_information ( -- 산
  mt_information_id -- 산번호
  );

-- 댓글
ALTER TABLE hms_comment
  ADD CONSTRAINT FK_hms_board_TO_hms_comment -- 게시판 -> 댓글
  FOREIGN KEY (
  board_id -- 게시판번호
  )
  REFERENCES hms_board ( -- 게시판
  board_id -- 게시판번호
  );

-- 댓글
ALTER TABLE hms_comment
  ADD CONSTRAINT FK_hms_member_TO_hms_comment -- 회원 -> 댓글
  FOREIGN KEY (
  member_id -- 회원번호
  )
  REFERENCES hms_member ( -- 회원
  member_id -- 회원번호
  );

-- 사진
ALTER TABLE hms_photo
  ADD CONSTRAINT FK_hms_board_TO_hms_photo -- 게시판 -> 사진
  FOREIGN KEY (
  board_id -- 게시판번호
  )
  REFERENCES hms_board ( -- 게시판
  board_id -- 게시판번호
  );

-- 댓글좋아요
ALTER TABLE comment_like
  ADD CONSTRAINT FK_hms_comment_TO_comment_like -- 댓글 -> 댓글좋아요
  FOREIGN KEY (
  comment_id -- 댓글번호
  )
  REFERENCES hms_comment ( -- 댓글
  comment_id -- 댓글번호
  );

-- 댓글좋아요
ALTER TABLE comment_like
  ADD CONSTRAINT FK_hms_member_TO_comment_like -- 회원 -> 댓글좋아요
  FOREIGN KEY (
  member_id -- 회원번호
  )
  REFERENCES hms_member ( -- 회원
  member_id -- 회원번호
  );

-- 게시판좋아요
ALTER TABLE board_like
  ADD CONSTRAINT FK_hms_board_TO_board_like -- 게시판 -> 게시판좋아요
  FOREIGN KEY (
  board_id -- 게시판번호
  )
  REFERENCES hms_board ( -- 게시판
  board_id -- 게시판번호
  );

-- 게시판좋아요
ALTER TABLE board_like
  ADD CONSTRAINT FK_hms_member_TO_board_like -- 회원 -> 게시판좋아요
  FOREIGN KEY (
  member_id -- 회원번호
  )
  REFERENCES hms_member ( -- 회원
  member_id -- 회원번호
  );

-- QnA
ALTER TABLE hms_QnA
  ADD CONSTRAINT FK_hms_member_TO_hms_QnA -- 회원 -> QnA
  FOREIGN KEY (
  member_id -- 회원번호
  )
  REFERENCES hms_member ( -- 회원
  member_id -- 회원번호
  );