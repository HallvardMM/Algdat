#x og y er to sorterte arrays, coordinate angir koordinat akse
function mergearrays(x,y,coordinate)
    output=[]
    for ø in 1:(length(x)/ndims(x)+length(y)/ndims(y))
        push!(output,[0 0])
    end
    i=1
    j=1
    k=1
    while i < (length(x)/ndims(x)+1) && j < (length(y)/ndims(y)+1)
        if(x[i,coordinate]<=y[j,coordinate])
            output[k]=x[i,:]
            println("x[i,:]: ", x[i,:])
            k=k+1
            i=i+1
        else
            output[k]=y[j,:]
            println("y[j,:]: ", y[j,:])
            k=k+1
            j=j+1
        end
    end
    
    while i < (length(x)/ndims(x)+1)
        output[k]=x[i,:]
        k=k+1
        i=i+1
        println("while x")
    end

    while j < (length(y)/ndims(y)+1)
        output[k]=y[j,:]
        k=k+1
        j=j+1
        println("while y")
    end

    return output
end

#x usortert array, coordinate angir koordinat akse vi skal sortere langs
function mergesort!(x, coordinate)
    if(length(x)/ndims(x)>1)
        println("length(x)/ndims(x): ",length(x)/ndims(x))
        mid = floor(Int64,length(x)/ndims(x)/2)
        println("floor(Int64,length(x)/ndims(x)/2): ", floor(Int64,length(x)/ndims(x)/2))
        L=x[1:mid,:]
        println("L=x[1:mid,:]: ", x[1:mid,:])
        R=x[mid:end,:]
        println("R=x[mid:end,:]: ", x[(mid+1):end,:])

        mergesort!(L,coordinate)
        mergesort!(R,coordinate)

        i=1
        j=1
        k=1

        # Copy data to temp arrays L[] and R[] 
        while (i < length(L)/ndims(L)+1) && (j < length(R)/ndims(R)+1) 
            if L[i,coordinate] <= R[j,coordinate] 
                x[k] = L[i,:] 
                i+=1
            else 
                x[k] = R[j,:] 
                j+=1
            end
            k+=1
        end

          
        # Checking if any element was left 
        while i < length(L)/ndims(L)+1
            x[k] = L[i,:] 
            i+=1
            k+=1
        end
          
        while j < length(R)/ndims(R)+1
            x[k] = R[j,:] 
            j+=1
            k+=1
        end
    end

        
end

function mergesort2(x, coordinate)
    output=[]
    out=zeros(Int8, length(x), 2)
    for i in 1:floor(Int64,length(x)/2)
        push!(output,Tuple(x[i,:]))
    end
    sort!(output,  by = x -> x[coordinate]) #Julia magic som bare funker på tupler!
    for i in 1:length(output)
        x[i,1]=output[i][1]
        x[i,2]=output[i][2]
    end
    return x
end
