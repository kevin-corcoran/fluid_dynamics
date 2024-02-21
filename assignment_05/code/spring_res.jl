# using PlotlyJS, LinearAlgebra #, Colors
using Plots, LinearAlgebra #, Colors


function meshgrid(x, y)
    X = [i for i in x, j in 1:length(y)]
    Y = [j for i in 1:length(x), j in y]
    return X, Y
end

α = 1
β = 1
l = 1; g = 9.8; k = 1; m = 1
ω₁ = g/l; ϕ₁ = 0; ϕ₂ = 1;
ω₂ = g/l + 2*k/m;
# ω₂ = ω₁

# ω^2 ^^ as defined above

F₀ = 2; ω₀ = 1.0;
D = (ω₀ - ω₁)*(ω₀ - ω₂)

B₁ = ((F₀/m)*(k/m + g/l - ω₀^2))/D
B₂ = ((F₀/m)*(k/m))/D

x₁(t) = α*cos.(ω₁*t .+ ϕ₁) .+ β*cos.(ω₂*t .+ ϕ₂) + B₁*cos.(ω₀*t)
x₂(t) = α*cos.(ω₁*t .+ ϕ₁) .- β*cos.(ω₂*t .+ ϕ₂) .+ B₂*cos.(ω₀*t)

a = 0.0; b = 5.0
ts = collect(a:0.01:b)
df = 2

# plot(ts,x₁(ts), legend=false)
# plot!(ts,x₂(ts), legend=false)
 
anim = @animate for i = 1:df:length(ts)
        plot(ts[1:i],x₁(ts[1:i]), xlim=(a,b), legend=false)
        plot!(ts[1:i],x₂(ts[1:i]), xlim=(a,b), legend=false)
end
gif(anim, "./anim_fps15.gif", fps = 15)






ts = collect(0:4/0.01)*0.01
xs = collect(0:4/0.01)*0.01
plot(xs,x₁(ts), legend=false)
plot!(xs,x₂(ts), legend=false)

anim = @animate for i=1:length(ts)
        plot(ts[1:i],x₁(1:i), legend=false)
        plot!(ts[1:i],x₂(1:i), legend=false)
end
gif(anim, "./anim_fps15.gif", fps = 15)

anim = @animate for t=ts
        plot(t,x₁(t), legend=false)
        plot!(t,x₂(t), legend=false)
end



function meshgrid(x, y)
    X = [i for i in x, j in 1:length(y)]
    Y = [j for i in 1:length(x), j in y]
    return X, Y
end

α = 1
β = 1
l = 1; g = 9.8; k = 1; m = 1
ω₁ = g/l; ϕ₁ = 0; ϕ₂ = 1;
ω₂ = g/l + 2*k/m

# ω^2 ^^ as defined above

F₀ = 2; ω₀ = 1;
D = (ω₀ - ω₁)*(ω₀ - ω₂)

B₁ = ((F₀/m)*(k/m + g/l - w₀^2))/D
B₂ = ((F₀/m)*(k/m))/D

x₁(t) = α*cos(ω₁*t + ϕ₁) + β*cos(ω₂*t + ϕ₂) + B₁*cos(ω₀*t)
x₂(t) = α*cos(ω₁*t + ϕ₁) - β*cos(ω₂*t + ϕ₂) + B₂*cos(ω₀*t)

ts = collect(-4:4)*0.01
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
