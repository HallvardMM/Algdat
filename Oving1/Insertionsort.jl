function insertionsort!(A)
    for j in 2:length(A)
        key = A[j]
        i=j-1
        while i>0 && A[i]>key
            A[i+1]=A[i]
            i=i-1
            A[i+1]=key
        end
    end
end

liste=[7,6,5,4,3,2,1]
print(liste)
insertionsort!(liste)
print(liste)