graph1 = g
root = unname(V(graph1)['a'])
goal = unname(V(graph1)['e'])

sld[unname(neighbors(g,'a')),]$V2

while () {
  
  if (current == goal) {
   
  }
  
  
  adj_v = unname(neighbors(graph1, current))
  sld[unname(neighbors(g,current)),]
  
  for(v in adj_v){
    if(visited[v,2]==1){
      adj_v = adj_v[adj_v != v]}
    
  }
  
  
  open  = c(adj_v, open)
  
  # if(is.null(closed))
  # {  closed = c(open[1]) }else
  # {  closed = append(closed,open[1])}
  #     
  #open = open[2:length(open)]
  
  
  current = open[1]
  visited[current,2] = 1
  
  
  V(graph1)[c(current)]$color = 'pink'
  if(length(open)==0)
  {echo('Failure')}
}
plot(graph1)
V(graph1)[closed]
E(graph1)[closed]