PRAGMA foreign_keys = ON;

-- Справочник клиентов 
CREATE TABLE IF NOT EXISTS dim_customers (
    customer_id INTEGER PRIMARY KEY,
    full_name TEXT,
    email TEXT,
    phone TEXT,
    city TEXT,
    created_at TIMESTAMP
);

-- Справочник товаров 
CREATE TABLE IF NOT EXISTS dim_products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price REAL,
    currency TEXT,
    is_active BOOLEAN
);

-- Таблица фактов: Заказы
CREATE TABLE IF NOT EXISTS fact_orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    unit_price REAL,
    currency TEXT,
    order_timestamp TIMESTAMP,
    status TEXT,
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id)
);

-- Таблица фактов: Платежи
CREATE TABLE IF NOT EXISTS fact_payments (
    payment_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    payment_method TEXT,
    amount REAL,
    currency TEXT,
    payment_timestamp TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES fact_orders(order_id)
);

-- Таблица фактов: Клики / События
CREATE TABLE IF NOT EXISTS fact_events (
    event_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    event_type TEXT,
    event_timestamp TIMESTAMP,
    product_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id) 
);