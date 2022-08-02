--USERINFO(회원) insert 

insert into userinfo values('seongmin', '1234', '정성민', '01012345678', '970902', '남', 'seongmin@gmail.com', '경기도');
insert into userinfo values('bongkune', '1234', '김봉균', '01023456789', '940603', '남', 'bongkune@gmail.com', '서울');
insert into userinfo values('jihun', '1234', '유지훈', '01034567891', '961010', '남', 'jihun@gmail.com', '부산');
insert into userinfo values('enbi', '1234', '임은비', '01045678912', '980105', '여', 'enbi@gmail.com', '광주');
insert into userinfo values('jeonghun', '1234', '이정현', '01056789123', '960504', '여', 'jeonghun@gmail.com', '대구');
insert into userinfo values('hunjeong', '1234', '임현정', '01067891234', '940701', '여', 'hunjeong@gmail.com', '천안');

--BOOK(책) insert

--1번 자기개발서
insert into book values(book_b_no_seq.nextval, '자기개발서', '마시멜로이야기', 12000, '달콤한 유혹에서 이겨낼 때, 비로소 얻게 된다', '1_marshmallow', '호아킴 데 포사다', '한국경제신문사');
insert into book values(book_b_no_seq.nextval, '자기개발서', '누가 내 치즈를 옮겼을까?', 13500, '인생에서 부딪힐 변화를 대처할 수 있는 지혜', '1_who', '스펜서 존슨', '진명출판사');
insert into book values(book_b_no_seq.nextval, '자기개발서', '미움받을 용기', 14900, '자유롭고 행복한 삶을 위한 가르침', '1_courage', '기시미 이치로', '진명출판사');
insert into book values(book_b_no_seq.nextval, '자기개발서', '최강의 멘탈관리', 17000, '세계 리더들의 지도자 멘탈 코칭', '1_reader', '킴벌리 페이스', '포르체');
insert into book values(book_b_no_seq.nextval, '자기개발서', '나를 찾는 시간', 16000, '나이 든다는 것은 생각만큼 슬프지 않다', '1_time', '유창선', '새빛');
--2번 건강
insert into book values(book_b_no_seq.nextval, '건강', '식사만 바꿔도 젊어집니다', 16500, '항노화 전문의가 알려주는 늙지 않는 식사법', '2_food', '마키타 젠지', '북드림');
insert into book values(book_b_no_seq.nextval, '건강', '당질 중독', 14000, '올바른 탄수화물 조절로 내 몸 리셋', '2_party', '마키타 젠지', '문예춘추사');
insert into book values(book_b_no_seq.nextval, '건강', '피곤해지지 않는 올바른 자세 도감 100', 15000, '올바른 자세를 위한 방법', '2_posture', '나츠시마 다카시', '즐거운상상');
insert into book values(book_b_no_seq.nextval, '건강', '절대 지치지 않는 몸', 15000, '과학적 원리를 통해 배우는 최강의 피로 해소법', '2_body', '나카노 제임스 슈이치', '비타북스');
insert into book values(book_b_no_seq.nextval, '건강', '글루코스 혁명', 18000, '좋아하는 음식을 즐기면서 과학적으로 체중을 줄이는 10가지 방법', '2_superfood', '제시 인차우스페', '아침사과');
--3번 요리
insert into book values(book_b_no_seq.nextval, '요리', '삐뽀삐뽀 119 이유식', 18900, '소아청소년과 전문의 하정훈이 전하는 건강한 아가 밥상', '3_babyfood', '하정훈', '유니책방');
insert into book values(book_b_no_seq.nextval, '요리', '우리술 익스프레스', 16500, '와인, 위스키, 사케 못지않은 K-술의 매력', '3_drink', '탁재형', 'EBS BOOKS');
insert into book values(book_b_no_seq.nextval, '요리', '구움과자 클래스', 17000, '슬픈하품의 따뜻한 홈베이킹', '3_brade', '이지혜', '시대인');
insert into book values(book_b_no_seq.nextval, '요리', '맛있다 죽', 16000, '건강을 담은 한 그릇', '3_porridge', '한복선', '리스컴');
insert into book values(book_b_no_seq.nextval, '요리', '오늘도 달걀', 14000, '만약에 달걀이 없었더라면 무엇으로 식탁을 차릴까', '3_egg', '손성희', '리스컴');
--4번 컴퓨터IT
insert into book values(book_b_no_seq.nextval, '컴퓨터IT', 'clean code', 33000, '애자일 소프트웨어 장인 정신', '4_code', '로버트 C. 마틴', '인사이트');
insert into book values(book_b_no_seq.nextval, '컴퓨터IT', '클린 아키텍처', 29000, '모든 프로그래머가 읽어야 하는 필독서!', '4_cleancode', '로버트 C. 마틴', '인사이트');
insert into book values(book_b_no_seq.nextval, '컴퓨터IT', '리팩터링', 35000, '코드 구조를 체계적으로 개선하여 효율적인 리팩터링 구현하기', '4_repack', '마틴 파울러', '한빛미디어');
insert into book values(book_b_no_seq.nextval, '컴퓨터IT', '객체지향의 사실과 오해', 20000, '역할, 책임, 협력 관점에서 본 객체지향', '4_fact', '조영호', '위키북스');
insert into book values(book_b_no_seq.nextval, '컴퓨터IT', '인스파이어드', 24000, '감동을 전하는 IT 제품은 어떻게 만들어지는가?', '4_inspired', '마티 케이건', '제이펍');
--5번 공포
insert into book values(book_b_no_seq.nextval, '공포', '그리고 아무도 없었다', 12000, '다들 어디간거야?', '5_nomore', '애거서 크리스티', '해문출판사');
insert into book values(book_b_no_seq.nextval, '공포', 'R의 공포가 온다', 20000, '기회를 동반한 또 다른 경제위기의 시작', '5_R', '김효신', '트러스트북스');
insert into book values(book_b_no_seq.nextval, '공포', '신비아파트 오싹오싹 무서운 이야기', 15000, '무서운 신비아파트에서 탈출하자', '5_apart', '앨리스,윤희정', '서울문화사');
insert into book values(book_b_no_seq.nextval, '공포', '오싹오싹 OK 공포 만화', 5500, '심장이 쫄깃! 머리카락이 쭈뼛!', '5_ok', '백철,계건일', '효리원');
insert into book values(book_b_no_seq.nextval, '공포', '악몽', 15000, '너무 무서워서 줄거리가 없습니다.', '5_dream', '조이스 캐럴 오츠', '포레');


-- USERINFO QNA insert

insert into qna values(QNA_q_no_SEQ.nextval, '1:1문의', '책 배송이 언제오나요?', sysdate, '제가 주문한 책 배송이 언제오나요?', 'seongmin');
insert into qna values(QNA_q_no_SEQ.nextval, '1:1문의', '책이 잘못왔어요', sysdate, '책이 잘못왔어요', 'enbi');
insert into qna values(QNA_q_no_SEQ.nextval, '1:1문의', '상품 언제 들어올까요?', sysdate, '상품 언제 들어올까요?', 'jeonghun');
insert into qna values(QNA_q_no_SEQ.nextval, '1:1문의', '주문이 누락됐습니다', sysdate, '주문이 누락됐습니다 주문이 누락됐습니다', 'hunjeong');
insert into qna values(QNA_q_no_SEQ.nextval, '1:1문의', '주문 취소하고싶어요', sysdate, '주문 취소하고싶어요', 'jihun');
insert into qna values(QNA_q_no_SEQ.nextval, '1:1문의', '배고파요', sysdate, '배고파요', 'bongkune');
