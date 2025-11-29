Key Advantages:

1. Separation of Storage & Compute
Compute clusters (virtual warehouses) scale independently from data storage.
2. Performance & Elasticity
Warehouses auto-scale and auto-suspend → lower cost and high performance.
3. Zero-copy Cloning
Instant cloning of tables/databases without duplicating storage.
4. Time Travel & Fail-safe
Recover data from accidental deletes or changes.
5. Multi-cluster Warehouses
Avoid resource contention, but so far in my project experiance, 1 cluster is enough 
6. Native Features for Pipelines/Integration
Streams, Tasks, Dynamic Tables, Snowflake connector for G4, Snowflake connector for MYSQL
7. Security by Design
Data masking, row access policies, encryption end-to-end.


# Snowflake  - Medallion Implementation

This repository contains SQL and optional Python/Snowpark scripts implementing:
- Synthetic data generation and load (Bronze) using internal stage
- Bronze → Silver transformations using Streams + Tasks
- Gold layer implemented as a Dynamic Table with continuous aggregation
- Data quality checks using Data Metric Functions (DMFs)
- Dynamic Data Masking policy protecting PII

## How to run
1. Login to Snowflake (UI Worksheets or SnowSQL).
2. Run `sql/00_SetupEnvironment.sql`.
3. Run `sql/01_create_file_format_and_stage.sql`.
4. Generate & load Bronze data: `sql/02_generate_and_load_bronze.sql`.
    1. you need to upload csv file to your internal stage (RAW_INTERNAL_STAGE)
        a. open your snowsight UI
        b. go to catalog => database explorer 
        c. click on MEDALLION_DB =>  BRONZE_LAYER => STAGES => RAW_INTERNAL_STAGE
        d. on the right tab clik +Files ==> upload products.csv file (you can optionally create specific folder like the example i used PRODUCTS as folder name)
        e. click Upload and just wait till your file in your internal stage (RAW_INTERNAL_STAGE) successfully uploaded   
5. Create Silver transforms: `sql/03_silver_layer_transformation.sql`. ----
6. Create streams and tasks: `sql/04_create_streams_and_tasks.sql`.
7. Create Gold dynamic table:`sql/05_gold_dynamic_table.sql`
8. Configure DMFs: `sql/06_dmf.sql`.
9. Configure masking: `sql/07_dynamic_data_masking.sql`.



