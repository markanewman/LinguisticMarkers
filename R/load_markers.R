#' @importFrom readr read_csv
#' @importFrom tidyr pivot_wider
load_markers <-
  function(file) {
    if(!file.exists(file)) { stop('QA: marker file does not exist') }
    
    markers_raw <- readr::read_csv(file, col_types = 'iclc')
    xcn <- c('ID', 'Marker', 'Fixed', 'Category')
    acn = colnames(markers_raw)
    if(!all(xcn == acn)) { stop('QA: marker file has bad columns') }
    
    markers_raw$xx = 1L
    markers <-
      tidyr::pivot_wider(
        markers_raw,
        names_from = 'Category',
        values_from = xx,
        values_fill = 0L)
    markers_raw$xx <- NULL
    
    markers <- as.data.frame(markers)
    tmp <- data.frame(
      ID = max(markers$ID) + 1L,
      Marker = as.character(NA),
      Fixed = T)
    cats <- unique(markers_raw$Category)
    for(cat in cats) {
      tmp[1, cat] <- 0L
    }
    markers <- rbind(markers, tmp)
    
    markers}
