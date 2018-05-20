--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.1.31.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 02.05.2018 11:35:20
-- Версия сервера: 5.7.21-log
-- Версия клиента: 4.1
--


-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка базы данных по умолчанию
--
USE programming_languages;

--
-- Описание для таблицы applying
--
DROP TABLE IF EXISTS applying;
CREATE TABLE applying (
  id_use INT(11) NOT NULL AUTO_INCREMENT,
  use_name VARCHAR(75) NOT NULL,
  PRIMARY KEY (id_use)
)
ENGINE = INNODB
AUTO_INCREMENT = 18
AVG_ROW_LENGTH = 2730
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы category
--
DROP TABLE IF EXISTS category;
CREATE TABLE category (
  id_category INT(11) NOT NULL AUTO_INCREMENT,
  category VARCHAR(55) NOT NULL,
  PRIMARY KEY (id_category)
)
ENGINE = INNODB
AUTO_INCREMENT = 31
AVG_ROW_LENGTH = 1820
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы firsttable
--
DROP TABLE IF EXISTS firsttable;
CREATE TABLE firsttable (
  id_pl SMALLINT(6) DEFAULT NULL,
  id_category INT(11) DEFAULT NULL,
  INDEX FK_firsttable_category_id_category (id_category),
  INDEX FK_firsttable_language_id_pl (id_pl)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 1092
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы language
--
DROP TABLE IF EXISTS language;
CREATE TABLE language (
  id_pl SMALLINT(6) NOT NULL AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  history TEXT DEFAULT NULL,
  logo VARCHAR(200) DEFAULT 'no_photo.png',
  create_year DATE DEFAULT NULL,
  libs_frameworks VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (id_pl),
  UNIQUE INDEX title (title)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы secondtable
--
DROP TABLE IF EXISTS secondtable;
CREATE TABLE secondtable (
  id_pl SMALLINT(6) DEFAULT NULL,
  id_use INT(11) DEFAULT NULL,
  INDEX FK_secondtable_applying_id_use (id_use),
  INDEX FK_secondtable_language_id_pl (id_pl)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 1820
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

-- 
-- Вывод данных для таблицы applying
--
INSERT INTO applying VALUES
(1, 'Back-end'),
(2, 'Embedded'),
(3, 'Enterprise'),
(4, 'Front-end'),
(6, 'Mobile dev'),
(14, 'Game dev');

-- 
-- Вывод данных для таблицы category
--
INSERT INTO category VALUES
(1, 'ГђЕёГ‘в‚¬ГђВѕГ‘вЂ ГђВµГђВґГ‘Ж’Г‘в‚¬ГђВЅГ‘вЂ№ГђВ№'),
(2, 'ГђЕѕГђВ±Г‘Е ГђВµГђВєГ‘вЂљГђВЅГђВѕ-ГђВѕГ‘в‚¬ГђВёГђВµГђВЅГ‘вЂљГђВёГ‘в‚¬ГђВѕГђВІГђВ°ГђВЅГђВЅГ‘вЂ№ГђВ№'),
(4, 'ГђЛњГђВјГђВїГђВµГ‘в‚¬ГђВ°Г‘вЂљГђВёГђВІГђВЅГ‘вЂ№ГђВ№'),
(5, 'ГђЕ“Г‘Ж’ГђВ»Г‘Е’Г‘вЂљГђВёГђВїГђВ°Г‘в‚¬ГђВ°ГђВґГђВёГђВіГђВјГђВ°ГђВ»Г‘Е’ГђВЅГ‘вЂ№ГђВ№'),
(6, 'ГђВќГђВёГђВ·ГђВєГђВѕГђВіГђВѕ Г‘Ж’Г‘в‚¬ГђВѕГђВІГђВЅГ‘ВЏ'),
(7, 'ГђвЂ™Г‘вЂ№Г‘ВЃГђВѕГђВєГђВѕГђВіГђВѕ Г‘Ж’Г‘в‚¬ГђВѕГђВІГђВЅГ‘ВЏ'),
(8, 'ГђЕЎГђВѕГђВјГђВїГђВёГђВ»ГђВёГ‘в‚¬Г‘Ж’ГђВµГђВјГ‘вЂ№ГђВ№'),
(9, 'ГђЛњГђВЅГ‘вЂљГђВµГ‘в‚¬ГђВїГ‘в‚¬ГђВµГ‘вЂљГђВёГ‘в‚¬Г‘Ж’ГђВµГђВјГ‘вЂ№ГђВ№'),
(24, 'ГђВ¤Г‘Ж’ГђВЅГђВєГ‘вЂ ГђВёГђВѕГђВЅГђВ°ГђВ»Г‘Е’ГђВЅГ‘вЂ№ГђВ№');

-- 
-- Вывод данных для таблицы firsttable
--
INSERT INTO firsttable VALUES
(3, 1),
(3, 4),
(3, 6),
(3, 8),
(3, 9),
(3, 19),
(2, 1),
(2, 5),
(2, 6),
(2, 9),
(1, 1),
(1, 4),
(1, 5),
(1, 8),
(1, 24);

-- 
-- Вывод данных для таблицы language
--
INSERT INTO language VALUES
(1, 'JavaScript', 'JavaScript Гўв‚¬вЂќ ГђВјГ‘Ж’ГђВ»Г‘Е’Г‘вЂљГђВёГђВїГђВ°Г‘в‚¬ГђВ°ГђВґГђВёГђВіГђВјГђВµГђВЅГђВЅГ‘вЂ№ГђВ№ Г‘ВЏГђВ·Г‘вЂ№ГђВє ГђВїГ‘в‚¬ГђВѕГђВіГ‘в‚¬ГђВ°ГђВјГђВјГђВёГ‘в‚¬ГђВѕГђВІГђВ°ГђВЅГђВёГ‘ВЏ. ГђЕёГђВѕГђВґГђВґГђВµГ‘в‚¬ГђВ¶ГђВёГђВІГђВ°ГђВµГ‘вЂљ ГђВѕГђВ±Г‘Е ГђВµГђВєГ‘вЂљГђВЅГђВѕ-ГђВѕГ‘в‚¬ГђВёГђВµГђВЅГ‘вЂљГђВёГ‘в‚¬ГђВѕГђВІГђВ°ГђВЅГђВЅГ‘вЂ№ГђВ№, ГђВёГђВјГђВїГђВµГ‘в‚¬ГђВ°Г‘вЂљГђВёГђВІГђВЅГ‘вЂ№ГђВ№ ГђВё Г‘вЂћГ‘Ж’ГђВЅГђВєГ‘вЂ ГђВёГђВѕГђВЅГђВ°ГђВ»Г‘Е’ГђВЅГ‘вЂ№ГђВ№ Г‘ВЃГ‘вЂљГђВёГђВ»ГђВё. ГђВЇГђВІГђВ»Г‘ВЏГђВµГ‘вЂљГ‘ВЃГ‘ВЏ Г‘в‚¬ГђВµГђВ°ГђВ»ГђВёГђВ·ГђВ°Г‘вЂ ГђВёГђВµГђВ№ Г‘ВЏГђВ·Г‘вЂ№ГђВєГђВ° ECMAScript.', 'js.png', '1995-12-04', 'jQuery, Angular, Node.js, Vue.js, React'),
(2, 'Python', 'Python Гўв‚¬вЂќ ГђВІГ‘вЂ№Г‘ВЃГђВѕГђВєГђВѕГ‘Ж’Г‘в‚¬ГђВѕГђВІГђВЅГђВµГђВІГ‘вЂ№ГђВ№ Г‘ВЏГђВ·Г‘вЂ№ГђВє ГђВїГ‘в‚¬ГђВѕГђВіГ‘в‚¬ГђВ°ГђВјГђВјГђВёГ‘в‚¬ГђВѕГђВІГђВ°ГђВЅГђВёГ‘ВЏ ГђВѕГђВ±Г‘вЂ°ГђВµГђВіГђВѕ ГђВЅГђВ°ГђВ·ГђВЅГђВ°Г‘вЂЎГђВµГђВЅГђВёГ‘ВЏ, ГђВѕГ‘в‚¬ГђВёГђВµГђВЅГ‘вЂљГђВёГ‘в‚¬ГђВѕГђВІГђВ°ГђВЅГђВЅГ‘вЂ№ГђВ№ ГђВЅГђВ° ГђВїГђВѕГђВІГ‘вЂ№Г‘Л†ГђВµГђВЅГђВёГђВµ ГђВїГ‘в‚¬ГђВѕГђВёГђВ·ГђВІГђВѕГђВґГђВёГ‘вЂљГђВµГђВ»Г‘Е’ГђВЅГђВѕГ‘ВЃГ‘вЂљГђВё Г‘в‚¬ГђВ°ГђВ·Г‘в‚¬ГђВ°ГђВ±ГђВѕГ‘вЂљГ‘вЂЎГђВёГђВєГђВ° ГђВё Г‘вЂЎГђВёГ‘вЂљГђВ°ГђВµГђВјГђВѕГ‘ВЃГ‘вЂљГђВё ГђВєГђВѕГђВґГђВ°. ГђВЎГђВёГђВЅГ‘вЂљГђВ°ГђВєГ‘ВЃГђВёГ‘ВЃ Г‘ВЏГђВґГ‘в‚¬ГђВ° Python ГђВјГђВёГђВЅГђВёГђВјГђВ°ГђВ»ГђВёГ‘ВЃГ‘вЂљГђВёГ‘вЂЎГђВµГђВЅ. ', 'python.png', '1991-02-20', 'Django, TurboGears, Pylons, Zope, Twisted'),
(3, 'Java', 'Java Гўв‚¬вЂќ Г‘ВЃГђВёГђВ»Г‘Е’ГђВЅГђВѕ Г‘вЂљГђВёГђВїГђВёГђВ·ГђВёГ‘в‚¬ГђВѕГђВІГђВ°ГђВЅГђВЅГ‘вЂ№ГђВ№ ГђВѕГђВ±Г‘Е ГђВµГђВєГ‘вЂљГђВЅГђВѕ-ГђВѕГ‘в‚¬ГђВёГђВµГђВЅГ‘вЂљГђВёГ‘в‚¬ГђВѕГђВІГђВ°ГђВЅГђВЅГ‘вЂ№ГђВ№ Г‘ВЏГђВ·Г‘вЂ№ГђВє ГђВїГ‘в‚¬ГђВѕГђВіГ‘в‚¬ГђВ°ГђВјГђВјГђВёГ‘в‚¬ГђВѕГђВІГђВ°ГђВЅГђВёГ‘ВЏ, Г‘в‚¬ГђВ°ГђВ·Г‘в‚¬ГђВ°ГђВ±ГђВѕГ‘вЂљГђВ°ГђВЅГђВЅГ‘вЂ№ГђВ№ ГђВєГђВѕГђВјГђВїГђВ°ГђВЅГђВёГђВµГђВ№ Sun Microsystems.', 'java.png', '1995-05-23', 'Java Server Faces, Stuts2, Google Web Toolkit');

-- 
-- Вывод данных для таблицы secondtable
--
INSERT INTO secondtable VALUES
(3, 3),
(3, 6),
(3, 14),
(2, 1),
(2, 4),
(2, 6),
(1, 4),
(1, 6),
(1, 14);

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;