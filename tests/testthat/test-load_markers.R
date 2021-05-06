context('load_markers')

test_that('requirements checking', {
  func <- LinguisticMarkers:::load_markers
  path <- system.file('extdata', 'xxx.csv', package = 'LinguisticMarkers')
  
  expect_error(func(), 'is missing')
  expect_error(func(path), 'does not exist')
})
