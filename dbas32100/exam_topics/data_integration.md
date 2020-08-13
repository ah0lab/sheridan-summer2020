## DATA INTEGRATION
*Integration* - The process of consildating data from different 
    data sources to support business needs.

### MAIN DATA SOURCES
1. OLTP (Online Transaction Processing) Databases
2. Application specific databases
3. Event Logs
4. Social Media

### DATA QUALITY
1. Uniqueness
2. Accuracy
3. Consistency
4. Completeness 
5. Currency
6. Timeliness
7. Referential Integrity

### APPROACHES TO INTEGRATION
- Consolidate data in one database that is optimized for reads
- Read Only Databases

### ETL (Extract - Transform - Load)
Describes the process that is used to integrate data or move 
data from one source to another.
#### EXTRACT
Process of getting data from the data sources, typically to a
temporary repo.
#### TRANSFORM
Process of changing the structure of the source tables through:
    *Selection*       - Restricting rows using WHERE clause
    *Joining*         - Projecting columns from more than one table
    *Denormalization* - Convert tables that are not in the third NF
                        to smaller tables that do not have redundancies.
    *Aggregation*     - Converting Data from detailed data to summary data
#### LOAD
Process of inserting transformed data to it's final destination and building
indexes in necessary.

