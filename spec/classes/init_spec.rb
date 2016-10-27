require 'spec_helper'
describe 'aprsdigi' do

  context 'with defaults for all parameters' do
    it { should contain_class('aprsdigi') }
  end
end
