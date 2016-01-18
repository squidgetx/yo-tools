###YO-TOOLS

YO-tools is a repo of materials and scripts to assist me (and anyone really) in creating some slick HTML emails quickly and easily using a set of HTML extensions and Ruby scripts. The environment provides a few layouts that require a minimum level of knowledge of Ruby and HTML/CSS to use.

#### Setup

You'll need the following things to use this suite of tools

```
bash
ruby
sass
bundler (ruby gem)
```

This repo also packages a slightly modified version of Ink, an email templating framework.

Run `bundle install` to install the remaining dependencies.

##### Configuration

You'll want to edit the `USERNAME` field in `bin/testmail.rb` and `bin/sendmail.rb` to match the account you'll be using to send the emails and you'll want to create a file `secrets/password` which contains the plaintext password for the account.

#### Basic Use
* `./testmail.sh < <file>` converts the *templated file* `file` to HTML and plaintext and then sends a multipart email to the account you specified in the `USERNAME` field in `bin/testmail.rb`
* `./sendmail.sh <address> <bcc> < <file>` sends the *templated file* `file` to `address` and BCCs to `bcc`.
* `./testjsonmail.sh` and `./sendjsonmail.sh` behave similarly, except they take json files instead of templated HTML

#### Email Structure

*Templated Files* refer to HTML emails written using custom built HTML tags to help organize different parts of the email. Examples can be found in the `sp2015/` directory. `bin/builder.rb` contains all of the different tags and their 'translations' if you would like to modify them.

You can also create emails using json, examples of these can be found in the `f2015` directory. The file `bin/read_json.rb` actually just takes the json and creates a templated file using ERB. You can modify this template in `templates/template.html.erb`

#### Styling

The styling of the email is by default set with style.scss.
