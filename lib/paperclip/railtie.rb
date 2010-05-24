require 'paperclip'

module Paperclip
  if defined? Rails::Railtie
    require 'rails'
    class Railtie < Rails::Railtie
      initializer 'paperclip' do |app|
        Paperclip::Railtie.insert
      end
    end
  end

  class Railtie
    def self.insert
      ActiveRecord::Base.send(:include, Paperclip)
      File.send(:include, Paperclip::Upfile)
    end
  end
end

