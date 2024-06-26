# Store-Data-Analysis | SQL
Data analysis on a scale model car database

<img src="https://github.com/s-mehakkk/Store-Data-Analysis/blob/main/Images/ProductLine.png" alt="Car Product Line " >


This project involves analyzing data from a car store database using SQL to gain insights and make data-driven decisions. The database contains various tables, including product lines, products, order details, orders, customers, payments, employees, and offices, each with different relationships.

## Objective
The main objectives of the analysis are as follows:

- Inventory Optimization: Determine which products should be ordered more or less based on their demand and performance.

- Customer Behavior Analysis: Tailor marketing and communication strategies to different customer segments, including VIP customers and less-engaged customers.

- Budget Allocation for Customer Acquisition: Calculate the Customer Lifetime Value (LTV) to determine how much the company can spend on acquiring new customers.

## Data Schema

<img src="https://github.com/s-mehakkk/Store-Data-Analysis/blob/main/Images/er-diagram.png" alt="ER Diagram " >

The database consists of the following tables and their relationships:

- productslines: Contains product category data with a one-to-many relationship with the products table.

- products: Contains product data with relationships to productslines and orderdetails tables.

- orderdetails: Contains order details data with relationships to the products and orders tables.

- orders: Contains order received data with a relationship to the orderdetails and customers tables.

- customers: Contains customer data with relationships to the orders, payments, and employees tables.

- payments: Contains payment data with a relationship to the customers table.

- employees: Contains employee data with relationships to itself (self-referencing), customers, and offices tables.

- offices: Contains office data with a one-to-many relationship with the employees table.

## Analysis Results
- Inventory Optimization: Determined top 10 performing products, contributing to 38% of total revenue. The analysis identified vintage cars and motorcycles as the top-performing products that should be restocked frequently.

- Customer Behavior Analysis: The analysis segmented the customer base into VIP and less-engaged customers, to facilitate the development of targeted marketing approaches to retain VIPs and attract new customers.

- Budget Allocation for Customer Acquisition: The average Customer Lifetime Value is £39,040, helping determine the marketing budget for new customer acquisition.

## Conclusion
This project provides valuable insights into the car store's inventory, customer behavior, and marketing strategy. The findings can be used to optimize inventory management, improve customer engagement, and allocate marketing resources effectively.

## How to Use
To replicate the analysis, import the provided SQL database into your preferred SQL server or database management tool. Then, run the SQL queries provided in the analysis to obtain the insights mentioned above.

Note: you can either use the store.sql file or run create_table.sql and insert_value.sql to set up the database.

Feel free to customize the queries or extend the analysis based on specific business requirements.

