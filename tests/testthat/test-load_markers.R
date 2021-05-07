context('load_markers')

test_that('requirements checking', {
  path <- system.file('extdata', 'xxx.csv', package = 'LinguisticMarkers')
  
  func <- LinguisticMarkers:::load_markers
  
  expect_error(func(), 'is missing')
  expect_error(func(path), 'does not exist')
})
