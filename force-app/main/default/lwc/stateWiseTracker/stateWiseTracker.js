import { LightningElement, wire } from "lwc";
import getApexData from "@salesforce/apex/covidUtil.covidStateWise";
const columns = [
  { label: "State", fieldName: "loc", type: "text", sortable: true },
  {
    label: "Active",
    fieldName: "totalConfirmed",
    type: "number",
    sortable: true
  },
  {
    label: "Recovered",
    fieldName: "discharged",
    type: "number",
    sortable: true
  },
  { label: "Deaths", fieldName: "deaths", type: "number", sortable: true }
];
export default class StateWiseTracker extends LightningElement {
  data = [];
  columns = columns;
  activeSections = [];
  @wire(getApexData)
  stateWiseData({ error, data }) {
    if (data) {
      console.log("Data", data);
      this.data = data;
    } else if (error) {
      console.error("Error:", error);
    }
  }
}
