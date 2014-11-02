# Grandstream

This gem provides an interface for interacting with Grandsteam IP Cameras.

For more information see http://www.grandstream.com/index.php/products/ip-video-surveillance

For API information see http://www.grandstream.com/products/surveillance/general/documents/grandstream_http_api.pdf

## Installation

Add this line to your application's Gemfile:

    gem 'grandstream'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grandstream

## Usage

    client = Grandstream::Client.new("10.0.1.4")
    options = client.load_options("audio_video") # returns a hash of options
    client.set_options "audio_video", { "primary.video.framerate": 30 }
   


## Command Line Utility

A command line utility is also provided in the gem which can take snapshots from the camera.

    gs_camera snapshot --ip 10.0.1.4 --outfile image.jpg 

## Contributing

1. Fork it ( http://github.com/<my-github-username>/grandstream/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
