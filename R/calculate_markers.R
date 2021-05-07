#' @title calculate_markers
#'
#' @description Calculate the linguistic markers for a corpus
#' 
#' @importFrom dplyr left_join mutate_all
#'
#' @export
#' 
#' @param corpus A \code{\link[base]{data.frame}} containing the text to process.
#' @param file The marker file. All marker files are external to the library for licensing purposes. See the vignettes for help.
#' @param id The name of the PK column for the \code{corpus}.
#' @param text The names of text column in \code{corpus} to process.
#' @param show_progress Should a progress bar be shown?
#' @return the annotated corpus
#'
#' @author Mark Newman, \email{mark@trinetteandmark.com}
#'
calculate_markers <-
  function(corpus, file, id = 'id', text = 'text', show_progress = interactive()) {
    if(!is.data.frame(corpus)) { stop('corpus is not a data.frame') }
    if(!(id %in% colnames(corpus))) { stop('id column not found in corpus') }
    if(!(text %in% colnames(corpus))) { stop('text column not found in corpus') }
  
    mdf <- load_markers(file)
    tc <- tidy_corpus(corpus, id, text)
    results <- match_markers(tc, mdf, show_progress)
    results <- group_markers(results)
    t1 <- data.frame(id = corpus[,id])
    results <- dplyr::left_join(t1, results, by = 'id')
    results <- dplyr::mutate_all(results, ~replace(., is.na(.), 0))
    cn <- colnames(results)
    cn[1] <- id
    colnames(results) <- cn
    if(nrow(corpus) != nrow(results)) {
        stop('QA: row counts out of sync mid processing')
      }
    results }
