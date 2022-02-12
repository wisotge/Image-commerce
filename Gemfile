source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.2'

# Server
gem 'mini_racer'
# 로그인/회원가입
gem 'devise'
# 로그인/회원가입 문구 다국어 자동 설정
gem 'devise-i18n'
# 어드민
gem 'rails_admin'
# bootstrap - 반응형 웹 템플릿
gem 'bootstrap', '~> 4.3.1'
# jquery - 자바스크립트 라이브러리
gem 'jquery-rails'
# fontawesome - 아이콘 라이브러리
gem 'font-awesome-rails'
# 레일스 다국어 자동 설정
gem 'rails-i18n'
# 파일 또는 이미지 첨부
gem 'carrierwave'
gem 'mini_magick'
gem 'rails', '~> 5.2.3'
# text-editor tinyMCE
gem 'tinymce-rails'
# flash alert
gem "bootstrap_flash_messages", "~> 1.0.1"
# paging
gem 'kaminari'
# Google OAuth
gem 'omniauth-oauth2'
gem 'omniauth-google-oauth2'
# 아이콘 사용
gem 'octicons'
# API key security
gem 'figaro'
# Upload Video
gem "paperclip-ffmpeg"
gem 'streamio-ffmpeg'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # database
  gem 'rails_db'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
