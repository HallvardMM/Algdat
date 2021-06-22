function usegreed(coins)
    for i in 1:length(coins)
        for j in i+1:length(coins)
            if(coins[i]%coins[j] != 0)
                return false
            end
        end
    end
    return true
end

function mincoinsgreedy(coins, value)
    output=0
    for element in coins
        output = output + floor(value/element)    
        value = value%element
    end
    return output
end

function mincoins(coins, value)
    # Om du ikke trenger inf kan du fjerne den
    inf = typemax(Int)
    # din kode her
end

### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test mincoins([4,3,1],18) == 5
  @test mincoins([1000,500,100,30,7,1],14) == 2
  @test mincoins([40, 30, 20, 10, 1], 90) == 3
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")