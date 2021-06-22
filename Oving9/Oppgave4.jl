mutable struct DisjointSetNode
    rank::Int
    p::DisjointSetNode
    DisjointSetNode() = (obj = new(0); obj.p = obj;)
end

function union!(x::DisjointSetNode, y::DisjointSetNode)

    x = findset(x)
    y = findset(y)
    
    if x.rank > y.rank
        y.p = x
    else
        x.p = y
        if x.rank == y.rank
            y.rank += 1
        end
    end
end

function findset(x::DisjointSetNode)::DisjointSetNode
    if !(x == x.p)
        x.p = findset(x.p)
    end 
    return x.p
end

function hammingdistance(s1::String, s2::String)::Int
    output = 0
    for tall in 1:length(s1)
        if !(s1[tall]==s2[tall])
            output +=1
        end
    end
    return output
end

### Du skal implementere denne funksjonen ###
#E liste med kanter
#n antall noder
#k antall klynger jeg skal finne
#(w,u,v) fra u til v med vekt w
#klyngeanalyse med minimale spenntrær
#Kruskals algoritme
function findclusters(E::Vector{Tuple{Int, Int, Int}}, n::Int, k::Int)::Array{Array{Int}}
    nodes = DisjointSetNode[DisjointSetNode() for x in 1:n]
    sort!(E)
    number = n
    for element in E 
        if number == k
            break
        end
        if !(findset(nodes[element[2]]) == findset(nodes[element[3]]))
            union!(nodes[element[2]], nodes[element[3]])
            number -= 1
        end
    end

    dict = Dict()
    for tall in 1:n
        parent = findset(nodes[tall])
        if haskey(dict, parent)
            push!(dict[parent], tall)
        else
            dict[parent] = [tall]
        end
    end
    output = [lists for lists in values(dict)]
    return output
end

### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)


using Test
@testset "Tester" begin
    @test sort([sort(x) for x in findclusters([(1, 3, 4), (3, 1, 3), (5, 1, 4), (6, 2, 1), (7, 2, 3), (8, 3, 1), (9, 3, 2), 
    (10, 4, 1), (11, 4, 2), (12, 4, 3), (4, 2, 4), (2, 1, 2)], 4, 2)]) == sort([[1, 2], [3, 4]])
    @test sort([sort(x) for x in findclusters([(1, 3, 4), (3, 1, 3), (5, 1, 4), (6, 2, 1), (7, 2, 3), (8, 3, 1), (9, 3, 2), 
    (10, 4, 1), (11, 4, 2), (12, 4, 3), (4, 2, 4), (2, 1, 2)], 4, 3)]) == sort([[1], [2], [3, 4]])
end

println("\nFungerte det? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke sjekker alle grensetilfellene")
println("---------------------------------------------------------\n\n")