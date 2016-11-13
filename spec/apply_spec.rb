require "spec_helper"

RSpec.describe Apply do
  it "has a version number" do
    expect(Apply::VERSION).not_to be nil
  end

  let(:the_proc) { ->(arg) { arg.upcase }.extend described_class }

  describe "#if" do
    let(:if_proc) { the_proc.if { |value| value == "the string" } }

    it "applies the proc to the value if the test is true for the value" do
      expect(if_proc["the string"]).to eq "THE STRING"
    end

    it "returns the unmodified value if the test is false" do
      expect(if_proc["a different string"]).to eq "a different string"
    end
  end

  describe "#unless" do
    let(:unless_proc) { the_proc.unless { |value| value == "the string" } }

    it "applies the proc to the value if the test is false for the value" do
      expect(unless_proc["the string"]).to eq "the string"
    end

    it "returns the unmodified value if the test is true for the value" do
      expect(unless_proc["a different string"]).to eq "A DIFFERENT STRING"
    end
  end

  describe "method" do
    it "extends the given proc with Apply", :aggregate_failures do
      action = proc { }
      expect(action).to receive(:extend).with(described_class).and_call_original
      expect(Apply(&action)).to be_a described_class
    end
  end
end
