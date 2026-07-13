# 📂 Dataset

## Overview

This project uses a fictional retail sales dataset designed for data analysis and Business Intelligence practice.

The dataset simulates the daily operations of a retail company, including customers, products, sales, salespeople, and order details.

---

## Dataset Information

| Item | Description |
|------|-------------|
| Domain | Retail Sales |
| Tables | 6 |
| Records | 200+ |
| Database | MySQL |
| Language | English |

---

## Tables

| Table | Description |
|--------|-------------|
| customers | Customer information |
| products | Product catalog |
| orders | Sales orders |
| order_items | Order details |
| salespeople | Salesperson information |
| targets | Monthly sales targets |

---

## Main Fields

### Customers

- customer_id
- customer_name
- segment
- city
- state

### Products

- product_id
- product_name
- category
- unit_price

### Orders

- order_id
- customer_id
- salesperson_id
- order_date
- payment_method
- order_status
- total_amount

### Order Items

- order_item_id
- order_id
- product_id
- quantity
- unit_price

### Salespeople

- salesperson_id
- salesperson_name
- region

### Targets

- salesperson_id
- target_month
- target_value

---

## Business Purpose

The dataset supports analyses such as:

- Sales Performance
- Revenue Analysis
- Customer Segmentation
- Product Performance
- Regional Analysis
- KPI Monitoring

---

## Notes

This dataset is intended exclusively for educational purposes and portfolio development.
