import { LightningElement, wire, track, api } from "lwc";
import fetchSummary from "@salesforce/apex/covidUtil.fetchSummary";

export default class DataTable extends LightningElement {
  @track covidSummary;
  @track activeCases;

  @track error;
  @track isLoaded = false;
  @wire(fetchSummary)
  covidSummaryData({ error, data }) {
    if (data) {
      this.activeCases = data.total - data.discharged - data.deaths;
      this.covidSummary = data;
      this.isLoaded = true;
      //   console.log("data:", data);
    } else if (error) {
      this.error = error;
    }
  }
}
