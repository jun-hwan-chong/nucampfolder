# %%
import sqlite3
import pandas as pd
# %%
con = sqlite3.connect('sakila.db')

# %%


def sql_to_df(sql_query):
    df = pd.read_sql(sql_query, con)
    return df


# %%
query = '''
    select *
    from sqlite_master
    where type = 'table';
'''

tables = sql_to_df(query)
tables
# %%
query = '''
    select first_name, last_name
    from customer
'''

customer_names = sql_to_df(query)
customer_names

# %%
print(customer_names.head())
# %%
print(customer_names.tail())
# %%
print(customer_names.describe())
# %%
print(customer_names.info())
# %%
query = '''
    select *
    from film
    where description
    like '%Pastry%'
'''

pastry_films = sql_to_df(query)
pastry_films
# %%
query = '''
    select count(title) as Count, rating as Rating
    from film
    where description
    like '%Pastry%'
    group by rating order by Count desc;
'''
pastry_films_by_rating = sql_to_df(query)
pastry_films_by_rating
# %%
pastry_films_by_rating.hist(column='Count', grid=False)
# %%
