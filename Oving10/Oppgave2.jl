function initialize!(G, s)
    for vertex in G.V
        vertex.d = -Inf
        vertex.p=vertex
    end
    s.d=Inf
end


function update!(u, v, w)
    if v.d < u.d+w
        v.d = u.d+w
        v.p = u
    end
end