function hammingdistance(s1::String, s2::String)::Int
    output = 0
    for tall in 1:length(s1)
        if !(s1[tall]==s2[tall])
            output +=1
        end
    end
    return output
end

print(hammingdistance("ATPBC","AFPSC"))