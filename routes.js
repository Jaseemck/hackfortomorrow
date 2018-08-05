const routes = require("next-routes")();

routes
    //.add("/ethrelief/new", "ethrelief/new")
    .add("/ethrelief/:address", "/ethrelief/show")
    .add("ethrelief/list", "ethrelief/list")
    .add("/ethrelief/createnewfund", "/ethrelief/createnewfund");
//.add("/ethrelief/:address/requests", "/campaigns/requests/index");

module.exports = routes;
