Given /^the following create_tickets:$/ do |create_tickets|
  CreateTicket.create!(create_tickets.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) create_ticket$/ do |pos|
  visit create_tickets_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following create_tickets:$/ do |expected_create_tickets_table|
  expected_create_tickets_table.diff!(tableish('table tr', 'td,th'))
end
