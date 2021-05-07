context('calculate_markers')

test_that('requirements checking', {
  func <- LinguisticMarkers::calculate_markers
  
  expect_error(func(NULL), 'corpus is not a data.frame')
  df <- data.frame(qq = 1)
  expect_error(func(df), 'id column not found')
  df <- data.frame(id = 1)
  expect_error(func(df), 'text column not found')
})

test_that('empty corpus', {
  corpus <-
    data.frame(
      id = c(1,2,3),
      text = c(NA, '', ':)'))
  path <- system.file('extdata', 'sample_markers.csv', package = 'LinguisticMarkers')
  
  func <- LinguisticMarkers::calculate_markers
  t1 <- func(corpus, path)
  
  expect_true(all(t1$id == c(1,2,3)))
  expect_true(all(t1[,-1] == 0))
})

test_that('basic match corpus', {
  corpus <-
    data.frame(
      id = 1:9,
      text = c('me bad', 'me bad bad', 'bad', 'me glad', 'me glad glad', 'glad', 'me', 'bad', 'glad'))
  path <- system.file('extdata', 'sample_markers.csv', package = 'LinguisticMarkers')

  func <- LinguisticMarkers::calculate_markers
  t1 <- func(corpus, path)
  
  expect_true(all(t1$id == 1:9))
  expect_true(all(t1$WordCount == c(2,3,1,2,3,1,1,1,1)))
  expect_true(all(t1$WordCountUnique == c(2,2,1,2,2,1,1,1,1)))
  expect_true(all(t1$MarkerCount == c(1,2,1,1,2,1,0,1,1)))
  expect_true(all(t1$MarkerCountUnique == c(1,1,1,1,1,1,0,1,1)))
  expect_true(all(t1$negative == c(1,2,1,0,0,0,0,1,0)))
  expect_true(all(t1$negativeUnique == c(1,1,1,0,0,0,0,1,0)))
  expect_true(all(t1$positive == c(0,0,0,1,2,1,0,0,1)))
  expect_true(all(t1$positiveUnique == c(0,0,0,1,1,1,0,0,1)))
})