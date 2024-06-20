CREATE TABLE warehouse
(
    id SERIAL UNIQUE,
    name_wh TEXT,
    address_wh TEXT NOT NULL,
    phone_wh TEXT NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE sections
(
    id SERIAL UNIQUE,
    id_wh REFERENCES warehouse (id),
    row INTEGER NOT NULL,
    segment TEXT,

    PRIMARY KEY (id)
);


Таблица №4 - Груз: Штрих код груза (продукта) | ID ячейки

CREATE TABLE cells
(
    id SERIAL UNIQUE,
    id_section REFERENCES sections (id),
    num_cell INTEGER NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE items
(
    bar_code SERIAL UNIQUE,
    id_cell REFERENCES cells (id),

    PRIMARY KEY (bar_code)
)
