function f4(n)
    for i in 1:n
        for j in i:n
            println("Algdat ruler!")
        end
    end

    if n > 1
        for i in 1:36
            f4(1/6* n)
        end
    end
end

f4(12)