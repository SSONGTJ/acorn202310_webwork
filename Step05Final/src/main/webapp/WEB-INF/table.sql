-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE user_info(
	id VARCHAR2(100) CONSTRAINT user_info_id_pk PRIMARY KEY,
	pwd VARCHAR2(100) CONSTRAINT user_info_pwd_nn NOT NULL,
	email VARCHAR2(100),
	profile VARCHAR2(100), --프로필 이미지 경로를 저장할 칼럼
	regdate DATE
);

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

-- 페이징 처리를 하기 위해서는 1. 정렬  2. 행번호 부여 3. 원하는 행만 select 

SELECT *
FROM
	(SELECT result1.*, ROWNUM AS rnum
	FROM
		(SELECT num, writer, title, orgFileName, fileSize, regdate 
		FROM board_file
		ORDER BY num DESC) result1)
WHERE rnum BETWEEN 6 AND 10





















