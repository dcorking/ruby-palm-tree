# Does `#class_double` do what I think it does

require 'rspec'

class Aubergine
  def self.colour
    'purple'
  end
end

RSpec.describe 'Aubergine' do
  it 'is purple' do
    expect(Aubergine.colour).to eq 'purple'
  end

  it 'can be mocked' do
    au = class_double('Aubergine')
    # This line is wrong. There is no underscore in `.to receive`
    # expect(au).to_receive(:colour).and_return('yellow')
    #
    # causes:
    #      NoMethodError:
    #        undefined method `to_receive' for #<RSpec::Expectations::Expect
    # ationTarget:0x0055785e2b2560>
    #        Did you mean?  should_receive

    expect(au).to receive(:colour).and_return('yellow')
    expect(au.colour).to eq 'yellow'
  end
end
