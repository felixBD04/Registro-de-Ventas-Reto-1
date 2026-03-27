DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Detalles_Ventas;

CREATE TABLE Cliente (
  ID_Cliente INT PRIMARY KEY,
  Nombre_Cliente VARCHAR(50) NOT NULL,
  Numero_Documento VARCHAR(20) NOT NULL,
  Tipo_Documento VARCHAR(5) NOT NULL,
  Email VARCHAR(150) NOT NULL,
  Telefono VARCHAR(20) NULL,
  Direccion VARCHAR(255) NOT NULL
);

CREATE TABLE Productos (
  ID_Producto INT PRIMARY KEY,
  Nombre_Producto VARCHAR(50) NOT NULL,
  Descripcion TEXT,
  Precio_Actual DECIMAL(10,2)
);

CREATE TABLE Ventas (
  Numero_Factura INT PRIMARY KEY,
  Fecha_Venta DATETIME NOT NULL,
  ID_Cliente INT NOT NULL,
  Metodo_Pago VARCHAR(20) NOT NULL,
  Total_Venta DECIMAL(10,2) NOT NULL,
  Estado_Venta VARCHAR(15) NOT NULL,
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Detalles_Ventas(
  ID_Detalle INT PRIMARY KEY,
  Numero_Factura INT,
  ID_Producto INT,
  Cantidad INT NOT NULL,
  FOREIGN KEY (Numero_Factura) REFERENCES Ventas(Numero_Factura)
  FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);