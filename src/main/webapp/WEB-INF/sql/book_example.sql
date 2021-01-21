CREATE SEQUENCE seq_board;

CREATE table tbl_board(
    bno NUMBER(10,0),
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE
);
SELECT * FROM tbl_board;
SELECT * FROM tbl_board WHERE bno > 0;
SELECT * FROM tbl_board ORDER BY bno DESC;
SELECT bno, title, content, writer, regdate, updatedate 
FROM
    (SELECT ROW_NUMBER() OVER(ORDER BY bno DESC) rn, bno, title, content, writer, regdate, updatedate
    FROM tbl_board)
WHERE rn BETWEEN 1 AND 10
;
SELECT * FROM tbl_board
WHERE writer LIKE '%user%';

ALTER TABLE tbl_board ADD CONSTRAINT pk_board PRIMARY KEY(bno);

INSERT INTO tbl_board(bno, title, content, writer)
VALUES (seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');

--ROLLBACK;
COMMIT;

--------------댓글
CREATE SEQUENCE seq_comment;
--DROP TABLE tbl_comment;

CREATE TABLE tbl_comment(
    cno NUMBER(10,0),
    bno NUMBER(10,0) NOT NULL,
    content VARCHAR2(500) NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT SYSDATE,
    PRIMARY KEY(cno)
);

SELECT * FROM tbl_comment WHERE cno > 0;
--DELETE FROM tbl_comment WHERE cno=11;

INSERT INTO tbl_comment(cno, bno, content, writer)
VALUES (seq_comment.nextval, 1, '댓글 내용', 'user00');

rollback;
COMMIT;
