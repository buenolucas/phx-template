/// <reference types="Cypress" />

describe("Should be run api tests", () => {
  let token;

  before(() => {
    const user = Cypress.env('user')
    cy.getToken(user.accessToken).then((tkn) => {
      token = tkn;
    });
  });

  beforeEach(() => {});

  it("shoulbe be get user library", () => {
    cy.request({
      method: "POST",
      url: Cypress.env("apiUrl"),
      headers: {
        Authorization: `Bearer ${token}`,
      },
      body: {
        query:
          "query User {\n  me {\n    id\n    email\n    facebookPhoto\n    apiToken\n    accessToken\n    firstAccess\n    intercom\n    name\n    username\n    products\n    changedPassword\n    userKindType\n    teacher {\n      id\n      blockedBooks\n      permissions\n      role\n      root {\n        id\n        requirePayment\n        __typename\n      }\n      __typename\n    }\n    reader {\n      id\n      currentProject\n      boletoUrl\n      getCurrentPoints\n      permissions\n      paymentDate\n      accessDaysLeft\n      listIndicationFromReadersToMe {\n        book {\n          ...bookNavigationFields\n          __typename\n        }\n        id\n        indicator {\n          user {\n            name\n            __typename\n          }\n          __typename\n        }\n        __typename\n      }\n      forest {\n        coins\n        __typename\n      }\n      listIndicationFromReadersByMe {\n        book {\n          ...bookNavigationFields\n          __typename\n        }\n        id\n        target {\n          user {\n            name\n            __typename\n          }\n          __typename\n        }\n        __typename\n      }\n      overallRanking(neighbors: 2) {\n        tier\n        percentage\n        rankingUsers {\n          entityId\n          facebookUid\n          profileId\n          rankPosition\n          rootName\n          totalTimeSpent\n          userName\n          __typename\n        }\n        __typename\n      }\n      collections {\n        id\n        name\n        image\n        __typename\n      }\n      overallRankingHistory {\n        points\n        month\n        rankPosition\n        tier\n        status\n        __typename\n      }\n      highlightsv2 {\n        bookShelfItems {\n          book {\n            slug\n            name\n            premium\n            __typename\n          }\n          mascot\n          __typename\n        }\n        isHighlight\n        name\n        __typename\n      }\n      mainScreenSuggestionsv2 {\n        bookShelfItems {\n          book {\n            ...bookNavigationFields\n            __typename\n          }\n          mascot\n          __typename\n        }\n        name\n        __typename\n      }\n      root {\n        id\n        name\n        paymentInfo\n        daysLeft\n        paymentPrice\n        requirePayment\n        root_acervo\n        maxSimultaneousUsers\n        __typename\n      }\n      entity {\n        id\n        requirePayment\n        degree\n        name\n        indicationsWithInfo {\n          book {\n            ...bookNavigationFields\n            __typename\n          }\n          teacherName\n          createdAt\n          deadlineDate\n          __typename\n        }\n        rankingEntity {\n          facebookUid\n          profileId\n          rankPosition\n          rootName\n          tier\n          totalTimeSpent\n          userName\n          __typename\n        }\n        rankingRoot {\n          facebookUid\n          profileId\n          rankPosition\n          rootName\n          tier\n          totalTimeSpent\n          userName\n          __typename\n        }\n        __typename\n      }\n      viewedBooks(last: 10) {\n        book {\n          ...bookNavigationFields\n          __typename\n        }\n        percentage\n        __typename\n      }\n      favoriteBooks {\n        ...bookNavigationFields\n        __typename\n      }\n      indicationsForMe {\n        book {\n          ...bookNavigationFields\n          __typename\n        }\n        teacherName\n        deadlineDate\n        createdAt\n        __typename\n      }\n      __typename\n    }\n    __typename\n  }\n}\n\nfragment bookNavigationFields on Book {\n  name\n  author\n  freemium\n  slug\n  layout\n  v2ready\n  degree\n  manualInfoChecked\n  description\n  imageUrlIntermediaria\n  imageUrlThumb\n  premium\n  freemium\n  __typename\n}\n",
        operationName: "User",
      },
    }).its('body.data').should('not.be.empty')

  });
  
});
