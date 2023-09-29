CREATE TABLE change (
        shift_id INTEGER PRIMARY KEY NOT NULL,
        сontract_id INTEGER PRIMARY KEY NOT NULL,
        order_id INTEGER PRIMARY KEY NOT NULL,
        supplier_id INTEGER PRIMARY KEY NOT NULL,
        responsible_demployee_id INTEGER PRIMARY KEY NOT NULL,
        name_of_works VARCHAR(20),
        work_id INTEGER PRIMARY KEY NOT NULL,
        unit_images VARCHAR(60),
        price_per_unit_of_measurement VARCHAR(100),
        square_footage VARCHAR(80),
        material_id INTEGER PRIMARY KEY NOT NULL,
        customer_id INTEGER PRIMARY KEY NOT NULL,
        warehouse_id INTEGER PRIMARY KEY NOT NULL
);

CREATE TABLE orders (
        order_id INTEGER PRIMARY KEY NOT NULL,
        customers_personal_information VARCHAR(50),
        address VARCHAR (50),
        shift_id INTEGER PRIMARY KEY NOT NULL
);

CREATE TABLE materials (
        material_id INTEGER PRIMARY KEY NOT NULL,
        names VARCHAR(10),
        price INTEGER,
        material_type_id INTEGER PRIMARY KEY NOT NULL
);

CREATE TABLE suppliers (
        id INTEGER PRIMARY KEY NOT NULL,
        name_of_the_organization VARCHAR(10),
        address VARCHAR(50)
);

CREATE TABLE contract (
        contract_id INTEGER PRIMARY KEY NOT NULL,
        personal_information VARCHAR(40),
        date_of_conclusion INTEGER,
        shift_id INTEGER PRIMARY KEY NOT NULL,
        customer_id INTEGER PRIMARY KEY NOT NULL
);

CREATE TABLE price_list (
        work_id INTEGER PRIMARY KEY NOT NULL,
        name_of_works VARCHAR(20),
        price_per_unit_measurement VARCHAR(40)
);

CREATE TABLE customer (
        customer_id INTEGER PRIMARY KEY NOT NULL,
        names VARCHAR(10),
        full_name VARCHAR(20),
        personal_information VARCHAR(50),
        address VARCHAR(30),
        type VARCHAR(60),
        kPP VARCHAR(15),
        iNN VARCHAR(15),
        telephone VARCHAR(10),
        passport VARCHAR(20)
);

CREATE TABLE staff (
        id INTEGER PRIMARY KEY NOT NULL,
        names VARCHAR(30),
        full_name VARCHAR(30),
        experience VARCHAR(5),
        post VARCHAR(10)
);

CREATE TABLE warehouse (
        warehouse_id INTEGER PRIMARY KEY NOT NULL,
        n_warehouse INTEGER,
        address VARCHAR(20),
        name_of_the_material VARCHAR(30),
        remains VARCHAR(20),
        supplier VARCHAR(10)
);