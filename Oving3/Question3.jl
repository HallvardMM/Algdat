function bruteforce(x)
    out=Inf
    for i in 1:floor(Int64,length(x)/ndims(x))
        for j in 1:floor(Int64,length(x)/ndims(x))
            if(i!=j)
                if(sqrt((x[j,1]-x[i,1])^2+(x[j,2]-x[i,2])^2)<out)
                    out=sqrt((x[j,1]-x[i,1])^2+(x[j,2]-x[i,2])^2)
                end
            end
        end
    end
    return out
    
end

liste=[1 1; 10 0; 2 2; 57 5]
println(bruteforce(liste))
