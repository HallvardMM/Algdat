
function splitintwo(x,y)
    lenX = size(x,1)
    lenY = size(y,1)
        
    x_v = nothing
    x_h = nothing
    y_v = nothing
    y_h = nothing
        
    if lenX % 2 == 0
        mid = div(lenX, 2)
        x_v = x[1:mid, :]
        x_h = x[mid+1:lenX,:]
        y_v = zeros(Float64, mid, 2)
        y_h = zeros(Float64, size(x_h,1),2)
            
    else
        mid = div(lenX,2)+1
        x_v = x[1:mid,:]
        x_h = x[mid+1:lenX, :]
        y_v = zeros(Float64, mid,2)
        y_h = zeros(Float64, size(x_h,1),2)
    end

    indexV = 1
    indexH = 1

    for i in 1:size(y, 1)
        found = false
        for j in 1:size(x_v, 1)
            t = y[i, :] == x_v[j,:]
            if t
                y_v[indexV, :] = y[i,:]
                indexV += 1
                found = true
            end
        end
        if found == false
            for j in 1:size(x_h, 1)
                if y[i,:] == x_h[j,:]
                    y_h[indexH,:] = y[i,:]
                    indexH += 1
                end
            end
        end
    end
    return x_v, x_h, y_v, y_h
end
