#trajectory plotting
function plot_trajectory!(ax, particle, billiard, T; dt = 0.01, full_domain=false, traj_args = traj_args, plot_velocity = false, dens = 200.0)
    pts, vel, ts = trajectory(particle, billiard, T; dt, full_domain)
    plot_domain!(ax,billiard, fundamental_only=!full_domain, dens=dens)
    lines!(ax, getindex.(pts,1), getindex.(pts,2); traj_args...)
    if plot_velocity
        arrows!(ax, getindex.(pts,1), getindex.(pts,2), getindex.(vel,1), getindex.(vel,2); lengthscale = 0.05)
    end
end

function plot_pb_trajectory!(ax, particle, billiard, T; dt = 0.01)
    boundary = CompositeCurve(get_boundary_curves(billiard))
    pb_traj = pb_trajectory(particle,billiard,T-1; dt = dt)
    scatter!(ax,[pt.s for pt in pb_traj],[pt.p for pt in pb_traj] )
    vlines!(ax,pb_sectors(billiard),color=:black, linestyle= :dash)
    ylims!(ax, -1.0, 1.0)
    xlims!(ax, 0.0, boundary.length*(length(billiard.symmetries)+1))
end

export plot_trajectory!, plot_pb_trajectory!