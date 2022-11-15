# Pin npm packages by running ./bin/importmap

# Pin npm packages by running ./bin/importmap

# Default, created by rails new.
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin_all_from "app/javascript/controllers", under: "controllers"

# If later decide not to serve this from a cdn, then see this article
#   https://dev.to/coorasse/rails-7-bootstrap-5-and-importmaps-without-nodejs-4g8
#
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.2.2/dist/js/bootstrap.esm.js"
#pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.6/lib/index.js" <- Doesn't work!!
# If popper (used for bootstrap popups and popvers) doesn't work, try the following instead:
pin "@popperjs/core", to: "https://unpkg.com/@popperjs/core@2.11.6/dist/esm/index.js" 


pin "datatables.net"              , to: "https://cdn.datatables.net/1.13.1/js/jquery.dataTables.mjs"
pin "datatables.net-bs5"          , to: "https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.mjs"
pin "datatables.net-buttons"      , to: "https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.mjs"
pin "datatables.net-buttons-bs5"  , to: "https://cdn.datatables.net/buttons/2.3.2/js/buttons.bootstrap5.mjs"
pin "datatables.net-buttons-html5", to: "https://cdn.datatables.net/buttons/2.3.2/js/buttons.html5.mjs"
pin "pdfmake"                     , to: "https://ga.jspm.io/npm:pdfmake@0.2.6/build/pdfmake.js"
pin "pdfmake-fonts"               , to: "https://ga.jspm.io/npm:pdfmake@0.2.6/build/vfs_fonts.js"
pin "jquery"                      , to: "https://ga.jspm.io/npm:jquery@3.6.1/dist/jquery.js"
pin "jquery-highlight"            , to: "https://ga.jspm.io/npm:jquery-highlight@3.5.0/jquery.highlight.js"

# To pickup my custom javascript files
pin_all_from "app/javascript/custom", under: "custom"

pin "jszip", to: "https://ga.jspm.io/npm:jszip@3.10.1/lib/index.js"
pin "buffer", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/buffer.js"
pin "core-util-is", to: "https://ga.jspm.io/npm:core-util-is@1.0.3/lib/util.js"
pin "events", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/events.js"
pin "immediate", to: "https://ga.jspm.io/npm:immediate@3.0.6/lib/browser.js"
pin "inherits", to: "https://ga.jspm.io/npm:inherits@2.0.4/inherits_browser.js"
pin "isarray", to: "https://ga.jspm.io/npm:isarray@1.0.0/index.js"
pin "lie", to: "https://ga.jspm.io/npm:lie@3.3.0/lib/browser.js"
pin "pako", to: "https://ga.jspm.io/npm:pako@1.0.11/index.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/process-production.js"
pin "process-nextick-args", to: "https://ga.jspm.io/npm:process-nextick-args@2.0.1/index.js"
pin "readable-stream", to: "https://ga.jspm.io/npm:readable-stream@2.3.7/readable-browser.js"
pin "readable-stream/lib/internal/streams/stream.js", to: "https://ga.jspm.io/npm:readable-stream@2.3.7/lib/internal/streams/stream-browser.js"
pin "safe-buffer", to: "https://ga.jspm.io/npm:safe-buffer@5.1.2/index.js"
pin "setimmediate", to: "https://ga.jspm.io/npm:setimmediate@1.0.5/setImmediate.js"
pin "string_decoder", to: "https://ga.jspm.io/npm:string_decoder@1.1.1/lib/string_decoder.js"
pin "util", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.27/nodelibs/browser/util.js"
pin "util-deprecate", to: "https://ga.jspm.io/npm:util-deprecate@1.0.2/browser.js"
