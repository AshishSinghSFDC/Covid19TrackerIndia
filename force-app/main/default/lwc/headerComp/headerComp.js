import { LightningElement, track, api } from "lwc";
import { loadScript, loadStyle } from "lightning/platformResourceLoader";
import Bootstrap from "@salesforce/resourceUrl/Bootstrap";
import covidSiteResources from "@salesforce/resourceUrl/covidSiteResources";

export default class HeaderComp extends LightningElement {
  @api covidPunch =
    covidSiteResources + "/covidSiteResources/img/punchCovid.jpg";
  renderedCallback() {
    Promise.all([
      loadScript(
        this,
        Bootstrap + "/bootstrap-5.0.0-beta3-dist/js/bootstrap.js"
      ),
      loadStyle(
        this,
        Bootstrap + "/bootstrap-5.0.0-beta3-dist/css/bootstrap.css"
      )
    ])
      .then(() => {
        console.log("Files loaded.");
      })
      .catch((error) => {
        alert(error.body.message);
      });
  }
}