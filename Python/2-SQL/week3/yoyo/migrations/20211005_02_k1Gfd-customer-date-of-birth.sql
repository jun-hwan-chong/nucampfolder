-- customer date_of_birth
-- depends: 20211005_01_CzIol-customers-table
alter table customers
    add column date_of_birth timestamp;
