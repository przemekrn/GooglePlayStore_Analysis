#Libaries
library(ggplot2)
library(scales)

# Load the dataset
apps_data <- read.csv("DataSets/googleplaystore.csv")

# Handle missing values (replace NA with appropriate values)
apps_data[is.na(apps_data)] <- 0

# Remove duplicates
apps_data <- apps_data[!duplicated(apps_data), ]

# Summary statistics
summary(apps_data)

# Distribution of Ratings

ggplot(apps_data, aes(x = Rating)) +
  geom_histogram(binwidth = 0.1, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Ratings", x = "Rating") +
  xlim(0, 5) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Ensure Reviews is numeric
apps_data$Reviews <- as.numeric(as.character(apps_data$Reviews))
# Get top 10 apps by reviews
top_10_apps <- head(apps_data[order(apps_data$Reviews, decreasing = TRUE), ], 30)
# Plot
ggplot(top_10_apps, aes(x =App, y = Reviews)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Top 10 Apps by Reviews", y = "Reviews") +
  theme_minimal() +
  coord_flip() +
  scale_y_continuous(labels = scales::comma)


# App Categories
ggplot(apps_data, aes(x = Category)) +
  geom_bar(fill = "skyblue") +
  labs(title = "App Categories", x = "Category", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
