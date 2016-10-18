require 'spec_helper'

class Heyupdate::Client
  describe Update do
    before(:each) do
      @client = Heyupdate::Client.new(ENV['API_TOKEN'])
    end

    describe "#updates" do
      it "retrives all update data" do
        VCR.use_cassette 'updates/updates' do
          expect(@client.updates[0]).to be_an_instance_of(Hash)
        end
      end
    end

  end
end
