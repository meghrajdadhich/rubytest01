require 'rails_helper'

RSpec.describe Csvimporter, type: :model do

  describe 'Class' do
    subject { Csvimporter }

    it { should respond_to(:import) }

    let(:data) { "id,name,quantity,price,comments\r1,Guitar,20,199.99,none" }

    describe "#import" do
      it "should create a new record if id does not exist" do
        File.stub(:open).with("filename", {:universal_newline=>false, :headers=>true}) {
          StringIO.new(data)
        }
        Csvimporter.import("filename")
        expect(Csvimporter.find_by(name: 'Guitar').price).to eq 199.99
      end
    end
  end

end
