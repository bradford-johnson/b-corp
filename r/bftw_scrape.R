# load packages
library(rvest)
library(tidyverse)

# scrape data
link <- "https://www.bcorporation.net/en-us/best-for-the-world-2022-workers" 

page <- read_html(link)

# companies with 1-9 employees
 company_name <- page |>
  html_nodes("#employees-1-9 .p-4:nth-child(1)") |>
  html_text()

country <- page %>%
  html_nodes("#employees-1-9 .p-4:nth-child(2)") |>
  html_text()

industry <- page %>%
  html_nodes("#employees-1-9 .p-4~ .p-4+ .text-left") |>
  html_text()

area_score <- page %>%
  html_nodes("#employees-1-9 .text-right.p-4") |>
  html_text()

df_1 <- data.frame(company_name, country, industry, area_score)

df_1 <- df_1 |>
  mutate(size = "1-9 Employees", year = "2022")

# companies with 10-49 employees
company_name <- page |>
  html_nodes("#employees-10-49 .p-4:nth-child(1)") |>
  html_text()

country <- page %>%
  html_nodes("#employees-10-49 .p-4:nth-child(2)") |>
  html_text()

industry <- page %>%
  html_nodes("#employees-10-49 .p-4~ .p-4+ .text-left") |>
  html_text()

area_score <- page %>%
  html_nodes("#employees-10-49 .text-right.p-4") |>
  html_text()

df_2 <- data.frame(company_name, country, industry, area_score)

df_2 <- df_2 |>
  mutate(size = "10-49 Employees", year = "2022")

# companies with 50-249 employees
company_name <- page |>
  html_nodes("#employees-10-49+ .flex-col-stack-2 .p-4:nth-child(1)") |>
  html_text()

country <- page %>%
  html_nodes("#employees-10-49+ .flex-col-stack-2 .p-4:nth-child(2)") |>
  html_text()

industry <- page %>%
  html_nodes("#employees-10-49+ .flex-col-stack-2 .p-4~ .p-4+ .text-left") |>
  html_text()

area_score <- page %>%
  html_nodes("#employees-10-49+ .flex-col-stack-2 .text-right.p-4") |>
  html_text()

df_3 <- data.frame(company_name, country, industry, area_score)

df_3 <- df_3 |>
  mutate(size = "50-249 Employees", year = "2022")

# companies with 250-999 employees
company_name <- page |>
  html_nodes("#employees-250-999 .p-4:nth-child(1)") |>
  html_text()

country <- page %>%
  html_nodes("#employees-250-999 .p-4:nth-child(2)") |>
  html_text()

industry <- page %>%
  html_nodes("#employees-250-999 .p-4~ .p-4+ .text-left") |>
  html_text()

area_score <- page %>%
  html_nodes("#employees-250-999 .text-right.p-4") |>
  html_text()

df_4 <- data.frame(company_name, country, industry, area_score)

df_4 <- df_4 |>
  mutate(size = "250-999 Employees", year = "2022")

# companies with 1000+ employees
company_name <- page |>
  html_nodes("#employees-1000\\+ .p-4:nth-child(1)") |>
  html_text()

country <- page %>%
  html_nodes("#employees-1000\\+ .p-4:nth-child(2)") |>
  html_text()

industry <- page %>%
  html_nodes("#employees-1000\\+ .p-4~ .p-4+ .text-left") |>
  html_text()

area_score <- page %>%
  html_nodes("#employees-1000\\+ .text-right.p-4") |>
  html_text()

df_5 <- data.frame(company_name, country, industry, area_score)

df_5 <- df_5 |>
  mutate(size = "1000+ Employees", year = "2022")

# combine all data frames into one
cleaned_data <- df_1 |>
  bind_rows(df_2) |>
  bind_rows(df_3) |>
  bind_rows(df_4) |>
  bind_rows(df_5)

# write as .csv
write_csv(cleaned_data, "bftw_workers.csv")