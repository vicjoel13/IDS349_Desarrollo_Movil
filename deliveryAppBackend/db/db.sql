CREATE TABLE users(
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    phone VARCHAR(80) NOT NULL UNIQUE,
    image VARCHAR(255) NULL,
    password VARCHAR(255) NOT NULL,
    is_available BOOLEAN NULL,
    session_token VARCHAR(255) NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TIMESTAMP(0) NOT NULL
);


INSERT INTO users(
    email,
    name,
    lastname,
    phone,
    password,
    created_at,
    updated_at
) 
VALUES(
    'bassildom@gmail.com',
    'Jorge',
    'Perez',
    '8095555555',
    '123456',
    '2023-12-08',
    '2023-12-08'
);