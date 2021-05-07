context('match_markers')

test_that('empty document', {
  corpus <-
    data.frame(
      id = c(1, 2),
      word = c('a', NA))
  markers <-
    data.frame(
      ID = c(1L, 2L),
      Marker = c('xxx', NA),
      Fixed = c(T, T),
      cat = c(1L, 0L))
  
  func <- LinguisticMarkers:::match_markers
  t1 <- func(corpus, markers, F)
  
  expect_equal(nrow(t1), 2)
  expect_true(all(t1$id == c(1,2)))
  expect_true(all(is.na(t1$Marker)))
  expect_true(all(t1$cat == c(0,0)))
})

test_that('basic match', {
  corpus <-
    data.frame(
      id = c(1),
      word = c('a'))
  markers <-
    data.frame(
      ID = c(1L, 2L),
      Marker = c('a', NA),
      Fixed = c(T, T),
      cat = c(1L, 0L))
  
  func <- LinguisticMarkers:::match_markers
  t1 <- func(corpus, markers, F)
  
  expect_equal(nrow(t1), 1)
  expect_true(all(t1$id == c(1)))
  expect_true(all(t1$Marker == c('a')))
  expect_true(all(t1$cat == c(1)))
})

test_that('multicat match', {
  corpus <-
    data.frame(
      id = c(1),
      word = c('a'))
  markers <-
    data.frame(
      ID = c(1L, 2L),
      Marker = c('a', NA),
      Fixed = c(T, T),
      cat1 = c(1L, 0L),
      cat2 = c(1L, 0L))
  
  func <- LinguisticMarkers:::match_markers
  t1 <- func(corpus, markers, F)
  
  expect_equal(nrow(t1), 1)
  expect_true(all(t1$id == c(1)))
  expect_true(all(t1$Marker == c('a')))
  expect_true(all(t1$cat1 == c(1)))
  expect_true(all(t1$cat2 == c(1)))
})