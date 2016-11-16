require "logger"

describe FaradayBoolean::ParseBoolean do
  describe "#call" do
    subject { connection.get("/boolean/#{flag}") }

    let(:connection) do
      Faraday.new(url: "http://example.com") do |conn|
        conn.response :boolean
        # conn.response :logger, Logger.new(STDOUT), bodies: true
        conn.adapter Faraday.default_adapter
      end
    end

    before do
      stub_request(:get, "http://example.com/boolean/#{flag}").
        with(headers: {"Accept" => "*/*", "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3"}).
        to_return(status: 200, body: body, headers: {})
    end

    context "When server should return boolean" do
      context "When server return true" do
        let(:flag) { "true" }
        let(:body) { "true" }

        its(:body) { should be true }
      end

      context "When server return false" do
        let(:flag) { "false" }
        let(:body) { "false" }

        its(:body) { should be false }
      end
    end

    context "When server should return not boolean" do
      let(:flag) { "other" }
      let(:body) { "{key:value}" }

      its(:body) { should eq body }
    end
  end
end
