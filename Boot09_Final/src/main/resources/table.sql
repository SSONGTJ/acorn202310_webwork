DROP TABLE user_tbl;

CREATE TABLE user_tbl(
	id NUMBER PRIMARY KEY,
	userName VARCHAR2(20) UNIQUE,
	password VARCHAR2(100) NOT NULL,
	email VARCHAR2(100) UNIQUE,
	role VARCHAR2(10) NOT NULL,
	profile VARCHAR2(100),
	regdate DATE
);

CREATE SEQUENCE user_seq;

SELECT * FROM user_tbl;

-- 이미지 겔러리를 만들기 위한 테이블 
CREATE TABLE board_gallery(
    num NUMBER PRIMARY KEY,
    writer VARCHAR2(100),
    caption VARCHAR2(100),   -- 이미지에 대한 설명
    saveFileName VARCHAR2(100), -- 업로드된 이미지의 이름
    regdate DATE -- 이미지 업로드 날짜 
);

SELECT * FROM board_gallery ORDER BY num DESC;

CREATE SEQUENCE board_gallery_seq;

-- LAG(칼럼명, 칸수, 존재하지 않을시 기본값) OVER (정렬 조건)
SELECT *
FROM
	(SELECT num, writer, caption, 
		LAG(num, 1, 0) OVER (ORDER BY num DESC) as PrevNum,
		LEAD(num, 1, 0) OVER (ORDER BY num DESC) as NextNum
	FROM board_gallery 
	ORDER BY num DESC)
WHERE num=5


-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE board_file(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
	saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
	fileSize NUMBER NOT NULL, -- 파일의 크기 
	regdate DATE
);

CREATE SEQUENCE board_file_seq; 

SELECT num, writer, caption, saveFileName, regdate,
	LAG(num, 1, 0) OVER (ORDER BY num DESC) AS prevNum,
	LEAD(num, 1, 0) OVER (ORDER BY num DESC) AS nextNum
FROM board_gallery
ORDER BY num DESC









