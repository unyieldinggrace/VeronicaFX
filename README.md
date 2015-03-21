# VeronicaFX
## Concept
Unopinionated web framework for Vala.  Optimised for happiness.

## Status
This is still in an experimental phase.  The code creates an SCGI app.  Apache can be configured to forward requests to that app and send back the response to the client.  This is mainly just to prove that such a thing can be done in Vala.

Before building it into something I would actually use for a project, there's several plumbing stages that need to be built.  The first is a small framework for generating JSON.  I mainly intend to use VeronicaFX to build server-side backends to Javascript SPAs (including, hopefully, the next version of my Bible-study app "HIFI Bible").
