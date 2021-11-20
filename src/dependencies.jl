using DataFrames, HTTP, CSV, Plots, StatsPlots, StatsBase, SplitApplyCombine, Missings


data_from_web = HTTP.request("GET", "https://raw.githubusercontent.com/saw191/"*"Stephanie_Walker_2504_2021_PROJECT3/main/data/Melbourne_housing_FULL.csv")
string_from_web = String(data_from_web.body);

df = CSV.read(IOBuffer(string_from_web), DataFrame)
