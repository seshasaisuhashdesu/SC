
co_sites = c(3,5,3,2)
mut_sites = c(2,1,4,5,3,2,3,2)
co_prob = 0.6
mut_prob = 0.1

population = c(13,24,8,19,18,7,23,25)
  
max_range = 28
min_range = 0
n = 5

get_x_value <- function(x){
  return(min_range + (max_range-min_range)/((2^n)-1 ) * x)
}

obj_function <- function(x_value){
  return(x_value^2)
}

get_pi_value <- function(Fx){
  return(Fx/sum(Fx))
}


selected_chromosomes <- function(cum_Pi, r){
  
  chrom_no = c()
  for(element in r){
    i = 1
    chrom = NULL
    for(p_element in cum_Pi){
      
      if(element > p_element){
        chrom = i + 1
      }
      i = i + 1
    }
    if(is.null(chrom)) { chrom_no = append(chrom_no, 1) }
    else{ chrom_no = append(chrom_no, chrom) }
  }
  
  return(chrom_no)
}

get_binary <- function(x){
  result = c()
  for(each in x){
    result = append(result,substring(paste(as.integer(rev(intToBits(each))),collapse=""), 32-n+1, 32))  
  }
  return(result)
}


do_crossover <- function(binary_pop){
  selected_chrom_iter = 1
  intermediate_population = c()
  for(each in r_co){
    if(each  <= co_prob){
      slice1 = paste(substring(binary_pop[selected_chrom_iter],1,co_sites[(selected_chrom_iter+1)/2]), substring(binary_pop[selected_chrom_iter+1],co_sites[(selected_chrom_iter+1)/2]+1), sep="" )
      slice2 = paste(substring(binary_pop[selected_chrom_iter+1],0,co_sites[(selected_chrom_iter+1)/2]), substring(binary_pop[selected_chrom_iter],co_sites[(selected_chrom_iter+1)/2]+1), sep="" )
      
      intermediate_population = append(intermediate_population, slice1)
      intermediate_population = append(intermediate_population, slice2)
    }
    else{
      intermediate_population = append(intermediate_population,binary_pop[selected_chrom_iter])
      intermediate_population = append(intermediate_population,binary_pop[selected_chrom_iter+1])
    }
    selected_chrom_iter = selected_chrom_iter + 2
  }
  return(intermediate_population)
}


do_mutation <- function(intermediate_population){
  generation = c()
  mut_iter = 1
  for(each in intermediate_population){
    if(runif(1,min = 0, max=1) <= mut_prob){
      if(substring(each,mut_sites[mut_iter],mut_sites[mut_iter]) == "0"){
        var1 = paste(substring(each,1,mut_sites[mut_iter]-1),"1",substring(each,mut_sites[mut_iter]+1),sep = "")
        generation = append(generation,var1)
        #substring(each,mut_sites[mut_iter],mut_sites[mut_iter]) = "1"
      } else{
        var1 = paste(substring(each,1,mut_sites[mut_iter]-1),"0",substring(each,mut_sites[mut_iter]+1),sep = "")
        generation = append(generation,var1)
        #substring(each,mut_sites[mut_iter],mut_sites[mut_iter]) = "0"
      }
      
    }
    else{
      generation = append(generation, each)
    }
    mut_iter = mut_iter + 1
  }
  return(generation)
}


avg_fitness_list = c()
for(i in rep(1,500)){
  #Selection
  x_value = get_x_value(population)
  fx = obj_function(x_value)
  Fx = fx
  average_fitness = mean(Fx)
  Pi = get_pi_value(Fx)
  cum_Pi = cumsum(Pi)
  r_selection = runif(length(population))
  selected = selected_chromosomes(cum_Pi,r_selection)
  #CrossOver
  r_co = runif(length(population)/2)
  binary_pop = get_binary(population[selected])
  intermediate_population = do_crossover(binary_pop)
  #Mutation
  population = do_mutation(intermediate_population)
  population = strtoi(population, base=2)
  avg_fitness_list = append(avg_fitness_list, average_fitness)
}
plot(avg_fitness_list)
