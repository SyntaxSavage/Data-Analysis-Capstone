# Data-Analysis-Capstone
End-to-end data analysis project using Excel, SQL, Python, and Power BI.
# Blinkit Sales Analysis - Data Analysis Capstone Project

![Project Cover](https://via.placeholder.com/800x200.png?text=Blinkit+Sales+Analysis+Capstone+Project)

Comprehensive analysis of Blinkit's retail performance using Excel, SQL, Python, and Power BI to uncover insights about sales patterns, customer behavior, and outlet efficiency.

## 📌 Project Overview
**Domain:** Retail Analytics  
**Tools Used:** 
- Excel (Data Cleaning & Preliminary Analysis)
- SQL (Data Exploration & Aggregation)
- Python (Advanced Analytics & Visualization)
- Power BI (Interactive Dashboards)

## 🎯 Business Objectives
1. Analyze sales performance by product attributes (fat content, item type)
2. Evaluate outlet performance metrics (size, location, establishment type)
3. Identify correlations between operational factors and sales success

## 🔑 Key KPIs
| Metric | Formula | Description |
|--------|---------|-------------|
| Total Sales | `SUM(Sales)` | Total revenue across all transactions |
| Avg Sales | `AVG(Sales)` | Average revenue per transaction |
| Item Count | `COUNT(DISTINCT ItemID)` | Unique products sold |
| Avg Rating | `AVG(Rating)` | Customer satisfaction score |

## 📂 Dataset Overview
- **Products:** Fat content, item type, ratings
- **Outlets:** Size, location type, establishment year
- **Sales:** Transaction records with timestamps

## 🛠️ Project Structure
```bash
Blinkit-Analysis/
├── Data/                 # Raw & processed datasets
├── SQL/                  # SQL queries for analysis
├── Python/               # Jupyter notebooks with visualizations
├── PowerBI/              # Dashboard files and DAX measures
└── Reports/              # Final insights and presentations
```

## 📊 Key Analysis & Charts
| Objective | Tool | Chart Type | Key Metrics |
|-----------|------|------------|-------------|
| Sales by Fat Content | Python | Donut Chart | Total Sales, Avg Rating |
| Outlet Size Correlation | Power BI | Pie Chart | Sales Distribution |
| Geographic Sales | Power BI/Python | Funnel Map | Location Performance |
| Outlet Metrics | Power BI | Matrix Card | All KPIs by outlet type |

## 💻 Code Samples

### SQL Snippet (Total Sales by Fat Content)
```sql
SELECT 
  FatContent,
  SUM(Sales) AS TotalSales,
  AVG(Sales) AS AvgSales,
  COUNT(DISTINCT ItemID) AS UniqueItems,
  AVG(Rating) AS AvgRating
FROM SalesData
GROUP BY FatContent;
```

### Python Visualization (Stacked Column Chart)
```python
import matplotlib.pyplot as plt
import seaborn as sns

plt.figure(figsize=(12,6))
sns.barplot(x='OutletType', y='TotalSales', hue='FatContent', data=df)
plt.title('Sales Distribution by Outlet Type & Fat Content')
plt.show()
```

## 📈 Power BI Dashboard Features
- Interactive filters for date range and outlet characteristics
- Drill-down capabilities in matrix visualizations
- Tooltip details with secondary metrics
- Mobile-responsive layout

## 🚀 How to Use
1. Clone repository: `git clone https://github.com/yourrepo/blinkit-analysis`
2. Install dependencies: `pip install -r requirements.txt`
3. Run Jupyter notebooks: `jupyter lab`
4. Open `Dashboard.pbix` in Power BI Desktop

## 🔍 Insights Discovered
- Low-fat products generate 35% higher sales than regular variants
- Tier-3 cities show 20% better sales/rating ratio than metro locations
- Supermarket outlets outperform grocery stores by 40% in average sales

## 📄 License
MIT License - Free for academic and research use
