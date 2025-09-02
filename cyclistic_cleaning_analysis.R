# 📦 Load Required Libraries
library(tidyverse)
library(lubridate)

# 📁 Set Working Directory and Load CSV Files
file_list <- list.files(
  path = "~/Documents/data analytics course/Cyclistic case study/csv files",
  pattern = "*.csv",
  full.names = TRUE
)

# 📊 Combine All Monthly Files into One DataFrame
cyclistic_all <- file_list %>% 
  map_df(read_csv)

# 🧹 Initial Cleaning: Remove Rows with Missing Critical Values
cyclistic_clean <- cyclistic_all %>%
  filter(
    !is.na(ride_id),
    !is.na(started_at),
    !is.na(ended_at),
    !is.na(member_casual)
  )

# ⏱️ Create Ride Duration in Minutes
cyclistic_clean <- cyclistic_clean %>%
  mutate(
    ride_duration = as.numeric(difftime(ended_at, started_at, units = "mins"))
  ) %>%
  filter(ride_duration > 0)

# 📆 Add Day of Week and Month Columns
cyclistic_clean <- cyclistic_clean %>%
  mutate(
    day_of_week = wday(started_at, label = TRUE),
    ride_month = month(started_at, label = TRUE)
  )

# 🧼 Filter Out Extreme Durations (<1 min or >1440 min)
cyclistic_clean <- cyclistic_clean %>%
  filter(ride_duration >= 1, ride_duration <= 1440)

# 🧍‍♂️ Segment Riders by Type
casual_riders <- cyclistic_clean %>% filter(member_casual == "casual")
member_riders <- cyclistic_clean %>% filter(member_casual == "member")

# 📊 Compare Ride Duration Metrics by Rider Type
cyclistic_clean %>%
  group_by(member_casual) %>%
  summarise(
    avg_duration = mean(ride_duration),
    median_duration = median(ride_duration),
    max_duration = max(ride_duration)
  )

# 📈 Ride Frequency by Day of Week
cyclistic_clean %>%
  group_by(member_casual, day_of_week) %>%
  summarise(total_rides = n()) %>%
  arrange(member_casual, desc(total_rides))

# 🚲 Bike Type Preference
cyclistic_clean %>%
  group_by(member_casual, rideable_type) %>%
  summarise(total_rides = n())

# 🕒 Time of Day Trends
cyclistic_clean <- cyclistic_clean %>%
  mutate(hour_of_day = hour(started_at))

cyclistic_clean %>%
  group_by(member_casual, hour_of_day) %>%
  summarise(total_rides = n())

# 💾 Export Cleaned Dataset to CSV
dir.create("~/Documents/data analytics course/Cyclistic case study/Outputs", showWarnings = FALSE)

write_csv(
  cyclistic_clean,
  "~/Documents/data analytics course/Cyclistic case study/Outputs/cyclistic_cleaned.csv"
)

