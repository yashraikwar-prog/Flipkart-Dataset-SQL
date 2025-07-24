# Flipkart Mobiles Data Analysis using SQL 📱

This project performs a basic exploratory data analysis (EDA) on a dataset of mobile phones listed on Flipkart. The analysis is conducted entirely using SQL to extract key insights about pricing, ratings, reviews, and brand performance.

-----

## 📂 Dataset

The dataset used is `flipkart_mobiles.csv`, which contains information scraped from Flipkart's website. The key columns in the dataset include:

  * **brand**: The manufacturer of the mobile phone.
  * **model**: The specific model of the phone.
  * **mrp**: Maximum Retail Price.
  * **msp**: Mobile Selling Price.
  * **ratings**: The average user rating (out of 5).
  * **no\_of\_reviews**: The total number of reviews for the product.
  * **discount**: The percentage discount offered.

-----

## 🛠️ Tools Used

  * **Database**: MySQL

-----

## 📊 Analysis & Insights

Several SQL queries were written to explore the data and answer key business questions. The complete script can be found in the `class 10 flipkart project.sql` file.

### 1\. Price Distribution by Brand

This query categorizes phones for each brand into different price segments.

**Query:**

```sql
SELECT
    brand,
    SUM(CASE WHEN mrp BETWEEN 0 AND 9999 THEN 1 ELSE 0 END) AS 'Price Below 10k',
    SUM(CASE WHEN mrp BETWEEN 10000 AND 19999 THEN 1 ELSE 0 END) AS 'Price between 10-20k',
    SUM(CASE WHEN mrp BETWEEN 20000 AND 39999 THEN 1 ELSE 0 END) AS 'Price between 20-40k',
    SUM(CASE WHEN mrp >= 40000 THEN 1 ELSE 0 END) AS 'Price Above 40k'
FROM
    mobiles
GROUP BY
    brand
ORDER BY
    brand;
```

**Result:**

### 2\. Top 5 Brands by Average Rating

This query identifies the brands with the highest average customer ratings.

**Query:**

```sql
SELECT brand, AVG(ratings) AS avg_rating
FROM mobiles
GROUP BY brand
ORDER BY avg_rating DESC
LIMIT 5;
```

**Result:**

### 3\. Top 5 Brands by Total Reviews

This query finds the brands that have accumulated the highest number of reviews, indicating popularity and sales volume.

**Query:**

```sql
SELECT brand, SUM(no_of_reviews) AS total_reviews
FROM mobiles
GROUP BY brand
ORDER BY total_reviews DESC
LIMIT 5;
```

**Result:**

### 4\. Brand with the Maximum Discount

This query calculates the maximum discount amount (`mrp` - `msp`) offered by each brand and identifies the brand with the highest discount on a single product.

**Query:**

```sql
SELECT
    brand,
    MAX(mrp-msp) AS max_discount_amount
FROM mobiles
GROUP BY brand
ORDER BY max_discount_amount DESC
LIMIT 1;
```

**Result:**

-----

## 🚀 How to Use

1.  **Set up the Database**:

      * Ensure you have a running MySQL server.
      * Create a new database.
        ```sql
        CREATE DATABASE flipkarts;
        USE flipkarts;
        ```

2.  **Create Table and Import Data**:

      * Create a table named `mobiles` that matches the structure of `flipkart_mobiles.csv`.
      * Import the data from the CSV file into the `mobiles` table. You can use a tool like MySQL Workbench or the `LOAD DATA INFILE` command.

3.  **Run the Queries**:

      * Execute the queries from the `class 10 flipkart project.sql` file to replicate the analysis.
