CREATE TABLE IF NOT EXISTS Dim_Customers (
  id_customer VARCHAR(7) NOT NULL ,
  gender VARCHAR(10),
  age INT,
  PRIMARY KEY (id_customer)
);


CREATE TABLE IF NOT EXISTS Dim_Products (
  id_dim_product INT NOT NULL,
  category VARCHAR(50),
  PRIMARY KEY (id_dim_product)
);


CREATE TABLE IF NOT EXISTS Dim_Payment_Methods (
  id_dim_payment_method INT NOT NULL,
  payment_method_name VARCHAR(20),
  PRIMARY KEY (id_dim_payment_method)
);

CREATE TABLE IF NOT EXISTS Dim_Shopping_Malls (
  id_dim_shopping_mall INT NOT NULL,
  shopping_mall_name VARCHAR(100),
  PRIMARY KEY (id_dim_shopping_mall)
);

CREATE TABLE IF NOT EXISTS Dim_Time (
  id_dim_time INT NOT NULL,
  invoice_date DATE NOT NULL,
  day INT,
  month INT,
  year INT,
  PRIMARY KEY (id_dim_time)
);

CREATE TABLE IF NOT EXISTS Invoice_Sales (
  id_invoice VARCHAR(7) NOT NULL,
  id_customer VARCHAR(7) NOT NULL,
  id_dim_product INT,
  id_dim_payment_method INT,
  id_dim_shopping_mall INT,
  id_dim_time INT,

  price DECIMAL(10,2),
  quantity INT,

  PRIMARY KEY (id_invoice),

    FOREIGN KEY (id_customer) REFERENCES Dim_Customers(id_customer),
    FOREIGN KEY (id_dim_product) REFERENCES Dim_Products(id_dim_product),
    FOREIGN KEY (id_dim_payment_method) REFERENCES Dim_Payment_Methods(id_dim_payment_method),
    FOREIGN KEY (id_dim_shopping_mall) REFERENCES Dim_Shopping_Malls(id_dim_shopping_mall),
    FOREIGN KEY (id_dim_time) REFERENCES Dim_Time(id_dim_time)
) 

