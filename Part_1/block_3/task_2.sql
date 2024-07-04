-- -------------------------------------------------------------------------------
-- ОБЪЕДИНЕНИЕ В ТРАНЗАКЦИИ
-- -------------------------------------------------------------------------------

--Обновляем телефон склада с конкретным адресом:
BEGIN;
UPDATE warehouse
    SET phone_wh = "+79415674671";
    WHERE address_wh = "какой-то адрес"
COMMIT;

-- Забираем товар из ячейки, присв. ей статус, затем кладем товар в ячейку и снова меняем ей статус:
BEGIN;
UPDATE cells
    SET status_cell = FALSE
    JOIN items ON cells.id = items.id_cell
        WHERE bar_code = 12900921512;
SAVEPOINT after_delete_bar_code;
DELETE FROM items
    WHERE bar_code = 12900921512;
ROLLBACK after_delete_bar_code;
COMMIT;
