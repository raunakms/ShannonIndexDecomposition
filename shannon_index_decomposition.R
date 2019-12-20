### FUNCTION: get.Hwithin() ---
get.Hwithin <- function(dat){
    # H_w = - SUM_g [ (n_g/n) * (SUM_i [ (n_gi/n_g) * ln(n_gi/n_g)] ) ]

    # GET GROUP AND ITEM TOTAL ---
    total_g <- rowSums(dat)
    total_i <- colSums(dat)
    total_t <- sum(total_g)

    list.j <- list()
    for(g in 1:length(total_g)){
        n_g <- total_g[g]
        n <- total_t

        list.k <- list()
        for(i in 1:length(total_i)){
            n_gi <- dat[g,i]
            k <- (n_gi/n_g)

            if(n_gi != 0){
                list.k[[i]] <- k * log(k)
            }else{
                list.k[[i]] <- k
            }
        }

        list.j[[g]] <- (n_g/n) * sum(unlist(list.k))
    }

    h_w <- - sum(unlist(list.j))

    return(h_w)
}

### FUNCTION: get.Hbetween() ---
get.Hbetween <- function(dat){
    # H_b = SUM_g [ (n_g/n) * (SUM_i [(n_gi/n_g) * ln((n_gi/n_g)/(n_i/n))] )]

    # GET GROUP AND ITEM TOTAL ---
    total_g <- rowSums(dat)
    total_i <- colSums(dat)
    total_t <- sum(total_g)

    list.b <- list()
    for(g in 1:length(total_g)){
        n_g <- total_g[g]
        n <- total_t

        list.k <- list()
        for(i in 1:length(total_i)){
            n_gi <- dat[g,i]
            n_i <- total_i[i]
            k <- (n_gi/n_g)

            if(n_gi != 0){
                list.k[[i]] <- k * log(k / (n_i/n) )
            }else{
                list.k[[i]] <- k
            }
        }

        list.b[[g]] <- (n_g/n) * sum(unlist(list.k))
    }

    h_b <- sum(unlist(list.b))

    return(h_b)
}

### FUNCTION:get.ShannonIndexDecomposition() ---
get.ShannonIndexDecomposition <- function(dat){
    # WITHIN GROUP SHANNON INDEX ---
    H_withinGroup <- get.Hwithin(dat)

    # BETWEEN GROUP SHANNON INDEX ---
    H_betweenGroup <- get.Hbetween(dat)

    # SHANNON INDEX DECOMPOSITION ---
    H_overall <- - H_withinGroup + H_betweenGroup

    # OUTPUT ---
    list.output <- list(H_withinGroup=H_withinGroup, 
                        H_betweenGroup=H_betweenGroup, 
                        H_overall=H_overall)

    return(list.output)
}
