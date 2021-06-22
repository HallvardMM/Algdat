function countingsortletters(A,position)
    number_of_elements = zeros(Int64, chartodigit('z'))
    output = Array{Union{Nothing, String}}(nothing, length(A))
    for j in 1:length(A)
        number_of_elements[chartodigit(A[j][position])] = number_of_elements[chartodigit(A[j][position])] + 1
    end

    for i in 2:chartodigit('z') 
        number_of_elements[i] = number_of_elements[i] + number_of_elements[i-1]
    end

    for j in length(A):-1:1
        output[number_of_elements[chartodigit(A[j][position])]] = A[j]
        number_of_elements[chartodigit(A[j][position])] = number_of_elements[chartodigit(A[j][position])] - 1
    end
    return output
end



function chartodigit(character)
    #Dette er en hjelpefunksjon for å få omgjort en char til tall
    #Den konverterer 'a' til 1, 'b' til 2 osv.
    #Eksempel: chartodigit("hei"[2]) gir 5 siden 'e' er den femte bokstaven i alfabetet.

    return character - '`'
end

### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere! 

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test countingsortletters(["aa", "bb", "cc"], 1) == ["aa", "bb", "cc"]
    @test countingsortletters(["cc", "bb", "aa"], 2) == ["aa", "bb", "cc"]
    @test countingsortletters(["ac", "bb", "ca"], 2) == ["ca", "bb", "ac"]
    @test countingsortletters(["ccc", "cba", "ca", "ab", "abc"], 2) == ["ca", "cba", "ab", "abc", "ccc"]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")