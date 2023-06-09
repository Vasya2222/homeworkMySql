
-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
-- Выведите 5 максимальных заработных плат (saraly)
-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
-- Найдите количество специальностей
-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет


CREATE DATABASE IF NOT EXISTS homework_3_mqsql;

# 2. Подключение к БД
USE homework_3_mqsql;

# 3. Создание таблицы 
DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8,2),
    age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
INSERT  staff (firstname, lastname, post, seniority, salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 50000, 60);
SELECT * FROM staff;

-- Выведите 5 максимальных заработных плат (saraly)
SELECT 
	id,
    salary,
    CONCAT(firstname," ", lastname) AS fullname
FROM staff
ORDER BY salary LIMIT 5;

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
SELECT 
	id,
    salary,
    CONCAT(firstname," ", lastname) AS fullname
FROM staff
ORDER BY salary;

SELECT 
	id,
    salary,
    CONCAT(firstname," ", lastname) AS fullname
FROM staff
ORDER BY salary DESC;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT 
	post,
    SUM(salary) AS sum_s
FROM staff
GROUP BY post;
-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT 
	count(post)
FROM staff
WHERE post = "Рабочий" AND age > 24 AND age <= 49
GROUP BY post;
-- Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS count_post
FROM staff;
-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT 
	post,
    AVG(age) AS avg_age
FROM staff
WHERE age < 30
GROUP BY post;