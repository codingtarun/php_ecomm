use php_ecomm_db;

-- Deleting all tables
SET FOREIGN_KEY_CHECKS=0; -- Checking for foreign key constraints and turing them off
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;

-- Creating ROLES table

CREATE TABLE IF NOT EXISTS `roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Creating USERS table 

CREATE TABLE IF NOT EXISTS `users` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` varchar(30) NOT NULL,
    `email_id` varchar(30) NOT NULL,
    `phone_no` varchar(12) NOT NULL,
    `role_id` INT NOT NULL,
    `password` varchar(255) NOT NULL,
    `is_deleted` boolean DEFAULT(0),
    PRIMARY KEY (id),
    FOREIGN KEY(role_id) REFERENCES roles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Creating CATEGORIES table 

CREATE TABLE IF NOT EXISTS `categories` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `image` VARCHAR(50) NOT NULL DEFAULT('product_avatar.jpg'),
    `status` boolean DEFAULT(1),
    `is_deleted` boolean DEFAULT(0),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Creating PRODUCTS table

CREATE TABLE IF NOT EXISTS `products` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(100) NOT NULL,
    `description` TEXT NOT NULL,
    `category_id` int NOT NULL,
    `image` VARCHAR(100) NOT NULL DEFAULT('product_avatar.jpg'),
    `price` DECIMAL(10,2) NOT NULL , -- MAX LIMIT (99999999.99)
    `status` BOOLEAN NOT NULL DEFAULT(1),
    `is_deleted` BOOLEAN NOT NULL DEFAULT(0),
    FOREIGN KEY(category_id) REFERENCES categories(id) on DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Creating Coupen table 

CREATE TABLE IF NOT EXISTS `coupens` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `code` VARCHAR(20) NOT NULL,
    `status` BOOLEAN NOT NULL DEFAULT(1),
    `id_deleted` BOOLEAN NOT NULL DEFAULT(0)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Creating ORDERS table 

CREATE TABLE IF NOT EXISTS `orders` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_details` JSON NOT NULL, -- Declaring JSON Data type.
    `user_id` INT NOT NULL,
    `amount` DECIMAL(10,2) NOT NULL,
    `status` VARCHAR(20) NOT NULL,
    `coupen_id` INT NULL DEFAULT(0),
    `is_deleted` BOOLEAN NOT NULL DEFAULT(0),
    FOREIGN KEY(coupen_id) REFERENCES coupens(id) ON DELETE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- CREATE TABLE IF NOT EXISTS `products` (
--   `product_id` int(11) NOT NULL AUTO_INCREMENT,
--   `product_name` varchar(100) NOT NULL,
--   `product_category` varchar(100) NOT NULL,
--   `product_description` varchar(255) NOT NULL,
--   `product_image` varchar(255) NOT NULL,
--   `product_image2` varchar(255) NOT NULL,
--   `product_image3` varchar(255) NOT NULL,
--   `product_image4` varchar(255) NOT NULL,
--   `product_price` decimal(6,2) NOT NULL, /* 9999.99 */
--   `product_special_offer` integer(2) NOT NULL,
--   `product_color` varchar(100) NOT NULL,
--   PRIMARY KEY (`product_id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- CREATE TABLE IF NOT EXISTS `orders` (
--   `order_id` int(11) NOT NULL AUTO_INCREMENT,
--   `order_cost` decimal(6,2) NOT NULL,
--   `order_status` varchar(100) NOT NULL DEFAULT 'on_hold',
--   `user_id` int(11) NOT NULL,
--   `user_phone` int(11) NOT NULL,
--   `user_city` varchar(255) NOT NULL,
--   `user_address` varchar(255) NOT NULL,
--   `order_date` DATETIME  NOT NULL DEFAULT CURRENT_TIMESTAMP,
--   PRIMARY KEY (`order_id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- CREATE TABLE IF NOT EXISTS `order_items` (
--   `item_id` int(11) NOT NULL AUTO_INCREMENT,
--   `order_id` int(11) NOT NULL,
--   `product_id` varchar(255) NOT NULL,
--   `product_name` varchar(255) NOT NULL,
--   `product_image` varchar(255) NOT NULL,
--   `user_id` int(11) NOT NULL,
--   `order_date` DATETIME  NOT NULL DEFAULT CURRENT_TIMESTAMP,
--   PRIMARY KEY (`item_id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- CREATE TABLE IF NOT EXISTS `users` (
--   `user_id` int(11) NOT NULL AUTO_INCREMENT,
--   `user_name` varchar(100) NOT NULL,
--   `user_email` varchar(100) NOT NULL,
--   `user_password` varchar(100) NOT NULL,
--   PRIMARY KEY (`user_id`),
--   UNIQUE KEY `UX_Constraint` (`user_email`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- CREATE TABLE IF NOT EXISTS `payments` (
--   `payment_id` int(11) NOT NULL AUTO_INCREMENT,
--   `order_id` int(11) NOT NULL,
--   `user_id` int(11) NOT NULL,
--   `transaction_id` varchar(250) NOT NULL,
--   PRIMARY KEY (`payment_id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

