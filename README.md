# TES_optimisation

## Objective 
A numerical model is developed to quantify the influence of graded metal foam on heat transfer rate, which is used to train an Artificial Neural Network (ANN) model. The porosity distribution has been optimized using a Genetic algorithm, which employs the ANN model to ascertain heat transfer rate for different graded metal foams.

## Procedure
   - Create Numerical model to find the heat transfer rate for various values porosity $\varepsilon_1$, $\varepsilon_2$ and $\varepsilon_3$
     
     ![image](https://github.com/sanjeet178/TES_optimisation/assets/69724036/01e36a3a-3ede-4e78-8c35-61b4d5de07b7)
   - Create ANN to map the **Heat Transfer Rate** to various values of **Porosities $\varepsilon$**. Optimiser:- **Adam Optimiser**, Hidden layers = 1, Mean Squared error based loss function used. The heat transfer rate is **Normalised** for training

     ![image](https://github.com/sanjeet178/TES_optimisation/assets/69724036/ffc3d873-7de0-41b9-9bb8-20c7c6a4fe2c)
     
   - Apply Genetic Algorithm to find the optimal value of $\varepsilon_1$, $\varepsilon_2$ and $\varepsilon_3$ such that enhanced heat transfer is achieved. Genetic Algorithm is a global optimiser that can be used to find the Global Extrema of the problem.

## Results
It can be seen that the the highest heat transfer rate is obtained at $\varepsilon_1$ = 0.93, $\varepsilon_2$ = 0.95 and $\varepsilon_3$ = 0.97 

![image](https://github.com/sanjeet178/TES_optimisation/assets/69724036/5a9d0ffb-3546-44da-ba53-ea54e1b4fb6e)

## References
   - Patankar, S. (1980, January 1). Numerical Heat Transfer and Fluid Flow. https://doi.org/10.1604/9780891165224
   - Pratama, D. A., Abo-Alsabeh, R. R., Bakar, M. A., Salhi, A., & Ibrahim, N. F. (2023, August). Solving partial differential equations with hybridized physic-informed neural network and optimization approach: Incorporating genetic algorithms and L-BFGS for improved accuracy. Alexandria Engineering Journal, 77, 205–226. https://doi.org/10.1016/j.aej.2023.06.047
