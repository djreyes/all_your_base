require 'spec_helper'

describe "Shared pages" do
  subject { page }

  describe "home page" do
    before { visit root_path }

    it { should have_selector('a', text: 'Sign up') }
    it { should have_selector('a', text: 'Sign in') }
    it { should have_selector('a', text: 'Sign out') }
  end
end