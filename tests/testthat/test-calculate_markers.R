context('calculate_markers')

test_that('requirements checking', {
  func <- LinguisticMarkers::calculate_markers
  
  expect_error(func(NULL), 'corpus is not a data.frame')
  df <- data.frame(qq = 1)
  expect_error(func(df), 'id column not found')
  df <- data.frame(id = 1)
  expect_error(func(df), 'text column not found')
})
