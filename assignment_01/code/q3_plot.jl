using PlotlyJS, LinearAlgebra #, Colors


function meshgrid(x, y)
    X = [i for i in x, j in 1:length(y)]
    Y = [j for i in 1:length(x), j in y]
    return X, Y
end

# # Linear discriminant function
# z(x,y) = (18 .- 2*y .- 3*x)./4
# xs = collect(0:(5/0.01))*0.01
# ys = collect(0:(5/0.01))*0.01
# X, Y = meshgrid(xs,ys)
# # Z1 = z(X,Y)

### Density in polar coordinates ####
u₀ = 1
ρ(r,t) = (r .- u₀*t)*exp.(-0.5*(r .- u₀*t .- 1).^2) 
rs = collect(range(2,6,length=200))
# ts = collect(range(1,5,length=5))
θs = collect(range(0, 2*pi, length=200))
t = 1

xs = rs.*cos.(θs)
ys = rs.*sin.(θs)
X, Y = meshgrid(xs,ys)
# R, T = meshgrid(rs,θs)
R = real(sqrt(X.^2 + Y.^2))

layout = Layout(
    scene=attr(
        xaxis=attr(
            range=[-5,5]
        ),
        yaxis=attr(
            range=[-5,5]
        ),
        zaxis=attr(
            range=[0,5]
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
        # z=z(X,Y),
        z=ρ.(R,0),
        showscale=false,
        # colorscale=["blue"]
        # surfacecolor="blue"
        # surfacecolor = RGB{Float64}(0.5,1,0.5)

        # mode = "markers",
        # color = "green",
        # name = "Positive"

    )
# p = plot([trace1, trace2, trace3, trace4], layout)
p = plot(trace1, layout)
savefig(p, "density.html")
