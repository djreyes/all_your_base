require 'spec_helper'

describe Task do
  let(:task) { Fabricate(:task) }
  subject { task }

  it { should belong_to(:todo) }
end
