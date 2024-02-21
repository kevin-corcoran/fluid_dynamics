using PlotlyJS, LinearAlgebra #, Colors


function meshgrid(x, y)
    X = [i for i in x, j in 1:length(y)]
    Y = [j for i in 1:length(x), j in y]
    return X, Y
end

# # Linear discriminant function
# p(x,y,n,m) = sin.(n*pi*x).*sin.(m*pi*y)
c₀ = 2.0; Δc = 1.0
cₛ(x,y) = c₀ .+ Δc*exp.(-0.5*(x.^2 .+ y.^2))
xs = collect(-4/0.01:4/0.01)*0.01
ys = collect(-4/0.01:4/0.01)*0.01
X, Y = meshgrid(xs,ys)
C = cₛ(X,Y)


layout = Layout(
    scene=attr(
        xaxis=attr(
            range=[-2,2]
        ),
        yaxis=attr(
            range=[-2,2]
        ),
        zaxis=attr(
            range=[1.5,4]
        ),
    ),
    legend=attr(
        yanchor="top",
        xanchor="right",
        orientation="v"
    )
)

# const_color = [ RGB{Float64}(0.5,1,0.5) for _ in 1:2 ]
trace1 = surface(
        x=X,
        y=Y,
        z=C,
        showscale=false,
        # colorscale=["blue"]
        # surfacecolor="blue"
        # surfacecolor = RGB{Float64}(0.5,1,0.5)

        # mode = "markers",
        # color = "green",
        # name = "Positive"
    )
# p = plot([trace1, trace2, trace3, trace4], layout)
plot_ = plot(trace1, layout)
savefig(plot_, "sound_anomoly.html")

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
