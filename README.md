# Collections

Collections serves the GOV.UK navigation pages and organisation pages. Search API is used to make the pages dynamic e.g. the latest changes for Topics, Organisations and Mainstream browse pages.

At time of writing, it also serves the priority campaign pages. See the [Campaign pages](docs/campaign-pages.md) manual for more details.

## Live examples

- Browse page: [gov.uk/browse](https://www.gov.uk/browse)
- Topic page: [gov.uk/oil-and-gas](https://www.gov.uk/oil-and-gas)
- Subtopic page: [gov.uk/oil-and-gas/fields-and-wells](https://www.gov.uk/oil-and-gas/fields-and-wells)
- Services and information page: [gov.uk/government/organisations/hm-revenue-customs/services-information](https://www.gov.uk/government/organisations/hm-revenue-customs/services-information)
- Taxonomy page: [gov.uk/education](https://www.gov.uk/education)
- Worldwide taxonomy page: [gov.uk/world/japan](https://www.gov.uk/world/japan)
- Organisation index page: [gov.uk/government/organisations](https://www.gov.uk/government/organisations)
- Organisation page: [gov.uk/government/organisations/cabinet-office](https://www.gov.uk/government/organisations/cabinet-office)
- Step by step page: [gov.uk/learn-to-drive-a-car](https://www.gov.uk/learn-to-drive-a-car)

## Nomenclature

### Topics

- **Curated list**: a group of content tagged to a subtopic that has been
  curated into a named list.
- **Topic**: a named group of sub-topics. (A deprecated name for this is "specialist sector".)
- **Sub-topic**: a group of content within a topic. (A deprecated name for this is
"specialist sub-sector".)

## Technical documentation

This is a Ruby on Rails app, and should follow [our Rails app conventions](https://docs.publishing.service.gov.uk/manual/conventions-for-rails-applications.html).

You can use the [GOV.UK Docker environment](https://github.com/alphagov/govuk-docker) or the local `startup.sh` script to run the app. Read [the guidance](https://docs.publishing.service.gov.uk/manual/local-frontend-development.html) to find out more about each approach, before you get started.

If you are using GOV.UK Docker, remember to combine it with the commands that follow. See [the GOV.UK Docker usage instructions](https://github.com/alphagov/govuk-docker#usage) for examples.

### Running the test suite

```
bundle exec rake
```

To test a single file:

```
bundle exec rails test test/unit/application_helper_test.rb
```

To run JavaScript tests (only):

```
bundle exec rake jasmine:ci
```

### Pact tests
Collections Organisations API has pact tests with [gds-api-adapters](https://github.com/alphagov/gds-api-adapters/blob/19515f01395a2a2cdfa22e1c86f8cb1a4298c492/test/test_helpers/pact_helper.rb).

Use `bundle exec rake pact:verify` to run the pact tests against the master pactfile stored on the pact broker.

If you have made a change to the code that consumes the organisations api, you might want to confirm that collections will still honour its pact. You can do so by running the pact tests against your local gds-api-adapters branch like so:
- From gds-api-adapters run `bundle exec rake` to regenerate a new pactfile on you local machine.
- From collections run `bundle exec rake PACT_URI="../gds-api-adapters/spec/pacts/gds_api_adapters-collections_organisation_api.json" pact:verify`

### Further documentation

- [Taxonomy pages](docs/taxonomy-pages.md)
- [Campaign pages](docs/campaign-pages.md)
- [API endpoints and consumers](docs/api.md)

## License

[MIT License](LICENCE.txt)
