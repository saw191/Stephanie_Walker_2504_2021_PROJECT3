
#rooms stat summary
room_summary = summarystats(df.Rooms)
#plot of rooms 
room_plot = histogram(df.Rooms,legend=false, xlabel="No of Rooms", ylabel="Density", title="Rooms plot with outlier", bins=30, normed=true)
#groupings
room_count = sort(groupcount(df.Rooms))
type_room_count = groupby(df, [:Rooms, :Type])
final_room_count = combine(type_room_count, nrow => :Count)

#price stat summary
price_summary = summarystats(df.Price)
#groupings
prices = groupby(df, :Price)
price_count = combine(prices, nrow => :Count)
#plot of prices
price_plot = scatter(price_count.Price, price_count.Count, ylabel = "Price Count", ylim = [0,300];  xlabel = "Price", title="Price Frequency Scatterplot", legend = false)

#method stat summary
method_group = groupby(df, :Method)
method_summary = combine(method_group, nrow => :Count)
#method plot
x = method_summary.Method
y = method_summary.Count
method_plot = plot(x, y, seriestype = :bar, legend=false, xlabel="Sales Method", ylabel="Count", title="Sales method plot")

#distance 
distance_grouping= sort(combine(distance_group, nrow => :Count))
distance_updated = distance_grouping[distance_grouping[!,:Distance].!="#N/A",:] #removed the #N/A value to plot
distance_updated.Distance = parse.(Float64, distance_updated.Distance) #change String to Float to get summary statistics
#distance summary statistics
distance_summary = summarystats(distance_updated.Distance)
#distance plot
distance_plot = histogram(distance_updated.Distance, legend=false, xlabel="Distance", ylabel = "Density", title="Distance summary histogram", normed=true)

# landsize
#landsize_summary = summarystats(df.Landsize)

@show(room_summary)
@show(room_plot)
@show(price_summary)
@show(price_plot)
@show(method_summary)
@show(method_plot)
@show(distance_summary)
@show(distance_plot)
#@show(landsize_summary)
#@show(landsize_plot)

