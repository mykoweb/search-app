require 'rails_helper'

describe Food do
  it { should respond_to :name }

  it { should belong_to :category }
end
