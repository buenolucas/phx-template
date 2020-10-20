/// <reference types="Cypress" />

import l from "../support/locators";
describe("Should be fuck", () => {
  before(() => {});

  it("should gonna be yeah!", () => {
    expect(true).to.equal(true);

    cy.visit("https://br.search.yahoo.com/");
    cy.get("#yschsp").type("artilheiros do cruzeiro esporte clube");
    cy.get("button[type='submit']").click();
  });
});
