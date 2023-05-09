
-- 3  Обеспечить с помощью операторов Insert, Update, Delete обновление
--информации в указанных таблицах.
INSERT INTO auto (Car_number, brand, Start_mileage, Load_copasity)
VALUES(@Car_number, @brand, @Start_mileage, @Load_copasity);

INSERT INTO driver (Last_name, Category, Expearence, Address, Birth_year)
VALUES(@Last_name, @Category, @Expearence, @Address, @Birth_year);

INSERT INTO rent_order (Date, Driver_id, Auto_id, Mileage, Weight, Price)
VALUES(@Date, @Driver_id, @Auto_id, @Mileage, @Weight, @Price);

INSERT INTO user (Login, HPasword, AdmRule, Driver_id)
VALUES (@Login, @HPasword, @AdmRule, @Driver_id)


Arguments:
@user_name = 'user1'
@user_dr_id = (select id from driver where last_name = @user_name)

--driver info
SELECT last_name, category, expearence, address, birth_year 
FROM driver 
WHERE id = @user_dr_id;
--tested


-- 2  по водителю, выполнившему наименьшее количество поездок, – все сведения
--и количество полученных денег; а если водитель совершивших минимальное количество поездок несколько?
with res as
(select d.Last_name, d.Category, d.Expearence, d.Address, d.Birth_year, count(driver_id) as num, ifnull(sum(price)*0.2, 0) as total
from driver d left join rent_order 
on d.id = driver_id
group by driver_id)
select r.Last_name, r.Category, r.Expearence, r.Address, r.Birth_year, r.total
from res r
where num = (select min(num) from res) 
limit 1; --?
--tested~~
 
--(*):

--по указанной машине – общий пробег и общую массу перевезенных грузов (*)
Arguments:
@carNum = 'AA0000'

SELECT a.start_mileage + ifnull(SUM(o.mileage), 0) AS total_distance, SUM(o.Weight) AS total_cargo_weight 
FROM auto a left join rent_order o 
ON a.id = o.auto_id
WHERE a.Car_number = @carNum;
--tested

--по указанному водителю – перечень выполненных заказов за указанный период (*)
Arguments: 
@start_date = 'yyyy-mm-dd'
@end_date = 'yyyy-mm-dd'

SELECT [Date], auto_id, Mileage, Weight, Price FROM rent_order 
WHERE driver_id = @user_dr_id
AND
[date] BETWEEN @start_date AND @end_date;
--tested

--по каждому водителю – общее количество поездок, общую массу
--перевезенных грузов, сумму заработанных денег (*);
SELECT d.last_name, COUNT(*) AS total_trips, SUM(weight) AS total_cargo_weight, SUM(price)*0.2 AS total_earnings 
FROM driver d left join rent_order o
ON d.id = o.driver_id
group by driver_id;
--tested

--по автомашине с наибольшим общим пробегом – все сведения;
SELECT Car_number, brand, Start_mileage, Load_copasity 
FROM auto 
WHERE id = (SELECT auto_id FROM rent_order GROUP BY auto_id ORDER BY SUM(mileage) DESC LIMIT 1);

with res as 
(SELECT Car_number, brand, Start_mileage, Load_copasity, a.start_mileage + ifnull(SUM(o.mileage), 0) AS total_distance
FROM auto a left join rent_order o 
ON a.id = o.auto_id
group by a.id)
select Car_number, brand, Start_mileage, Load_copasity, total_distance
from res 
where res.total_distance = (select max(total_distance) from res);
--tested


-- 4  Создать функцию, который при добавлении информации в таблицу заказов,
--проверяет, не превышает ли масса груза грузоподъемности машины, и если это так,
--то запрещает помещать информацию в таблицу(*). не моя забота


-- 5  Создать функцию, которая за указанный период определяет количество денег,
--начисленных каждому водителю за перевозки. В качестве параметра передать
--начальную дату периода и конечную дату периода. Результаты занести в
--специальную таблицу (*).
Arguments: 
@start_date = 'yyyy-mm-dd'
@end_date = 'yyyy-mm-dd'

CREATE VIEW special_table
AS 
SELECT d.last_name, COUNT(*) AS total_trips, SUM(weight) AS total_cargo_weight, SUM(price)*0.2 AS total_earnings 
FROM driver d left join rent_order o
ON d.id = o.driver_id
where [date] BETWEEN @start_date AND @end_date
group by driver_id;
--tested


-- 6  Создать функцию, которая за указанный период определяет количество денег,
--начисленных указанному водителю за перевозки. В качестве параметра передать
--начальную дату периода, конечную дату периода и фамилию водителя(*).
Arguments: 
@start_date = 'yyyy-mm-dd'
@end_date = 'yyyy-mm-dd'
@user_name = 'user1'
@user_dr_id = (select id from driver where last_name = @user_name)

SELECT d.last_name as driver_name, COUNT(*) AS total_trips, ifnull(SUM(weight), 0) AS total_cargo_weight, ifnull(SUM(price), 0)*0.2 AS total_earnings 
FROM driver d left join rent_order o
ON d.id = o.driver_id
where driver_id = @user_dr_id and
[date] BETWEEN @start_date AND @end_date
group by driver_id;
--tested