#trajectory plotting
function plot_trajectory!(ax, particle, billiard, T; dt = 0.01, full_domain=false, traj_args = traj_args, plot_velocity = false)
    pts, vel, ts = trajectory(particle, billiard, T; dt, full_domain)
    plot_domain!(ax,billiard, fundamental_only=!full_domain)
    lines!(ax, getindex.(pts,1), getindex.(pts,2); traj_args...)
    if plot_velocity
        arrows!(ax, getindex.(pts,1), getindex.(pts,2), getindex.(vel,1), getindex.(vel,2); lengthscale = 0.05)
    end
end

export plot_trajectory!