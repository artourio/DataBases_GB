/* 1. Преобразовать дату начала потока в таблице потоков к виду год-месяц-день. Используйте команду UPDATE */

sqlite> UPDATE streams SET started_at = SUBSTR (started_at, 7, 4) ||'-'|| SUBSTR (started_at, 4,2) ||'-'|| SUBSTR (started_at, 1,2);

/* 2. Получите идентификатор и номер потока, запланированного на самую позднюю дату. */

sqlite> SELECT id, number, MAX(started_at) AS latest_start FROM streams;   /* incorrect */
sqlite> SELECT id, number FROM streams GROUP BY started_at DESC LIMIT 1;  /* correct */

/* 3. Покажите уникальные значения года по датам начала потоков обучения. */

sqlite> SELECT DISTINCT(SUBSTR(started_at, 1,4)) AS year FROM streams GROUP BY started_at;

/* 4. Найдите количество преподавателей в базе данных. Выведите искомое значение в столбец с именем total_teachers. */

sqlite> SELECT COUNT(1) total_teachers FROM teachers;

/* 5. Покажите даты начала двух последних по времени потоков. */

sqlite> SELECT started_at FROM streams ORDER by started_at  DESC LIMIT 2;

/* 6. Найдите среднюю успеваемости учеников по потокам преподавателя с идентификатором равным 1. */

sqlite> SELECT AVG(performance) AS av_perform  FROM grades WHERE teacher_id = 1 GROUP by stream_id;
sqlite> SELECT AVG(performance) AS av_perform  FROM grades WHERE teacher_id = 1;

/* 7. найдите идентификаторы преподавателей, у которых средняя успеваемость по всем потокам меньше 4.8 */

sqlite> SELECT teacher_id, AVG(performance) AS av_perform FROM grades GROUP BY teacher_id HAVING av_perform < 4.8;


