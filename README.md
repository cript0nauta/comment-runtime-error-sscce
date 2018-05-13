# Bugs found
* Error when viewing the page without a server (from file:// URLs)
* `TypeError: attrs is undefined` runtime error when adding an HTML inside the body

# Replication
1. Clone the repo and compile the elm code by running `elm make Main.elm --output Main.js`
2. Access to `file:///path/to/comment/runtime-error-sscce/index.html` from Firefox
(works in Chromium also but with different tracebacks). This exception will be shown:
```
Error: Cannot navigate to the following URL. It seems to be invalid:
file:///tmp/comment-runtime-error-sscce/index.html
```
3. Serve the contents of the directory with a development web server (like with `python3 -m http.server`)
4. Visit `http://localhost:8000/index.html`
5. You will have a `TypeError: attrs is undefined` error
6. Edit the `index.html` file by removing the following line:
```html
  <!-- This HTML comment causes a runtime error -->
```
7. Refresh the page and the counter example will work correctly
