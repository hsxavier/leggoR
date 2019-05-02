FROM rocker/tidyverse

RUN mkdir /agora-digital
WORKDIR /agora-digital
COPY DESCRIPTION .
RUN Rscript -e 'devtools::install_github("analytics-ufcg/rcongresso")'
RUN Rscript -e 'devtools::install_deps()'
COPY . .
RUN Rscript -e 'devtools::install()'

CMD Rscript scripts/fetch_updated_bills_data.R data/tabela_geral_ids_casa.csv exported
