/// <reference types="Cypress" />

import l from "../support/locators";
describe("Should be fuck", () => {
  before(() => {});

  it("should gonna be yeah!", () => {
    expect(true).to.equal(true);

    cy.visit("https://duckduckgo.com/?t=newext&atb=v241-4__");
    cy.get("#yschsp").type("artilheiros do cruzeiro esporte clube");
    cy.get("button[type='submit']").click();
  });
});
