## Du skal implementere denne funksjonen 
function countingsortlength(A)
    number_of_elements = zeros(Int64, 1000)
    output = Array{Union{Nothing, String}}(nothing, length(A))
    for j in 1:length(A)
        number_of_elements[length(A[j])+1] = number_of_elements[length(A[j])+1] + 1
    end

    for i in 2:1000
        number_of_elements[i] = number_of_elements[i] + number_of_elements[i-1]
    end

    for j in length(A):-1:1
        output[number_of_elements[length(A[j])+1]] = A[j]
        number_of_elements[length(A[j])+1] = number_of_elements[length(A[j])+1] - 1
    end
    return output
end





### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere! 

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test countingsortlength(["ccc", "bb", "a"]) == ["a", "bb", "ccc"]
    @test countingsortlength(["aaa", "bb", "c"]) == ["c", "bb", "aaa"]
    @test countingsortlength(["bb", "a", ""]) == ["", "a", "bb"] # Testen her sjekker om du kan sortere også med emtpy string
    @test countingsortlength(["bbbb", "aa", "aaaa", "ccc"]) == ["aa", "ccc", "bbbb", "aaaa"] # Fra oppgaven
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")