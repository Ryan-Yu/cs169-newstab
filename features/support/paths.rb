module NavigationHelpers
  
  def path_to(page_name)
    case page_name
    
    when /^the (newstab )?home\s?page$/
      '/'
    when /^the add new article page$/
      '/articles/new'
    when /^the show all articles page$/
      '/articles'
    when /^the show all users$/
      '/users'
    when /^the public groups page$/
      '/public_groups'
    when /^the groups page$/
      '/groups'
    when /^the show page for article "(.*)"$/
      article_path(Article.find_by_url($1))
    when /^the show page for article by id "(.*)"$/
      article_path(Article.find($1))
    when /^the show page for user email "(.*)"$/
      user_path(Users.find_by_email($1))
    when /^the group page for group with index "(.*)"$/
      group_path(Group.find($1))
    when /^the group page for "(.*)"$/
      group_path(Group.find_by_group_name($1))
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)