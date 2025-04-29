module CBPlotting

using Makie
using QCPlotting
using BilliardGeometry
using BilliardGeometryPlotting
using ClassicalBilliards

using StaticArrays

traj_args = Dict(:linewidth=>0.75, :linestyle=>:solid, :transparency => true, :alpha => 0.1)
include("trajectory.jl")


end
