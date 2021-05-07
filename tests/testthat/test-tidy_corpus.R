context('tidy_corpus')

test_that('empty corpus', {
  t1 <- data.frame(id = c(1,2,3), text = c(NA, '', ':)'))
  
  func <- LinguisticMarkers:::tidy_corpus
  t2 <- func(t1, 'id', 'text')

  expect_equal(nrow(t2), 0)
})

test_that('basic corpus', {
  t1 <- data.frame(id = c(1,2), text = c('a', 'a b'))
  
  func <- LinguisticMarkers:::tidy_corpus
  t2 <- func(t1, 'id', 'text')
  
  expect_true(all(t2$id == c(1, 2, 2)))
  expect_true(all(t2$word == c('a', 'a', 'b')))
})
