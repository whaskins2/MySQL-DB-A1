INSERT INTO staff (staffid, fname, sname, role, gender, phone, dob, address, city, country, postcode)
VALUES (14438496, 'Warren', 'Haskins', 'senior instructor', 'male', '07530175296', 19900828,'123 Example Lane', 'Northampton', 'UK', 'NN11NQ');
INSERT INTO staff (staffid, fname, sname, role, gender, phone, dob, address, city, country, postcode)
VALUES (14283920, 'Hannah', 'Nichol', 'senior instructor', 'female', '01604595959', 19920226,'123 Example Lane', 'Northampton', 'UK', 'NN11NQ');
INSERT INTO staff (staffid, fname, sname, role, gender, phone, dob, address, city, country, postcode)
VALUES (85923849, 'Ryan', 'Haskins', 'instructor', 'male', '01604588375', 19930104,'123 Example Lane', 'Northampton', 'UK', 'NN11NQ');
INSERT INTO staff (staffid, fname, sname, role, gender, phone, dob, address, city, country, postcode)
VALUES (10432903, 'Manning', 'Peyton', 'senior instructor', 'male', '073942859402', 19480101,'123 Example Lane', 'Northampton', 'UK', 'NN11NQ');
INSERT INTO staff (staffid, fname, sname, role, gender, phone, dob, address, city, country, postcode)
VALUES (04729123, 'Genene', 'Bradlaw', 'senior instructor', 'female', '016048585854', 19650724,'123 Example Lane', 'Northampton', 'UK', 'NN11NQ');
INSERT INTO staff (staffid, fname, sname, role, gender, phone, dob, address, city, country, postcode)
VALUES (44729124, 'Philippe', 'Anselmo', 'admin', 'female', '016048545154', 19460411,'123 Example Lane', 'Northampton', 'UK', 'NN11NQ');
INSERT INTO staff (staffid, fname, sname, role, gender, phone, dob, address, city, country, postcode)
VALUES (24729125, 'John', 'Lodge', 'admin', 'male', '016048885624', 19850424,'123 Example Lane', 'Northampton', 'UK', 'NN11NQ');

INSERT INTO clients (clientid, fname, sname, email, phone, address, city, country, postcode)
VALUES (14438497, 'Goomba', 'Nichol', 'goombnichol@gmail.com', '01604282828', '123, Test Address Lane', 'Northampton', 'UK', 'NN1123');
INSERT INTO clients (clientid, fname, sname, email, phone, address, city, country, postcode)
VALUES (14343434, 'Freddy', 'Mercury', 'fred@gmail.com', '01606293823', '123, Test Address Lane', 'Northampton', 'UK', 'NN1123');
INSERT INTO clients (clientid, fname, sname, email, phone, address, city, country, postcode)
VALUES (12312333, 'Mario', 'Guy', 'itsame@hotmail.com', '07383838389', '123, Test Address Lane', 'Northampton', 'UK', 'NN1123');
INSERT INTO clients (clientid, fname, sname, email, phone, address, city, country, postcode)
VALUES (45665453, 'Clint', 'Sabaton', 'CSab@outlook.com', '07123429195', '123, Test Address Lane', 'Northampton', 'UK', 'NN1123');
INSERT INTO clients (clientid, fname, sname, email, phone, address, city, country, postcode)
VALUES (83454356, 'Robert', 'Nixx', 'nixx@gmail.com', '01604123123', '123, Test Address Lane', 'Northampton', 'UK', 'NN1123');
INSERT INTO clients (clientid, fname, sname, email, phone, address, city, country, postcode)
VALUES (02839419, 'Florence', 'Skring', 'liebe@gmail.com', '01738292910', '123, Test Address Lane', 'Northampton', 'UK', 'NN1123');

INSERT INTO cars(reg, make, model, staffid)
VALUES ('X631ENV', 'Fiat', 'Punto', 14283920);
INSERT INTO cars(reg, make, model, staffid)
VALUES ('AB05CDE', 'Toyota', 'Yaris', 85923849);
INSERT INTO cars(reg, make, model, staffid)
VALUES ('LU7789', 'Ford', 'Fiesta', 14438496);
INSERT INTO cars(reg, make, model, staffid)
VALUES ('BP99NBC', 'Lotus', 'Elise', 10432903);
INSERT INTO cars(reg, make, model, staffid)
VALUES ('YLP75F', 'Citroen', 'Picasso', 04729123);

