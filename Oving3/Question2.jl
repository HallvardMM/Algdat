function binaryintervalsearch(x,delta, coordinate)
    output=Int64[]
if(length(x)<2)
    print("first if")
    return -1, -1
else
    mid=floor(Int64, length(x)/ndims(x)-floor(Int64, length(x)/ndims(x)/2))
    println("mid: ", mid)
    if(length(x)/ndims(x)%2==0)
        println("mod hit")
        midvalue=(x[mid,coordinate]+x[mid+1,coordinate])/2
        println("midvalue: ", midvalue)
    else
        midvalue=x[mid,coordinate]
        println("midvalue: ", midvalue)
    end
    mindelta=midvalue-delta
    println("mindelta: ", mindelta)
    maxdelta=midvalue+delta
    println("maxdelta: ", maxdelta)
    for i in 1:floor(Int64, length(x)/ndims(x))
        if(x[i,coordinate]>=mindelta && x[i,coordinate]<=maxdelta)
            println("this is output: ",i, output)
            if(length(output)>1)
                pop!(output)
            end
            push!(output,i)
        end
    end
end
if (length(output)<1)
    x=-1, -1
    return x
elseif (length(output)==1)
    x=output[1], output[1]
    return x
else
    x=output[1], output[2]   
    return x
end
end

print(binaryintervalsearch([1.0 0.0; 2.0 0.0; 3.0 0.0; 4.0 0.0], 0.1, 2))