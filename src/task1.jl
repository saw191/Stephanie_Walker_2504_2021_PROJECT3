
#Rooms
#Rooms summary statistics
room_summary = summarystats(df.Rooms)
#groupings
room_no_outlier = df[df[!, :Rooms].!==16,:]
#Rooms plot
room_plot = histogram(room_no_outlier.Rooms,legend=false, xlabel="No of Rooms", ylabel="Frequency", title="Rooms plot with no outlier",  ylim = (0, 4000), palette=:greens)
savefig(room_plot, "room_plot.png")

#Price
#Price summary statistics
price_summary = summarystats(df.Price)
#groupings
prices = groupby(df, :Price)
price_count = combine(prices, nrow => :Count)
#Prices plot
price_plot = scatter(price_count.Price, price_count.Count, ylabel = "Price Count", ylim = [0,300];  xlabel = "Price", title="Price Frequency Scatterplot", legend = false, palette=:blues)
savefig(price_plot, "price_plot.png")

#Method
#Method summary statistics
method_group = groupby(df, :Method)
method_summary = combine(method_group, nrow => :Count)
#Method plot
x = method_summary.Method
y = method_summary.Count
method_plot = plot(x, y, seriestype = :bar, legend=false, xlabel="Sales Method", ylabel="Count", title="Sales method plot", palette=:reds)
savefig(method_plot, "method_plot.png")

#Distance
#Distance grouping
distance_group = groupby(df, :Distance)
distance_grouping = sort(combine(distance_group, nrow => :Count))
distance_updated = distance_grouping[distance_grouping[!,:Distance].!="#N/A",:] #removed the #N/A value to plot
distance_updated.Distance = parse.(Float64, distance_updated.Distance) #change String to Float to get summary statistics
#Distance summary statistics
distance_summary = summarystats(distance_updated.Distance)
#Distance plot
distance_plot = histogram(distance_updated.Distance, legend=false, xlabel="Distance", ylabel = "Density", ylim=(0,0.06), title="Distance summary histogram", bins=80,  normed=true, palette=:greens)
savefig(distance_plot, "distance_plot.png")

#Landsize
#Landsize summary statistics
landsize_summary = summarystats(df.Landsize)
df_updated = dropmissing!(df)
landsize_summary_updated = summarystats(df_updated.Landsize)
#Landsize grouping
landsize_grouping = sort(combine(groupby(df_updated, :Landsize), nrow => :Count))
df_updated.Landsize = df_updated[!, :Landsize]
#Landsize plot
landsize_plot = scatter(df_updated.Landsize, (landsize_grouping.Count), ylabel = "Count", xlabel = "Landsize", title="Landsize plot", legend = false, palette=:reds)
savefig(landsize_plot, "landsize_plot.png")

#Summary statistics and plots for all required variables 
@show(room_summary)
display(room_plot)
@show(price_summary)
display(price_plot)
@show(method_summary)
display(method_plot)
@show(distance_summary)
display(distance_plot)
@show(landsize_summary_updated)
display(landsize_plot)