INSERT INTO offices(officeid, office_name, address, city, country, postcode, managerid)
VALUES (10000000, 'Northampton Head Office','49 Billing Road', 'Northampton','UK', 'NN1 4JH', 14438496);
INSERT INTO offices(officeid, office_name, address, city, country, postcode, managerid)
VALUES (10000001, 'Milton Keynes Office','1 Grafton St', 'Milton Keynes', 'UK', 'MK1 1ST', 14283920);

INSERT INTO office_staff(officeid, staffid)
VALUES(10000000, 14438496);
INSERT INTO office_staff(officeid, staffid)
VALUES(10000001, 14283920);
INSERT INTO office_staff(officeid, staffid)
VALUES(10000000, 85923849);
INSERT INTO office_staff(officeid, staffid)
VALUES(10000000, 10432903);
INSERT INTO office_staff(officeid, staffid)
VALUES(10000001, 04729123);
INSERT INTO office_staff(officeid, staffid)
VALUES(10000000, 44729124);
INSERT INTO office_staff(officeid, staffid)
VALUES(10000001, 24729125);

INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312312, '2017-02-10 13:00:00', 14438497, 14438496, 'interview');
INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312313, '2017-02-15 11:30:00', 12312333, 85923849, 'interview');
INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312314, '2017-01-15 18:15:00', 83454356, 04729123, 'interview');
INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312322, '2016-11-18 13:15:00', 14438497, 14438496, 'interview');

INSERT INTO interviews(interviewid)
VALUES (12312312);
INSERT INTO interviews(interviewid)
VALUES (12312313);
INSERT INTO interviews(interviewid)
VALUES (12312314);
INSERT INTO interviews(interviewid, notes, provisional_license)
VALUES (12312322, 'Client has previous driving experience - taken 2 months of weekly lessons in the past', 'y');

INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312315, '2016-12-23 09:30:00', 14343434, 14438496, 'test');
INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312316, '2017-01-20 17:15:00', 45665453, 10432903, 'test');
INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312320, '2016-12-21 12:30:00', 14343434, 14438496, 'test');
INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312321, '2016-12-22 14:30:00', 14343434, 14438496, 'test');
INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312324, '2017-01-09 14:00:00', 14343434, 14438496, 'test');
INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312325, '2017-01-09 14:00:00', 45665453, 10432903, 'test');

-- Past tests
INSERT INTO tests(testid, result, type, note)
VALUES (12312315, 'fail', 'driving', 'Crashed');
INSERT INTO tests(testid, result, type, note)
VALUES (12312316, 'pass', 'written', '');
INSERT INTO tests(testid, result, type, note)
VALUES (12312320, 'fail', 'driving', 'Crashed again');
INSERT INTO tests(testid, result, type, note)
VALUES (12312321, 'fail', 'driving', 'Crashed a third time');
INSERT INTO tests(testid, result, type, note)
VALUES (12312324, 'fail', 'driving', 'Crashed a fourth time');
INSERT INTO tests(testid, result, type)
VALUES (12312325, 'pass', 'driving');


INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312317, '2016-12-05 09:20:00', 14438497, 14438496, 'lesson');
INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312318, '2016-12-05 11:45:00', 12312333, 85923849, 'lesson');
INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312319, '2016-11-24 16:00:00', 83454356, 04729123, 'lesson');
INSERT INTO meetings(meetingid, datetime, clientid, staffid, type)
VALUES (12312323, '2017-02-24 16:00:00', 83454356, 04729123, 'lesson');

INSERT INTO lessons(lessonid, miles_driven, notes)
VALUES (12312317, 3.2, 'Progressing well.');
INSERT INTO lessons(lessonid, miles_driven, notes)
VALUES (12312318, 2.8, 'More work needed on parallel parking.');
INSERT INTO lessons(lessonid, miles_driven, notes)
VALUES (12312319, 3, 'Ready for test.');
INSERT INTO lessons(lessonid)
VALUES (12312323);

-- Future tests
call db14438496.schedule_test(14343434, 14438496, 85923849, '2017-01-22 16:00:00', 'driving');
call db14438496.schedule_test(14343434, 14438496, 85923849, '2017-01-21 18:00:00', 'written');

INSERT INTO faults(faultid, reg, description)
VALUES (1, 'X631ENV', 'Faulty headgasket');
INSERT INTO faults(faultid, reg, description)
VALUES (2, 'X631ENV', 'Broken taillight');
INSERT INTO faults(faultid, reg, description)
VALUES (3, 'AB05CDE', 'Faulty seatbelt');
INSERT INTO faults(faultid, reg, description)
VALUES (4, 'AB05CDE', 'Worn clutch');
INSERT INTO faults(faultid, reg, description)
VALUES (5, 'AB05CDE', 'Broken windscreen wipers');