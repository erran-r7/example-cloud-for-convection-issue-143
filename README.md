# Example cloud to verify template changes
See also https://github.com/rapid7/convection/pull/143.

## Steps to validate
### Latest version of Convection
The current version is 0.2.32 at the time of this writing...

```sh
echo "source 'https://rubygems.org'\n\ngem 'convection'" > Gemfile
echo "source 'https://rubygems.org'\n\ngem 'convection', github: 'rapid7/convection', branch: 'feature/support-s3-configuration-as-first-class-citizens'" > Gemfile

bundle install
bundle update convection

export TEMPLATE_TO_CONVERGE=before
bundle exec convection print s3-bucket > before-template-convection-0.2.32.json
```

```sh
echo "source 'https://rubygems.org'\n\ngem 'convection', github: 'rapid7/convection', branch: 'feature/support-s3-configuration-as-first-class-citizens'" > Gemfile

bundle install
bundle update convection
export TEMPLATE_TO_CONVERGE=before
bundle exec convection print s3-bucket > before-template-convection-with-patch-from-143.json
```

```sh
echo "source 'https://rubygems.org'\n\ngem 'convection', github: 'rapid7/convection', branch: 'feature/support-s3-configuration-as-first-class-citizens'" > Gemfile

bundle install
bundle update convection
export TEMPLATE_TO_CONVERGE=after
bundle exec convection print s3-bucket > after-template-convection-with-patch-from-143.json
```
