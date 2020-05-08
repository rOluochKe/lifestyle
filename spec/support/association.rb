RSpec::Matchers.define :have_many do |expected|
  match do |actual|
    if actual.respond_to?(:reflect_on_association)
      actual.reflect_on_association(expected)&.macro == :has_many
    else
      actual.class.reflect_on_association(expected)&.macro == :has_many
    end
  end
end

RSpec::Matchers.define :belong_to do |expected|
  match do |actual|
    if actual.respond_to?(:reflect_on_association)
      actual.reflect_on_association(expected)&.macro == :belongs_to
    else
      actual.class.reflect_on_association(expected)&.macro == :belongs_to
    end
  end
end
