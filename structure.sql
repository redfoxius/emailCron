CREATE TABLE IF NOT EXISTS `items` (
  id int(11) unsigned NOT NULL auto_increment, -- ID объявления
  user_id int(11) unsigned NOT NULL default 0, -- ID пользователя
  status tinyint(1) unsigned NOT NULL default 1, -- статус объявления
  title varchar(150) NOT NULL default '', -- заголовок объявления
  link text, -- ссылка на страницу просмотра объявления
  descr text, -- описание объявления
  publicated_to timestamp NOT NULL default '0000-00-00 00:00:00', -- срок окончания публикации объявления
  last_checked timestamp NOT NULL default '0000-00-00 00:00:00', -- дата последней проверки CRON-скриптом
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


CREATE TABLE IF NOT EXISTS `users` (
  id int(11) unsigned NOT NULL auto_increment, -- ID пользователя
  email text, -- Email пользователя
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
