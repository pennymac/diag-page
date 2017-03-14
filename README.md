# Diagnostics Enginge

## Setup
In your Gemfile:
```
gem 'diag_pages', :git => 'https://github.com/pennymac/diag-page.git', branch: 'master', :tag => 'v0.0.7'
```

Check the repo for the latest tag to use

## In your code

### `config/routes.rb`

```
mount DiagPages::Engine => "/diag"
```

### `config/initializers/diag_pages.rb`

```
DiagPages.configure do |config|

  config.diag_tests.push({
    name: "Recaptcha", # how it will appear in the menu
    link: "recaptcha", # the url endpoint
    description: "Test the availability of Recaptcha URL",
    status: nil, # start with nil
    block: lambda { # pass in a lambda that will execute within the app
      begin # always wrap it to catch any breakages
        clnt = HTTPClient.new
        response = clnt.post "http://www.google.com/recaptcha/api/verify", 'secret' => ENV["RECAPTCHA_PRIVATE_KEY"]
        return response.code == 200 # return what you want to display on the /diag page
      rescue
        return false # always return false in a failed condition
      end
    }
  })

end
```
