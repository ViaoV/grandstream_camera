require "spec_helper"

describe Grandstream::Client do 
    let(:ip) { '10.0.1.13' }
    let(:client) { client = Grandstream::Client.new('10.0.1.13') }
    describe "#snapshot_url" do 
        it "should create snapshot_url using ip address" do 
            expect(client.snapshot_url).to eq("http://#{ip}/snapshot/view0.jpg")
        end
    end
    describe "#get_snapshot" do 
        it "downloads image file" do 
            client.get_snapshot('tmp/snapshot.jpg')
            expect(File.exist?('tmp/snapshot.jpg'))
            File.delete('tmp/snapshot.jpg')
        end
    end

    describe "#load_options" do 
        it "should return hash" do
           expect(client.load_options("goform/audio_video")).to be_a(Hash)
        end
    end

    describe "#set_options" do 
        it "should set an option" do 
           old_options = client.load_options("goform/audio_video")
           client.set_options "goform/audio_video", { "video.primary.framerate" => 1 }
           new_options = client.load_options("goform/audio_video")
           expect(new_options["video.primary.framerate"]).to eq("1")
        end
    end
end
