
-- -------------------------------------------------------------------------------
-- СОЗДАНИЕ ТАБЛИЦ
-- -------------------------------------------------------------------------------

--Таблица №1 - Склад: ID | Наименование склада | Адрес | Контактный телефон
CREATE TABLE warehouse
(
    id SERIAL,
    name_wh TEXT,
    address_wh TEXT NOT NULL,
    phone_wh TEXT NOT NULL,

    PRIMARY KEY (id)
);

--Таблица №2 - Секция: ID | ID склада | Ряд | Сектор
CREATE TABLE sections
(
    id SERIAL,
    id_wh INT REFERENCES warehouse (id),
    row INTEGER NOT NULL,
    segment TEXT,

    PRIMARY KEY (id)
);

--Таблица №3 - Ячейки: ID | ID секции | Номер места (ячейки)
CREATE TABLE cells
(
    id SERIAL,
    id_section INT REFERENCES sections (id),
    num_cell INTEGER NOT NULL,

    PRIMARY KEY (id)
);

--Таблица №4 - Груз: Штрих код груза (продукта) | ID ячейки | Классификация груза
CREATE TABLE items
(
    bar_code NUMERIC(13,0) UNIQUE,
    id_cell INT REFERENCES cells (id),
    classification TEXT

    PRIMARY KEY (bar_code)
)


-- -------------------------------------------------------------------------------
-- ЗАПРОСЫ НА ЗАПОЛНЕНИЕ ТАБЛИЦ
-- -------------------------------------------------------------------------------

INSERT INTO warehouse SET name_wh='ЛИНК', address_wh='300028, РФ, Тульская область, г. Тула, ул. Болдина, д. 94', phone_wh='+7(4872)21-22-14 (доб. 105)';
INSERT INTO warehouse SET name_wh='ПЕТРОВСКОЕ_РФЦ', address_wh='143541, Московская обл., г. Истра, с. Петровское, территория МПСК Ориентир-Запад, зд. 1А', phone_wh='+7(495)232-10-00 (доб. 71953)';
INSERT INTO warehouse SET name_wh='ЖУКОВСКИЙ_РФЦ', address_wh='140182, Московская область, г. Жуковский, район Замоскворечье, д. 457, стр. 5', phone_wh='+7 915 130-41-80';


INSERT INTO sections SET name_wh='ЖУКОВСКИЙ_РФЦ', address_wh='140182, Московская область, г. Жуковский, район Замоскворечье, д. 457, стр. 5', phone_wh='+7 915 130-41-80';