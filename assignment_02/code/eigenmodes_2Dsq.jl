using PlotlyJS, LinearAlgebra #, Colors


function meshgrid(x, y)
    X = [i for i in x, j in 1:length(y)]
    Y = [j for i in 1:length(x), j in y]
    return X, Y
end

# # Linear discriminant function
# p(x,y,n,m) = sin.(n*pi*x).*sin.(m*pi*y)
λ(n,m) = pi*sqrt(n^2+m^2)
p(x,y,t,n,m) = sin.(n*pi*x).*sin.(m*pi*y).*(cos.(t*λ(n,m)) + sin.(t*λ(n,m)))
xs = collect(-4:4)*0.01
ys = collect(-4:4)*0.01
ts = collect(-4:4)*0.01
X, Y = meshgrid(xs,ys)
n = 3; m = 3; t = 0;
P = p(X,Y,t,n,m)

layout = Layout(
    scene=attr(
        xaxis=attr(
            range=[0,1]
        ),
        yaxis=attr(
            range=[0,1]
        ),
        zaxis=attr(
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
trace1 = surface(
        x=X,
        y=Y,
        z=P,
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
# savefig(plot_, "modes.html")

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
