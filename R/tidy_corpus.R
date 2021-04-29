#' @importFrom tidytext unnest_tokens
tidy_corpus <-
  function(corpus, id, text) {
    corpus <- corpus[,c(id, text)]
    colnames(corpus) <- c('id', 'text')
    t1 <- tidytext::unnest_tokens(corpus, word, text)
    rownames(t1) <- NULL
    t1 }
