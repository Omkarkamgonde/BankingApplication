# Banking Application

A simple Java Web Application for banking operations (Registration, Login, Balance Check).

## Prerequisites

- Java 22 (or compatible JDK)
- Maven 3.x
- MySQL Database

## Setup Database

1. Create a MySQL database named `ankush`.
2. Execute the `db.sql` script to create the required table.
   ```sql
   source db.sql;
   ```
   Or manually:
   ```sql
   CREATE DATABASE ankush;
   USE ankush;
   CREATE TABLE admininfo (
       uid VARCHAR(50),
       pwd VARCHAR(50),
       Accnum VARCHAR(50),
       name VARCHAR(100),
       bal INT
   );
   ```

3. Update the database credentials in `src/main/java/com/example/util/DBConnection.java` if they differ from the defaults:
   - User: `root`
   - Password: `Deshmukhadcet@123`

## How to Run

1. Open a terminal in the project root.
2. Run with Maven Jetty Plugin:
   ```bash
   mvn jetty:run
   ```
3. Access the application at:
   - Login: [http://localhost:8080/loginPage.html](http://localhost:8080/loginPage.html)
   - Register: [http://localhost:8080/Register.html](http://localhost:8080/Register.html)

## Project Structure

- `src/main/webapp`: JSP and HTML files.
- `src/main/java`: Java source code (Database connection utility).
- `pom.xml`: Maven build configuration.
