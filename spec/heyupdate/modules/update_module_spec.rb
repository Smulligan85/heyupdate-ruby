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

    describe "#post_update" do
      it "posts a new update" do
        VCR.use_cassette 'updates/post_update' do
          expect(@client.post_update("I wrote a blog post on Angular today")).to be_an_instance_of(Hash)
        end
      end

      it "returns the newly created update" do
        VCR.use_cassette 'updates/post_update' do
          expect(@client.post_update("I wrote a blog post on Angular today")["message"]).to eq("I wrote a blog post on Angular today")
        end
      end
    end

    describe "#edit_update" do
      it "edits an existing update" do
        VCR.use_cassette 'updates/edit_update' do
          expect(@client.edit_update("67007", "I updated my Angular 2 blog post")).to be_an_instance_of(Hash)
        end
      end

      it "returns the edited update object" do
        VCR.use_cassette 'updates/edit_update' do
          expect(@client.edit_update("67007", "I updated my Angular 2 blog post")["message"]).to eq("I updated my Angular 2 blog post")
        end
      end
    end

  end
end
