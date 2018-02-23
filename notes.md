## install steps

### edit-slack

1. `Plugin 'yaasita/edit-slack.vim'` in vimrc
2. download binary from [here](https://github.com/yaasita/edit-slack/releases/download/v0.8.2/darwin-amd64-edit-slack)]
3. `mv ~/Downloads/darwin-amd64-edit-slack ~/.vim/bundle/edit-slack.vim/edit-slack`
4. `chmod +x ~/.vim/bundle/edit-slack.vim/edit-slack`
5.

### command to interactive rebase current branch with latest version of master

```
gcm && gl && git rev-parse HEAD | tr -d '\n' | pbcopy && gco - && grbi $(pbpaste)
```



















### create middleman site

```
$ echo "ruby 2.3.6" >> .tool-version
$ bundle init
$ vim Gemfile
```

#### learn basics of vim (put some links)

specify ruby version by adding the following line on the second line (before the gems).
```
ruby '2.3.6'
```
add the slim gem as well.
should look something like this

```
source 'https://rubygems.org'

ruby '2.3.6'

gem 'middleman', '~> 4.2'
gem 'middleman-autoprefixer', '~> 2.7'

# windows does not come with time zone data
gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby]

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1', platforms: [:mswin, :mingw]

# slim template because f**k brackets
gem 'slim'
```

run `$ bundle` again to install slim

add `require 'slim'` to the top of the generated `config.rb` file.

then rename and convert the `source/index.html.erb` file to `source/index.html.slim`

```
$ mv source/index.html.erb source/index.html.slim
```

you should have something like
```
---
title: Welcome to Middleman
---

svg.middleman-logo[xmlns="http://www.w3.org/2000/svg" viewbox="0 0 400 340" aria-labelledby="middleman-logo__title" role="img"]
  title#middleman-logo__title
    | Middleman
  path.middleman-logo__top-left-bar[fill-opacity=".45" d="M0 40L200 0v30L0 60z"]
  path.middleman-logo__top-right-bar[fill="#fff" d="M200 0l200 40v20L200 30z"]
  path.middleman-logo__left-m[fill-opacity=".45" d="M0 78v184l45 5V152l45 83 47-83v129l53 7V52l-57 8-43 83-43-70z"]
  path.middleman-logo__right-m[fill="#fff" d="M400 78v184l-45 5V152l-45 83-47-83v129l-53 7V52l57 8 43 83 43-70z"]
  path.middleman-logo__bottom-left-bar[fill-opacity=".45" d="M0 300l200 40v-30L0 280z"]
  path.middleman-logo__bottom-right-bar[fill="#fff" d="M200 340l200-40v-20l-200 30z"]

h1
  |  Middleman is Running
= link_to("Read Documentation", "https://middlemanapp.com/basics/templating_language/", target: "_blank")

```

serve it

```
$ middleman serve
```
to make sure it works open up your browser and go to http://localhost:4567. You should
see content on the page that corresponds with that in the `index.html.slim`

I think this is a good time to commit your changes using git

```
$ git add .
$ git commit -m 'initial commit: middleman setup with slim'
```

### what we have done so far step 1

- specified a ruby version (versioning is important in the long term)
- used bundler to setup a middleman project [middleman]( https://github.com/middleman/middleman )
- i like [slim](https://github.com/slim-template/slim#what-is-slim) so included it in the setup
- converted to the erb file to slim

### optimisation

#### tool-tip
install [pry](https://github.com/AndrewKvalheim/middleman-pry) for debugging
check [here](https://github.com/pry/pry) for more info

middleman framework allows you to do some helpful, we can demonstrate by hiding that ugly in line svg tags.

this is a must if you are going to use [svg](https://www.w3schools.com/graphics/svg_intro.asp)'s in your site.

lets start by creating an svg file of our own and an `images/svgs/`

```
$ mkdir source/images/svgs/
$ touch source/images/middleman-logo.svg
```

copy the original in line svg tag in your index file.
the original file looked like this before conversion

```
---
title: Welcome to Middleman
---

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 340" class="middleman-logo" aria-labelledby="middleman-logo__title" role="img">
  <title id="middleman-logo__title">Middleman</title>
  <path class="middleman-logo__top-left-bar" fill-opacity=".45" d="M0 40L200 0v30L0 60z"/>
  <path class="middleman-logo__top-right-bar" fill="#fff" d="M200 0l200 40v20L200 30z"/>
  <path class="middleman-logo__left-m" fill-opacity=".45" d="M0 78v184l45 5V152l45 83 47-83v129l53 7V52l-57 8-43 83-43-70z"/>
  <path class="middleman-logo__right-m" fill="#fff" d="M400 78v184l-45 5V152l-45 83-47-83v129l-53 7V52l57 8 43 83 43-70z"/>
  <path class="middleman-logo__bottom-left-bar" fill-opacity=".45" d="M0 300l200 40v-30L0 280z"/>
  <path class="middleman-logo__bottom-right-bar" fill="#fff" d="M200 340l200-40v-20l-200 30z"/>
</svg>

<h1>
  Middleman is Running
</h1>

<%= link_to(
  "Read Documentation",
  "https://middlemanapp.com/basics/templating_language/",
  target: "_blank"
) %>
```

once that is done create a file in the `helper` directory with your svg helper logic

something like this in `helpers/svg_helper.rb`

```
def svg(name)
  file_path = File.join(app.root, config[:svgs_dir], "#{name}.svg")

  return 'file not found' unless File.exists?(file_path)

  File.read(file_path)
end
```

do some under the hood configuring. in `config.rb` you can include specific
[configurations](https://middlemanapp.com/advanced/configuration/).

let's do some refactoring while we are here; create an assets folder within the source
directory

```
$ mkdir source/assets/
$ mv images/svgs/ source/assets/
$ mv javascripts source/assets/
$ mv stylesheets source/assets/
```

add the following to `config.rb`

```
set :css_dir,    'assets/stylesheets'
set :js_dir,     'assets/javascripts'
set :images_dir, 'assets/images'
set :svgs_dir,   'source/assets/images/svgs'
```

now we can simply add use our helper method to render svgs in our template neatly with `= svg 'name-of-svg-file'`

in our case using the middleman svg provided upon creating the project as an example

```
---
title: Welcome to Middleman
---

= svg 'middleman-logo'

h1
  |  Middleman is Running

= link_to("Read Documentation", "https://middlemanapp.com/basics/templating_language/", target: "_blank")
```

### let's add livereload

continuing on with the tools
add [livereload](https://github.com/middleman/middleman-livereload) to your list of gems

```
gem 'middleman-livereload', '~> 3.4.3'
```

then run

```
$ bundle install
```

activate it in your config (`config.rb`).

```
activate :livereload
```

### let's install a package manager

before we do this, remember that `.tool-versions` file we created at the beginning?
add the version of [node](https://nodejs.org/en/) you want continue with (install it if
you have not done so yet)

in my case I will be using 8.9.4 so I will add

```
nodejs 8.9.4
```

we are going to use [yarn](https://yarnpkg.com) as our package manage

once yarn is installed, initialize it

```
$ yarn init
```

### add yarn packages

we are going to install [materialize](http://materializecss.com/)

```
$ yarn add materialize-css
```

go to your `layout.slim` and make the appropriate changes. you should end up with something like this;

```
doctype html
html
  head
    /! Import Google Icon Font
    link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" /
    /! Import materialize.css
    link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css" rel="stylesheet" /
    /! Let browser know website is optimized for mobile
    meta content="width=device-width, initial-scale=1.0" name="viewport" /
    meta content=("text/html; charset=UTF-8") http-equiv="Content-Type" /
    meta charset="utf-8" /
    meta content="ie=edge" http-equiv="x-ua-compatible" /
    meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport" /
    /! Use the title from a page's frontmatter if it has one
    title= current_page.data.title || "Middleman"
    = stylesheet_link_tag "site"
    = javascript_include_tag "site"

  body
    /! Import jQuery before materialize.js
    script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"
    script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"
```

add a navigation bar to the layouts so that we can see materialize working
```
    nav class="nav-wrapper"
      div class="row"
        div class="col m6 s12"
          a class="brand-logo left" href="#"  Logo

        div class="col m6 s12"
          ul id="nav-mobile" class="right hide-on-med-and-down"
            li
              a href="#"  About
            li
              a href="#"  Projects
            li
              a href="#"  MyDocs

    main
      = yield
```

now we that we have materialize we can start designing our pages

### let's blog
