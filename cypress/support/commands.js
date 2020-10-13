// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//

import l from "./locators";

Cypress.Commands.add("login", (identity) => {
  cy.visit("/login");
  cy.get(l.login.id).type(identity);
  //cy.get(l.login.password).type("123456");
  cy.contains(l.login.submit, "Entrar").click();
  cy.get(l.login.error).should("not.exist");
  //console.log('dasdsdsa')
  cy.url().should("not.contain", l.login.url);
});

Cypress.Commands.add("getToken", (identity) => {
  return cy.request({
    method: "POST",
    url: Cypress.env("apiUrl"),
    body: {
      query:
      `mutation {\n  loginWithToken(token: \"${identity}\") {\n    token\n  }\n}`,

      variables:null
    },
  }).its('body.data.loginWithToken.token').should('not.be.empty')
    .then((token) => {
      console.log('xabçau')
      return token
    })
});
