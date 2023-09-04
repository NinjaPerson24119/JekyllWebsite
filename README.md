# Jekyll Website for an Author

![Walkthrough of website](demo.webp)

This site is statically generated. It's built using an HTML5 template, Jekyll, CSS/SCSS, and JavaScript.

Installation:

If using Windows, see https://jekyllrb.com/docs/installation/windows/ to install Ruby and Jekyll.
If using Ubuntu, run `./setup.sh` in the project's root directory to automatically install dependencies.

## Testing:

Navigate to the the `www` directory and run `jekyll serve` in a terminal.
Open the indicated address in a browser.

To test on mobile devices, run `jekyll serve --host=0.0.0.0` which will host the website over the local network.
To load the webpage, check `ifconfig` to get the server's IP, then from the mobile device, enter the server's IP along with the required port.

## Modifying the navigation:

Edit the file: `www/_data/navigation.yaml`
It should use a format similar to the following:

```
- name: Home
  link: /
- name: Author
  link: author.html
- name: Books
  link: '#'
  sub:
    - name: Book Series
      link: book_series.html
- name: Contact
  link: contact.html
- name: Shop
  link: https://www.etsy.com
  external: true
```

Each link and sublink has a boolean `external` that can be set to force that link to open in a new tab.
Editing this file will automatically populate the navigation bar.
The navigation tree's depth is limited to two (no sub-sublinks).
Use `'#'` to indicate a link that doesn't do anything.

## Adding pages:

Create a new page in the `www` directory by making an empty .md (markdown) file.
For Jekyll to generate HTML from markdown, the top of each .md file must have the following:

```
---
layout: default
title: MyPageName
---
```

Where `layout` will determine how the page is formatted, and `title` will determine the name displayed in a browser's tab.

## Social media / mailer:

Links for social media pages are specified in the `www/_data/settings.yaml` file.
The URL for the mailer is also here. If it changes, it can be extracted again by inspecting the mailer form provided by the relevant service.

## Deployment

The site should be minified for deployment. The minifier will only run in production builds.
To generate a production build, use the following command: `JEKYLL_ENV=production jekyll build`
Test the build by running the site locally: `jekyll serve --skip-initial-build`
If the build is indeed in production mode, the footer will ommit the statement "This is a development build".
Since this is a static site, the generated files may then be dumped directly onto a server.
