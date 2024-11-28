# WalMart-Sales-Analysis
Analyzed Walmart sales data to extract business insights related to product performance, customer behavior,  and sales trends. Utilized SQL to clean, transform, and analyze data, focusing on key metrics such as total sales, average transaction value, and product line performance. 

## About the Dataset

The dataset used in this project contains detailed sales information, including customer demographics, product categories, transaction details, and more.

### **Columns in the Table**:
- `id`: Unique identifier for each transaction.
- `branch`: Store branch where the transaction occurred.
- `city`: Location of the store.
- `customer_type`: Type of customer (e.g., "Member", "Normal").
- `gender`: Gender of the customer.
- `product_line`: Category of the product sold.
- `unit_price`: Price per unit of the product.
- `quantity`: Number of units sold.
- `tax`: Tax applied to the transaction.
- `total`: Total amount (including tax).
- `date`: Date of the transaction.
- `time`: Time of the transaction.
- `payment`: Mode of payment (e.g., "Cash", "Credit Card", "E-wallet").
- `cogs`: Cost of goods sold.
- `gross_margin_percentage`: Gross margin percentage.
- `gross_income`: Gross income from the transaction.
- `rating`: Customer rating of the transaction.

---

## Objectives

1. Analyze sales performance by branch and city.
2. Identify the most popular product lines and their contributions to total revenue.
3. Study customer behavior by gender and type.
4. Compare sales trends across different payment methods.
5. Evaluate product performance and customer ratings.

---

## Tools and Technologies

- **Database**: MySQL
- **Language**: SQL
- **Visualization**: Power BI (planned integration for advanced reporting)
- **Operating System**: Windows 10

---

## SQL Tasks Performed

1. **Descriptive Analysis**:
   - Total revenue and quantity sold by branch and city.
   - Average customer ratings by product line.

2. **Customer Insights**:
   - Gender-based purchase patterns.
   - Revenue split between member and non-member customers.

3. **Sales Trends**:
   - Peak sales hours and days.
   - Sales distribution across payment methods.

4. **Product Analysis**:
   - Best-selling product categories.
   - Tax contribution to total sales.

5. **Profitability**:
   - Gross margin trends by branch.
   - Analysis of high-revenue transactions.

---

## Insights

- Branches in high-population cities have consistently higher revenue.
- Members contribute significantly to repeat purchases, especially in specific product lines.
- Credit cards are the most used payment method during peak sales hours.
- The "Electronics" product line generates the highest gross income.

---

## How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/Gayathri-13092002/walmart-sales-analysis.git

2. Import the dataset (walmartsalesdata.csv) into your database.

3. Run the provided SQL scripts to replicate the analysis.

4. Optionally, integrate the output with visualization tools like Power BI for better insights.
