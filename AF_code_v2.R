# 1. Setup and preparation ----

## 1.1 Set Working Directory ----

setwd("/Volumes/Ext_Dr_BH/R_Directory/R_thesis")

## 1.2 Install and load necessary packages ----

usePackage <- function(p){
  if(!is.element(p, installed.packages()[,1])) install.packages(p, dep = TRUE)
  require(p, character.only = TRUE)
}

usePackage("decisionSupport")
usePackage("tidyverse") 
usePackage("rmarkdown") 
usePackage("knitr")


# 2. Define input table, legends table and results folders----

input_table <- read.csv("AF_input_table.csv")
legend_file <- read.csv("AF_legend_storage.csv")
evpi_results_folder <- "AF_evpi_results"

# 3. Random value selection ----
make_variables<-function(est,n=1)
{ x<-random(rho=est, n=n)
for(i in colnames(x)) assign(i,
                             as.numeric(x[1,i]),envir=.GlobalEnv)
}

make_variables(estimate_read_csv(input_table)) 

# 4. Model function ----

AF_cost_benefit_simulation <- function () {
 
## 4.1 Calculate Satus Quo ---- 
  ## 4.1.1 Status Quo Costs: Seasonal maize expense----
  
  seasonal_maize_expense <- 
    ((farmers_maize * local_price) + (imported_maize * import_price))
  
  farmers_maize <- total_area_harvest - (total_area_harvest * AF_maize_loss)
  
  ## 4.1.2 Status Quo Benefits ----
  
  seasonal_income <- flour_sales * flour_price
  
  # for sales, we choose an optimum milling capacity.. figure out how to 
  # define what is the optimum for processing unit for sales (costs to be 
  #included, find out how they define the target sale)
  
  # find out how to write a condition, maybe an if else function, farmers maize 
  # must be at least equal to the min milling, otherwise the gap equals 
  # amount of import maize
  
  #if max milling capacity is used with farmers maize, it's a benefit
     
}
# 6. Value Varier function to produce realistic year-to-year variation ----
vv()
 
# 7. Montecarlo simultation for model function ----

mcSimulation(estimate = as.estimate(input_table),
             model_function = example_decision_model,
             numberOfModelRuns = 100,
             functionSyntax = "plainNames")

# 8. Projection to Latent Structures (PLS) Analysis ----

# 9. Calculation of the expected cash flow ----

# 10. Visualization and interpretation of outputs ----


                       
# Example with Cory of initial model ----
example_decision_model <- function(x, varnames)
{
  profit <- benefits-costs
  
  final_profits <- profit + 500
  final_baseline <- profit 
  return(c(final_profits, final_baseline))
  
}


