import os
from pyspark.sql import SparkSession
from delta import configure_spark_with_delta_pip


def get_spark_session():
    spark = (SparkSession
             .builder
             #.enableHiveSupport()
             .master("spark://spark-master:7077")
             .config("spark.sql.warehouse.dir", "/opt/spark/spark-warehouse")
             .getOrCreate()
             )
    return spark


