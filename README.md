# ShannonIndexDecomposition
This script is useful for Shannon Entropy Index Decomposition implemented in R. This script is based on the Shannon Entropy Index Decomposition formulation presented by [Akay *et al*. J Popul Econ., 2017](https://doi.org/10.1007/s00148-016-0618-8)

## Reference
> Akay *et al*. *Ethnic diversity and well-being.*  J Popul Econ. (2017) 30(1):265–306. [DOI: 10.1007/s00148-016-0618-8](https://doi.org/10.1007/s00148-016-0618-8)
> Josef Novotný. *On the measurement of regional inequality: does spatial dimension of income inequality matter?* Ann Reg Sci (2007) 41:563–580. [DOI:10.1007/s00168-007-0113-y](https://doi.org/10.1007/s00168-007-0113-y)
<br/><br/>

## Usage
- Shannon Entropy Index Decomposition 
  - Use `get.ShannonIndexDecomposition()` function to get the within group (in-class), between group (out-class), and overall group diversity index.

```sh
get.ShannonIndexDecomposition(dat)
```

#### Input parameter
- `dat` : R dataframe or matrix containing the input data of Group and Features. Groups, for which the diversity indices are calculated, are arranged in rows and the Features in columns.

#### Output
- The function `get.ShannonIndexDecomposition` generates output of the following in form of a R-list.
  - `H_withinGroup`   : Within group Shannon Entropy Index Decomposition
  - `H_betweenGroup`  : Between group Shannon Entropy Index Decomposition
  - `H_overall`       : Overall Shannon Entropy Index
<br/><br/>

## Demo script
```sh
# LOAD DATA --- 
dat <- matrix(c(20,30,10,70), byrow = TRUE, nrow = 2)

# SHANNON INDEX DECOMPOSITION ---
source("shannon_index_decomposition.R")
get.ShannonIndexDecomposition(dat)
```
