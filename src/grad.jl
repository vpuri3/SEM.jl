#
#--------------------------------------#
export grad
#--------------------------------------#
"""
    Compute gradient

    [Dx] * u = [rx sx] * [Dr] * u
    [Dy]     = [ry sy]   [Ds]
"""
function grad(u,Dr,Ds,rx,ry,sx,sy)

ur = ABu([],Dr,u);
us = ABu(Ds,[],u);

ux = @. rx * ur + sx * us;
uy = @. ry * ur + sy * us;

return ux,uy
end
#--------------------------------------#
function grad(u::Array{Number},msh::Mesh)

    @unpack Dr,Ds,rx,ry,sx,sy = msh

    ux,uy = grad(u,Dr,Ds,rx,ry,sx,sy)

    return ux,uy
end
#--------------------------------------#
