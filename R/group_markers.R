#' @importFrom dplyr group_by summarise select
group_markers <-
  function(corpus) {
    groups <- dplyr::group_by(corpus, id)
    cats <- colnames(corpus)[-(1:5)]
    counts <- 
      dplyr::summarise(
        groups,
        WordCount = length(word),
        WordCountUnique = length(unique(word)),
        MarkerCount = sum(!is.na(Marker)),
        MarkerCountUnique = length(unique(ID[!is.na(Marker)])),
        .groups = 'keep')
    for(cat in cats) {
      g1 <- groups[,c('id', 'ID', cat)]
      colnames(g1) <- c('id', 'ID','value')
      c1 <- dplyr::summarise(
        g1,
        count = sum(value),
        unique = length(unique(ID[value == 1])),
        .groups = 'keep')
      colnames(c1) <- c('id', cat, paste0(cat, 'Unique'))
      counts <- merge(counts, c1)
      rm(g1, c1)
    }
    counts }
