require 'chefspec'

describe 'datacenter::default' do
  
  context 'default' do
    let (:chef_run) do
      ChefSpec::Runner.new.converge 'datacenter::default'
    end
  
    it 'should write its own tests' do
      pending "not implemented, yet"
    end

  end
end

