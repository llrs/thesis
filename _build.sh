#!/bin/sh

Rscript -e "bookdown::render_book('index.Rmd', output_format = 'bookdown::gitbook', encoding = 'UTF-8')"
Rscript -e "bookdown::render_book('index.Rmd', output_format = 'bookdown::pdf_book', encoding = 'UTF-8')"
Rscript -e "bookdown::render_book('index.Rmd', output_format = 'bookdown::epub_book', encoding = 'UTF-8')"
