pdf_html <- function(pdf) {
  infos <- pdf_info(pdf)             
  html <- tempfile(fileext = '.html') 
  
  command <- sprintf('pdftohtml -f 1 -l %s -q -i -s -noframes %s %s', 
                     infos$pages,
                     normalizePath(pdf),
                     html)
  
  system(command)                     
  txt <- readr::read_file(html)       
  file.remove(html)                   
  txt
}


html<- pdf_html(txt)

html %>% 
  read_html() %>% 
  html_nodes('div') %>% 
  head()