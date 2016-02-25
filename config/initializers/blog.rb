# This code does a few things for us:
# * It generates the Jekyll site when the Rails application starts
# * It defines a path for the site to be at (http://localhost:3000/blog/) – to change this path, modify the dest variable
# * It uses smart error handling to ensure that we know when the site build succeeds and when it fails. This also ensures that, even if the site build fails, the application will not fail, allowing for a separation of code bugs between Jekyll and Rails


Rails.application.config.after_initialize do
    Rails.logger = Logger.new(STDOUT)
    begin
        #make a spot for the site
        dest = Rails.root.join('public/blog')
        
        #generate the site
        Jekyll::Site.new(
            Jekyll.configuration({
                "config" => Rails.root.join('config', 'jekyll.yml').to_s,
                "source" => Rails.root.join('blog').to_s,
                "destination" => dest.to_s
                })
            ).process
        
        # the strange codes give the output color
        Rails.logger.info "\e[0;32;49mJekyll site built!\e[0m]]"
    rescue => e
        Rails.logger.error "\e[0;31;49mJekyll site build failed.\e[0m\n\e[0;33;49mError:\e[0m #{e}"
    end
end