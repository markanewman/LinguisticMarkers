#' @importFrom stringr str_starts fixed
#' @importFrom utils setTxtProgressBar txtProgressBar
match_markers <-
  function(corpus, markers, show_progress) {
    if(show_progress) { pb <- utils::txtProgressBar(max = nrow(markers), style = 3) }
    t1 <- vector(mode = 'list', length = nrow(markers))
    cnt_full <- nrow(corpus)
    for(i in 1:nrow(markers)) {
      if(show_progress) { utils::setTxtProgressBar(pb, i) }

      if(!markers$Fixed[i]) {
        indx <- stringr::str_starts(corpus$word, stringr::fixed(markers$Marker[i]))
      } else if (is.na(markers$Marker[i])) {
        indx <- rep(T, times = nrow(corpus))
      } else {
        indx <- corpus$word == markers$Marker[i]
      }
      indx <- ifelse(is.na(indx), F, indx)
      cnt_proc <- nrow(corpus)
      matches <- corpus[indx,]
      corpus <- corpus[!indx,]
      if(cnt_proc != nrow(matches) + nrow(corpus)) {
        stop('QA: row counts out of sync mid processing')
      }
      matches <- cbind(matches, markers[rep(i, times = nrow(matches)),])
      rownames(matches) <- NULL
      t1[[i]] <- matches
      rm(indx, matches, cnt_proc)
    }
    if(show_progress) { close(pb); rm(pb) }
    
    corpus <- do.call(rbind, t1)
    
    if(cnt_full != nrow(corpus)) {
      stop('QA: row counts out of sync')
    }
    rm(i, t1, cnt_full)
    corpus }
