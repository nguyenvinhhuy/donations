create database donations;
use donations;

-- ------------ role table ------------
create table role(
	id int not null auto_increment primary key,
    role_name varchar(255)
);

insert into role values
 (1,"ADMIN"),
 (2,"USER");
 
-- ------------ user table ------------
create table user(
	id int not null auto_increment primary key,
    full_name varchar(255),
    address varchar(255),
    email varchar(255),
    note varchar(255),
    phone_number varchar(255),
    user_name varchar(255),
    password varchar(128),
    status int,
    created varchar(255),
    role_id int,
    foreign key (role_id) references role(id)
);

insert into user values
 
 (1,"David Adams","Ha Noi","david@gmail.com","note1","0789123456","david","12345",1,"2023-06-24",1),
 (2,"John Doe","Berlin","john@gmail.com","note2","0789123456","john","12345",1,"2023-06-24",1),
 (3,"Ajay Rao","Tokyo","ajay@gmail.com","note3","0789123456","ajay","12345",1,"2023-06-24",2),
 (4,"Mary Public","Washington D.C","mary@gmail.com","note4","0789123456","mary","12345",1,"2023-06-24",2),
 (5,"Maxwell Dixon","London","max@gmail.com","note5","0789123456","maxwell","12345",1,"2023-06-24",2),
 (6,"Show Adams","Ha Noi","show@gmail.com","note6","0789123456","show","12345",1,"2023-06-24",1),
 (7,"Johnan Sena","Berlin","johnan@gmail.com","note7","0789123456","johnan","12345",1,"2023-06-24",1),
 (8,"Kenvin Rao","Tokyo","kenvin@gmail.com","note8","0789123456","kenvin","12345",1,"2023-06-24",2),
 (9,"Marry Ken","Washington D.C","marry@gmail.com","note9","0789123456","marry","12345",1,"2023-06-24",2),
 (10,"Harry Dixon","London","harry@gmail.com","note10","0789123456","harry","12345",1,"2023-06-24",2);
-- ------------ donation table ------------
create table donation(
	id int not null auto_increment primary key,
    code varchar(255),
    name varchar(255),
    description varchar(255),
    money int,
    organization_name varchar(255),
    phone_number varchar(255),
	start_date varchar(255),
    end_date varchar(255),
    status int,
    created varchar(128)
);

-- select * from donation;
-- select d.id, d.code, d.name, d.description, (select sum(money) from user_donation ud where ud.status = 1 and ud.donation_id = d.id) sum_money, 
-- d.organization_name, d.phone_number, d.start_date, d.end_date, d.status, d.created from donation d;

insert into donation values
 (1,"code1","Trăng biên giới 2022","description1",0,"Hương Sen","0789123456","2022-09-24","2022-09-25",1,"2023-06-24"),
 (2,"code2","Tết thiếu nhi 2023","description2",0,"Trái Tim Yêu Thương","0789123456","2023-06-01","2023-06-02",1,"2023-06-24"),
 (3,"code3","Xuân yêu thương 2023","description3",0,"Hương Sen","0789123456","2023-01-01","2023-01-01",2,"2023-06-24"),
 (4,"code4","Lớp học tình thương 2023","description4",0,"Sen Việt","0789123456","2023-06-15","2023-08-15",2,"2023-06-24"),
 (5,"code5","Ấm lòng người cao tuổi","description5",0,"Hương Sen","0789123456","2020-01-01","2025-12-31",2,"2023-06-24"),
 (6,"code6","Trăng biên giới 2021","description6",0,"Hương Sen","0789123456","2021-09-24","2021-09-25",1,"2023-06-24"),
 (7,"code7","Tết thiếu nhi 2022","description7",0,"Trái Tim Yêu Thương","0789123456","2022-06-01","2022-06-02",1,"2023-06-24"),
 (8,"code8","Xuân yêu thương 2022","description8",0,"Hương Sen","0789123456","2022-01-01","2023-01-01",2,"2023-06-24"),
 (9,"code9","Lớp học tình thương 2022","description9",0,"Sen Việt","0789123456","2022-06-15","2022-08-15",2,"2023-06-24"),
 (10,"code10","Mùa vu lan 2020","description10",0,"Hương Sen","0789123456","2020-05-01","2020-05-03",2,"2023-06-24");
-- ------------ user_donation table ------------
create table user_donation(
	id int not null auto_increment primary key,
    money int,
    name varchar(255),
    text varchar(128),
    status int,
    created varchar(128),
    user_id int,
    donation_id int,
    foreign key (user_id) references user(id),
    foreign key (donation_id) references donation(id)
);

insert into user_donation values
 (1,2000000,"User 1 Ủng hộ Trăng biên giới 2022","text1",1,"2023-06-24",1,1),
 (2,2000000,"User 2 Ủng hộ Tết thiếu nhi 2023","text2",1,"2023-06-24",2,2),
 (3,2000000,"User 3 Ủng hộ Xuân yêu thương 2023","text3",1,"2023-06-24",3,3),
 (4,2000000,"User 4 Ủng hộ Lớp học tình thương 2023","text4",1,"2023-06-24",4,4),
 (5,2000000,"User 5 Ủng hộ Ấm lòng người cao tuổi","text5",1,"2023-06-24",5,5);
 
select * from user_donation;
 
 
 