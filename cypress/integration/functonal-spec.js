/// <reference types="Cypress" />

import l from "../support/locators";
describe("Should be fuck", () => {
  before(() => {});

  it("should gonna be yeah!", () => {
    cy.visit("http://localhost:5000");
    expect(true).to.equal(true);
  });
});
