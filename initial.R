library(igraph)


graph1 = graph( c('Arad','Sibiu', 
                  'Arad', 'Timisoara', 
                  'Arad','Zerind', 
                  'Zerind', 'Odarea', 
                  'Odarea','Sibiu',
                  'Sibiu', 'Farara', 
                  'Sibiu','Riminieu Vilcca', 
                  'Riminieu Vilcca','Pitesti', 
                  'Riminieu Vilcca', 'Craiova', 
                  'Pitesti', 'Craiova', 
                  'Pitesti', 'Bucharest', 
                  'Bucharest','Giurgui', 
                  'Bucharest', 'Urzieeri', 
                  'Urzieeri','Hirsova', 
                  'Hirsova','Eforie', 
                  'Hirsova','Vaslui', 
                  'Vaslui', 'Iasi', 
                  'Iasi','Neamt', 
                  'Timisoara', 'Lugoj', 
                  'Lugoj','Mehadia',
                  'Mehadia', 'Dobreta',
                  'Dobreta','Craiova',
                  'Bucharest', 'Farara'), directed = FALSE)

V(graph1)$color = c('skyblue')

E(graph1)$weight = 1


graph2 = graph( c('A', 'B', 
                  'A', 'C', 
                  'B', 'D', 
                  'D', 'E', 
                  'D', 'C',
                  'E', 'G', 
                  'G', 'H', 
                  'H', 'I', 
                  'I', 'J', 
                  'J', 'K', 
                  'J', 'F', 
                  'K', 'M', 
                  'K', 'F', 
                  'C', 'F', 
                  'C', 'L', 
                  'L', 'M' 
                  ), directed = FALSE)



graph3 = graph( c('A', 'B',
                  'A', 'C',
                  'A', 'D',
                  'A', 'E'))

# Heuristic
g = make_empty_graph(directed = FALSE) + vertices(letters[1:18])
g = add_edges(g, c('a','b'), attr=list(weight = 73))
g = add_edges(g, c('a','c'), attr=list(weight = 64))
g = add_edges(g, c('a','d'), attr=list(weight = 89))
g = add_edges(g, c('a','e'), attr=list(weight = 104))
g = add_edges(g, c('k','b'), attr=list(weight = 83))
g = add_edges(g, c('k','h'), attr=list(weight = 35))
g = add_edges(g, c('h','l'), attr=list(weight = 36))
g = add_edges(g, c('l','i'), attr=list(weight = 28))
g = add_edges(g, c('l','p'), attr=list(weight = 63))
g = add_edges(g, c('i','c'), attr=list(weight = 64))
g = add_edges(g, c('i','f'), attr=list(weight = 31))
g = add_edges(g, c('i','m'), attr=list(weight = 20))
g = add_edges(g, c('p','o'), attr=list(weight = 45))
g = add_edges(g, c('p','r'), attr=list(weight = 65))
g = add_edges(g, c('o','m'), attr=list(weight = 50))
g = add_edges(g, c('o','r'), attr=list(weight = 72))
g = add_edges(g, c('r','q'), attr=list(weight = 65))
g = add_edges(g, c('q','j'), attr=list(weight = 80))
g = add_edges(g, c('q','g'), attr=list(weight = 113))
g = add_edges(g, c('j','n'), attr=list(weight = 53))
g = add_edges(g, c('j','e'), attr=list(weight = 40))
g = add_edges(g, c('j','g'), attr=list(weight = 35))
g = add_edges(g, c('n','d'), attr=list(weight = 89))
g = add_edges(g, c('n','f'), attr=list(weight = 84))

V(g)$color = c('skyblue')
V(g)['a']$color = c('yellow')
V(g)['r']$color = c('yellow')

hmap = hashmap(c('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R'),
               c(240,186,182,163,170,150,165,139,120,130,122,104,100,77,72,65,65,0))