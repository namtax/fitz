Given(/^there are no racecourses near to me$/) do
  expect(Venue).to receive(:create).and_return([])
end

When(/^I search for the racecourses near to me$/) do
  visit '/'
  fill_in('postcode', with: 'SL6 2AQ')
  click_on 'Search'
end

Then(/^I want to see a list of the nearest racecourses$/) do
  racecourses.each do |r|
    expect(page).to have_content('Ascot Racecourse')
  end
end

Then(/^I want to know there are no results$/) do
   expect(page).to have_content('No results - try again')
end

def racecourses
  [
    'Ascot Racecourse',
    'Royal Windsor Racecourse',
    'Sandown Park Racecourse',
    'Racecourse Marina',
    'Newbury Racecourse'
  ]
end