// Entry point for the build script in your package.json
import '@hotwired/turbo-rails'
import './controllers'
import './jquery'
import * as bootstrap from 'bootstrap'
window.bootstrap = bootstrap
import './sbadmin/sbadmin.min.js'
import './sbadmin/bootstrap.bundle.min.js'
