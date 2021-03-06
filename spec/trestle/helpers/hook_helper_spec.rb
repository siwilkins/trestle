require 'spec_helper'

require_relative '../../../app/helpers/trestle/hook_helper'

describe Trestle::HookHelper do
  include ActionView::Helpers::OutputSafetyHelper
  include Trestle::HookHelper

  describe "#hook" do
    it "calls and concatenates each hook" do
      Trestle.config.hook("test-hook") { "abc" }
      Trestle.config.hook("test-hook") { "123" }

      expect(hook("test-hook")).to eq("abc\n123")
    end
  end

  describe "#hook?" do
    it "returns true if there are hooks defined for the given name" do
      Trestle.config.hook("test-hook") {}
      expect(hook?("test-hook")).to be true
    end

    it "returns false if there are no hooks defined for the given name" do
      expect(hook?("no-hook")).to be false
    end
  end
end
