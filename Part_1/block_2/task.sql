
-- -------------------------------------------------------------------------------
-- СОЗДАНИЕ ТАБЛИЦ
-- -------------------------------------------------------------------------------

--Таблица №1 - Склад: ID | Наименование склада | Адрес | Контактный телефон
CREATE TABLE warehouse
(
    id SERIAL,
    ltd TEXT NOT NULL,
    name_wh TEXT,
    address_wh TEXT NOT NULL,
    phone_wh TEXT NOT NULL,

    PRIMARY KEY (id)
);

--Таблица №2 - Секция: ID | ID склада | Ряд | Сектор
CREATE TABLE sections
(
    id SERIAL,
    id_wh INT,
    row INTEGER NOT NULL,
    segment TEXT,

    PRIMARY KEY (id),
    FOREIGN KEY (id_wh)
        REFERENCES warehouse (id)
);

--Таблица №3 - Ячейки: ID | ID секции | Номер места (ячейки)
CREATE TABLE cells
(
    id SERIAL,
    id_section INT,
    num_cell INTEGER NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (id_section)
        REFERENCES sections (id)
);

--Таблица №4 - Груз: Штрих код груза (продукта) | ID ячейки | Классификация груза
CREATE TABLE items
(
    bar_code BIGSERIAL NOT NULL
    CHECK (1000000000000 <= bar_code <= 9999999999999),
    id_cell INT,
    classification TEXT,

    PRIMARY KEY (bar_code),
    FOREIGN KEY (id_cell)
        REFERENCES cells (id)
);


-- -------------------------------------------------------------------------------
-- ЗАПРОСЫ НА ЗАПОЛНЕНИЕ ТАБЛИЦ
-- -------------------------------------------------------------------------------

-- Заполнение таблицы №1 - Склад:
INSERT INTO warehouse (name_wh, ltd, address_wh, phone_wh)
    VALUES ("ЛИНК", "ЛИНК", "300028, РФ, Тульская область, г. Тула, ул. Болдина, д. 94", "+7(4872)21-22-14 (доб. 105)"),
        ("ПЕТРОВСКОЕ_РФЦ", "OZON", "143541, РФ, Московская область, г. Истра, с. Петровское, территория МПСК Ориентир-Запад, зд. 1А", "+7(495)232-10-00 (доб. 71953)"),
        ("ЖУКОВСКИЙ_РФЦ", "OZON", "140182, РФ, Московская область, г. Жуковский, район Замоскворечье, д. 457, стр. 5", "+7 915 130-41-80"),
        ("СЦ_Омск_ВБ", "Wildberries", "644105, РФ, Омская область, г. Омск, ул. Раздольная, д. 1А", "+7 974 152-42-31")

-- Заполнение таблицы №2 - Секция:
INSERT INTO sections (, row, segment)
    VALUES (ro)



