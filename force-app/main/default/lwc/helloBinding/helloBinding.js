import { LightningElement } from "lwc";

export default class helloBinding extends LightningElement{
    areDetailsVisible = false;

    handleChange(event){
        this.areDetailsVisible = event.target.checked;
    }
}