-- -------------------------------------------------------------------------------
-- ЗАПРОСЫ С ВЫБОРКАМИ, ОБЪЕДИНЯЮЩИМИ ДАННЫЕ ИЗ СВЯЗ. ТАБЛИЦ
-- -------------------------------------------------------------------------------

-- Выводим все данные из таблицы "Груз/предмет", для конкретного сектора и ряда склада с ID = 2:
SELECT * FROM items
    JOIN cells ON items.id_cell = cells.id
    JOIN sections ON cells.id_section = sections.id
        WHERE id_wh = 2 AND sections.row = 2 AND sections.segment = "A";

-- Удаляем строки из таблицы "Груз/предмет", если статус ячейки в таблице "Ячейки" равен False:
DELETE
    FROM items
    JOIN cells ON items.id_cell = cells.id
        WHERE cells.status_cell = FALSE;
