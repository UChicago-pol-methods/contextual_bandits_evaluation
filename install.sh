#!/usr/bin/env bash
# if encounter tapi errors on mac https://stackoverflow.com/questions/69236331/conda-macos-big-sur-ld-unsupported-tapi-file-type-tapi-tbd-in-yaml-file
python setup.py develop

pip install numpy==1.23.5
conda install pandas
pip install scipy
pip install  scikit-learn
pip install autograd
pip install statsmodels
pip install ipykernel
pip install dill
pip install jupyterlab
pip install matplotlib
pip install seaborn

conda install -c conda-forge gcc
conda install -c gcc
conda install -c r rpy2
conda install -c conda-forge r r-essentials
conda install -c conda-forge r-devtools 
conda install -c conda-forge r-bh
conda install -c conda-forge r-rcpp
conda install -c conda-forge r-matrix
conda install -c conda-forge r-RcppEigen
export PKG_CPPFLAGS="-DHAVE_WORKING_LOG1P" # https://github.com/conda-forge/r-base-feedstock/issues/163#issuecomment-1172913391
Rscript -e 'install.packages("grf", repos = "http://cran.us.r-project.org")'
Rscript -e 'install.packages("policytree", repos = "http://cran.us.r-project.org")'
