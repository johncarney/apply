require "apply/version"

module Apply
  def if(&test)
    self.class.new(&(->(value) { test[value] ? call(value) : value }))
  end

  def unless(&test)
    self.class.new(&(->(value) { test[value] ? value : call(value) }))
  end
end

def Apply(&action)
  action.extend Apply
end
