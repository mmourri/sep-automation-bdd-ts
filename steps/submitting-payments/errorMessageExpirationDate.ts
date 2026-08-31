import { Given, Then, When } from "@cucumber/cucumber";
import { expect} from "@playwright/test";
import { reviewPaymentPage, page } from "../../globalPagesSetup";
import { productInfo } from "../../utilities/qa-data-reader";

When('user enters the {string}', async function (string) {
    await reviewPaymentPage.enterExpiryDate(string);
});

When('user clicks the terms and conditions checkbox', async function () {
    await reviewPaymentPage.clickTermsAndConditionsCheckbox();
});

Then('the error message {string} should be displayed immediately', async function (string) {
    await expect(reviewPaymentPage.cardExpiryErrorMessage).toHaveText(string);
});
