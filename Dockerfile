FROM islasgeci/base:0.7.0
COPY . /workdir
RUN Rscript -e "install.packages(c('covr', 'devtools', 'lintr', 'roxygen2', 'styler', 'testthat', 'vdiffr'), repos='http://cran.rstudio.com')"