const client = algoliasearch("UGEZOCGL5L", "a64a63fabdae50e3d5f03e3d59fe5fdf");
const creeks = client.initIndex('Creek');
const users = client.initIndex('User');

const algoliaAutocomplete = () => {
  autocomplete('#aa-search-input', {}, [
      {
        source: autocomplete.sources.hits(creeks, { hitsPerPage: 3 }),
        displayKey: 'title',
        templates: {
          suggestion({_highlightResult}) {
            return `<span>${_highlightResult.title.value}</span>`;
          }
        }
      },
      {
        source: autocomplete.sources.hits(users, { hitsPerPage: 3 }),
        displayKey: 'username',
        templates: {
          suggestion({_highlightResult}) {
            return `<span>${_highlightResult.username.value}</span>`;
          }
        }
      }
  ]);
}

export { algoliaAutocomplete };
