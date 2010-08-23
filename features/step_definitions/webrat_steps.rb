# encoding: utf-8

### Actions ###

When %r{^I accept HTML$} do
  header 'HTTP_ACCEPT', 'text/html'
end

When %r{^I accept wildcard formats, but not JSON$} do
  header 'HTTP_ACCEPT', '*/*'
end

When %r{^I accept wildcard formats, and JSON$} do
  header 'HTTP_ACCEPT', 'application/json, */*'
end

When %r{^I accept JSON$} do
  header 'HTTP_ACCEPT', 'application/json'
end

When %r{^I accept HTML and JSON$} do
  header 'HTTP_ACCEPT', 'text/html, application/json'
end

When %r{^I accept nothing$} do
end

When %r{^I go to "(.*)"$} do |path|
  visit path
end

### Results ###

Then %r{^I should see "(.*)"$} do |text|
  webrat.response.body.to_s.should =~ /#{text}/m
end

Then %r{^I should not see "(.*)"$} do |text|
  webrat.response.body.to_s.should_not =~ /#{text}/m
end

Then %r{^the request should succeed$} do
  (200..207).should === webrat.response.status
end

Then %r{^the request should fail$} do
  (200..207).should_not === webrat.response.status
end

Then %r{^I should see the JSON:$} do |expected|
  JSON.parse(expected).should ==
    JSON.parse(webrat.response.body)
end

Then %r{^I should receive HTML$} do
  webrat.response.content_type.should == 'text/html'
end

Then %r{^I should receive JSON$} do
  webrat.response.content_type.should == 'application/json'
end

