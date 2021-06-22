### Du skal implementere denne funksjonen ###
function cumulative(weights)

    rows, cols = size(weights)
    path = Matrix{Int64}(undef, rows, cols)
    
    for row in 1:rows
        for column in 1:cols
            
            if row == 1
                weights[row, column] = weights[row, column]
            elseif column == 1
                number = min(weights[row-1, column], weights[row-1, column+1])
                weights[row, column] = number + weights[row, column]
            elseif column == cols 
                number = min(weights[row-1, column-1], weights[row-1, column])
                weights[row, column] = number + weights[row, column]
            else
                number = min(weights[row-1, column-1], weights[row-1, column])
                number = min(number, weights[row-1, column+1])
                weights[row, column] = number + weights[row, column]
            end
        end
    end
    
    return weights
    
end

### Tester ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test cumulative([1 1 ; 1 1]) == [1 1 ;2 2]
    #Dette er samme eksempel som det vist i oppgaveteskten
	@test cumulative([3  6  8 6 3; 7  6  5 7 3; 4  10 4 1 6; 10 4  3 1 2;6  1  7 3 9])== [3  6  8  6  3;10 9  11 10 6;13 19 13 7  12;23 17 10 8  9;23 11 15 11 17]
end


println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")