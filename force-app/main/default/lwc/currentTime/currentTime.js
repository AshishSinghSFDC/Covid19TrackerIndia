import { LightningElement, api, track } from "lwc";
import LOCALE from "@salesforce/i18n/locale";

export default class CurrentTime extends LightningElement {
  @track date = new Date();
}
