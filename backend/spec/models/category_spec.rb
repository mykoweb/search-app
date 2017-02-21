require 'rails_helper'

describe Category do
  it { should respond_to :name }

  it { should have_many :foods }
end
