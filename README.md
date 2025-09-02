# 🚲 Cyclistic Case Study: Unlocking Rider Insights for Membership Growth

## 📌 Business Objective
Cyclistic, a bike-share company in Chicago, aims to convert casual riders into annual members. This case study analyzes rider behavior to uncover actionable strategies that support this goal.

## 🧹 Data Cleaning & Preparation
- Combined 12 monthly CSV files using R
- Removed rows with missing critical values (`ride_id`, `started_at`, `ended_at`, `member_casual`)
- Created `ride_duration` in minutes and filtered out extreme values (<1 or >1440 mins)
- Engineered features: `day_of_week`, `ride_month`, `hour_of_day`
- Segmented riders into `casual` and `member` groups

## 📊 Key Insights
- **Ride Duration**: Casual riders take significantly longer rides than members
- **Time of Day**: Casuals ride more during weekend afternoons; members ride during weekday commute hours
- **Bike Type Preference**: Casuals favor electric bikes more than members
- **Seasonality**: Casual rides peak in summer; member usage remains steady year-round

## 💡 Strategy Recommendations
- Offer **weekend membership discounts** to attract leisure riders
- Introduce **electric bike perks** for casual users
- Launch **loyalty programs** for frequent casual riders
- Use **targeted email campaigns** based on ride history and patterns

## 📈 Visualizations (Tableau Public)
- [Average Ride Duration](#)  
- [Ride Frequency by Hour and Day](#)  
- [Monthly Ride Trends](#)  
- [Bike Type Split](#)

> 📷 images available in `/Dashboard` folder

## 🛠️ Tools Used
- **R**: Data cleaning, feature engineering, segmentation
- **Tableau Public**: Dashboard creation and visualization
- **Excel**: Pivot validation and summary analysis

## 📁 Repository Structure

/outputs → Contains the cleaned CSV file used for Tableau dashboarding and analysis  
README.md → Project overview, insights, and strategy recommendations  

