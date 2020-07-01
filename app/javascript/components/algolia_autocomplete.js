const algoliaAutocomplete = () => {
  const search = document.getElementById('aa-search-input');
  if (search) {
    const client = algoliasearch("UGEZOCGL5L", "a64a63fabdae50e3d5f03e3d59fe5fdf");
    const creeks = client.initIndex('Creek');
    const categories = client.initIndex('Category');
    const users = client.initIndex('User');
    autocomplete('#aa-search-input', {}, [
    {
      source: autocomplete.sources.hits(creeks, { hitsPerPage:  1}),
      displayKey: 'title',
      templates: {
        header: '<div class="aa-suggestions-category">Creeks</div>',
        suggestion({_highlightResult}) {
          console.log(_highlightResult)
          return `<span>${_highlightResult.title.value}</span>`;
        }
      }
    },
    {
      source: autocomplete.sources.hits(categories, { hitsPerPage:  1}),
      displayKey: 'name',
      templates: {
        header: '<div class="aa-suggestions-category">Categories</div>',
        suggestion({_highlightResult}) {
          return `<span>${_highlightResult.name.value}</span>`;
        }
      }
    },
    {
      source: autocomplete.sources.hits(users, { hitsPerPage: 1 }),
      displayKey: 'username',
      templates: {
        header: '<div class="aa-suggestions-category">Streamers</div>',
        suggestion({_highlightResult}) {
          return `<span>${_highlightResult.username.value}</span>`;
        }
      }
      }
    ]);
  };

}

export { algoliaAutocomplete };
