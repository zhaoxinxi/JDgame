CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV["HdR6c4E1TvjMsnvylXZVa-23sKAD_5bppvrNwQjW"]
  config.qiniu_secret_key    = ENV["rWYnCxICeuGEIy4TKVorJ781x6vgTTdXCIebEdVQ"]
  config.qiniu_bucket        = ENV["cosyfish"]
  config.qiniu_bucket_domain = ENV["oooly5avu.bkt.clouddn.com"]
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
  config.qiniu_up_host       = "http://up.qiniug.com"  #选择不同的区域时，"up.qiniug.com" 不同

end
