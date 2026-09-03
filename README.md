# BookForYou

BookForYou is a Java web application for buying and selling products online. Users can create an account, browse available products, add items to a cart, complete purchases, and manage their profile. Sellers can list products and manage warehouse/inventory information.

## Features

- User registration and login
- Profile and password management
- Product browsing and filtering
- Product listing with category, condition, price, description, and optional image
- Shopping cart management
- Checkout and purchase flow
- Seller and warehouse/inventory workflows
- MySQL-backed persistence

## Technology stack

- Java Servlet API and JSP
- Apache Ant / NetBeans web project
- Apache Tomcat
- MySQL
- MySQL Connector/J 5.0.7
- Java source/target level 1.8

## Project layout

```text
src/java/
  controller/     Servlet request handlers
  dao/            Database access objects
  dbconnector/   MySQL connection setup
  dto/            Data transfer objects
  model/          Application and persistence logic
web/
  *.jsp           Views and form handlers
  *.html          Login and registration pages
  WEB-INF/        Web application configuration
nbproject/        NetBeans project and Ant configuration
build.xml         Ant build entry point
```

## Prerequisites

Install the following before running the application:

1. JDK 8 or a compatible JDK that can compile Java 8 source.
2. Apache Tomcat with Servlet/JSP support. The project is configured as a Tomcat web application.
3. Apache Ant (NetBeans can also invoke the included Ant build).
4. MySQL Server.
5. MySQL Connector/J `5.0.7`.

The NetBeans project currently references the connector at:

```text
..\Webappplicationusing_MVC\mysql-connector-java-5.0.7-bin.jar
```

Update `file.reference.mysql-connector-java-5.0.7-bin.jar` in `nbproject/project.properties` if the JAR is stored elsewhere. The connector is intentionally not committed because JAR files are ignored by `.gitignore`.

## Database setup

The application expects a MySQL database named `project1`. Create it before starting Tomcat:

```sql
CREATE DATABASE project1;
```

The application uses the following tables:

- `user` — account, contact, address, and registration data
- `product_table` — product details, seller, image, condition, timestamp, and sold status

Create the tables with the columns used by the application, or import the project’s existing database dump if one is available. At minimum, the application expects these fields:

```text
user:
  user_id, username, password, email, first_name, last_name,
  contact, address, registration_date

product_table:
  product_id, product_name, product_category, product_price,
  description, time_stamp, image_url, seller_id,
  product_condition, is_sold
```

Before running the application, check `src/java/dbconnector/Dbconnector.java` and configure the MySQL URL, username, and password for the local database.

## Running with NetBeans

1. Open the project directory in NetBeans.
2. Configure a local Tomcat server in **Tools > Servers**.
3. Confirm the MySQL Connector/J reference resolves in the project properties.
4. Ensure MySQL is running and the `project1` database is available.
5. Run the project.
6. Open:

   ```text
   http://localhost:8080/BookForyou/
   ```

The configured welcome page is `login.html`.

## Building from the command line

From the project root:

```bash
ant clean
ant dist
```

The deployable WAR is generated at:

```text
dist/BookForyou.war
```

Copy the WAR to Tomcat’s `webapps` directory, start Tomcat, and visit `/BookForyou/`.

## Notes

- This is a legacy Java EE 7-style web project and may require compatibility adjustments when used with newer Tomcat or JDK versions.
- Database credentials are currently hard-coded in the connector class. For production use, move them to environment-specific configuration and use a restricted database user.
- No automated tests are currently included in the repository.

## License

No license file is currently included. Add a license before distributing or reusing the project.
