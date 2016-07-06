# Example cloud to verify template changes
See also https://github.com/rapid7/convection/pull/143.

## Steps to validate
### Using the original template format in convection v0.2.32
```sh
echo -e "source 'https://rubygems.org'\n\ngem 'convection'" > Gemfile

bundle install
bundle update convection

export TEMPLATE_TO_CONVERGE=before
bundle exec convection print s3-bucket > rendered-stacks/before-template-convection-0.2.32.json
```

### Using the original template format including https://github.com/rapid7/convection/pull/143
```sh
echo -e "source 'https://rubygems.org'\n\ngem 'convection', github: 'rapid7/convection', branch: 'feature/support-s3-configuration-as-first-class-citizens'" > Gemfile

bundle install
bundle update convection

export TEMPLATE_TO_CONVERGE=before
bundle exec convection print s3-bucket > rendered-stacks/before-template-convection-with-patch-from-143.json
```

### Using the new template format including https://github.com/rapid7/convection/pull/143
```sh
echo -e "source 'https://rubygems.org'\n\ngem 'convection', github: 'rapid7/convection', branch: 'feature/support-s3-configuration-as-first-class-citizens'" > Gemfile

bundle install
bundle update convection

export TEMPLATE_TO_CONVERGE=after
bundle exec convection print s3-bucket > rendered-stacks/after-template-convection-with-patch-from-143.json
```
