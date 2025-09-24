from src.etl_anbima import download_daily_datas, list_last_days, concat_dataset


#==================INPUTS=================#
util_days = 5

#================FUNCTIONS================#
list_dates = list_last_days(util_days)
df = download_daily_datas(list_days=list_dates)
concat_dataset(df, list_days=list_dates)