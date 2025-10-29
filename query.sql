CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TABLE profiles (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users (id),
    image TEXT,
    phone VARCHAR(20),
    address VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    user_id INT REFERENCES users (id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TABLE sessions (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users (id),
    session_token TEXT UNIQUE NOT NULL,
    login_time TIMESTAMP WITH TIME ZONE NOT NULL,
    expired_time TIMESTAMP WITH TIME ZONE NOT NULL,
    ip_address VARCHAR(20),
    device VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TABLE password_resets (
    id SERIAL PRIMARY KEY,
    old_password TEXT NOT NULL,
    new_password TEXT NOT NULL,
    user_id INT REFERENCES users (id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TABLE auth_logs (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users (id),
    type_activity VARCHAR(20) NOT NULL,
    detail TEXT NOT NULL,
    ip_address VARCHAR(20),
    device VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TABLE permissions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);

CREATE TABLE role_permissions (
    id SERIAL PRIMARY KEY,
    role_id INT REFERENCES roles (id),
    permission_id INT REFERENCES permissions (id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_by INT,
    updated_by INT
);