#
# Compute the Lagrange interpolation matrix from xi to xo
#
function interpMat(xo,xi)
    
    no = length(xo)
    ni = length(xi)

    a = ones(1,ni)
    for i=1:ni
        for j=1:(i-1)  a[i]=a[i]*(xi[i]-xi[j]) end
        for j=(i+1):ni a[i]=a[i]*(xi[i]-xi[j]) end
    end
    a = 1 ./ a

    J = zeros(no,ni)
    s = ones(1,ni)
    t = ones(1,ni)
    for i=1:no
        x = xo[i]
        for j=2:ni
            s[j]      = s[j-1]    * (x-xi[j-1]   )
            t[ni+1-j] = t[ni+2-j] * (x-xi[ni+2-j])
        end
        J[i,:] = a .* s .* t
    end

    return J
end
