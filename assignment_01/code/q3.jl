using Plots
using LaTeXStrings
# u₀ = 1
# ρ(r,t) = (r .- u₀*t)*exp.(-0.5*(r .- u₀*t .- 1).^2) 
# rs = collect(range(2,6,length=4))
# ts = collect(range(1,5,length=5))
# θs = collect(range(0, 2*pi, length=100))
# # contour plots...
# t = 1
# plot(θs, ones(100)*ρ(1,t) , proj=:polar)
# for r in rs
#     p = plot!(θs, ones(100)*ρ(r,t) , proj=:polar)
#     display(p)
# end

# plot rs, ρ(rs,t) for fixed t
# using GR
u₀ = 1
ρ(r,t) = (r .- u₀*t)*exp.(-0.5*(r .- u₀*t .- 1).^2) 
rs = collect(range(0,6,length=100))
ts = collect(range(1,5,length=5))
# initial condition
plot(rs, ρ.(rs,0),label = "t = 0", title = "Density Plot")
for t in ts
    p = plot!( rs,
              ρ.(rs,t),
              label = "t = $t",
              xlabel = "r",
              ylabel = "density" )
    display(p)
end


# # surface plot attempt
# u₀ = 1
# ρ(r,t) = (r .- u₀*t)*exp.(-0.5*(r .- u₀*t .- 1).^2) 
# len = 100
# rs = collect(range(2,6,length=len))
# ts = collect(range(1,5,length=len))
# θs = collect(range(0, 2*pi, length=len))
# t = 0
# f(r,θ) = ρ(r, t)

# surface(f(rs, θs), proj=:polar)

# f(rs, 0)
# fr(r) = ρ(r, ts)
# plot(rs, fr(rs), proj=:polar)
# contour(rs, θs, f, proj=:polar)
# contour(rs, r -> ρ(r,0))
# for t in ts
#     plot(rs, ρ(rs,t))
# end
# # f(r) = ρ(r,ts)
# # contour(rs,ts, f, proj=:polar)
# # plot(rs,f)