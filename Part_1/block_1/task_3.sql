
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
    status_cell BOOLEAN NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (id_section)
        REFERENCES sections (id)
);

--Таблица №4 - Груз: Штрих код груза (продукта) | ID ячейки | Классификация груза
CREATE TABLE items
(
    bar_code BIGSERIAL NOT NULL
    CONSTRAINT valid_bar_code CHECK (1000000000000 <= bar_code <= 9999999999999),
    id_cell INT,
    classification TEXT,

    PRIMARY KEY (bar_code),
    FOREIGN KEY (id_cell)
        REFERENCES cells (id)
);


