MYSQL - INSERTING DATA



To reset auto-increment numbers:
ALTER TABLE tableName AUTO_INCREMENT = 1;

To delete all data (but leave structure) within table:
DELETE FROM tableName;


---- groups ----

(groupID,title,isPrivate,ownerID) INSERT INTO groups (title,isPrivate,ownerID) VALUES ();

INSERT INTO groups (title,isPrivate,ownerID) VALUES ('Estrellas Astronomy Group','yes',5);

INSERT INTO groups (title,isPrivate,ownerID) VALUES ('Public Policy 101','no',3);

INSERT INTO groups (title,isPrivate,ownerID) VALUES ('Infinite Finite','no',7);

INSERT INTO groups (title,isPrivate,ownerID) VALUES ('Nerds for Words English Literature Group','no',2);

INSERT INTO groups (title,isPrivate,ownerID) VALUES ('Media Studies for Graduates','yes',1);


---- messages ----

(messageID,content,dateSent,timeSent)

INSERT INTO 

---- roomDetails ----

(roomID,maxCapacity,foodAllowed)

---- schools ----

(schoolID,schoolName,city,stateProvince,country)

---- sessions ----

(sessionID,attendees,title,courseCode,sessioDescription,date,time,address,room,isPrivate)

---- users ----

INSERT INTO users (userName,password,firstName,lastName,DOB,email,phone,bio) VALUES ();

INSERT INTO users (userName,password,firstName,lastName,DOB,email,phone,bio) VALUES ('yestoknope','Hillary4eva','Leslie','Knope','1974-01-18','parksandrec@email.com','(153) 850-3857','I am big enough to admit that I am often inspired by myself.');

INSERT INTO users (userName,password,firstName,lastName,DOB,email,phone,bio) VALUES ('undisputed','theRestisDrag','RuPaul','Charles','1960-11-17','youstay@email.com','(432) 555-5114','The library is open.');

INSERT INTO users (userName,password,firstName,lastName,DOB,email,phone,bio) VALUES ('proudmary','More!Fringe!','Tina','Turner','1939-11-26','rollin@email.com','(748) 203-8822','My wish is to give the kind of truth to people that will help them change their minds. When that happens, I''ll be the best that I can be.');

INSERT INTO users (userName,password,firstName,lastName,DOB,email,phone,bio) VALUES ('hellodolly','Dollywood!23','Dolly','Parton','1964-01-19','hellodolly@email.com','(789) 205-8936','A peacock who rests on its feathers is just another turkey.');

INSERT INTO users (userName,password,firstName,lastName,DOB,email,phone,bio) VALUES ('euphoric','just$ayn0','Zendaya','Coleman','1996-09-01','curlgirl@email.com','(257) 830-6494','The best thing it so realize that you are who you are and you gotta work with what you got.');

INSERT INTO users (userName,password,firstName,lastName,DOB,email,phone,bio) VALUES ('justrich','weouthere!','Constance','Wu','1982-03-22','dontmisstheboat@email.com','(301) 133-9562','Public service is about serving all the people, including the ones who are not like you.');

INSERT INTO users (userName,password,firstName,lastName,DOB,email,phone,bio) VALUES ('IronAaron','1234AbCd!','Aaron','Arnold','1997-05-11','ironman123@email.com','(732) 474-8639','Excited to soak up as much as I can.');

INSERT INTO users (userName,password,firstName,lastName,DOB,email,phone,bio) VALUES ('SasheerZ','Sas433r?','Sasheer','Zamata','2000-11-13','funnysz@email.edu','(928) 224-5944','I love to perform and witness people in their element.');
