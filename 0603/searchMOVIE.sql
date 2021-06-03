-- movie table 제작 (영화제목(PK), 개봉일, 평점, 관객 수, 상영 시간, 장르 ID)
create table movie (movie_id varchar2(20),
                    release_date date,
                    rating int,
                    audience_no int,
                    running_time int,
                    genre_id int,
                    primary key(movie_id));

-- actor table 제작 (배우 이름(PK), 출연 영화(FK), 역할, 소속사, 성별)
create table actor (actor_id varchar2(20),
                    movie_id varchar2(20),
                    character varchar2(20),
                    agency varchar2(20),
                    gender char(1) constraint actor_gender check (gender in ('F','M')), -- F 혹은 M만 적을 수 있도록 제한
                    primary key(actor_id),
                    foreign key(movie_id) references movie(movie_id));    

-- director table 제작 (감독 이름(PK), 제작 영화(FK), 대표작, 나이)
create table director (director_id varchar2(20),
                        movie_id varchar2(20),
                        popular varchar2(20),
                        age int,
                        primary key(director_id),
                        foreign key(movie_id) references movie(movie_id));

-- genre table 제작 (1:드라마 / 2:SF / 3:멜로 / 4:코미디)
create table genre (genre_id int,
                    genre_name varchar2(20),
                    primary key(genre_id));

-- movie 세부사항 추가
insert into movie values('jurassic park',to_date('1991-06-11','yyyy-mm-dd'),9.32,555,132,2);
insert into movie values('Titanic',to_date('1998-02-20','yyyy-mm-dd'),9.88,197,194,3);
INSERT INTO movie VALUES('기생충', to_date('2019-05-30','yyyy-mm-dd'), 9.07, 1030, 132, 1);
insert into movie values ('Cruella',to_date('2021-05-26','yyyy-mm-dd'),8.7,38,133,4);
insert into movie values('미나리', to_date('2021-03-03','yyyy-mm-dd'), 8.31, 110, 115, 1);

-- actor 세부사항 추가
insert into actor values('Sam Neill','jurassic park','DR.allen grant','Curtis Brown', 'M');
insert into actor values('Laura Dern','jurassic park','Ellie Sattler','IMDbPro', 'F');
insert into actor values('Jeff Goldblum','jurassic park','Ian Malcolm','Elevate Artist', 'M');
insert into actor values('Leonardo DiCaprio','Titanic','Jack Dawson','Creative Artists', 'M');
insert into actor values('Kate Winslet','Titanic','Rose DeWitt','United Agents', 'F');
insert into actor values('Billy Zane','Titanic','Caledon Hockley','MN2S', 'M');
INSERT INTO actor VALUES('송강호', '기생충', '기택 역', '써브라임', 'M');
INSERT INTO actor VALUES('이선균', '기생충', '동익 역', '호두앤유', 'M');
INSERT INTO actor VALUES('조여정', '기생충', '연교 역', '높은엔터', 'F');
INSERT INTO actor VALUES('최우식', '기생충', '기우 역', '매니지먼트 숲', 'M');
INSERT INTO actor VALUES('박소담', '기생충', '기정 역', '아티컴퍼니', 'F');
INSERT INTO actor VALUES('이정은', '기생충', '문광 역', '윌엔터', 'F');
INSERT INTO actor VALUES('장혜진', '기생충', '충숙 역', '아이오케이', 'F');
insert into actor values ('Emma Stone', 'Cruella', 'Cruella', '','F');
insert into actor values ('Emma Thompson', 'Cruella', 'Baroness', 'Hamilton','F');
insert into actor values ('Emily Beecham', 'Cruella', 'Catherine Miller' , 'Beaumont', 'F');
insert into actor values('스티븐연', '미나리', '제이콥', 'B앤C', 'M');
insert into actor values('한예리', '미나리', '모니카', '사람엔터', 'F');
insert into actor values('윤여정', '미나리', '순자', '후크엔터', 'F');
insert into actor values('앨런김', '미나리', '데이빗', 'CAA', 'M');

-- director 세부사항 추가
insert into director values('Steven Spielberg','jurassic park','ET',74);
insert into director values('James Cameron','Titanic','Avatar',66);
INSERT INTO director VALUES('봉준호','기생충','괴물', 53);
insert into director values ('Craig Gillespie', 'Cruella', 'Lars and Real Girl', 53);
insert into director values('정이삭','미나리','괴물',45);

-- genre 구분 추가
insert into genre values(1,'드라마');
insert into genre values(2,'SF');
insert into genre values(3,'Melo/Romance');
insert into genre values(4,'Comedy');

