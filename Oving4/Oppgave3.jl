## Hvis du bruker denne, kan jeg desverre ikke gi ut LF
## Da må du fylle den ut selv
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

## Hvis du bruker denne, kan jeg desverre ikke gi ut LF
## Da må du fylle den ut selv
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

## Du skal implementere denne funksjonen 
function flexradix(A, maxlength)
    sorted_length = countingsortlength(A)
    for i in maxlength:-1:1
        last_elements = []
        temp = findall(x -> length(x) >= i, sorted_length)
        if length(temp) != 0 && temp != last_elements
            start = temp[1]
            slutt = temp[end]
            possible_check = sorted_length[start:slutt]
            sortert_check = countingsortletters(possible_check, i)
            sorted_length[start:slutt] = sortert_check
            last_elementer = temp
        end
    end
    return sorted_length
end


###NESTE TEST ###
### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere! 

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test flexradix(["d", "c", "b", "a"], 1) == ["a", "b", "c", "d"]
    @test flexradix(["d", "c", "b", ""], 1) == ["", "b", "c", "d"]
    @test flexradix(["jeg", "elsker", "deg"], 6) == ["deg", "elsker", "jeg"]
    @test flexradix(["denne", "oppgaven", "mangler", "emojies"], 8) == ["denne", "emojies", "mangler", "oppgaven"]
    @test flexradix(["kobra", "aggie", "agg", "kort", "hyblen"], 6) == ["agg", "aggie", "hyblen", "kobra", "kort"] # Fra oppgaven
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")


