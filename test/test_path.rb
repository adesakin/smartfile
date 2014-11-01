

class TestPath < MiniTest::Test
  def setup
    @s_k = SMARTFILE_CONFIG['key']
    @s_p = SMARTFILE_CONFIG['pass']
    stub_request(:get, "https://#{@s_k}:#{@s_p}@app.smartfile.com/api/2/whoami/?format=json").\
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'smartfile_rubygem_1.0'}).\
      to_return(:status => 200, :body => "", :headers => {})
  end

  def test_dummy_all_requests
    stub_request(:any, "www.example.com").to_return(status: 200, body: "stubbed response", headers: {})
    req = Net::HTTP.get("www.example.com", "/")
    assert_equal "stubbed response", req
  end

  def test_get_path
    s = SmartFile.new
    s.setup(:whoami)
    params = {:attribute => "query"}
    res = s.get(params)

    # assert_requested :get, res
  end


  def test_post_path

  end

  def test_put_path

  end

  def test_delete_path

  end


end