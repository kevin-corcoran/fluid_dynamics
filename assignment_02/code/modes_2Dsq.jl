using Plots, LinearAlgebra #, Colors


function meshgrid(x, y)
    X = [i for i in x, j in 1:length(y)]
    Y = [j for i in 1:length(x), j in y]
    return X, Y
end

# # Linear discriminant function
# p(x,y,n,m) = sin.(n*pi*x).*sin.(m*pi*y)
λ(n,m) = pi*sqrt(n^2+m^2)
p(x,y,t,n,m) = sin.(n*pi*x).*sin.(m*pi*y).*(cos.(t*λ(n,m)) + sin.(t*λ(n,m)))
xs = collect(0:(1/0.01))*0.01
ys = collect(0:(1/0.01))*0.01
ts = collect(0:(5/0.01))*0.01
X, Y = meshgrid(xs,ys)
# P = p(X,Y,t,n,m)

# n = 1; m = 1; t = 0;
# p11 = plot(X,Y,p(X,Y,t,n,m), legend=false, title = "modes: w = $n, k = $m")
# savefig(p11, string("modes_w$n","_k$m.png"))

# n = 1; m = 2; t = 0;
# p12 = plot(X,Y,p(X,Y,t,n,m), legend=false, title = "modes: lw = $n, k = $m")
# savefig(p12, string("modes_w$n","_k$m.png"))

# n = 2; m = 2; t = 0;
# p22 = plot(X,Y,p(X,Y,t,n,m), legend=false, title = "modes: w = $n, k = $m")
# savefig(p22, string("modes_w$n","_k$m.png"))

n = 2; m = 2; # t = 0;
anim = @animate for i=ts
        plot(X,Y,p(X,Y,i,n,m), zlims = (-1.5,1.5), legend=false)
end
gif(anim, "./anim_n2_m2_fps15.gif", fps = 15)