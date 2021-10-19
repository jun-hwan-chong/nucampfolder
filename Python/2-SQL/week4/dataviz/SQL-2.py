# %%
import sqlite3
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

con = sqlite3.connect('sakila.db')


def sql_to_df(sql_query):
    df = pd.read_sql(sql_query, con)
    return df


# %%
query = '''
    select
        strftime('%Y-%m', payment_date) AS Date, ROUND(SUM(amount), 0) AS Sales
    FROM payment
    GROUP BY Date
    ORDER BY Date ASC;
'''
sales_per_month = sql_to_df(query)
sales_per_month
