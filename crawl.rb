require 'capybara/poltergeist'
require 'pp'

# Capybaraインスタンスの作成
def generate_crawler
  options = {:js_errors => false, :timeout => 1000, phantomjs_logger: Logger.new('/dev/null')}
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, options)
  end
  
  session = Capybara::Session.new(:poltergeist)
  
  session.driver.headers = {
    'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36"
  }
  
  session
end

### 以下クロール処理

# Capybaraインスタンス作成
session = generate_crawler

# トップページ遷移
session.visit 'https://arao99.github.io/capybara-practice/'

# 動作確認
# puts session.html
pp session.has_css?('h1')
pp session.has_css?('h3')
pp session.has_css?('h2')
