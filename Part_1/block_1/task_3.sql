
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
    bar_code SERIAL UNIQUE,
    id_cell INT REFERENCES cells (id),
    classification TEXT

    PRIMARY KEY (bar_code)
)