graph1 = g

root = unname(V(graph1)['a'])
goal = unname(V(graph1)['r'])

open = c(root)
closed = c()
visited = cbind(V(graph1),rep(0,length(V(graph1))))
visited[1,2] = 1
current = root

sld[unname(neighbors(g,'a')),]$V2
while (length(open) != 0) {
  if (current == goal) {
    #    V(graph1)[c(current)]$color = 'pink'
    closed = append(closed,(current))
    break()
  }
  
  
  open = open[open!=current]
  
  if(is.null(closed))
  {  closed = c(current) }else
  {  closed = append(closed,(current))}
  
  adj_v = unname(neighbors(graph1, current))
  
  for(v in adj_v){
    if(visited[v,2]==1){
      adj_v = adj_v[adj_v != v]}
    
  }
  
  
  open  = c(adj_v, open)

  current = open[1]
  visited[current,2] = 1
  
  
  if(length(open)==0)
  {echo('Failure')}
}
plot(graph1)
V(graph1)[closed]
E(graph1)[closed]