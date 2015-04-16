class AssertionFailed < StandardError; end

def assert(condition)
  raise AssertionFailed unless condition
end

class TinyTest

end

assert_does_not_raise_for_true_condition = -> () {
  assert(1 + 1 == 2)
}.call

assert_raises_for_false_condition = -> () {
  begin
    assert(1 + 1 != 2)
  rescue AssertionFailed
    raised = true
  else
    fail
  end
}.call

report_result_of_single_passing_test = -> () {
  result = TinyTest.run(
    ->() {}
  )
  assert 1 == result.passed_count
  assert 1 == result.run_count
}.call

puts "Success!"
