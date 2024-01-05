import { LightningElement, api } from 'lwc' 

export default class Child extends LightningElement {
    // Private Property
    @api
    firstName = 'Sanjay';
}