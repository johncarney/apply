require "apply/version"

module Apply
  def if(&test)
    ->(value) { test[value] ? call(value) : value }
  end

  def unless(&test)
    ->(value) { test[value] ? value : call(value) }
  end
end

def Apply(&action)
  action.extend Apply
end
