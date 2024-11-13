# Crowdfunding_ETL Project

This project demonstrates the development of an ETL (Extract, Transform, Load) pipeline using Python, Pandas, and PostgreSQL. The pipeline processes crowdfunding and contact data to extract, clean, and load it into a PostgreSQL database. This README provides a walkthrough of each step in the ETL process.

## Table of Contents
- [Project Overview](#project-overview)
- [ETL Process](#etl-process)
    - [Extract](#extract)
    - [Transform](#transform)
    - [Load](#load)
        - [Creating the Crowdfunding Database](#creating-the-crowdfunding-database)
- [ERD and Database Schema](#erd-and-database-schema)
- [Instructions for Running the Project](#instructions-for-running-the-project)
- [Project Structure](#project-structure)
- [Contributors](#contributors)


## Project Overview
This project demonstrates a complete ETL (Extract, Transform, Load) pipeline designed to process and organize crowdfunding data for analytical use. Collaborating with a partner, we developed this pipeline using Python, Pandas, and either dictionary methods or regular expressions to clean and transform raw data from multiple sources. The pipeline outputs four structured CSV files, which serve as a foundation for creating an Entity-Relationship Diagram (ERD) and a relational database schema.

Upon completing the transformations, the data is loaded into a PostgreSQL database, offering a scalable solution for analyzing and exploring crowdfunding campaigns. This project highlights best practices in data wrangling, schema design, and efficient database import, demonstrating practical applications of data engineering for real-world datasets.

## ETL Process
The ETL process consists of three main stages: Extract, Transform, and Load. Each stage plays a crucial role in converting raw data into a structured format suitable for analysis. First, the data is extracted from various sources, then cleaned and transformed to ensure consistency, and finally loaded into a PostgreSQL database to enable efficient querying and analysis. Below is a detailed breakdown of each stage in our pipeline.

### Extract
The extraction step involves reading data from two Excel files:
- `crowdfunding.xlsx`: Contains information about crowdfunding campaigns, includinging categories, subcategories, and campaign details.
- `contacts.xlsx`: Contains contact details for each campaign.

### Transform
The data from each file undergoes cleaning and transformation to prepare it for loading into the database. This transformation is broken down into the following sections:

#### Category and Subcategory DataFrames
1. **Category DataFrame**
    - Extracted from `crowdfunding.xlsx`.
    - Consists of unique categories in the data.
    - Columns:
        - `category_id`: Sequentially numbered entries from `cat1` to `catn`, where `n` is the number of categories.
        - `category`: Category title.
    - Saved as `category.csv`

2. **Subcategory DataFrame**
    - Extracted from `crowdfunding.xlsx`.
    - Consists of unique subcategories in the data.
    - Columns:
        - `subcategory_id`: Sequentially numbered entries from `subcat1` to `subcatn`, where `n` is the number of subcategories.
        - `subcategory`: Subcategory title.
    - Saved as `subcategory.csv`

#### Campaign DataFrame
The `campaign` DataFrame is extracted from `crowdfunding.xlsx` and contains detailed information about each campaign. Key transformations include:
- **Renaming Columns**:
    - The `blurb` column is renamed to `description`, `launched_at` to `launch_date`, and `deadline` to `end_date`.
- **Data Type Conversion**:
    - `goal` and `pledged` columns are converted to float data types.
    - `launch_date` and `end_date` columns are converted to datetime format.
- **Forgien Key Columns**:
    - `category_id` and `subcategory_id` columns are added by mapping the categories and subcategories from their respective DataFrames.
- Saved as `campaign.csv`

#### Contacts DataFrame
The `contacts` DataFrame is extracted from `contacts.xlsx` using regular expressions to parse and transform the data. This DataFrame includes:
- `contact_id`, `first_name`, `last_name`, and `email` columns. 
- **Data Transformation**:
    - the `contact_id` column is converted into the integer type.
    - Each entry in the `name` column is split into `first_name` and `last_name`

The final `contacts` DataFrame is saved as `contacts.csv`

### Load

The final stage of the ETL pipeline is loading the transformed data into a PostgreSQL database. This step involves creating a structured schema to support data integrity and defining relationships among tables using primary and foreign keys. After establishing the schema, each CSV file is imported into its corresponding table, enabling efficient data storage and retrieval.

#### Creating the Crowdfunding Database

1. **Schema Definition**:
   - An ERD (Entity-Relationship Diagram) is created to define relationships between the tables.
   - The schema is defined in `crowdfunding_db_schema.sql`, specifying primary keys, foreign keys, and data types for each table.

2. **Database Creation**:
   - A PostgreSQL database named `crowdfunding_db` is created.
   - Tables are generated based on the schema in `crowdfunding_db_schema.sql`, with careful attention to the order of table creation to manage foreign keys effectively.

3. **Data Loading**:
   - Each CSV file (`category.csv`, `subcategory.csv`, `campaign.csv`, `contacts.csv`) is loaded into the corresponding SQL table.
   - Data validation is performed by running `SELECT *` statements on each table to verify successful imports and correct data structure.

### ERD and Database Schema

The ERD (Entity-Relationship Diagram) and database schema provide the foundation for organizing and storing the transformed data. The ERD visually represents table relationships, while the schema outlines the structure, data types, and key constraints for each table in the PostgreSQL database.

1. **ERD Creation**:
   - The ERD displays the relationships between tables, helping to clarify the structure of the database.
   - Relationships include links between categories, subcategories, campaigns, and contacts.

2. **Schema Definition**:
   - `crowdfunding_db_schema.sql` defines the database schema with primary keys, foreign keys, and appropriate data types for each column.
   - The schema is structured to ensure data integrity and efficiency in retrieval.

### Instructions for Running the Project

To set up and run the ETL pipeline, follow these steps to ensure the environment is correctly configured, the database is set up, and data is successfully imported.

1. **Clone the Repository**:
   - Clone the GitHub repository containing this project to your local machine.
   - Navigate to the project directory.

   ```bash
   git clone https://github.com/kbumadianne/Crowdfunding_ETL
   cd Crowdfunding_ETL
   ```

2. **Run the ETL Pipeline**:
    - Open the the Jupyter notebook file in the project directory to perform the ETL steps.
    - Run the Jupyter notebook to extract, transform, and save the data as CSV files.

3. **Set Up the PostgreSQL Database:**
    - Open PostgreSQL and create a new database named `crowdfunding_db`. 
    - Run the schema file to create tables in the correct order and with proper constraints. 
    ``` sql
    \i crowdfunding_db_schema.sql
    ```
4. **Load CSV Data into Database**:
    - Use PostgreSQL's COPY command to load data from each CSV file into its corresponding table
    - Alternatively, right click on the table in the Schema section of the sidebar and use the GUI import feature.


### Project Structure

This project is organized to support a streamlined ETL workflow, with separate directories for raw data, processed CSV files, schema definitions, and supporting documentation. Each component contributes to a clear, modular setup that simplifies development and collaboration.

- **`crowdfunding.xlsx`**: Source data for campaigns, categories, and subcategories.
- **`contacts.xlsx`**: Source data for contact information.
- **`category.csv`, `subcategory.csv`, `campaign.csv`, `contacts.csv`**: Transformed CSV files ready for database import.
- **`crowdfunding_db_schema.sql`**: PostgreSQL schema definition with tables, primary keys, and foreign keys.
- **`README.md`**: Project documentation, providing an overview of the ETL process and usage instructions.

## Contributors
- Eva Anderson ([github](https://github.com/the-eva-a))
- Kelsie Bumadianne ([github](https://github.com/kbumadianne))