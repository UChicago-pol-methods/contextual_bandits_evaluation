<h1 align="center">Contextual Replication of Adaptive Confidence Intervals</h1>

# R Package Adaptation

We have adjusted the simulation code originally provided by [Zhan, Ruohan, et al. (2021)](https://arxiv.org/abs/2106.02029) to focus on only on the estimation methods relevant to our `banditsCI` R package: contextual and non-contextual variance minimizing and variance stabilizing estimates. 
The original Python example code is accessible [here](https://github.com/gsbDBI/contextual_bandits_evaluation/blob/master/experiments/intro_example.ipynb).

Our updated version of Python simulation code is accessible here:
- [experiments/simulation.ipynb](https://github.com/UChicago-pol-methods/contextual_bandits_evaluation/blob/master/experiments/main/simulations.ipynb)
We simulate the experimental data in python, analyze it using the original python code, and then export identical data to be analyzed in R. 

Our analysis script in R can be reviewed here:
- R Markdown: [experiments/results/Simulation_with_Python_experiment_data.Rmd](https://github.com/UChicago-pol-methods/contextual_bandits_evaluation/blob/master/experiments/results/Simulation_with_Python_experiment_data.Rmd)
- Rendered PDF: [experiments/results/Simulation_with_Python_experiment_data.pdf](https://github.com/UChicago-pol-methods/contextual_bandits_evaluation/blob/master/experiments/results/Simulation_with_Python_experiment_data.pdf)

The objective is to compare the estimates produced in the [python notebook](https://github.com/UChicago-pol-methods/contextual_bandits_evaluation/blob/master/experiments/main/simulations.ipynb) (cells 4, 5, and 6) to those in the R script, reported below. 
Note that in numerical examples Zhan et al. estimate constrasts "defining the doubly robust score for the contrast as the difference in doubly robust scores for the two policies," (section 6, Target Policies) i.e., the appropriate comparisons for contrasts are using the "combined" method. 
In the python analysis code, 
- Non-contextual variance minimizing estimates are represented  as`propscore_expected`
- Contextual variance minimizing estimates are `propscore_X`
- Non-contextual variance stabilizing estimates are `lvdl_expected`
- Contextual variance stabilizing estimates are `lvdl_X`
- Unlike in the R code, in the python code, `uniform` estimation method refers to one in which weights 1:T are applied to doubly robust scores; this differes from the "uniform" estimation method in [Hadad, et al. (2021)](https://arxiv.org/abs/1911.02768) which reports AIPW estimates, which is also what is reported as "uniform" in the R code. Here we also present methods to replicate the 1:T weighting scheme in the Zhan et al. simulations as `uniform_var`. 


|method                   |   estimate| std_error|       var|contrasts   |policy         |
|:------------------------|----------:|---------:|---------:|:-----------|:--------------|
|non_contextual_minvar    |  0.4017075| 0.0563778| 0.0031785|main effect |optimal        |
|contextual_minvar        |  0.5147350| 0.0181728| 0.0003303|main effect |optimal        |
|non_contextual_stablevar |  0.4450447| 0.0577781| 0.0033383|main effect |optimal        |
|contextual_stablevar     |  0.5011886| 0.0222223| 0.0004938|main effect |optimal        |
|uniform_var              |  0.4646648| 0.0569579| 0.0032442|main effect |optimal        |
|non_contextual_minvar    |  0.1876929| 0.0395924| 0.0015676|main effect |best           |
|contextual_minvar        |  0.1950278| 0.0261016| 0.0006813|main effect |best           |
|non_contextual_stablevar |  0.1369466| 0.0624188| 0.0038961|main effect |best           |
|contextual_stablevar     |  0.1656435| 0.0367070| 0.0013474|main effect |best           |
|uniform_var              | -0.0529567| 0.3033878| 0.0920442|main effect |best           |
|non_contextual_minvar    |  0.3175327| 0.0794133| 0.0063065|combined    |(best,optimal) |
|contextual_minvar        |  0.2869980| 0.0545568| 0.0029764|combined    |(best,optimal) |
|non_contextual_stablevar |  0.3751744| 0.1153043| 0.0132951|combined    |(best,optimal) |
|contextual_stablevar     |  0.3403858| 0.0908967| 0.0082622|combined    |(best,optimal) |
|uniform_var              |  0.5176216| 0.3027359| 0.0916490|combined    |(best,optimal) |
|non_contextual_minvar    |  0.2140146| 0.0688913| 0.0047460|separate    |(best,optimal) |
|contextual_minvar        |  0.3197071| 0.0318048| 0.0010115|separate    |(best,optimal) |
|non_contextual_stablevar |  0.3080981| 0.0850554| 0.0072344|separate    |(best,optimal) |
|contextual_stablevar     |  0.3355451| 0.0429096| 0.0018412|separate    |(best,optimal) |

We find that the estimates are nearly identical except for rounding errors. 

---------------------------------------------
The following is the original README.md:


<h1 align="center">Adaptive Weighting in Contextual Bandits</h1>

Models for paper _Off-Policy Evaluation via Adaptive Weighting with Data from Contextual Bandits_.

<p align="center">
  Table of contents </br>
  <a href="#overview">Overview</a> •
  <a href="#development-setup">Development Setup</a> •
  <a href="#quickstart-with-model">Quickstart</a> 
</p>


# Overview

*Note: For any questions, please file an issue.*

Adaptive experimental designs can dramatically improve efficiency in randomized trials. But adaptivity also makes offline policy inference challenging. In the paper _Off-Policy Evaluation via Adaptive Weighting with Data from Contextual Bandits_, we propose a class of estimators that lead to asymptotically normal and consistent policy evaluation. This repo contains reproducible code for the results shown in the paper. 

We organize the code into two directories:
- [./adaptive](https://github.com/gsbDBI/contextual_bandits_evaluation/tree/main/adaptive) is a Python module for doing adaptive weighting developed in the paper.

- [./experiments](https://github.com/gsbDBI/contextual_bandits_evaluation/tree/main/experiments) contains python scripts to run experiments and make plots shown in the paper, including:
   - collecting contextual bandits data with a Thompson sampling agent;
   - doing off-line policy evaluation using collected data;
   - saving results and making plots. 

# Development setup
R and Python are required. We recommend creating the following conda environment for computation.
```bash
conda create --name aw_contextual python=3.7
conda activate aw_contextual
source install.sh
```

# Quickstart with model

- To do adaptive weighting and reproduce results shown in the paper, please follow the instructions in [./experiments/README.md](https://github.com/gsbDBI/contextual_bandits_evaluation/blob/main/experiments/README.md).
- For a quick start on one simulation using synthetic data of sample size 1000 , use
```bash
source activate aw_contextual
cd ./experiments/
python script_synthetic.py -T 1000 -s 1 -n test
```
Results will be saved in ./experiments/results/


