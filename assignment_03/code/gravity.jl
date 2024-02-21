using PlotlyJS, LinearAlgebra #, Colors

ω₀ = 0.2; a = 1.0
X(Z) = sqrt(ω₀)/(2.0*a)*(tan.(Z) .* sec.(Z) .- tanh.(sin.(Z)))
Zs = collect(0.0:10/0.01)*0.01
x = X(Zs)

layout = Layout(
    scene=attr(
        xaxis=attr(
            range=[0,10]
        ),
        yaxis=attr(
            range=[-2,2]
        ),
    ),
    legend=attr(
        yanchor="top",
        xanchor="right",
        orientation="v"
    )
)

# const_color = [ RGB{Float64}(0.5,1,0.5) for _ in 1:2 ]
trace1 = scatter(
        x=Zs,
        y=x,
        # showscale=false,
        # colorscale=["blue"]
        # surfacecolor="blue"
        # surfacecolor = RGB{Float64}(0.5,1,0.5)

        # mode = "markers",
        # color = "green",
        # name = "Positive"
    )
# p = plot([trace1, trace2, trace3, trace4], layout)
plot_ = plot(trace1, layout) #, layout)
savefig(plot_, "plot.html")

# anim = @animate for i=ts
#     plot(
#         surface(
#             x=X,
#             y=Y,
#             z=p(X,Y,i,n,m),
#             showscale=false,
#         ),
#         layout)
# end
# gif(anim, "./anim_fps15.gif", fps = 15)
