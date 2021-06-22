s = []
push!(s, 2)
push!(s, 5)
println(s)    # gir lista [2,5]
println(s[1]) # dette gir verdien 2
x = pop!(s)
println(x)    # dette gir verdien 5

# Visste du at funksjoner kan ha emoji i navnet?  💯
function reverseandlimit(array, maxnumber)
    output=[]
    for i in 1:length(array)
        x=pop!(array)
        if x>maxnumber
            push!(output,maxnumber)
        else
            push!(output,x)
        end
    end
    return output
end

test=[2,3,5,7,8,0,10]
print(test)
print(reverseandlimit(test,6))