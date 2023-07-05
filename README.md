For adding data from new ad platforms to our MCDM we need to:
1. Connect our new raw ad platforms data to our DWH (e.g. in BigQuery).
2. Add direct links from databases to dbt. To do this, we can create a separate sql file in dbt where we refer to the data in the source (e.g. in BigQuery):
select * from raw_data.new_data_file
Then we can use  {{ ref() }} for this file or we can use direct links on new ad platforms data ‘raw_data.new_data_file ‘
Before that we connect our raw data files to dbt Cloud.
3. Use the same SELECT structure in our MCDM-model for new ad platforms data and create a new UNION ALL query.
4. WE can configure our ad platforms data to check for source freshness in dbt by configuring our sources.yml file as below:
sources:
  - name: stripe
    database: raw_data
    schema: stripe
    tables:
      - name: new_data_table
        loaded_at_field: _batched_at
        freshness:
          warn_after: {count: 12, period: hour}
          error_after: {count: 24, period: hour}



### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
