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

function findclusters(E::Vector{Tuple{Int, Int, Int}}, n::Int, k::Int)
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
    output = values(dict)
    return output
end

### Du skal implementere denne funksjonen ###
function findanimalgroups(animals::Vector{Tuple{String, String}}, k::Int64)::Array{Array{String}}
    #Generere listen, E, med kanter, der vekten, w, regnes ut med funksjonen hammingdistance. 
    #Husk at det skal gå en kant mellom et hvert par med noder.
    E = Array{Tuple{Int, Int,Int}}(undef, 0)
    for i in 1:length(animals)
        for j in i+1:length(animals)
            w = hammingdistance(animals[i][2],animals[j][2])
            push!(E,(w,i,j))
            push!(E,(w,j,i))
        end
    end
    #Finne grupperingen med findclusters.
    clusters = findclusters(E, length(animals),k)
    #Endre returverdien fra findclusters til å innholde lister med dyrenavn i stedet for indekser.
    output = Array{Array{String}}(undef,0)
    for edges in clusters
        temp = Array{String}(undef,0)
        for value in edges
            push!(temp, animals[value][1])
        end
        push!(output, temp)
    end
    println("ouptut: ", output)
    return output
end

### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)


using Test
@testset "Tester" begin
    @test sort([sort(x) for x in findanimalgroups([("Ugle", "CGGCACGT"), ("Elg", "ATTTGACA"), ("Hjort", "AATAGGCC")], 2)]) == sort([["Ugle"], ["Elg", "Hjort"]])

    @test sort([sort(x) for x in findanimalgroups([("Hval", "CGCACATA"), ("Ulv", "AGAAACCT"), ("Delfin", "GGCACATA"), ("Hund", "GGAGACAA"), 
    ("Katt", "TAACGCCA"), ("Leopard", "TAACGCCT")], 3)]) == sort([["Hund", "Ulv"], ["Delfin", "Hval"], ["Katt", "Leopard"]])
end

println("\nFungerte det? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke sjekker alle grensetilfellene")
println("---------------------------------------------------------\n\n")
